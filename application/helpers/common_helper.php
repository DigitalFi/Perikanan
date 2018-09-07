<?php 
function create_db_combo($tblname, $key_field, $value_field, $order_field, $additional_value='-Plese Select-', $param=''){
     //get main CodeIgniter object  
       $ci =& get_instance();
       //load databse library
       $ci->load->database();

   $ci->db->from($tblname);
     if($param!=''){
        $ci->db->where($param);
     }
     $ci->db->order_by($order_field);
     $result = $ci->db->get();

    $dd[''] = $additional_value ;
    if ($result->num_rows() > 0){
      foreach ($result->result() as $row) {
        $dd[$row->$key_field] = $row->$value_field;
      }
    }
    return $dd;
  }

function create_chosen_db_combo($id_obj, $tblname, $key_field, $value_field, $order_field, $additional_value, $selected_value='', $param='', $multiple=false, $dt_arr_multi=array()){
     $ci =& get_instance();
     $ci->load->database();
     if($order_field!=''){
        $sqlorder = " ORDER BY $order_field";
     }
     $sql ="SELECT $key_field, $value_field FROM $tblname $param $sqlorder";  //echo $sql ."<br>";

     $query=$ci->db->query($sql);
     $result = $query->result_array();
    $dd='' ;
    $state ='';
    $multi ='';
    $tanda='';
    if($multiple==true){
      $multi = 'multiple';
      $tanda = "[]";
    }

      $dd.= '<select '.$multi.' style="position:absolute;" data-placeholder="" id="'.$id_obj.'" name="'.$id_obj.$tanda.'" single class="chosen-select" tabindex="8" " >';
          $cntr = 0;
          if($additional_value==''){
            //$additional_value ='-Please Select-';
          }
      foreach ($result as $res) {
        $r = array_values($res);
        $flag ='';
//echo " data ". $r[0] ." selected ". $selected_value .'<br>';
            if($r[0]==$selected_value){
              $selected='Selected';
            }else{
              $selected='';
            }

            if($cntr==0){
              $dd.='<option style="fixed; z-index:99999"    value="">'.$additional_value.'</option>';
            } 

            if($multiple==true){//jika dropdown multi select
              if(count($dt_arr_multi)>0){//Jika nilai sudah ada di db utk user tertentu
                     if(in_array($r[0],$dt_arr_multi, true)){
                        $selected='Selected';
                     }else{
                        $selected='';
                     }
                   $dd.='<option  style="fixed; z-index:99999"  '.$flag.' '.$selected.' value="'.$r[0].'">'.$r[1].'</option>';
              }else{//jika nilai blum ada di db utk user tertentu
                   $dd.='<option  style="fixed; z-index:99999"  '.$flag.' value="'.$r[0].'">'.$r[1].'</option>';
              }
            }else{//jika single select
                $dd.='<option  style="fixed; z-index:99999"  '.$flag.' '.$selected.' value="'.$r[0].'">'.$r[1].'</option>';
            }

            $cntr++;
      }
      $dd.= '</select>';
    return $dd;
  }

   function is_data_exist($tblname, $fieldname, $param){
      $ci =& get_instance();
      $ci->load->database();

      $sql ="SELECT $fieldname FROM $tblname WHERE $param ";
      $query=$ci->db->query($sql);
      $row=$query->row();
      if(isset($row)){
        return true;
      }else{
        return false;
      }
   }

  function display_menu($parent='') {
    $ci =& get_instance();
    $ci->load->database();
    $roles_id = $ci->session->userdata('role_id');
    $menu_spec = get_sys_setting('008');

    $sqlhdr = "SELECT a.id_menu, a.menu_label, a.additional_info, a.id_pages, a.link_menu, Deriv1.Count, a.parent_id, a.icon_menu  FROM `sys_front_menu` a 
    LEFT OUTER JOIN (SELECT parent_id, COUNT(*) AS Count FROM `sys_front_menu` WHERE is_active = 'Y' GROUP BY parent_id) Deriv1 
    ON a.id_menu = Deriv1.parent_id WHERE a.parent_id='$parent' and is_active = 'Y' AND menu_spec like '%$menu_spec%' ";
    //AND id_menu in (SELECT id_menu FROM sys_menu_role WHERE roles_id = '$roles_id') ORDER BY sort_order";
    $queryhdr =$ci->db->query($sqlhdr);

    $class_active ="";$default_page="";
    $menu_item =""; $addinfo="";
                      foreach ($queryhdr->result() as $row){
                      //condition helper check for sneaky li
                      if($row->Count>0){
                          $li_open = "";
                          $li_close ="";

                      }elseif ($row->Count==0){
                          $li_open = "<li class='nav-item active'>";
                          $li_close ="</li>";

                      }  
                      if($row->Count>0){
                          $menu_item.="<li class='nav-item dropdown'>
                          <a class='nav-link dropdown-toggle' href='#'' id='dropdownMenuButton2' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>".$row->menu_label."<span class='sr-only'></span></a>
                                <div class='dropdown-menu' aria-labelledby='dropdownMenuLink_1'>";
                                    $menu_item.=display_menu($row->id_menu);
                   $menu_item.="</div>";    
                          $menu_item.="</li>";               
                      } elseif ($row->Count==0) {
                        $template_id = '';// get_template_id($row->id_pages);
                        if($parent!=''){
                            $li_open = "";
                            $li_close ="";
                            $submenu_class = "dropdown-item";
                        }else{
                          $li_open = "<li class='nav-item'>";
                          $li_close ="</li>";
                          $submenu_class = "nav-link";
                        }
                        $menu_desc = str_replace(" ", "-", $row->menu_label);
                        if($row->additional_info!=''){
                          $addinfo = str_replace(" ", "-", $row->additional_info)."-";
                        }
                        $menu_item.=$li_open;
                        if($row->link_menu=="#"){
                          $link_url = base_url();
                        }else{
                          $link_url=base_url().$row->link_menu."/".$row->id_pages."/".$template_id."?lbl=".$addinfo.$menu_desc;
                        }
                        $menu_item.="<a class='".$submenu_class."' href=".$link_url.">".$row->menu_label."<span class='sr-only'>(current)</span></a>";
                        $menu_item.=$li_close;
                      } else;
                      }
   
    //  $menu_item.=" </ul>";
   
    return $menu_item;  
    }

  function display_menu_adm($parent='') {
    $ci =& get_instance();
    $ci->load->database();
    $roles_id = $ci->session->userdata('role_id');
    $menu_spec = get_sys_setting('008');

    $sqlhdr = "SELECT a.id_menu, a.menu_label, a.link_menu, Deriv1.Count, a.parent_id, a.icon_menu  FROM `sys_admin_menu` a 
    LEFT OUTER JOIN (SELECT parent_id, COUNT(*) AS Count FROM `sys_admin_menu` GROUP BY parent_id) Deriv1 
    ON a.id_menu = Deriv1.parent_id WHERE a.parent_id='$parent' and is_active = 'Y' AND menu_spec like '%$menu_spec%' ";
    //AND id_menu in (SELECT id_menu FROM sys_menu_role WHERE roles_id = '$roles_id') ORDER BY sort_order";
    $queryhdr =$ci->db->query($sqlhdr);
   // echo "menu". 
    $class_active ="";$default_page="";
    $menu_item ="<ul class='nav nav-list'>";
                      if($parent==''){
                        $default_page ="Dashboard";
                      } 
                      foreach ($queryhdr->result() as $row){
                          if($row->menu_label==$ci->input->get('menu')){
                            $class_active = "class='active'";
                          }else{
                            $class_active = "";
                          }

                          if($row->menu_label==$ci->uri->segment(1)){
                            $class_active_hdr = "class='active'";
                          }else{
                            $class_active_hdr = "";
                          }


                      if($row->Count>0){
                          $menu_item.="<li $class_active_hdr>
                          <a href='#' ><i class='fa fa-".$row->icon_menu."'></i> <span class='nav-label'>".$row->menu_label."</span> <span class='fa arrow'></span></a>
                                <ul class='nav nav-second-level collapse'>";
                                    $menu_item.=display_menu_adm($row->id_menu);
                   $menu_item.="</ul>";    
                          $menu_item.="</li>";               
                      } elseif ($row->Count==0) {
                  $menu_item .="<li  $class_active>
                                  <a href='".base_url().$row->link_menu."?menu=".$row->menu_label."'><i class='fa fa-". $row->icon_menu."'></i> <span class='nav-label'>".$row->menu_label."</span></a>
                                </li>";
                      } else;
                      }
    $menu_item.=" </ul>";

    return $menu_item;  
  }

