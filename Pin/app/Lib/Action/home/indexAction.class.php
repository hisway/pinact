<?php
class indexAction extends frontendAction {
    
    public function index() {

        //发现
        $hot_tags = explode(',', C('pin_hot_tags')); //热门标签
        //$hot_tags = array_slice($hot_tags, 0, 12);
        //$this->waterfall('', 'hits DESC,id DESC', '', C('pin_book_page_max'), 'book/index');

        //$this->assign('index_cate_list', $index_cate_list);
        //$this->assign('hot_tags', $hot_tags);
        $this->assign('nav_curr', 'index');
        $this->_config_seo();
        //$this->display();
		
		
        $page_max = C('pin_book_page_max'); //发现页面最多显示页数
        $sort = $this->_get('sort', 'trim', 'new'); //排序
        $tag = $this->_get('tag', 'trim'); //当前标签

        $where = array();
        
          if ($tag) {
          $item_tag_table = C('DB_PREFIX').'item_tag';
          $tag_id = M('tag')->where(array('name'=>$tag))->getField('id');
          $where = array($item_tag_table.'.tag_id'=>$tag_id);
          //排序：最热(hot)，最新(new)
          switch ($sort) {
          case 'hot':
          $order = 'i.hits DESC,i.id DESC';
          break;
          case 'new':
          $order = 'i.id DESC';
          break;
          }
          $this->tcate_waterfall($where, $order);
          } else {
		
         
        //$tag && $where['intro'] = array('like', '%' . $tag . '%');
		
        //排序：最热(hot)，最新(new)
        switch ($sort) {
            case 'hot':
                $order = 'hits DESC,id DESC';
                break;
            case 'new':
                $order = 'id DESC';
                break;
        }
        $this->waterfall($where, $order, '', $page_max);
        }

        $this->assign('hot_tags', $hot_tags);
        $this->assign('tag', $tag);
        $this->assign('sort', $sort);
        $this->_config_seo(C('pin_seo_config.book'), array('tag_name' => $tag)); //SEO
        $this->display();
    }
    public function index_ajax() {
        $tag = $this->_get('tag', 'trim'); //标签
        $sort = $this->_get('sort', 'trim', 'new'); //排序
        switch ($sort) {
            case 'hot':
                $order = 'hits DESC,id DESC';
                break;
            case 'new':
                $order = 'id DESC';
                break;
        }
        $where = array();
        $tag && $where['intro'] = array('like', '%' . $tag . '%');
        $this->wall_ajax($where, $order);
    }
	
	/**
     * 标签分类瀑布
     */
    public function tcate_waterfall($where, $order = 'i.id DESC', $field = '') {
        $db_pre = C('DB_PREFIX');
        $item_tag_table = $db_pre . 'item_tag';
        $item_tag_mod = M('item_tag');
        $where_init = array('i.status' => '1');
        $where = array_merge($where_init, $where);
        $count = $item_tag_mod->where($where)->join($db_pre . 'item i ON i.id = ' . $item_tag_table . '.item_id')->count();
        $spage_size = C('pin_wall_spage_size'); //每次加载个数
        $spage_max = C('pin_wall_spage_max'); //每页加载次数
        $page_size = $spage_size * $spage_max; //每页显示个数
        $pager = $this->_pager($count, $page_size);
        !$field && $field = 'i.id,i.uid,i.uname,i.title,i.intro,i.img,i.price,i.likes,i.comments,i.comments_cache';
        $item_list = $item_tag_mod->field($field)->where($where)->join($db_pre . 'item i ON i.id = ' . $item_tag_table . '.item_id')->order($order)->limit($pager->firstRow . ',' . $spage_size)->select();
        foreach ($item_list as $key => $val) {
            isset($val['comments_cache']) && $item_list[$key]['comment_list'] = unserialize($val['comments_cache']);
        }
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
    }

	
	
}