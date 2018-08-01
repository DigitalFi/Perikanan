<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Frontend_menu_models extends CI_Model{
	
	function __construct(){
			  // Call the Model constructor
			  parent::__construct();
			  $this->load->library('session');
			  $this->load->helper('common');
	}	

	function generate_frontend_menu($parent){
		$next_id_menu ='';
		$sqlhdr = "SELECT a.id_menu, a.menu_label, a.link_menu,  a.section_id,  Deriv1.Count, a.parent_id  FROM `sys_frontend_menu` a 
		LEFT OUTER JOIN (SELECT parent_id, COUNT(*) AS Count FROM `sys_frontend_menu` GROUP BY parent_id) Deriv1 
		ON a.id_menu = Deriv1.parent_id WHERE a.parent_id='$parent' and a.is_active='Y' ORDER BY sort_order";
		$queryhdr =$this->db->query($sqlhdr);

		$menu_position = strtolower(get_sys_setting ('003'));
		$menu_item = "<div class='collapse navbar-collapse navbar-".$menu_position."'>";
		$menu_item.= "<ul class='nav navbar-nav'>";

		foreach ($queryhdr->result() as $row){
			$section = get_foldername_by_section_id($row->section_id);
			$img_folder = get_foldername_by_section_id($row->section_id);
			$url_menu = base_url();
			if($row->link_menu!='#' && $row->link_menu!=''){
				$url_menu = base_url().$img_folder."/detail/".$row->link_menu."/".strtolower($row->menu_label);
			}

			if($row->Count>0){		
				$menu_item.="<li class='dropdown'><a class='dropdown-toggle' data-toggle='dropdown' href='".$url_menu."'>".$row->menu_label."<span class='caret'></span></a>";	
				if(isset($row->parent_id)){
					$menu_item.="<ul class='dropdown-menu'>";
					$menu_item.= $this->generate_sub_menu($row->id_menu);
				}
			  }elseif($row->Count==0){
				  $menu_item.= "<li class='scroll active'><a href='".$url_menu."'>".$row->menu_label."</a></li>";
			  }
			    $menu_item.="</li>";
			}//foreach ($queryhdr->result() as $row){
			$menu_item.="</ul>
		  </div>
		</div>
		</div>";
		return $menu_item;	
	}
	
	private function generate_sub_menu($parent_id){
		$item_sub_menu='';
		$sql_sub = "SELECT a.id_menu, a.menu_label, a.link_menu, a.section_id,  Deriv1.Count, a.parent_id  FROM `sys_frontend_menu` a 
				LEFT OUTER JOIN (SELECT parent_id, COUNT(*) AS Count FROM `sys_frontend_menu` GROUP BY parent_id) Deriv1 
				ON a.id_menu = Deriv1.parent_id WHERE a.parent_id='$parent_id' and a.is_active='Y' order by a.sort_order";
			$querysub =$this->db->query($sql_sub);	
			
			foreach ($querysub->result() as $row){
			$section = get_foldername_by_section_id($row->section_id);
			$url_menu = base_url();	
			if($row->link_menu!='#' && $row->link_menu!=''){
				$url_menu = base_url().$section."/detail/".$row->link_menu."/".strtolower($row->menu_label);
			}
				if($row->Count>0){
						$item_sub_menu.="<li class='menu-item dropdown dropdown-submenu'><a href='".$url_menu."'>".$row->menu_label."</a>";
						$item_sub_menu.="<ul class='dropdown-menu'>";	
						$item_sub_menu.=$this-> generate_sub_menu($row->id_menu);
				}elseif($row->Count==0){
					$item_sub_menu.="<li><a href='".$url_menu."'>".$row->menu_label."</a></li>";
				}else;
			}
				$item_sub_menu.="</li>";
				$item_sub_menu.="</ul>";
			return $item_sub_menu;
	}
}

?>