function display_tree_menu($parent='') {
    $ci =& get_instance();
    $ci->load->database();
    $roles_id = $ci->session->userdata('role_id');
    $menu_spec = get_sys_setting('008');

    $sqlhdr = "SELECT a.id_menu, a.menu_label, a.sort_order, a.link_menu, Deriv1.Count, a.parent_id, a.icon_menu  FROM `sys_front_menu` a 
    LEFT OUTER JOIN (SELECT parent_id, COUNT(*) AS Count FROM `sys_front_menu` GROUP BY parent_id) Deriv1 
    ON a.id_menu = Deriv1.parent_id WHERE a.parent_id='$parent' and is_active = 'Y' AND menu_spec like '%$menu_spec%' ";
    $queryhdr =$ci->db->query($sqlhdr);

     // $menu_item="<ul  id='tree1' class='sortable'>";
    $script='';
    $menu_item="<ul  id='tree1' class='sortable".$parent."'>";
      $script.="<script>
      $( function() {
      $( '.sortable".$parent."' ).sortable({
        placeholder: 'ui-state-highlight',
        update: function( event, ui ) {
        //var sorted = $( '.sortable".$parent."' ).sortable( 'serialize');
       // data_id = $( '.sortable".$parent."' ).sortable('toArray', {attribute: 'data-item'});

        var dataObj = {};
        var attribArray = [];
        $('.sortable".$parent." li').each(function(el,i){
            var obj = new Object;
            attribArray.push({'id' : $(this).attr('data-id'), 'parent' : $(this).attr('data-parent'), 'sortorder' : $(this).attr('data-sortorder') })
        })
        dataObj['data'] = attribArray;
        alert(JSON.stringify(dataObj));

        $.ajax({
           url: 'update_sort_order_adm',
           type: 'POST',
           data: {data_order: sorted},
           success: function (data) {
              //  alert(data);
           }
          });     
          }   
      });
      $( '.sortable".$parent."' ).disableSelection();
      } );
      </script>";

      foreach ($queryhdr->result() as $row){
          if($row->Count>0){
              $menu_item.="<li data-id=".$row->id_menu." data-parent=".$row->parent_id." data-sortorder=".$row->sort_order." class='ui-state-default'  class='folder' title='Bookmarks'>".$row->menu_label."&nbsp;<button style='margin-top:-2px' type='button' class='btn btn-warning btn-xs align-top'><i class='fa fa-link'></i> Add sub menu </button>";
                        $menu_item.=display_tree_menu($row->id_menu);
              $menu_item.="</li>";               
          }elseif($row->Count==0){
              $menu_item.="<li  data-id=".$row->id_menu." data-parent=".$row->parent_id." data-sortorder=".$row->sort_order." class='ui-state-default align-top' >".$row->menu_label."<button style='margin-top:-3px' type='button' class='btn btn-success btn-xs pull-right align-top' onclick=javascript:editdata('".$row->id_menu."')><i class='fa fa-link'></i> Maintain this Menu</button></li>";
          } else;
      }
    $menu_item.="</ul>";

    return $menu_item.$script;  
  }



