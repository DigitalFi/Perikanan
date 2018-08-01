<?php
 
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
 
/**
 *
 * @author http://www.roytuts.com
 */
class File_model extends CI_Model {
 
   
    function save_files_info($files, $desc) {
        //start db traction
        $this->db->trans_start();
        //file data
       $file_data_hdr = array();
       $file_data_dtl = array();
        // Save article header
            $sort_order =  get_last_sort_order('sys_fe_content', 'fe_content_sort_order', 'fe_section_name', $this->input->post("section") );
            $file_data_hdr[] = array(
                'fe_full_content' => htmlentities($this->input->post("editor1")),
                'fe_content_title' =>$this->input->post("title"),
                'fe_content_short_desc' =>$this->input->post("short_desc"),
                'status_active' =>'Y',
                'fe_section_name' =>$this->input->post("section"),
                'fe_content_sort_order' =>$sort_order,
                'fe_content_btn_label' =>$this->input->post("lblbutton")
            );
            $this->db->insert_batch('sys_fe_content', $file_data_hdr);
            $insert_id = $this->db->insert_id();

       //insert data with multiple image
         $counter_desc = 0;   
        foreach ($files as $file) {
            $file_data_dtl[] = array(
                'content_id' => $insert_id,
                'files_name' =>$file['file_name'], 
                'file_desc' =>$desc[$counter_desc],
                'upload_date' =>date('Y-m-d H:i:s'),
                'upload_by' =>$this->session->userdata('full_name')
            );
          $counter_desc++;  
        }
$this->db->insert_batch('tbl_gallery_files', $file_data_dtl);
        $this->db->trans_complete();
        //check transaction status
        if ($this->db->trans_status() === FALSE) {
            foreach ($files as $file) {
                $file_path = $file['full_path'];
                //delete the file from destination
                if (file_exists($file_path)) {
                    unlink($file_path);
                }
            }
            //rollback transaction
            $this->db->trans_rollback();
            return FALSE;
        } else {
            //commit the transaction
            $this->db->trans_commit();
            return TRUE;
        }
    }
 
}