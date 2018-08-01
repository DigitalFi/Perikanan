	 <script src="<?php echo base_url()?>assets/js/jquery.tablesorter.min.js"></script>
	<link href="<?php echo base_url()?>assets/css/tblsorter/tblsorter.css" rel="stylesheet">

<script>

function Populate(){
  var favorite = [];
  $.each($("input[name='id_content']:checked"), function(){
       favorite.push($(this).val());
  });
  $('#tags').val(favorite.join("|"));
  //alert("My favourite sports are: " + favorite.join(", "));

}

$('document').ready(function()
{
    $('.select-all').click(function(){
        if(this.checked)
            $(".chk-box").prop("checked", true);
        else
            $(".chk-box").prop("checked", false);
    });
        
    $(".chk-box").click(function()
    {
        //alert ('jml check '+$(".chk-box").length +'jml yg di check'+  $(".chk-box:checked").length)
        if($(".chk-box").length == $(".chk-box:checked").length)
        {
            $(".select-all").prop("checked", true);
        }
        else
        {
            $(".select-all").removeAttr("checked");
        }
    });
});

$(document).ready(function() { 
    $("table").tablesorter({ 
    	 widgets: ['zebra'],
        // pass the headers argument and assing a object 
        headers: { 
            // assign the secound column (we start counting zero) 
            0: { 
                // disable it by setting the property sorter to false 
                sorter: false 
            }, 
            1: { 
                // disable it by setting the property sorter to false 
                sorter: false 
            }, 
            // assign the third column (we start counting zero) 
            6: { 
                // disable it by setting the property sorter to false 
                sorter: false 
            } 
        } 
    }); 
});
</script>

  <div id="list_data_container">
  <?php
  echo '<table class="table table-condensed table-bordered tablesorter">';
  echo '<thead class="nav">
      <tr>
        <th>#</th>
        <th><input type="checkbox" OnChange="Populate()"  class="select-all"   /></th>
        <th><a href="javascript:searchFilter()">Page Name</a></th>
        <th>Section Item</th>
        <th>Is Main Page</th>
        <th>Article</th>
        <th>Action</th>
      </tr>
      </thead>
      <tbody>';
  		$rec_no =1;
	      if(!empty($posts)){  
             $m_page ='';  
              foreach($posts as $row){
              if($row['is_main_page']=='1'){
                $m_page = '<i class="fa fa-check-square-o fa-2x" aria-hidden="true"></i>';
              }else{
                $m_page = '<i class="fa fa-square-o fa-2x" aria-hidden="true"></i>';
              }
	            echo '<tr>
	                <td scope="row">'.$rec_no.'</td>
	                <td scope="row"><input type="checkbox" class="chk-box"  Onclick="Populate()" name="id_pages[]" value='.$row['page_id'].' /></td>
	                <td><a href="javascript:get_data('."'".$row['page_id']."'".')">'.$row['page_name'].'</a></td>
	                <td>'.get_section_in_array($row['section_name']).'</td>
	                <td align="center">'.$m_page.'</td>
	                <td>'.$row['fe_content_title'].'</td>
	                <td align="center"><a href="javascript:get_data('."'".$row['page_id']."'".')"><i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i></a></td>
	              </tr>';
	          $rec_no++;    
	          }
	        }else{
	            echo '<tr><td colspan="8" class="bg-danger">Data not available or not found</td></tr>';
	        }  
	      echo '</table>';
   	 ?>
</div>
<?php echo $this->ajax_pagination->create_links(); ?>