function get_breadcrumb_info($idmenu){
    $ci =& get_instance();
    $ci->load->database(); 
    $item_bc='';
    $sql = "SELECT b.menu_label main, a.menu_label child
            FROM sys_admin_menu AS a
            LEFT JOIN sys_admin_menu AS b ON a.parent_id = b.id_menu
            WHERE a.id_menu ='$idmenu' ";
  $query=$ci->db->query($sql);
  $rows=$query->row();
  if(isset($rows)){
    if($rows->main==''){
       $item_bc = array($rows->child);
    }else{
      $item_bc = array($rows->main, $rows->child);
    }
  }
  return $item_bc;
}

function get_info_by_id($tblname, $fieldinfo, $field_id, $nilai){
  $ci =& get_instance();
  //load databse library
  $ci->load->database();    

  $sql ="SELECT  $fieldinfo FROM $tblname WHERE $field_id = '$nilai'";
  //echo $sql."<BR>";
  $query=$ci->db->query($sql);
  $rows=$query->row();
  if(isset($rows)){
    $info = $rows->$fieldinfo;
  }else{
    $info ='';
  }
  return $info;
}

function get_info_by_id_global_param($tblname, $fieldinfo, $param){
  $ci =& get_instance();
  //load databse library
  $ci->load->database();    

  $sql ="SELECT  $fieldinfo FROM $tblname $param ";
  $query=$ci->db->query($sql);
  $rows=$query->row();
  if(isset($rows)){
    $info = $rows->$fieldinfo;
  }else{
    $info ='';
  }
  return $info;
}

 function get_sys_setting($id){
     $ret_val = '';
       //get main CodeIgniter object
       $ci =& get_instance();
       
       //load databse library
       $ci->load->database();
       
     //get data from database
     $sql ="SELECT value_setting FROM sys_settings WHERE id_setting = '$id'";
     $query = $ci->db->query($sql);
     $row=$query->row();
     if($row){
      $ret_val = $row->value_setting;    
     }
     return $ret_val;
   }

