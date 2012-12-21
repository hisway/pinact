<?php

class spaceAction extends frontendAction {

    private $_user = null;

    public function _initialize() {
        parent::_initialize();
        $this->_mod = D('item');//添加活动
        $uid = $this->_get('uid', 'intval');
        if ($uid) {
            $user = M('user')->find($uid);
            //ship   0:互相未关注 1:我关注对方 2:互相关注
            $user['ship'] = 0;
            if ($this->visitor->is_login) {
                $ship = M('user_follow')->where(array('uid' => $this->visitor->info['id'], 'follow_uid' => $user['id']))->find();
                if ($ship) {
                    $user['ship'] = $ship['mutually'] ? 2 : 1;
                }
            }
            $this->_user = $user;
        } elseif (!$uid && $this->visitor->is_login) {
            $this->_user = $this->visitor->get();
        } else {
            $this->_404();
        }
        $this->assign('user', $this->_user);
        $this->_curr_nav(ACTION_NAME); //方法里面可以自定义
    }

    protected function _curr_nav($nav = 'index') {
        $nav_list = $this->_get_nav();
        $this->assign('space_nav_list', $nav_list);
        $this->assign('space_nav_curr', $nav);
    }

    private function _get_nav() {
        return array(
            'index' => array('text' => '封面', 'url' => U('space/index', array('uid' => $this->_user['id']))),
            'talk' => array('text' => '动态', 'url' => U('space/talk', array('uid' => $this->_user['id']))),
            'album' => array('text' => '专辑', 'url' => U('space/album', array('uid' => $this->_user['id']))),
            'item' => array('text' => '发起', 'url' => U('space/item', array('uid' => $this->_user['id']))),
            'like' => array('text' => '想去', 'url' => U('space/like', array('uid' => $this->_user['id'])))
        );
    }

    /**
     * 封面
     */
    public function index() {
        //用户的专辑
        $album_list = M('album')->field('id,title,items,cover_cache')->where(array('uid' => $this->_user['id'], 'status' => 1))->limit('6')->order('id DESC')->select();
        foreach ($album_list as $key => $val) {
            $album_list[$key]['cover'] = unserialize($val['cover_cache']);
        }
        $this->assign('album_list', $album_list);
        //用户的分享
        $where = array('uid' => $this->_user['id']);
        $field = 'id,uid,title,intro,img,price,likes,comments';
        $this->waterfall($where, 'id DESC', $field);
        $this->_config_seo(array(
            'title' => $this->_user['username'] . L('space_home_title') . '-' . C('pin_site_name'),
        ));
        $this->display();
    }

    /**
     * 分享
     */
    public function item() {
        $sort = $this->_get('sort', 'trim', 'new');
        switch ($sort) {
            case 'hot':
                $order = 'likes DESC';
                break;
            case 'new':
                $order = 'id DESC';
                break;
        }
        $where = array('uid' => $this->_user['id']);
        $field = 'id,uid,title,intro,img,price,likes,comments';
        if (IS_AJAX) {
            $this->wall_ajax($where, $order, $field);
        } else {
            $this->waterfall($where, $order, $field);
            $this->assign('sort', $sort);
            $this->_config_seo(array(
                'title' => $this->_user['username'] . L('space_item_title') . '-' . C('pin_site_name'),
            ));
            $this->display();
        }
    }

