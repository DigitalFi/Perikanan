 <link href="<?php echo base_url()?>assets/css/bootstrap.form.css" rel="stylesheet" type="text/css">
 <style>
.fixed-panel {
  min-height: 10px;
  max-height: 500px;
  overflow-y: scroll;
} 


.table-condensed{
  font-size: 12px;
}

#imaginary_container{
   /*  margin-top:20%; Don't copy this */
}
.stylish-input-group .input-group-addon{
    background: white !important; 
}
.stylish-input-group .form-control{
	border-right:0; 
	box-shadow:0 0 0; 
	border-color:#ccc;
}
.stylish-input-group button{
    border:0;
    background:transparent;
}

 </style>
 <div class="panel panel-default">
 <div class="panel-heading clearfix">
 <h4 class="panel-title pull-left" style="padding-top: 7.5px;">Manage Article</h4>
 	<div class="row ">
        <div class="col-sm-6 col-sm-offset-3 pull-right">
            <div id="imaginary_container"> 
                <div class="input-group stylish-input-group">
                    <input type="text" class="form-control"  placeholder="Search" >
                    <span class="input-group-addon">
                        <button type="submit" onclick="alert('test')">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>  
                    </span>
                </div>
            </div>
        </div>
	</div>
 </div>
  <div class="panel-body">
 <?php
 
 	echo $list_article;
  /*//print_r($records); // echo $this->table->generate($records); 
 		echo '<table class="table table-striped table-condensed">';
		echo '<thead class="nav">
				<tr>
				  <th>#</th>
				  <th><input type="checkbox" /></th>
				  <th>Title</th>
				  <th>Short Description</th>
				  <th>Image File</th>
				  <th>Active Status</th>
				</tr>
			  </thead>
			  <tbody>';
		$rec_no =1;	  
 		foreach($records->result() as $row){
			$short_desc =$row->fe_content_short_desc;
			if($row->fe_content_short_desc==''){
				$short_desc = substr($row->fe_full_content,0,150);
			}
			$three_dot='';
			if(strlen($row->fe_full_content)>=150){
				$three_dot = '...';	
			}
			echo '<tr>
				  <td scope="row">'.$rec_no.'</td>
				  <td scope="row"><input type="checkbox" /></td>
				  <td>'.$row->fe_content_title.'</td>
				  <td>'.$short_desc.$three_dot.'</td>
				  <td>'.$row->fe_img_files.'</td>
				  <td>'.$row->status_active.'</td>
				</tr>';
		$rec_no++;		
		}
 		echo '</table>';*/
 
  ?>
 <?php echo $this->pagination->create_links(); ?>
</div>
  <div class="panel-footer">
   <button type="button" onclick="save(document.getElementById('sv_mode').value)" class="btn btn-danger btn-sm">Delete Article</button>
   <button type="button" onclick="save(document.getElementById('sv_mode').value)" class="btn btn-success btn-sm">Add Article</button>
  </div>
</div>