function generate_table($array_title, $array_data, $field_to_display){

   $Rows = count($array_data); 
    $Cols = count($array_title) ; 
    echo '<table class="table table-condensed table-bordered tablesorter">';
    echo '<thead>';
    foreach($array_title as $title){
     echo '<th>'.$title.'</th>';
    }
    echo '</thead>';
    echo'<tbody>';
    foreach( $array_data as $data){ 
      $r = array_values($data);
      echo '<tr>';
      for($j=0;$j<=$Cols-1;$j++){ 
        echo '<td>'. $r[$j] .'</td>'; 
      }
      echo '</tr>';
    }
    echo'</tbody>';

    echo '</table>';
}

function get_menu_by_role_id($role_id){
   $ci =& get_instance();
   $ci->load->database();
   $ci->db->select('id_user_role, b.roles_name, c.menu_label');
   $ci->db->from('sys_menu_role a');
   $ci->db->join("sys_roles b", 'a.roles_id=b.roles_id','inner');
   $ci->db->join("sys_admin_menu c", 'c.id_menu=a.id_menu', 'inner');
   $ci->db->where("b.roles_id='$role_id'");
   $query = $ci->db->get();
   $menu='';
   foreach ($query->result() as $row){
      $menu.=' <span class="badge badge-info">'.$row->menu_label.'</span>';
   }

   return $menu;
}

function format_date_as_db_format($strdate, $oriformat='d/m/Y', $db_ormat='Y-m-d'){
  $date = DateTime::createFromFormat('d/m/Y', $strdate);
  return $date->format('Y-m-d');
}

function format_date_as_id_format($strdate, $oriformat='Y-m-d'){
  $date = DateTime::createFromFormat('Y-m-d', $strdate);
  if($date){
    return $date->format('d/m/Y');
  }else{
    return '';
  }
}

function indonesian_date ($timestamp = '', $date_format = 'l, j F Y | H:i', $suffix = 'WIB') {
    if (trim ($timestamp) == '')
    {
            $timestamp = time ();
    }
    elseif (!ctype_digit ($timestamp))
    {
        $timestamp = strtotime ($timestamp);
    }
    # remove S (st,nd,rd,th) there are no such things in indonesia :p
    $date_format = preg_replace ("/S/", "", $date_format);
    $pattern = array (
        '/Mon[^day]/','/Tue[^sday]/','/Wed[^nesday]/','/Thu[^rsday]/',
        '/Fri[^day]/','/Sat[^urday]/','/Sun[^day]/','/Monday/','/Tuesday/',
        '/Wednesday/','/Thursday/','/Friday/','/Saturday/','/Sunday/',
        '/Jan[^uary]/','/Feb[^ruary]/','/Mar[^ch]/','/Apr[^il]/','/May/',
        '/Jun[^e]/','/Jul[^y]/','/Aug[^ust]/','/Sep[^tember]/','/Oct[^ober]/',
        '/Nov[^ember]/','/Dec[^ember]/','/January/','/February/','/March/',
        '/April/','/June/','/July/','/August/','/September/','/October/',
        '/November/','/December/',
    );
    $replace = array ( 'Sen','Sel','Rab','Kam','Jum','Sab','Min',
        'Senin','Selasa','Rabu','Kamis','Jumat','Sabtu','Minggu',
        'Jan','Feb','Mar','Apr','Mei','Jun','Jul','Ags','Sep','Okt','Nov','Des',
        'Januari','Februari','Maret','April','Juni','Juli','Agustus','Sepember',
        'Oktober','November','Desember',
    );
    $date = date ($date_format, $timestamp);
    $date = preg_replace ($pattern, $replace, $date);
    $date = "{$date} {$suffix}";
    return $date;
} 

function getsysdate($format="Y-m-d H:i:s"){
    date_default_timezone_set("Asia/Bangkok");
    $sysdate = date($format);
    return $sysdate;
}

function fcharword($string, $upper = true){
  $words = explode(" ", $string);
  $acronym = "";

  foreach ($words as $w) {
    if($upper==true){
      $fchar = strtoupper($w[0]);
    }
  $acronym .=$fchar;

  }
  return $acronym;
}


?>