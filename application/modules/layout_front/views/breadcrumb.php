            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-sm-4">
                    <h2><?php echo $title ?></h2>
                    <ol class="breadcrumb">
                            <?php 
                                $itembc ='';
                                if(is_array($bc)){
                                    foreach($bc as $item){
                                        $itembc.= "<li>
                                                    $item
                                                  </li>";
                                    }
                                }else{
                                        $itembc= "<li class='active'>$title</li>";                                  
                                }
                             echo "Home / ".$itembc;

                             ?>
                    </ol>
                </div>
            </div>