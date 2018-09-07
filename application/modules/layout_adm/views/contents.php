						<script>
							function load_page(url_page,id_menu, lbl_menu){
							   var id='';
							   $('.loading').show();	
							   $.ajax({
							      type: "POST",
							      url: url_page,
							      data: {idmenu: id_menu, label:lbl_menu}, 
							      error : function(xhr, ajaxOptions, thrownError){
							          console.log(xhr.status);
							          console.log(xhr.responseText);
							          console.log(thrownError);
							      },
							      success : function(data){
							      	   $('.loading').hide();
							           $('#web_container').html(data);

							      }
							  });
							}

						</script>

						<div class="loading" style="display: none; position: absolute;left: 50%;top: 50%;">
						  <div class="content">
						      <img src="<?php echo base_url().'assets/images/loading_circle.gif'; ?>"/>
						  </div>
						</div>						
			            <div class="wrapper wrapper-content">
			                
			                    <div id="web_container">
			                    	<div class="row  border-bottom white-bg dashboard-header">
								<!-- PAGE CONTENT BEGINS -->
									<?php
									if ( ! defined('BASEPATH')) exit('No direct script access allowed');

									if($webcontent)
									{
									    $this->load->view($webcontent);
									}
									?>									
								<!-- PAGE CONTENT ENDS -->
									</div>
								</div>
			                
			            </div>


