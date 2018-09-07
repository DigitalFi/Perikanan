         <div id="messages" ></div>
        <div class="post-list" id="postList">
             <div id="list_data_container">
                    <?php
                    echo '<table id="myTable" style="width:70%"  class="table table-condensed table-bordered tablesorter">';
                    echo '<thead>
                        <tr>
                          <th style="text-align:right; width:3px" >#</th>
                          <th style="width:3px" ><input type="checkbox" OnChange="Populate()"  class="select-all"   /></th>
                          <th>User Name</th>
                          <th>Email</th>
                          <th>Full Name</th>
                          <th>Role</th>
                          <th style="width:3px">Action</th>
                        </tr>
                        </thead>
                   <tbody>';
                    $rec_no =1;
                    if(!empty($posts)){  
                        $status ='';  
                        foreach($posts as $row){
                         // $opd = $row['id_opd'];

                         echo '<tr>
                              <td scope="row" align="right" style="width:3%" >'.$rec_no.'. </td>
                              <td style="width:3px" scope="row"><input type="checkbox" class="chk-box"  Onclick="Populate()" name="id_content[]" value='.$row['user_id'].' /></td>
                              <td ><a href="javascript:editdata('."'".$row['user_id']."'".')">'.$row['user_name'].'</a></td>
                              <td>'.$row['email'].'</td>
                              <td>'.$row['full_name'].'</td>
                              <td>'.$row['roles_name'].'</td>
                              <td style="width:3px" align="center"><a href="javascript:editdata('."'".$row['user_id']."'".')"><i style="font-size:16px;" class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i></a></td>
                            </tr>';
                        $rec_no++;    
                        }
                      }else{
                         echo '<tr><td colspan="7" class="bg-danger">Data not available or not found</td></tr>';
                      }  
                    echo '</table>';
                      ?>
            <?php  echo $this->ajax_pagination->create_links(); ?>        
        </div>
 