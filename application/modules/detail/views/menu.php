<!-- Content start here -->
<?php

    if(is_array($dt_template)){	
	  foreach ($dt_template as $dt) {
	   	echo get_template($dt['id_template'], $dt['id_pages'], false, '11');
	   	//$idtemplate, $idpages, $fordetail=false, $template_used=0
	  }
	}else{
		echo "You Need setup the page";
	}
?>
<!-- Content end here -->