    /**
     * 喜欢
     */
    public function like() {
        $db_pre = C('DB_PREFIX');
        $spage_size = C('pin_wall_spage_size');
        $spage_max = C('pin_wall_spage_max');
        $page_size = $spage_size * $spage_max;

        $item_like_mod = M('item_like');
        $where = array(
            $db_pre . 'item_like.uid' => $this->_user['id'],
            'i.status' => 1,
        );
        $field = 'i.id,i.uid,i.uname,i.title,i.price,i.intro,i.img,i.likes,i.comments';
        $order = $db_pre . 'item_like.add_time DESC';
        $join = $db_pre . 'item i ON i.id=' . $db_pre . 'item_like.item_id';

        $count = $item_like_mod->join($join)->where($where)->count();
        $pager = $this->_pager($count, $page_size);
        $item_list = $item_like_mod->field($field)->join($join)->where($where)->order($order)->limit($pager->firstRow . ',' . $spage_size)->select();
        $this->assign('item_list', $item_list);
        //当前页码
        $p = $this->_get('p', 'intval', 1);
        $this->assign('p', $p);
        //当前页面总数大于单次加载数才会执行动态加载
        if (($count - ($p - 1) * $page_size) > $spage_size) {
            $this->assign('show_load', 1);
        }
        //总数大于单页数才显示分页
        $count > $page_size && $this->assign('page_bar', $pager->fshow());
        //最后一页分页处理
        if ((count($item_list) + $page_size * ($p - 1)) == $count) {
            $this->assign('show_page', 1);
        }
        $this->assign('like_manage', true);
        $this->_config_seo(array(
            'title' => $this->_user['username'] . L('space_like_title') . '-' . C('pin_site_name'),
        ));
        $this->display();
    }

    public function like_wall() {
        $db_pre = C('DB_PREFIX');
        $spage_size = C('pin_wall_spage_size'); //每次加载个数
        $spage_max = C('pin_wall_spage_max'); //加载次数
        $p = $this->_get('p', 'intval', 1); //页码
        $sp = $this->_get('sp', 'intval', 1); //子页

        $item_like_mod = M('item_like');
        //条件
        $where = array(
            $db_pre . 'item_like.uid' => $this->_user['id'],
            'i.status' => 1,
        );
        //计算开始
        $start = $spage_size * ($spage_max * ($p - 1) + $sp);
        //
        $field = 'i.id,i.uid,i.uname,i.title,i.price,i.intro,i.img,i.likes,i.comments';
        $order = $db_pre . 'item_like.add_time DESC';
        $join = $db_pre . 'item i ON i.id=' . $db_pre . 'item_like.item_id';
        $item_list = $item_like_mod->field($field)->join($join)->where($where)->order($order)->limit($start . ',' . $spage_size)->select();

        $this->assign('item_list', $item_list);
        $this->assign('like_manage', true);
        $resp = $this->fetch('public:waterfall');
        $data = array(
            'isfull' => 1,
            'html' => $resp,
        );
        $count <= $start + $spage_size && $data['isfull'] = 0;
        $this->ajaxReturn(1, '', $data);
    }

    /**
     * 微博内容
     */
    public function feed_src() {
        $src_id = $this->_get('src_id', 'intval');
        $src_type = $this->_get('src_type', 'intval', 0);
        switch ($src_type) {
            case 0 :
                $item_mod = M('item');
                $item = $item_mod->field('id,title,img,url,price')->find($src_id);
                $this->assign('item', $item);
                break;
        }
        $resp = $this->fetch('feed_src_item');
        $this->ajaxReturn(1, '', $resp);
    }

    /**
     * 用户发表的
     */
    public function talk() {
        $topic_mod = M('topic');
        $map = array('uid' => $this->_user['id']);
        $type = $this->_get('type', 'intval', 0);
        if ($type) {
            $map['type'] = 0;
        }
        $pagesize = 20;
        $count = $topic_mod->where($map)->count('id');
        $pager = $this->_pager($count, $pagesize);
        $topic_list = $topic_mod->where($map)->order('id DESC')->limit($pager->firstRow . ',' . $pager->listRows)->select();
        foreach ($topic_list as $key => $val) {
            if ($val['type'] == '1') {
                $src_tid = M('topic_relation')->where(array('tid' => $val['id']))->getField('src_tid');
                $topic_list[$key]['qt'] = $topic_mod->find($src_tid);
            }
        }
        $this->assign('topic_list', $topic_list);
        $this->assign('page_bar', $pager->fshow());
        $this->assign('tab_current', 'talk');
        $this->_curr_nav('talk');
        $this->_config_seo(array(
            'title' => $this->_user['username'] . L('space_feed_title') . '-' . C('pin_site_name'),
        ));
        $this->display();
    }

