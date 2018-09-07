<!-- Content start here -->
<?php

  if(!isset($dt_template->template_used)){
  	echo "Template untuk detail halaman ini belum di setting  <a href=".base_url().">klik disini </a> untuk ke halaman utama";
  }else{	
	  $template_used = $dt_template->template_used;
	  $detil_of = $dt_template->detail_of; 	
	  $arr_default_template = explode("|", $dt_template->default_template);

	  $arr_default_template = array_merge($arr_default_template, array($template_used));
	  foreach ($arr_default_template as $dt) {
		echo get_template($dt, $page_id, true, $template_used, $article_id);
	  }

	  echo generate_template_detail($page_id, $template_used, $article_id);
	 // echo "<BR>".$this->db->last_query()."<BR>";
 }

?>
<!-- Content end here -->