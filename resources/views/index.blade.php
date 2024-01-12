<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <title>{{ config('app.name', 'Laravel') }}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="Sistema de facturacion electronica de cualquier producto,Ventas Manrique" name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="google-site-verification" content="e6xkp_UHXBVig3KkEBN0q9AskoEbkbZP_Pv5N1Gnqus" />

        <link rel="shortcut icon" href="assets/images/favicon.ico">
        <!-- CSRF Token -->
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <!--Morris Chart CSS -->
        <link rel="stylesheet" href="/assets/plugins/morris/morris.css">
        <!-- DataTables -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
        <meta name="userId" content="{{ Auth::check()?Auth::user()->id:'' }}">
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/metismenu/dist/metisMenu.min.css">


        <link href="/css/plugins_datables.css" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap core CSS -->
        <!-- MetisMenu CSS -->
        <!-- Icons CSS -->
        <!-- Font Awesome -->
        <link href="/fontawesome/css/all.css" rel="stylesheet"> <!--load all styles -->
        <!-- Custom styles for this template -->
        
        <link href="/css/plantilla.css" rel="stylesheet">



    </head>


    <body>
      <div id="app">
        <div id="page-wrapper">
                <!-- Top Bar Start -->
            <div class="topbar">

                <!-- LOGO -->
                <div class="topbar-left">
                    <div class="">
                        <a href="/dashboard" class="logo">
                            <img src="/assets/images/logo.png" alt="logo" class="logo-lg" />
                            <img src="/assets/images/logo_sm.png" alt="logo" class="logo-sm hidden" />
                        </a>
                    </div>
                </div>

                <!-- Top navbar -->
                <div class="navbar navbar-default" role="navigation">
                    <div class="container">
                        <div class="">

                            <!-- Mobile menu button -->
                            <div class="pull-left">
                                <button type="button" class="button-menu-mobile visible-xs visible-sm">
                                    <i class="fa fa-bars"></i>
                                </button>
                                <span class="clearfix"></span>
                            </div>



                            <!-- Top nav Right menu -->
                            <ul class="nav navbar-nav navbar-right top-navbar-items-right pull-right">
                                {{-- <li class="hidden-xs">
                                    <form role="search" class="navbar-left app-search pull-left">
                                         <input type="text" placeholder="Search..." class="form-control">
                                         <a href=""><i class="fa fa-search"></i></a>
                                    </form>
                                </li> --}}
                                <notification :notifications="notifications"></notification>

                                <li class="dropdown top-menu-item-xs">
                                    <a href="" class="dropdown-toggle menu-right-item profile" data-toggle="dropdown" aria-expanded="true"><img src="/assets/images/users/user.png" alt="user-img" class="img-circle"> </a>
                                    <ul class="dropdown-menu">
                                        <li><router-link to="/dashboard/perfil"><i class="fa fa-user-circle"></i> Perfil</router-link></li>
                                        {{-- <li><a href="javascript:void(0)"><i class="ti-settings m-r-10"></i> Settings</a></li>
                                        <li><a href="javascript:void(0)"><i class="ti-lock m-r-10"></i> Lock screen</a></li> --}}
                                        <li class="divider"></li>
                                        <li>
                                             <a href="javascript:void(0)" onclick="document.getElementById('logoutForm').submit()"><i class="fas fa-sign-out-alt"></i> Cerrar Session</a>
                                            
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div> <!-- end container -->
                </div> <!-- end navbar -->
            </div>
            <!-- Top Bar End -->
            <form id="logoutForm" action="{{ route('logout') }}" method="POST">
                 @csrf
                
            </form>

            <!-- Page content start -->
            <div class="page-contentbar">

                <!--left navigation start-->
                @include('plantilla.sidebar')
                <!--left navigation end-->

                <!-- START PAGE CONTENT -->
                <div id="page-right-content" class="page-right-content">
                    @yield('contenido')
                    <!-- end container -->
                    <div class="footer">
                        {{-- <div class="pull-right hidden-xs">
                            Project Completed <strong class="text-custom">39%</strong>.
                        </div> --}}
                        <div>
                            
                                <script type="text/javascript">
                                    copyright=new Date();
                                    update=copyright.getFullYear();
                                    document.write("© 2020 - " + update + " " + "Ventas Manrique");
                                </script>
                        </div>
                    </div> <!-- end footer -->
                </div>
                <!-- End #page-right-content -->

            </div>
            <!-- end .page-contentbar -->
        </div>
        <!-- End #page-wrapper -->
        <!-- js placed at the end of the document so the pages load faster -->
        
        </div>       

        <script src="/js/app.js"></script>
        <script src="/js/plantilla.js"></script> 
        <script src="/assets/plugins/morris/morris.min.js"></script>
        {{-- <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.21/datatables.min.js"></script> --}}
        <script src="/js/plugins_datables.js"></script>

        <script src="/assets/plugins/raphael/raphael-min.js"></script>
        <!-- Dashboard init -->

        <script src="/assets/js/jquery.app.js"></script>
        {{-- <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.14.1/lodash.min.js"></script> --}}
        {{-- <script src="js/jquery.dataTables.min.js" type="text/javascript" charset="utf-8" async defer></script>
        <script src="js/dataTables.responsive.min.js" type="text/javascript" charset="utf-8" async defer></script> --}}

        

    </body>
</html>