    /**
     * 我自己的动态主页
     */
    public function me() {
        !$this->visitor->is_login && $this->redirect('user/login');
        //获取动态索引
        $topic_index_mod = M('topic_index');
        $map = array('uid' => $this->_user['id']);
        $pagesize = 20;
        $count = $topic_index_mod->where($map)->count();
        $pager = $this->_pager($count, $pagesize);
        $tid_res = $topic_index_mod->field('tid')->where($map)->order('tid DESC')->limit($pager->firstRow . ',' . $pager->listRows)->select();
        $tid_arr = array();
        foreach ($tid_res as $val) {
            $tid_arr[] = $val['tid'];
        }
        $topic_list = array();
        //获取动态内容
        if ($tid_arr) {
            $topic_mod = M('topic');
            $topic_list = $topic_mod->where(array('id' => array('in', $tid_arr)))->order('id DESC')->select();
        }
        $this->assign('topic_list', $topic_list);
        $this->assign('page_bar', $pager->fshow());
        $this->assign('tab_current', 'me');
        $this->_curr_nav('talk');
        $this->_config_seo(array(
            'title' => L('space_me_title') . '-' . C('pin_site_name'),
        ));
        $this->display();
    }

    /**
     * @我的
     */
    public function atme() {
        !$this->visitor->is_login && $this->redirect('user/login');
        $topic_at_mod = M('topic_at');
        $map = array('uid' => $this->_user['id']);
        $pagesize = 20;
        $count = $topic_at_mod->where($map)->count();
        $pager = $this->_pager($count, $pagesize);
        $tid_res = $topic_at_mod->field('tid')->where($map)->order('tid DESC')->limit($pager->firstRow . ',' . $pager->listRows)->select();
        $tid_arr = array();
        foreach ($tid_res as $val) {
            $tid_arr[] = $val['tid'];
        }
        $topic_list = array();
        //获取动态内容
        if ($tid_arr) {
            $topic_mod = M('topic');
            $topic_list = $topic_mod->where(array('id' => array('in', $tid_arr)))->order('id DESC')->select();
        }
        foreach ($topic_list as $key => $val) {
            if ($val['type'] == '1') {
                $src_tid = M('topic_relation')->where(array('tid' => $val['id']))->getField('src_tid');
                $topic_list[$key]['qt'] = $topic_mod->find($src_tid);
            }
        }
        //清理提醒
        D('user_msgtip')->clear_tip($this->_user['id'], 2);
        $this->assign('topic_list', $topic_list);
        $this->assign('page_bar', $pager->fshow());
        $this->assign('tab_current', 'atme');
        $this->_curr_nav('talk');
        $this->_config_seo(array(
            'title' => L('space_me_title') . '-' . C('pin_site_name'),
        ));
        $this->display();
    }

    /**
     * 评论我的
     */
    public function cmtme() {
        !$this->visitor->is_login && $this->redirect('user/login');
        $topic_mod = M('topic');
        $topic_comment_mod = M('topic_comment');
        $pagesize = 20;
        $map = array('author_uid' => $this->_user['id']);
        $count = $topic_comment_mod->where($map)->count('id');
        $pager = $this->_pager($count, $pagesize);
        $cmt_list = $topic_comment_mod->where($map)->order('id DESC')->limit($pager->firstRow . ',' . $pager->listRows)->select();
        foreach ($cmt_list as $key => $val) {
            $cmt_list[$key]['topic'] = $topic_mod->where(array('id' => $val['tid']))->getField('content');
        }
        $this->assign('cmt_list', $cmt_list);
        $this->assign('page_bar', $pager->fshow());
        $this->assign('tab_current', 'cmtme');
        $this->_curr_nav('talk');
        $this->_config_seo(array(
            'title' => L('space_me_title') . '-' . C('pin_site_name'),
        ));
        $this->display();
    }

