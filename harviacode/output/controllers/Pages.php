<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Pages extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('Pages_model');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));
        
        if ($q <> '') {
            $config['base_url'] = base_url() . 'pages/index.html?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'pages/index.html?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'pages/index.html';
            $config['first_url'] = base_url() . 'pages/index.html';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;
        $config['total_rows'] = $this->Pages_model->total_rows($q);
        $pages = $this->Pages_model->get_limit_data($config['per_page'], $start, $q);

        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'pages_data' => $pages,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $this->load->view('pages/sys_pages_list', $data);
    }

    public function read($id) 
    {
        $row = $this->Pages_model->get_by_id($id);
        if ($row) {
            $data = array(
		'page_id' => $row->page_id,
		'page_name' => $row->page_name,
		'section_name' => $row->section_name,
		'is_main_page' => $row->is_main_page,
		'sort_order' => $row->sort_order,
		'article_id' => $row->article_id,
	    );
            $this->load->view('pages/sys_pages_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('pages'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('pages/create_action'),
	    'page_id' => set_value('page_id'),
	    'page_name' => set_value('page_name'),
	    'section_name' => set_value('section_name'),
	    'is_main_page' => set_value('is_main_page'),
	    'sort_order' => set_value('sort_order'),
	    'article_id' => set_value('article_id'),
	);
        $this->load->view('pages/sys_pages_form', $data);
    }
    
    public function create_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
		'page_name' => $this->input->post('page_name',TRUE),
		'section_name' => $this->input->post('section_name',TRUE),
		'is_main_page' => $this->input->post('is_main_page',TRUE),
		'sort_order' => $this->input->post('sort_order',TRUE),
		'article_id' => $this->input->post('article_id',TRUE),
	    );

            $this->Pages_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('pages'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->Pages_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('pages/update_action'),
		'page_id' => set_value('page_id', $row->page_id),
		'page_name' => set_value('page_name', $row->page_name),
		'section_name' => set_value('section_name', $row->section_name),
		'is_main_page' => set_value('is_main_page', $row->is_main_page),
		'sort_order' => set_value('sort_order', $row->sort_order),
		'article_id' => set_value('article_id', $row->article_id),
	    );
            $this->load->view('pages/sys_pages_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('pages'));
        }
    }
    
    public function update_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('page_id', TRUE));
        } else {
            $data = array(
		'page_name' => $this->input->post('page_name',TRUE),
		'section_name' => $this->input->post('section_name',TRUE),
		'is_main_page' => $this->input->post('is_main_page',TRUE),
		'sort_order' => $this->input->post('sort_order',TRUE),
		'article_id' => $this->input->post('article_id',TRUE),
	    );

            $this->Pages_model->update($this->input->post('page_id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('pages'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->Pages_model->get_by_id($id);

        if ($row) {
            $this->Pages_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('pages'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('pages'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('page_name', 'page name', 'trim|required');
	$this->form_validation->set_rules('section_name', 'section name', 'trim|required');
	$this->form_validation->set_rules('is_main_page', 'is main page', 'trim|required');
	$this->form_validation->set_rules('sort_order', 'sort order', 'trim|required');
	$this->form_validation->set_rules('article_id', 'article id', 'trim|required');

	$this->form_validation->set_rules('page_id', 'page_id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function excel()
    {
        $this->load->helper('exportexcel');
        $namaFile = "sys_pages.xls";
        $judul = "sys_pages";
        $tablehead = 0;
        $tablebody = 1;
        $nourut = 1;
        //penulisan header
        header("Pragma: public");
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0,pre-check=0");
        header("Content-Type: application/force-download");
        header("Content-Type: application/octet-stream");
        header("Content-Type: application/download");
        header("Content-Disposition: attachment;filename=" . $namaFile . "");
        header("Content-Transfer-Encoding: binary ");

        xlsBOF();

        $kolomhead = 0;
        xlsWriteLabel($tablehead, $kolomhead++, "No");
	xlsWriteLabel($tablehead, $kolomhead++, "Page Name");
	xlsWriteLabel($tablehead, $kolomhead++, "Section Name");
	xlsWriteLabel($tablehead, $kolomhead++, "Is Main Page");
	xlsWriteLabel($tablehead, $kolomhead++, "Sort Order");
	xlsWriteLabel($tablehead, $kolomhead++, "Article Id");

	foreach ($this->Pages_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
	    xlsWriteLabel($tablebody, $kolombody++, $data->page_name);
	    xlsWriteLabel($tablebody, $kolombody++, $data->section_name);
	    xlsWriteLabel($tablebody, $kolombody++, $data->is_main_page);
	    xlsWriteLabel($tablebody, $kolombody++, $data->sort_order);
	    xlsWriteLabel($tablebody, $kolombody++, $data->article_id);

	    $tablebody++;
            $nourut++;
        }

        xlsEOF();
        exit();
    }

}

/* End of file Pages.php */
/* Location: ./application/controllers/Pages.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-05-06 08:24:37 */
/* http://harviacode.com */