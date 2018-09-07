<nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav metismenu" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element"> <span>
                                <img  alt="image" style="-webkit-filter: drop-shadow(5px 5px 5px #222); filter: drop-shadow(3px 3px 3px #222); width:60%" class="img-responsive" src="<?php echo base_url()?>assets/images/logo_kkp.png" />
                                 </span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"><?php echo $this->session->userdata('full_name') ?></strong>
                                 </span> <span class="text-muted text-xs block"><?php echo $this->session->userdata('roles_name') ?> <b class="caret"></b></span> </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a href="profile.html">Profile</a></li>
                                <li class="divider"></li>
                                <li><a href="<?php echo base_url()?>auth/logout">Logout</a></li>
                            </ul>
                        </div>
                        <div class="logo-element">
                            DEPOK+
                        </div>
                    </li>
                    <?php echo display_menu_adm() ?>
                </ul>

            </div>
        </nav>