<?php
/*
 *  Class blog main class to pull all the latest posts.
 */
class blog extends Controller {
  
  #Load models
  public function _construct()
  {
    #Load models
    
    #Load libraries
  }
  
  public function index()
  {
    #Collection of top 4 posts.
    $data = array(
            "listOfPostData" => ""  
                  );
    $this->load->view('index');
  }
  
/*
 * Class ends here
 */
}
?>