<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Website Dinas Kearsipan | Pemerintah Kota Depok</title>

    <script src="<?php echo base_url()?>assets/js/jquery.min.js"></script>
    <script src="<?php echo base_url()?>assets/js/jquery-ui.js"></script>

  <!-- core CSS -->
    <link href="<?php echo base_url()?>assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url()?>assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="<?php echo base_url()?>assets/css/main.css" rel="stylesheet">
    <link href="<?php echo base_url()?>assets/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">


</head><!--/head-->

<link href="<?php echo base_url()?>assets/css/tblsorter/tblsorter.css" rel="stylesheet">
<link href="<?php echo base_url()?>assets/css/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url()?>assets/css/bootstrap.form.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url()?>assets/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css">


</head><!--/head-->

<body id="home" class="homepage">

    <header id="header">
        <nav id="main-menu" class="navbar navbar-default navbar-fixed-top" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="<?php echo base_url()?>"><img src="<?php echo base_url()?>assets/images/upload/logo/<?php echo  get_logo() ?>" style="width:169px;height:57px" alt="logo"></a>
                </div>
        <!-- MENU BEGIN HERE-->
                <?php echo $nav_bar_menu ?>
                
        <!-- MENU END HERE-->
               
            </div><!--/.container-->
        </nav><!--/nav-->
    </header><!--/header-->
<!--Page Content Start-->

<script>
function searchFilter(page_num) {
    page_num = page_num?page_num:0;
    document.getElementById('page_pos').value=page_num;  
    var keywords = $('#keywords').val();
    var sortBy = $('#sortBy').val();
    $.ajax({
        type: 'POST',
        url: '<?php echo base_url(); ?>opd/ajaxPaginationData/'+page_num,
        data:'page='+page_num+'&keywords='+keywords+'&sortBy='+sortBy,
        beforeSend: function () {
            $('.loading').show();
        },
        success: function (html) {
            $('#postList').html(html);
            $('.loading').fadeOut("slow");
        }
    });
}


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
             // assign the third column (we start counting zero) 
            6: { 
                // disable it by setting the property sorter to false 
                sorter: false 
            } 
        } 
    }); 
});


 function showAlert(containerId, alertType, message, delay_time) {
    $("#" + containerId).append('<div style="position:fixed;top: 50%;left: 40%;" class="alert alert-' + alertType + '" id="alert' + containerId + '">' + message + '</div>');
    $("#alert" + containerId).alert();

    window.setTimeout(function () { $("#alert" + containerId).alert('close'); }, delay_time);
}

function get_data(id){
    var url;
    var nmsection ;
    var arr_section;

    url= '<?php echo base_url() ?>opd/get_article_data';
    $('#flage_save').val('2');
    $.post(url, {
         article_id : id
    }, function(response){
        var obj = $.parseJSON(response);
        $.each(obj, function() {
            $('#hdn_article_id').val(this['fe_content_id']);
            $('#nm_opd').val(this['fe_content_title']);
            $('#no_arsip').val(this['fe_content_short_desc']);
            $('#judul_arsip').val(this['fe_full_content']);
            $('#txt_tgl_terbit').val(this['tgl_arsip']);
            $('#myModal').modal('show'); 
         });
    });
}

</script>

<style>
  #sortable1, #sortable2 {
    border: 1px solid #eee;
    width: 210px;
    min-height: 50px;
    list-style-type: none;
    margin: 0;
    padding: 5px 0 0 0;
    float: left;
    margin-right: 10px;
    cursor: move;
  }
  #sortable1 li, #sortable2 li {
    margin: 0 5px 5px 5px;
    padding: 5px;
    font-size: 1.2em;
    width: 200px;
  }

  .ui-sortable-placeholder { 
     background:yellow !important; 
     height: 40px !important; // this is the key, set your own height, start with small
     visibility: visible !important;
     boder: 1px dotted;
     margin: 0 0 -10px 0; // additionaly, you can position your placeholder, 
     }  
  </style>
