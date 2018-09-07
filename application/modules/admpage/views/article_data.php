<script>
$(document).ready(function() {
    $('.chosen-select', this).chosen({width: "40%"});    
      init_grid_data_manipulation();

});

</script>
<div id="messages" ></div>
<div class="post-list" id="postList">
     <div id="list_data_container">
              <?php
                  echo '<table id="myTable" style="width:90%"  class="table table-hovered table-bordered">';
                  echo '<thead>
                      <tr>
                        <th style="text-align:right; width:3px" >#</th>
                        <th style="width:3px" ><input type="checkbox" OnChange="Populate()"  class="select-all"   /></th>
                        <th>Tittle</th>
                        <th>Short Description</th>
                        <th>Media Type</th>
                        <th>Article Type</th>
                        <th style="text-align:right;" >Create Date</th>
                        <th>Create By</th>
                        <th style="text-align:right;" >Update Date</th>
                        <th>update By</th>
                        <th>Publish By</th>
                       <th style="width:3px">Action</th>
                      </tr>
                      </thead>
                  <tbody>';
                  $rec_no =1;
                  if(!empty($posts)){  
                      $status ='';  
                      foreach($posts as $row){
                       echo '<tr>
                            <td scope="row" align="right" style="width:3%" >'.$rec_no.'. </td>
                            <td style="width:3px" scope="row"><input type="checkbox" class="chk-box"  Onclick="Populate()" name="id_content[]" value='.$row['id_article'].' /></td>
                            <td ><a href="javascript:editdata('."'".$row['id_article']."'".')">'.$row['title'].'</a></td>
                            <td>'.$row['short_description'].'</td>
                            <td>'.$row['file_type'].'</td>
                            <td>'.$row['nm_template'].'</td>
                            <td align="right" >'.$row['create_date'].'</td>
                            <td align="right">'.$row['user_name'].'</td>
                            <td align="right" >'.$row['update_date'].'</td>
                            <td align="right">'.$row['update_by'].'</td>
                            <td align="right">'.$row['publish_by'].'</td>
                            <td style="width:3px" align="center"><a href="javascript:editdata('."'".$row['id_article']."'".')"><i style="font-size:16px;" class="fa fa-edit" aria-hidden="true"></i></a></td>
                          </tr>';
                      $rec_no++;    
                      }
                    }else{
                       echo '<tr><td colspan="8" class="bg-info">Data not available or not found</td></tr>';
                    }  
                  echo '</table>';
                    ?>
    </div>
    <?php echo $this->ajax_pagination->create_links(); ?>        
</div>
 