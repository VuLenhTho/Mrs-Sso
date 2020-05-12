<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Ule - Bootstrap Admin Dashboard HTML Template</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
    <!-- Sweetalert -->
    <link href="../../assets/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
    <script src="../js/modernizr-3.6.0.min.js"></script>
</head>

<body class="v-light vertical-nav fix-header fix-sidebar">
<div id="preloader">
    <div class="loader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"/>
        </svg>
    </div>
</div>
<div id="main-wrapper">
    <!-- header -->
    <div class="header">
        <div class="nav-header">
            <div class="brand-logo"><a href="index.html"><b><img src="../../assets/images/logo.png" alt=""> </b><span
                    class="brand-title"><img src="../../assets/images/logo-text.png" alt=""></span></a>
            </div>
            <div class="nav-control">
                <div class="hamburger"><span class="line"></span> <span class="line"></span> <span class="line"></span>
                </div>
            </div>
        </div>
        <div class="header-content">
            <div class="header-left">
                <ul>
                    <li class="icons position-relative"><a href="javascript:void(0)"><i
                            class="icon-magnifier f-s-16"></i></a>
                        <div class="drop-down animated bounceInDown">
                            <div class="dropdown-content-body">
                                <div class="header-search" id="header-search">
                                    <form action="#">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Search">
                                            <div class="input-group-append"><span class="input-group-text"><i
                                                    class="icon-magnifier"></i></span>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="header-right">
                <ul>
                    <li class="icons"><a href="javascript:void(0)"><i class="mdi mdi-bell f-s-18"
                                                                      aria-hidden="true"></i>
                        <div class="pulse-css"></div>
                    </a>
                        <div class="drop-down animated bounceInDown">
                            <div class="dropdown-content-heading"><span class="text-left">Recent Notifications</span>
                            </div>
                            <div class="dropdown-content-body">
                                <ul>
                                    <li>
                                        <a href="#">
                                            <img class="pull-left m-r-10 avatar-img"
                                                 src="../../assets/images/avatar/1.jpg" alt="">
                                            <div class="notification-content"><small
                                                    class="notification-timestamp pull-right">02:34 PM</small>
                                                <div class="notification-heading">Mr. Dmitry</div>
                                                <div class="notification-text">5 members joined today</div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <img class="pull-left m-r-10 avatar-img"
                                                 src="../../assets/images/avatar/2.jpg" alt="">
                                            <div class="notification-content"><small
                                                    class="notification-timestamp pull-right">02:34 PM</small>
                                                <div class="notification-heading">Mariam</div>
                                                <div class="notification-text">likes a photo of you</div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <img class="pull-left m-r-10 avatar-img"
                                                 src="../../assets/images/avatar/3.jpg" alt="">
                                            <div class="notification-content"><small
                                                    class="notification-timestamp pull-right">02:34 PM</small>
                                                <div class="notification-heading">Tasnim</div>
                                                <div class="notification-text">Hi Teddy, Just wanted to let you ...
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <img class="pull-left m-r-10 avatar-img"
                                                 src="../../assets/images/avatar/4.jpg" alt="">
                                            <div class="notification-content"><small
                                                    class="notification-timestamp pull-right">02:34 PM</small>
                                                <div class="notification-heading">Ishrat Jahan</div>
                                                <div class="notification-text">Hi Teddy, Just wanted to let you ...
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="text-center"><a href="#" class="more-link">See All</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="icons"><a href="javascript:void(0)"><i class="mdi mdi-comment f-s-18"
                                                                      aria-hidden="true"></i>
                        <div class="pulse-css"></div>
                    </a>
                        <div class="drop-down animated bounceInDown">
                            <div class="dropdown-content-heading"><span class="text-left">2 New Messages</span>
                            </div>
                            <div class="dropdown-content-body">
                                <ul>
                                    <li class="notification-unread">
                                        <a href="#">
                                            <img class="pull-left m-r-10 avatar-img"
                                                 src="../../assets/images/avatar/1.jpg" alt="">
                                            <div class="notification-content"><small
                                                    class="notification-timestamp pull-right">02:34 PM</small>
                                                <div class="notification-heading">Saiul Islam</div>
                                                <div class="notification-text">Hi Teddy, Just wanted to let you ...
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-unread">
                                        <a href="#">
                                            <img class="pull-left m-r-10 avatar-img"
                                                 src="../../assets/images/avatar/2.jpg" alt="">
                                            <div class="notification-content"><small
                                                    class="notification-timestamp pull-right">02:34 PM</small>
                                                <div class="notification-heading">Ishrat Jahan</div>
                                                <div class="notification-text">Hi Teddy, Just wanted to let you ...
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <img class="pull-left m-r-10 avatar-img"
                                                 src="../../assets/images/avatar/3.jpg" alt="">
                                            <div class="notification-content"><small
                                                    class="notification-timestamp pull-right">02:34 PM</small>
                                                <div class="notification-heading">Saiul Islam</div>
                                                <div class="notification-text">Hi Teddy, Just wanted to let you ...
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <img class="pull-left m-r-10 avatar-img"
                                                 src="../../assets/images/avatar/4.jpg" alt="">
                                            <div class="notification-content"><small
                                                    class="notification-timestamp pull-right">02:34 PM</small>
                                                <div class="notification-heading">Ishrat Jahan</div>
                                                <div class="notification-text">Hi Teddy, Just wanted to let you ...
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="text-center"><a href="#" class="more-link">See All</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="icons">
                        <a href="javascript:void(0)"> <i class="mdi mdi-crosshairs-gps f-s-18" aria-hidden="true"></i>
                            <div class="pulse-css"></div>
                        </a>
                        <div class="drop-down dropdown-task animated bounceInDown">
                            <div class="dropdown-content-heading"><span class="text-left">Task Update</span>
                            </div>
                            <div class="dropdown-content-body">
                                <ul>
                                    <li>
                                        <a href="#">
                                            <div class="notification-content"><small
                                                    class="notification-timestamp pull-right">85% Complete</small>
                                                <div class="notification-heading">Task One</div>
                                                <div class="progress">
                                                    <div style="width: 85%;" aria-valuemax="100" aria-valuemin="0"
                                                         aria-valuenow="85" role="progressbar"
                                                         class="progress-bar progress-bar-success"></div>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="notification-content"><small
                                                    class="notification-timestamp pull-right">60% Complete</small>
                                                <div class="notification-heading">Task Two</div>
                                                <div class="progress">
                                                    <div style="width: 60%;" aria-valuemax="100" aria-valuemin="0"
                                                         aria-valuenow="60" role="progressbar"
                                                         class="progress-bar progress-bar-primary"></div>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="notification-content"><small
                                                    class="notification-timestamp pull-right">25% Complete</small>
                                                <div class="notification-heading">Task Three</div>
                                                <div class="progress">
                                                    <div style="width: 25%;" aria-valuemax="100" aria-valuemin="0"
                                                         aria-valuenow="25" role="progressbar"
                                                         class="progress-bar progress-bar-warning"></div>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="notification-content"><small
                                                    class="notification-timestamp pull-right">75% Complete</small>
                                                <div class="notification-heading">Task Four</div>
                                                <div class="progress">
                                                    <div style="width: 75%;" aria-valuemax="100" aria-valuemin="0"
                                                         aria-valuenow="75" role="progressbar"
                                                         class="progress-bar progress-bar-danger"></div>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="text-center"><a href="#" class="more-link">See All</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="icons"><a href="javascript:void(0)"><i class="mdi mdi-account f-s-20"
                                                                      aria-hidden="true"></i></a>
                        <div class="drop-down dropdown-profile animated bounceInDown">
                            <div class="dropdown-content-body">
                                <ul>
                                    <li><a href="#"><i class="mdi mdi-email"></i> <span>Inbox</span></a>
                                    </li>
                                    <li><a href="#"><i class="mdi mdi-settings"></i> <span>Setting</span></a>
                                    </li>
                                    <li><a href="#"><i class="icon-lock"></i> <span>Lock Screen</span></a>
                                    </li>
                                    <li><a href="#"><i class="icon-power"></i> <span>Logout</span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- #/ header -->
    <!-- sidebar -->
    <div class="nk-sidebar">
        <div class="nk-nav-scroll">
            <ul class="metismenu" id="menu">
                <li class="nav-label">Main</li>
                <li><a class="has-arrow" href="#" aria-expanded="false"><i class=" mdi mdi-view-dashboard"></i> <span
                        class="nav-text">Dashboard</span> <span class="badge badge-danger nav-badge">10</span></a>
                    <ul aria-expanded="false">
                        <li><a href="index.html">Dashnoard 1</a>
                        </li>
                        <li><a href="index2.html">Dashnoard 2</a>
                        </li>
                        <li><a href="index3.html">Dashnoard 3</a>
                        </li>
                        <li><a href="index4.html">Dashnoard 4</a>
                        </li>
                        <li><a href="index5.html">Dashnoard 5</a>
                        </li>
                        <li><a href="index5.html">Dashnoard 5</a>
                        </li>
                        <li><a href="index6.html">Dashnoard 6</a>
                        </li>
                        <li><a href="index7.html">Dashnoard 7</a>
                        </li>
                        <li><a href="index8.html">Dashnoard 8</a>
                        </li>
                        <li><a href="index9.html">Dashnoard 9</a>
                        </li>
                        <li><a href="index10.html">Dashnoard 10</a>
                        </li>
                    </ul>
                </li>


                <li class="nav-label">APPS</li>

                <li><a class="has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-chart-bar"></i> <span
                        class="nav-text">Charts</span> <span class="badge badge-warning nav-badge">14</span></a>
                    <ul aria-expanded="false">

                        <li><a href="chart-flot.html">Flot</a>
                        </li>
                        <li><a href="chart-morris.html">Morris</a>
                        </li>
                        <li><a href="chart-chartjs.html">Chartjs</a>
                        </li>

                        <li><a href="chart-chartist.html">Chartist</a>
                        </li>
                        <li><a href="chart-sparkline.html">Sparkline</a>
                        </li>

                        <li><a href="chart-justgage.html">Justgage</a>
                        </li>
                        <li><a href="chart-knob.html">Knob</a>
                        </li>
                        <li><a href="chart-peity.html">Peity</a>
                        </li>
                    </ul>
                </li>
                <li><a class="has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-email"></i> <span
                        class="nav-text">Email</span></a>
                    <ul aria-expanded="false">
                        <li><a href="email-inbox.html">Inbox</a>
                        </li>
                        <li><a href="email-read.html">Read</a>
                        </li>
                        <li><a href="email-compose.html">Compose</a>
                        </li>
                    </ul>
                </li>
                <li><a href="calender-event.html"><i class="mdi mdi-calendar-check"></i> <span
                        class="nav-text">Calendar</span></a></li>
                <li><a href="widget-basic-card.html"><i class="mdi mdi-widgets"></i> <span
                        class="nav-text">Widget</span></a>
                </li>

                <li><a class="has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-diamond"></i> <span
                        class="nav-text">UI Features</span> <span class="badge badge-success nav-badge">16</span></a>
                    <ul aria-expanded="false">
                        <li><a href="ui-accordion.html">Accordion</a>
                        </li>
                        <li><a href="ui-alert.html">Alert</a>
                        </li>
                        <li><a href="ui-badge.html">Badge</a>
                        </li>
                        <li><a href="ui-button.html">Button</a>
                        </li>
                        <li><a href="ui-button-group.html">Button Group</a>
                        </li>
                        <li><a href="ui-cards.html">Cards</a>
                        </li>
                        <li><a href="ui-carousel.html">Carousel</a>
                        </li>
                        <li><a href="ui-dropdown.html">Dropdown</a>
                        </li>
                        <li><a href="ui-list-group.html">List Group</a>
                        </li>
                        <li><a href="ui-media-object.html">Media Object</a>
                        </li>
                        <li><a href="ui-modal.html">Modal</a>
                        </li>
                        <li><a href="ui-pagination.html">Pagination</a>
                        </li>
                        <li><a href="ui-popover.html">Popover</a>
                        </li>
                        <li><a href="ui-progressbar.html">Progressbar</a>
                        </li>
                        <li><a href="ui-tab.html">Tab</a>
                        </li>
                        <li><a href="ui-typography.html">Typography</a>
                        </li>
                        <li><a href="uc-nestedable.html">Nestedable</a>
                        </li>
                        <li><a href="uc-sweetalert.html">Sweetalert</a>
                        </li>
                        <li><a href="uc-toastr.html">Toastr</a>
                        </li>
                        <li><a href="uc-weather.html">Weather</a>
                        </li>
                    </ul>
                </li>
                <li><a class="has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-nfc-variant"></i> <span
                        class="nav-text">Form Stuff</span> <span class="badge badge-primary nav-badge">14</span></a>
                    <ul aria-expanded="false">
                        <li><a href="form-basic.html">Basic Forms</a>
                        </li>
                        <li><a href="form-addons.html">Form Addons</a>
                        </li>
                        <li><a href="form-validation.html">Form Validation</a>
                        </li>
                        <li><a href="form-editor.html">Form Editor</a>
                        </li>
                        <li><a href="form-pickers.html">Form Pickers</a>
                        </li>
                        <li><a href="form-summernote.html">Form Summernote</a>
                        </li>
                        <li><a href="form-typehead.html">Form Typehead</a>
                        </li>
                        <li><a href="form-xeditable.html">Form Xeditable</a>
                        </li>
                        <li><a href="form-dropzone.html">Form Dropzone</a>
                        </li>
                    </ul>
                </li>
                <li><a class="has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-table-edit"></i> <span
                        class="nav-text">Table</span></a>
                    <ul aria-expanded="false">
                        <li><a href="table-basic.html">Basic</a>
                        </li>
                        <li><a href="table-layout.html">Table Layout</a>
                        </li>
                        <li><a href="table-dt-basic.html">Datatable Basic</a>
                        </li>
                    </ul>
                </li>

                <li><a href="map-datamap.html"><i class="mdi mdi-map"></i> <span class="nav-text">Map</span></a></li>
                <li class="nav-label">Extra</li>
                <li><a class="has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-google-pages"></i> <span
                        class="nav-text">Pages</span></a>
                    <ul aria-expanded="false">
                        <li><a href="page-login.html">Login</a>
                        </li>

                        <li><a href="page-register.html">Register</a>
                        </li>

                        <li><a href="page-lock-screen.html">Lock Screen</a>
                        </li>
                        <li><a href="page-recover.html">Recover</a>
                        </li>
                        <li><a href="page-error-400.html">Error 400</a>
                        </li>
                        <li><a href="page-error-403.html">Error 403</a>
                        </li>
                        <li><a href="page-error-404.html">Error 404</a>
                        </li>
                        <li><a href="page-error-500.html">Error 500</a>
                        </li>
                        <li><a href="page-error-503.html">Error 503</a>
                        </li>
                        <li><a href="page-one-column.html">One Column</a>
                        </li>
                        <li><a href="page-pricing.html">Pricing</a>
                        </li>
                    </ul>
                </li>
                <li><a href="page-invoice.html"><i class="mdi mdi-square-edit-outline"></i> <span class="nav-text">Invoice Summary</span></a>
                </li>

            </ul>
        </div>
        <!-- #/ nk nav scroll -->
    </div>
    <!-- #/ sidebar -->
    <!-- content body -->
    <div class="content-body">
        <div class="container">
            <div class="row page-titles">
                <div class="col p-0">
                    <h4>Hello, <span>Welcome here</span></h4>
                </div>
                <div class="col p-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Components</a>
                        </li>
                        <li class="breadcrumb-item active">Sweetalert</li>
                    </ol>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Sweet Wrong</h4>
                            <div class="card-content">
                                <div class="sweetalert m-t-30">
                                    <button class="btn btn-danger btn sweet-wrong">Sweet Wrong</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# card -->
                </div>
                <!-- /# column -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Sweet Message</h4>
                            <div class="card-content">
                                <div class="sweetalert m-t-30">
                                    <button class="btn btn-info btn sweet-message">Sweet Message</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# card -->
                </div>
                <!-- /# column -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Sweet Text</h4>
                            <div class="card-content">
                                <div class="sweetalert m-t-30">
                                    <button class="btn btn-primary btn sweet-text">Sweet Text</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# card -->
                </div>
                <!-- /# column -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Sweet Success</h4>
                            <div class="card-content">
                                <div class="sweetalert m-t-30">
                                    <button class="btn btn-success btn sweet-success">Sweet Success</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# card -->
                </div>
                <!-- /# column -->
            </div>
            <!-- /# row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Sweet Confirm</h4>
                            <div class="card-content">
                                <div class="sweetalert m-t-30">
                                    <button class="btn btn-warning btn sweet-confirm">Sweet Confirm</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# card -->
                </div>
                <!-- /# column -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Sweet Confirm Or Cancel</h4>
                            <div class="card-content">
                                <div class="sweetalert m-t-30">
                                    <button class="btn btn-warning btn sweet-success-cancel">Sweet Confirm Or Cancel
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# card -->
                </div>
                <!-- /# column -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Sweet Image Message</h4>
                            <div class="card-content">
                                <div class="sweetalert m-t-30">
                                    <button class="btn btn-info btn sweet-image-message">Sweet Image Message</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# card -->
                </div>
                <!-- /# column -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Sweet HTML</h4>
                            <div class="card-content">
                                <div class="sweetalert m-t-30">
                                    <button class="btn btn-primary btn sweet-html">Sweet HTML</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# card -->
                </div>
                <!-- /# column -->
            </div>
            <!-- /# row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Sweet Auto Close</h4>
                            <div class="card-content">
                                <div class="sweetalert m-t-30">
                                    <button class="btn btn-danger btn sweet-auto">Sweet Auto Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# card -->
                </div>
                <!-- /# column -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Sweet Prompt</h4>
                            <div class="card-content">
                                <div class="sweetalert m-t-30">
                                    <button class="btn btn-success btn sweet-prompt">Sweet Prompt</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# card -->
                </div>
                <!-- /# column -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Sweet Ajax</h4>
                            <div class="card-content"></div>
                            <div class="sweetalert m-t-15">
                                <button class="btn btn-info btn sweet-ajax">Sweet Ajax</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- #/ container -->
    </div>
    <!-- #/ content body -->
    <!-- footer -->
    <div class="footer">
        <div class="copyright">
            <p>Copyright &copy; <a href="https://ule.merkulov.design">Ule</a> 2019, by <a
                    href="https://1.envato.market/tf-merkulove" target="_blank">merkulove</a></p>
        </div>
    </div>
    <!-- #/ footer -->
</div>
<!-- Common JS -->
<script src="../../assets/plugins/common/common.min.js"></script>
<!-- Custom script -->
<script src="../js/custom.min.js"></script>
<script src="../../assets/plugins/sweetalert/js/sweetalert.min.js"></script>
<script src="../../assets/plugins/sweetalert/js/sweetalert.init.js"></script>
</body>

</html>