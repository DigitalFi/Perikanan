<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dashboard_model extends CI_Model{
	

 
	function __construct(){
			  // Call the Model constructor
       parent::__construct();
       $this->load->library('session');
       $this->load->helper('common');
       $this->load->database();
	}	

    function get_total_urusan(){

       $sql ="SELECT COUNT(*) as jmldata FROM ref_urusan  ";
       $query = $this->db->query($sql);
       $row = $query->row();
       $jmldata = 0;
       if(isset($row)){
         $jmldata = $row->jmldata;
       }
       return $jmldata;
    }

    function get_total_urusan_uploaded(){
       $currentyear = getSysDate('Y');
       $sql ="SELECT COUNT(DISTINCT kd_urusan) as jmldata FROM tbl_statistic_stg WHERE tahun ='$currentyear'";
       $query = $this->db->query($sql);
       $row = $query->row();
       $jmldata = 0;
       if(isset($row)){
         $jmldata = $row->jmldata;
       }
       return $jmldata;
    }

    function get_percent_data_uploaded(){
      $expected = $this->get_total_urusan();
      $actual = $this->get_total_urusan_uploaded();
      $percent_data = 0;
      if($actual!=0){
        $percent_data = ($actual/$expected) * 100;
      }

      return number_format($percent_data,2)."%";
    }    

    function get_total_data_complete(){
        $currentyear = getSysDate('Y');
        $sql ="select * FROM (
        SELECT  tbl_statistic_stg.kd_urusan, nm_urusan, SUM(nilai) jmlnilai, tahun FROM tbl_statistic_stg 
        inner join ref_urusan on ref_urusan.kd_urusan = tbl_statistic_stg.kd_urusan 
        GROUP BY tbl_statistic_stg.kd_urusan ORDER BY tbl_statistic_stg.kd_urusan
        )x WHERE x.jmlnilai > 0 AND x.tahun ='$currentyear'";
        $query = $this->db->query($sql);
        return ($query->num_rows() > 0)?$query->num_rows():FALSE;
    }

    function get_total_data_incomplete(){
        $currentyear = getSysDate('Y');
        $sql ="select * FROM (
        SELECT  tbl_statistic_stg.kd_urusan, nm_urusan, SUM(nilai) jmlnilai, tahun FROM tbl_statistic_stg 
        inner join ref_urusan on ref_urusan.kd_urusan = tbl_statistic_stg.kd_urusan 
        GROUP BY tbl_statistic_stg.kd_urusan ORDER BY tbl_statistic_stg.kd_urusan
        )x WHERE x.jmlnilai = 0 AND  x.tahun ='$currentyear'";
         $query = $this->db->query($sql);
        return ($query->num_rows() > 0)?$query->num_rows():FALSE;
    }    

    function get_percent_kelengkapan_data(){
      $currentyear = getSysDate('Y');
      $complete = $this->get_total_data_complete();
      $incomplete = $this->get_total_data_incomplete();
      $percent_data = 0;
      if($complete!=0){
        $percent_data = ($complete/$incomplete) * 100;
      }

      return number_format($percent_data,2) ."%";
    } 

    function get_zero_data_urusan(){
      $currentyear = getSysDate('Y');
      $sql ="SELECT COUNT(*) AS jmldata, tahun FROM (
      SELECT  kd_urusan, SUM(nilai) jmlnilai, tahun FROM tbl_statistic_stg GROUP BY kd_urusan ORDER BY kd_urusan
      )x  WHERE x.jmlnilai =0 AND  x.tahun ='$currentyear'";
     $query = $this->db->query($sql);
     $row = $query->row();
     $jmldata = 0;
     if(isset($row)){
       $jmldata = $row->jmldata;
     }
     return $jmldata;
     }

     function get_contained_data_urusan(){
      $currentyear = getSysDate('Y');
      $sql ="SELECT COUNT(*) AS jmldata, tahun FROM (
      SELECT  kd_urusan, SUM(nilai) jmlnilai, tahun FROM tbl_statistic_stg GROUP BY kd_urusan ORDER BY kd_urusan
      )x  WHERE x.jmlnilai >0 AND  x.tahun ='$currentyear'";
     $query = $this->db->query($sql);
     $row = $query->row();
     $jmldata = 0;
     if(isset($row)){
       $jmldata = $row->jmldata;
     }
     return $jmldata;
     }

     function get_zero_data(){
        $currentyear = getSysDate('Y');
        $sql ="select * FROM (
        SELECT  tbl_statistic_stg.kd_urusan, nm_urusan, SUM(nilai) jmlnilai, tahun FROM tbl_statistic_stg 
        inner join ref_urusan on ref_urusan.kd_urusan = tbl_statistic_stg.kd_urusan 
        GROUP BY tbl_statistic_stg.kd_urusan ORDER BY tbl_statistic_stg.kd_urusan
        )x WHERE x.jmlnilai = 0 AND  x.tahun ='$currentyear'";
         $query = $this->db->query($sql);
        return ($query->num_rows() > 0)?$query->result_array():FALSE;
     }

     function get_contained_data(){
        $currentyear = getSysDate('Y');
        $sql ="select * FROM (
        SELECT  tbl_statistic_stg.kd_urusan, nm_urusan, SUM(nilai) jmlnilai, tahun FROM tbl_statistic_stg 
        inner join ref_urusan on ref_urusan.kd_urusan = tbl_statistic_stg.kd_urusan 
        GROUP BY tbl_statistic_stg.kd_urusan ORDER BY tbl_statistic_stg.kd_urusan
        )x WHERE x.jmlnilai > 0 AND  x.tahun ='$currentyear'";
         $query = $this->db->query($sql);
        return ($query->num_rows() > 0)?$query->result_array():FALSE;
     }

}
?>