<div class="container">
<input type="hidden" id ="tags" name="tags" /> 
<input type="hidden" id ="secnm" name="secnm" />

    <div class="row">
           <div class="box-header">
                <h4 class="box-title">Organisasi Perangkat Daerah</h4>
                <div class="box-tools">
                        <div class="loading" style="display: none; position: absolute;left: 50%;top: 50%;">
                            <div class="content">
                                <img src="<?php echo base_url().'assets/images/loader/loading.gif'; ?>"/>
                            </div>
                        </div>
                         <div class="input-group">
                            <input type="text" onkeydown = "if (event.keyCode == 13) searchFilter() "    
                            name="searchText" id="keywords"  class="form-control input-sm pull-right" style="width: 200px; " placeholder="Search"/>
                           <div class="input-group-btn">
                                <button style="height: 30px; border: 1px solid " onclick="searchFilter()" class="btn btn-sm btn-default searchList"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                </div>
            </div><!-- /.box-header -->
     <form id="frm_page_list" > 
        <input type="hidden" id="page_pos">      
         <div id="messages" ></div>
        <div class="post-list" id="postList">
             <div id="list_data_container">
              <?php
              echo '<table id="myTable"  class="table table-condensed table-bordered tablesorter">';
              echo '<thead>
                  <tr>
                    <th>#</th>
                    <th>Judul/Nama Arsip</th>
                    <th>Nomer Arsip</th>
                    <th>Nama OPD</th>
                    <th>Tanggal Terbit Arsip</th>
                  </tr>
                  </thead>
              <tbody>';
              $rec_no =1;
              if(!empty($posts)){  
                  $status ='';  
                  foreach($posts as $row){
                      if($row['status_active']=='Y'){
                        $status = '<i class="fa fa-check-square-o fa-2x" aria-hidden="true"></i>';
                      }else{
                        $status = '<i class="fa fa-square-o fa-2x" aria-hidden="true"></i>';
                      }
                   echo '<tr>
                        <td scope="row" align="right" >'.$rec_no.'</td>
                        <td ><a href="javascript:get_data('."'".$row['fe_content_id']."'".')">'.$row['fe_full_content'].'</a></td>
                        <td>'.$row['fe_content_short_desc'].'</td>
                        <td>'.$row['fe_content_title'].'</td>
                        <td>'.indonesian_date($row['display_start_from'],'d/m/Y','').'</td>
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
        </div>
     </form>   
    </div>
</div>

<!-- modal upload -->
     <div class="container">
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="padding-left: 15px; padding-right:10px">
                        <form id="frm_add_article" enctype="multipart/form-data" role="form">
                        <style type="text/css">
                          ginput[type="text"]
                          {
                              border: 0;
                              outline: 0;
                              border-bottom: 1px solid blue;
                              outline: 0;
                          }


                        </style>
                       
                        <input type="hidden" id ="flag_save" name="flag_save" />
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title">Detail OPD</h4>
                            </div>
                                      <input type="hidden" id="hdn_article_id" name="hdn_article_id" > 
                                          <div class="form-group-sm">
                                               <label for="menutext">Nama OPD:</label>
                                                <input type="text" class="form-control" readonly maxlength="150" style="width:60%" id="nm_opd" name="nm_opd">
                                          </div>
                                          <div class="form-group-sm">
                                               <label for="menutext">Nomer Arsip:</label>
                                                <input type="text" class="form-control" readonly maxlength="255" style="width:60%" id="no_arsip" name="no_arsip">
                                          </div>
                                        <div class="form-group-sm">
                                            <label for="menutext">Judul/Nama Arsip:</label>
                                            <input type="text" class="form-control" readonly maxlength="255" style="width:60%" id="judul_arsip" name="judul_arsip">
                                        </div>
                                          <div class="form-group-sm">
                                               <label for="menutext">Tgl. Terbit Arsip:</label>
                                                   <input type='text' style="width: 10%" readonly id="txt_tgl_terbit" name="txt_tgl_terbit" class="form-control" />
                                                   <br>
                                          </div>
                                           
                            <!--modal content end here-->
                                          <div class="modal-footer" style="text-align:right">
                                              <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
                                          </div>                                          
                                </div>
                      </form>  
                          
                    </div>
                </div>
            </div>

        </div>

<!--Page Content End-->



    <script src="<?php echo base_url()?>assets/js/jquery.tablesorter.min.js"></script>
    <script src="<?php echo base_url()?>assets/js/moment.js"></script>
    <script src="<?php echo base_url()?>assets/js/bootstrap-datetimepicker.js"></script>

    <script src="<?php echo base_url()?>assets/js/bootstrap.min.js"></script>
  
    <script src="<?php echo base_url()?>assets/js/owl.carousel.min.js"></script>
    <script src="<?php echo base_url()?>assets/js/mousescroll.js"></script>
    <script src="<?php echo base_url()?>assets/js/smoothscroll.js"></script>
    <script src="<?php echo base_url()?>assets/js/jquery.prettyPhoto.js"></script>
    <script src="<?php echo base_url()?>assets/js/jquery.isotope.min.js"></script>
    <script src="<?php echo base_url()?>assets/js/jquery.inview.min.js"></script>
    <script src="<?php echo base_url()?>assets/js/wow.min.js"></script>
    <script src="<?php echo base_url()?>assets/js/main.js"></script>
    
  <?php echo generate_footer('16')?>  
</body>
</html>