    /**
     * 专辑
     */
    public function album() {
        $sort = $this->_get('sort', 'trim', 'new');
        $type = $this->_get('type', 'trim', 'pub');
        $pagesize = 20;
        if ($type == 'followed') {
            $db_pre = C('DB_PREFIX');
            $album_follow_mod = M('album_follow');
            $count_map = array('uid' => $this->_user['id']);
            $map = array($db_pre.'album_follow.uid' => $this->_user['id']);
            $sort_order = ($sort == 'hot') ? 'a.follows DESC' : 'a.id DESC';
            $count = $album_follow_mod->where($count_map)->count();
            $pager = $this->_pager($count, $pagesize);
            //left join
            $album_list = $album_follow_mod->field('a.id,a.title,a.items,a.cover_cache')->join($db_pre . 'album a ON a.id=' . $db_pre . 'album_follow.album_id')->where($map)->order($sort_order)->limit($pager->firstRow . ',' . $pager->listRows)->select();
        } else {
            $album_mod = M('album');
            $map = array('uid' => $this->_user['id'], 'status' => 1);
            $sort_order = ($sort == 'hot') ? 'follows DESC' : 'id DESC';
            $count = $album_mod->where($map)->count('id');
            $pager = $this->_pager($count, $pagesize);
            $album_list = $album_mod->field('id,title,items,cover_cache')->where($map)->order($sort_order)->limit($pager->firstRow . ',' . $pager->listRows)->select();
        }
        foreach ($album_list as $key => $val) {
            $album_list[$key]['cover'] = unserialize($val['cover_cache']);
        }
        $this->assign('album_list', $album_list);
        $this->assign('page_bar', $pager->fshow());
        $this->assign('sort', $sort);
        $this->assign('type', $type);
        $this->_config_seo(array(
            'title' => $this->_user['username'] . L('space_album_title') . '-' . C('pin_site_name'),
        ));
        $this->display();
    }

    /**
     * 个人信息
     */
    public function info() {
        $this->_config_seo(array(
            'title' => $this->_user['username'] . L('space_info_title') . '-' . C('pin_site_name'),
        ));
        $this->display();
    }

    /**
     * 名片
     */
    public function card() {
        $this->assign('user', $this->_user);
        $is_follow = '0';
        if ($this->visitor->is_login && M('user_follow')->where(array('uid' => $this->visitor->info['id'], 'follow_uid' => $this->_user['id']))->count()) {
            $is_follow = '1';
        }
        $this->assign('is_follow', $is_follow);
        $resp = $this->fetch('public:user_card');
        $this->ajaxReturn(1, '', $resp);
    }

    /**
     * 关注
     */
    public function follow() {
        $user_follow_mod = M('user_follow');
        $db_pre = C('DB_PREFIX');
        $uf_table = $db_pre . 'user_follow';
        $pagesize = 20;
        $count = $user_follow_mod->where(array('uid' => $this->_user['id']))->count();
        $pager = $this->_pager($count, $pagesize);
        $where = array($uf_table . '.uid' => $this->_user['id']);
        $field = 'u.id,u.username,u.fans,u.last_time,' . $uf_table . '.add_time,' . $uf_table . '.mutually';
        $join = $db_pre . 'user u ON u.id=' . $uf_table . '.follow_uid';
        $user_list = $user_follow_mod->field($field)->where($where)->join($join)->order($uf_table . '.add_time DESC')->limit($pager->firstRow . ',' . $pager->listRows)->select();
        $this->assign('user_list', $user_list);
        $this->assign('page_bar', $pager->fshow());
        $this->assign('tab_current', 'follow');
        $this->_config_seo(array(
            'title' => $this->_user['username'] . L('space_follow_title') . '-' . C('pin_site_name'),
        ));
        $this->display();
    }

