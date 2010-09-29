<?php
/*
 *This is a bare bone application for codeigniter with HAML and SASS.
 */
class Welcome extends Controller {

	function Welcome()
	{
		parent::Controller();	
	}
	
	function index()
	{
		$data = array(
									"title" => "Simple application with PHP Codeigniter",
									"pageHeading" => "Test Codeigniter application."
									);
		$this->load->view('index', $data);
	}
}

/* End of file welcome.php */
/* Location: ./system/application/controllers/welcome.php */