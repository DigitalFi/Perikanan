<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Pages_model extends CI_Model{
	
	function __construct(){
			  // Call the Model constructor
		parent::__construct();
	   $this->load->library('session');
       $this->load->database();
       $this->load->helper('common');
	}	


function get_page_section(){
	$sql ="SELECT section_id, section_name, section_title FROM sys_page_section WHERE is_visible = 'Y'";
	$query=$this->db->query($sql);
	$query=$this->db->query($sql);
	$row=$query->result();
	return $row;
}	


	function jumlah_data($kriteria){
	 $this->db->like('page_name', $kriteria);
	 $this->db->from('sys_pages');
	 $num_rows= $this->db->count_all_results();//$this->db->count_all("sys_fe_content");
	 return $num_rows;
	}

    function pageListingCount($searchText = '')
    {
        $this->db->select('page_id, page_name, section_name, is_main_page, sort_order, article_id');
        $this->db->from('sys_pages');
        if(!empty($searchText)) {
            $likeCriteria = "(page_name  LIKE '%".$searchText."%' OR  section_name  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }
        $query = $this->db->get();
        return count($query->result());
    }

    function page_listing($searchText = '', $page, $segment)
    {
        $this->db->select('page_id, page_name, section_name, is_main_page, sort_order, article_id');
        $this->db->from('sys_pages');
        if(!empty($searchText)) {
            $likeCriteria = "(page_name  LIKE '%".$searchText."%'
                            OR  section_name  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }
        $this->db->limit($page, $segment);
        $query = $this->db->get();
        
        $result = $query->result();  
        return $result;
    }

	function data_page($number,$offset,$kriteria){
	 $this->db->like('page_name', $kriteria);
	 $this->db->order_by('page_name');
	 return $query = $this->db->get('sys_pages',$number,$offset)->result();	

	}
 
function update_content($data, $id){
		if(isset($data['fe_img_files'])){
			$fe_img_files=$data['fe_img_files'];
		}

		$fe_content_title=$data['fe_content_title'];
		$fe_content_short_desc=$data['fe_content_short_desc'];
		$fe_full_content=$data['fe_full_content'];
		$fe_content_btn_label=$data['fe_content_btn_label'];
		$fe_section_name=$data['fe_section_name'];
		$fe_content_sort_order=$data['fe_content_sort_order'];
		$update_by=$this->session->userdata('full_name');

		if(isset($data['fe_img_files'])){
			$sql = "UPDATE sys_fe_content SET fe_img_files='$fe_img_files', fe_content_title='$fe_content_title', 
			fe_content_short_desc='$fe_content_short_desc', fe_full_content='$fe_full_content', fe_content_btn_label='$fe_content_btn_label',
			fe_content_sort_order='$fe_content_sort_order', fe_section_name='$fe_section_name', update_date=NOW(), update_by='$update_by'
			WHERE fe_content_id = '$id'";

		}else{
			$sql = "UPDATE sys_fe_content SET fe_content_title='$fe_content_title', 
			fe_content_short_desc='$fe_content_short_desc', fe_full_content='$fe_full_content', fe_content_btn_label='$fe_content_btn_label',
			fe_content_sort_order='$fe_content_sort_order', fe_section_name='$fe_section_name', update_date=NOW(), update_by='$update_by'
			WHERE fe_content_id = '$id'";

		}


		//return $sql;
		$this->db->query($sql);

		// $this->db->trans_complete();
		// if ($this->db->trans_status() === FALSE) {
		//     # Something went wrong.
		//     $this->db->trans_rollback();
		//     echo "Article ".$fe_content_title."Update Failed";
		// } 
		// else {
		//     # Everything is Perfect. 
		//     # Committing data to the database.
		//     $this->db->trans_commit();
		   
		// }		
		 echo "Article ".$fe_content_title."Update successfully";
 }

function insert_content($data){
		$fe_img_files=$data['fe_img_files'];
		$fe_content_title=$data['fe_content_title'];
		$fe_content_short_desc=$data['fe_content_short_desc'];
		$fe_full_content=$data['fe_full_content'];
		$fe_content_btn_label=$data['fe_content_btn_label'];
		$fe_section_name=$data['fe_section_name'];
		$fe_content_sort_order=$data['fe_content_sort_order'];
		$create_by=$this->session->userdata('full_name');

		$sql = "INSERT INTO sys_fe_content(fe_img_files, fe_content_title, fe_content_short_desc, fe_full_content, fe_content_btn_label, fe_content_sort_order, fe_section_name,status_active, create_date, create_by)
		VALUES ('$fe_img_files', '$fe_content_title', '$fe_content_short_desc', '$fe_full_content', '$fe_content_btn_label', '$fe_content_sort_order', '$fe_section_name', 'Y', NOW(), '$create_by')";

		//return $sql;
		$this->db->query($sql);
		echo "Article ".$fe_content_title." saved successfully";
 }


function update_content_ori($data, $id, $with_img = true){
		$fe_content_title=$data['fe_content_title'];
		$fe_content_short_desc=$data['fe_content_short_desc'];
		$fe_full_content=$data['fe_full_content'];
		$fe_content_btn_label=$data['fe_content_btn_label'];
		$fe_section_name=$data['fe_section_name'];
		$fe_content_sort_order=$data['fe_content_sort_order'];
		$update_by=$this->session->userdata('full_name');

		if($with_img== true){
			$fe_img_files=$data['fe_img_files'];
			$sql = "UPDATE sys_fe_content SET fe_img_files='$fe_img_files', fe_content_title='$fe_content_title', 
			fe_content_short_desc='$fe_content_short_desc', fe_full_content='$fe_full_content', fe_content_btn_label='$fe_content_btn_label',
			fe_content_sort_order='$fe_content_sort_order', fe_section_name='$fe_section_name', update_date=NOW(), update_by='$update_by'
			WHERE fe_content_id = '$id'";
		}else{
			$sql = "UPDATE sys_fe_content SET fe_content_title='$fe_content_title', 
			fe_content_short_desc='$fe_content_short_desc', fe_full_content='$fe_full_content', fe_content_btn_label='$fe_content_btn_label',
			fe_content_sort_order='$fe_content_sort_order', fe_section_name='$fe_section_name', update_date=NOW(), update_by='$update_by'
			WHERE fe_content_id = '$id'";
		}

		$this->db->query($sql);
		echo "Article ".$fe_content_title."Updated successfully";
 }

function load_article_add_ui($list_section){
	$form_ui='<link href="'.base_url().'assets/css/bootstrap-datetimepicker.css" rel="stylesheet">
	<link href="'.base_url().'assets/css/bootstrap.form.css" rel="stylesheet" type="text/css">
	<script src="'.base_url().'assets/js/jquery.min.js"></script>
	<script src="'.base_url().'assets/js/moment.js"></script>
	<script src="'.base_url().'assets/js/bootstrap-datetimepicker.js"></script>
	
	<script>
	$("#upload").on("click", function() {
			var file_data = $("#berkas").prop("files")[0];   
			var form_data = new FormData();                  
			form_data.append("file", file_data);
			$.ajax({
						url: "save_article", // point to server-side PHP script 
						dataType: "text",  // what to expect back from the PHP script, if anything
						cache: false,
						contentType: false,
						processData: false,
						data: form_data,                         
						type: "post",
						success: function(php_script_response){
							alert(php_script_response); // display response from the PHP script, if any
						}
			 });
		});
	</script>
			 <div id="files"></div>
				<form id="data">
				 
					  <div class="form-group-sm">
						   <label for="menutext">Title:</label>
							<input type="text" class="form-control" maxlength="75" style="width:60%" id="title" name="title">
					  </div>
					  <div class="form-group-sm">
						   <label for="menutext">Short Description:</label>
							<input type="text" class="form-control" maxlength="75" style="width:60%" id="short_desc" name="short_desc">
					  </div>
					<div class="form-group-sm">
						<label for="menutext">Content Detail:</label>
						<textarea name="editor1" id="editor1" rows="10" cols="80">
						</textarea>
					</div>
					  <div class="form-group-sm">
						   <label for="menutext">Label for Button:</label>
							<input type="text" class="form-control" maxlength="75" style="width:30%" id="lblbutton" name="lblbutton">
					  </div>
					<div class="form-group-sm">
						<label for="menutext">Image Article :</label>
						<input class="form-control" style="width:60%" type="file" name="berkas" id="berkas" />
					</div>
					
					<div class="form-group-sm">
						<label for="menutext">Set this page as:</label>';
							 
							$attributes = 'class="form-control" style="width:200px" id="section"';
						$form_ui.=form_dropdown('section', $list_section, set_value('section'), $attributes); 
							
				   $form_ui.='</div>
					<div class="col-md-3">
						<div class="form-group">
						<label for="menutext">Publish this article From:</label>
						   <div class="input-group date" id="dtfrom">
								<input type="text" class="form-control" />
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
					</div>
				   <div class="col-md-3">
						<div class="form-group">
						<label for="menutext">Until:</label>
						   <div class="input-group date" id="dtuntil">
								<input type="text" class="form-control" />
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
					</div>
				
				<script type="text/javascript">
					$(function () {
						$("#dtfrom").datetimepicker({
							widgetPositioning:{
								vertical: "top"
							}
						});
						$("#dtuntil").datetimepicker({
							useCurrent: false,//Important! See issue #1075
							widgetPositioning:{
								vertical: "top"
							}
						});
						$("#dtfrom").on("dp.change", function (e) {
							$("#dtuntil").data("DateTimePicker").minDate(e.date);
						});
						$("#dtuntil").on("dp.change", function (e) {
							$("#dtfrom").data("DateTimePicker").maxDate(e.date);
						});
					});
				</script>    
				<script>
					CKEDITOR.replace( "editor1", {
						extraPlugins: "uploadimage",
						height: 200,
						width : 600,
				
						// Configure your file manager integration. This example uses CKFinder 3 for PHP.
						//filebrowserBrowseUrl: "../uploads/",
						//filebrowserImageBrowseUrl: "../uploads/",
						
						filebrowserUploadUrl: "do_upload",
						//filebrowserImageUploadUrl:"../uploads/bookcase8.png",
						//image_alignClasses: [ "image-align-left", "image-align-center", "image-align-right" ],
						//image_disableResizer: false
						
					} );
					
					//config.plugins = "dialogui,dialog,about,a11yhelp,basicstyles,blockquote,clipboard,panel,floatpanel,menu,contextmenu,resize,button,toolbar,elementspath,enterkey,entities,popup,filebrowser,floatingspace,listblock,richcombo,format,horizontalrule,htmlwriter,wysiwygarea,image,indent,indentlist,fakeobjects,link,list,magicline,maximize,pastetext,pastefromword,removeformat,showborders,sourcearea,specialchar,menubutton,scayt,stylescombo,tab,table,tabletools,undo,wsc,lineutils,widgetselection,widget,filetools,notification,notificationaggregator,uploadwidget,uploadimage,uploadfile,uploadcare";
				</script>
				</form>
                    <div class="modal-footer">
                    <input type="submit" value="Submit">
                     <button type="button" id="upload"  class="btn btn-danger">Save it</button>
                     <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                    </div>
                  </div>
				';
  return  $form_ui;
}

	function delete_selected_article() {
		$id_content = $this->input->post('id_content');
		
		print_r($id_content);
		
/*		for ($i=0; $i < count($id_content) ; $i++) { 
			$this->db->where('fe_content_id', $id_content[$i]);
			$this->db->delete('sys_fe_content');
		}
*/	}

function get_data_article($id){
	$sql ="SELECT fe_content_id, fe_img_files, fe_content_title, fe_content_short_desc, 
	fe_full_content, fe_content_btn_label, fe_section_name FROM sys_fe_content WHERE fe_content_id = '$id' ";
	$query=$this->db->query($sql);
	$row=$query->row();

	return $row;
}

	
}
?>