    /**
     * 粉丝
     */
    public function fans() {
        $user_follow_mod = M('user_follow');
        $db_pre = C('DB_PREFIX');
        $uf_table = $db_pre . 'user_follow';
        $pagesize = 20;
        $count = $user_follow_mod->where(array('follow_uid' => $this->_user['id']))->count();
        $pager = $this->_pager($count, $pagesize);
        $where = array($uf_table . '.follow_uid' => $this->_user['id']);
        $field = 'u.id,u.username,u.fans,u.last_time,' . $uf_table . '.add_time,' . $uf_table . '.mutually';
        $join = $db_pre . 'user u ON u.id=' . $uf_table . '.uid';
        $user_list = $user_follow_mod->field($field)->where($where)->join($join)->order($uf_table . '.add_time DESC')->limit($pager->firstRow . ',' . $pager->listRows)->select();
        if ($this->visitor->is_login) {
            D('user_msgtip')->clear_tip($this->visitor->info['id'], 1);
        }
        $this->assign('user_list', $user_list);
        $this->assign('page_bar', $pager->fshow());
        $this->assign('tab_current', 'fans');
        $this->_config_seo(array(
            'title' => $this->_user['username'] . L('space_fans_title') . '-' . C('pin_site_name'),
        ));
        $this->display();
    }
    /**
     * 活动添加
     */
	public function act_add() {
        if (IS_POST) {
            //获取数据
            if (false === $data = $this->_mod->create()) {
                $this->error($this->_mod->getError());
            }
            if( !$data['cate_id']||!trim($data['cate_id']) ){
                $this->error('请选择活动分类');
            }

            //必须上传图片
            if (empty($_FILES['img']['name'])) {
                $this->error('请上传活动图片');
            }
/*             //获取马甲
            $auid = $this->_post('auid', 'intval');
            $auto_user_mod = M('auto_user');
            $user_mod = M('user');
            $unames = $auto_user_mod->where(array('id'=>$auid))->getField('users');
            $unamea = explode(',', $unames);
            $users = $user_mod->field('id,username')->where(array('username'=>array('in', $unamea)))->select();
            !$users && $this->error('请选择发布马甲');
            //发布用户
            $user_rand = array_rand($users);
            $data['uid'] = $users[$user_rand]['id'];
            $data['uname'] = $users[$user_rand]['username']; */
			
			
            //发布用户
            //$user_rand = array_rand($users); 
			// $data['uid'] = $users[$user_rand]['id'];
            //$data['uname'] = $users[$user_rand]['username'];
			
			//发布用户
/* 			$uid = $this->_post('uid');
			$user_mod = M('user');
			$users = $user_mod->where(array('id'=>$uid))->getField('username');
			$data['uid'] = $uid;
			$data['uname'] = $users; */
			
			$data['uid'] = $this->_post('uid');
			$data['uname'] = $this->_post('uname');	
			

			//时间地点
			$data['start_time']=$this->_post('time_start');
			$data['end_time']=$this->_post('time_end');
			$data['address']=$this->_post('address');
            if( !$data['start_time']){
                $this->error('请设置活动开始时间');
            }			
            if( !$data['end_time']){
                $this->error('请设置活动结束时间');
            }
            if( !$data['address']){
                $this->error('请设置活动地点');
            }
            //上传图片
            $date_dir = date('ym/d/'); //上传目录
            $item_imgs = array(); //相册
            $result = $this->_upload($_FILES['img'], 'item/'.$date_dir, array(
                'width'=>C('pin_item_bimg.width').','.C('pin_item_img.width').','.C('pin_item_simg.width'), 
                'height'=>C('pin_item_bimg.height').','.C('pin_item_img.height').','.C('pin_item_simg.height'),
                'suffix' => '_b,_m,_s',
                //'remove_origin'=>true 
            ));
            if ($result['error']) {
                $this->error($result['info']);
            } else {
                $data['img'] = $date_dir . $result['info'][0]['savename'];
                //保存一份到相册
                $item_imgs[] = array(
                    'url'     => $data['img'],
                );
            }
            //上传相册
            $file_imgs = array();
            foreach( $_FILES['imgs']['name'] as $key=>$val ){
                if( $val ){
                    $file_imgs['name'][] = $val;
                    $file_imgs['type'][] = $_FILES['imgs']['type'][$key];
                    $file_imgs['tmp_name'][] = $_FILES['imgs']['tmp_name'][$key];
                    $file_imgs['error'][] = $_FILES['imgs']['error'][$key];
                    $file_imgs['size'][] = $_FILES['imgs']['size'][$key];
                }
            }
            if( $file_imgs ){
                $result = $this->_upload($file_imgs, 'item/'.$date_dir, array(
                    'width'=>C('pin_item_bimg.width').','.C('pin_item_simg.width'),
                    'height'=>C('pin_item_bimg.height').','.C('pin_item_simg.height'),
                    'suffix' => '_b,_s',
                ));
                if ($result['error']) {
                    $this->error($result['info']);
                } else {
                    foreach( $result['info'] as $key=>$val ){
                        $item_imgs[] = array(
                            'url'    => $date_dir . $val['savename'],
                            'order'  => $key + 1,
                        );
                    }
                }
            }
            $data['imgs'] = $item_imgs;
            $item_id = $this->_mod->publish($data);
            !$item_id && $this->error(L('operation_failure'));

            //附加属性
            $attr = $this->_post('attr', ',');
            if( $attr ){
                foreach( $attr['name'] as $key=>$val ){
                    if( $val&&$attr['value'][$key] ){
                        $atr['item_id'] = $item_id;
                        $atr['attr_name'] = $val;
                        $atr['attr_value'] = $attr['value'][$key];
                        M('item_attr')->add($atr);
                    }
                }
            }
            $this->success(L('operation_success'));
        } else {
            //来源
            $orig_list = M('item_orig')->where(array('status'=>1))->select();
            $this->assign('orig_list',$orig_list);
            //采集马甲
            $auto_user = M('auto_user')->select();
            $this->assign('auto_user', $auto_user); 
            $this->display();
        }
    }
    /**
     * 活动编辑
     */
    public function act_edit() {
        if (IS_POST) {
            //获取数据
            if (false === $data = $this->_mod->create()) {
                $this->error($this->_mod->getError());
            }
            if( !$data['cate_id']||!trim($data['cate_id']) ){
                $this->error('请选择商品分类');
            }			
            $item_id = $data['id'];
            $date_dir = date('ym/d/'); //上传目录
            $item_imgs = array(); //相册
			//时间地点
			$data['start_time']=$this->_post('time_start');
			$data['end_time']=$this->_post('time_end');
			$data['address']=$this->_post('address');
            if( !$data['start_time']){
                $this->error('请设置活动开始时间');
            }			
            if( !$data['end_time']){
                $this->error('请设置活动结束时间');
            }
            if( !$data['address']){
                $this->error('请设置活动地点');
            }
			
            //修改图片
            if (!empty($_FILES['img']['name'])) {
                $result = $this->_upload($_FILES['img'], 'item/'.$date_dir, array(
                    'width'=>C('pin_item_bimg.width').','.C('pin_item_img.width').','.C('pin_item_simg.width'), 
                    'height'=>C('pin_item_bimg.height').','.C('pin_item_img.height').','.C('pin_item_simg.height'),
                    'suffix' => '_b,_m,_s',
                ));
                if ($result['error']) {
                    $this->error($result['info']);
                } else {
                    $data['img'] = $date_dir . $result['info'][0]['savename'];
                    //保存一份到相册
                    $item_imgs[] = array(
                        'item_id' => $item_id,
                        'url'     => $data['img'],
                    );
                }
            }

            //上传相册
            $file_imgs = array();
            foreach( $_FILES['imgs']['name'] as $key=>$val ){
                if( $val ){
                    $file_imgs['name'][] = $val;
                    $file_imgs['type'][] = $_FILES['imgs']['type'][$key];
                    $file_imgs['tmp_name'][] = $_FILES['imgs']['tmp_name'][$key];
                    $file_imgs['error'][] = $_FILES['imgs']['error'][$key];
                    $file_imgs['size'][] = $_FILES['imgs']['size'][$key];
                }
            }
            if( $file_imgs ){
                $result = $this->_upload($file_imgs, 'item/'.$date_dir, array(
                    'width'=>C('pin_item_bimg.width').','.C('pin_item_simg.width'),
                    'height'=>C('pin_item_bimg.height').','.C('pin_item_simg.height'),
                    'suffix' => '_b,_s',
                ));
                if ($result['error']) {
                    $this->error($result['info']);
                } else {
                    foreach( $result['info'] as $key=>$val ){
                        $item_imgs[] = array(
                            'item_id' => $item_id,
                            'url'    => $date_dir . $val['savename'],
                            'order'   => $key + 1,
                        );
                    }
                }
            }
            //标签
            $tags = $this->_post('tags', 'trim');
            if (!isset($tags) || empty($tags)) {
                $tag_list = D('tag')->get_tags_by_title($data['intro']);
            } else {
                $tag_list = explode(' ', $tags);
            }
            if ($tag_list) {
                $item_tag_arr = $tag_cache = array();
                $tag_mod = M('tag');
                foreach ($tag_list as $_tag_name) {
                    $tag_id = $tag_mod->where(array('name'=>$_tag_name))->getField('id');
                    !$tag_id && $tag_id = $tag_mod->add(array('name' => $_tag_name)); //标签入库
                    $item_tag_arr[] = array('item_id'=>$item_id, 'tag_id'=>$tag_id);
                    $tag_cache[$tag_id] = $_tag_name;
                }
                if ($item_tag_arr) {
                    $item_tag = M('item_tag');
                    //清除关系
                    $item_tag->where(array('item_id'=>$item_id))->delete();
                    //商品标签关联
                    $item_tag->addAll($item_tag_arr);
                    $data['tag_cache'] = serialize($tag_cache);
                }
            }

            //更新商品
            $this->_mod->where(array('id'=>$item_id))->save($data);
            //更新图片和相册
            $item_imgs && M('item_img')->addAll($item_imgs);

            //附加属性
            $attr = $this->_post('attr', ',');
            if( $attr ){
                foreach( $attr['name'] as $key=>$val ){
                    if( $val&&$attr['value'][$key] ){
                        $atr['item_id'] = $item_id;
                        $atr['attr_name'] = $val;
                        $atr['attr_value'] = $attr['value'][$key];
                        M('item_attr')->add($atr);
                    }
                }
            }
            $this->success(L('operation_success')); 
        } else {
/*             $id = $this->_get('id','intval');
            $item = $this->_mod->where(array('id'=>$id))->find();
            //分类
            $spid = $this->_cate_mod->where(array('id'=>$item['cate_id']))->getField('spid');
            if( $spid==0 ){
                $spid = $item['cate_id'];
            }else{
                $spid .= $item['cate_id'];
            }
            $this->assign('selected_ids',$spid); //分类选中
            $tag_cache = unserialize($item['tag_cache']);
            $item['tags'] = implode(' ', $tag_cache);
            $this->assign('info', $item);
            //来源
            $orig_list = M('item_orig')->select();
            $this->assign('orig_list', $orig_list);
            //相册
            $img_list = M('item_img')->where(array('item_id'=>$id))->select();
            $this->assign('img_list', $img_list);
            //属性
            $attr_list = M('item_attr')->where(array('item_id'=>$id))->select();
            $this->assign('attr_list', $attr_list); */
            $this->display();
        }
    }
	    /**
     * ajax获取标签
     */
    public function ajax_gettags() {
        $title = $this->_get('title', 'trim');
        $tag_list = D('tag')->get_tags_by_title($title);
        $tags = implode(' ', $tag_list);
        $this->ajaxReturn(1, L('operation_success'), $tags);
    }
	    /**
     * 获取紧接着的下一级分类ID
     */	
    public function ajax_getchilds() {
	     $this->_cate_mod = D('item_cate');
        $id = $this->_get('id', 'intval');
        $type = $this->_get('type', 'intval', null);
        $map = array('pid'=>$id);
        if (!is_null($type)) {
            $map['type'] = $type;
        }
        $return = $this->_cate_mod->field('id,name')->where($map)->select();
        if ($return) {
            $this->ajaxReturn(1, L('operation_success'), $return);
        } else {
            $this->ajaxReturn(0, L('operation_failure'));
        }
    }	
}