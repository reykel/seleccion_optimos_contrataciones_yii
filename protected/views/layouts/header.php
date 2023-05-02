<?php include 'config.php' ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Ziwa 2.5.1</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Ziwa 5.2.1">
    <meta name="author" content="Reynier Hernández Palacios">

    <!-- The styles -->
    <link id="bs-css" href="css/bootstrap-cerulean.min.css" rel="stylesheet">

    <link href="css/charisma-app.css" rel="stylesheet">
    <link href='bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
    <link href='bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
    <link href='bower_components/chosen/chosen.min.css' rel='stylesheet'>
    <link href='bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
    <link href='bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <link href='bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>

    <link href='bower_components/imgareaselect/css/imgareaselect-animated.css' rel='stylesheet'>
    <link href='bower_components/imgareaselect/css/imgareaselect-default.css' rel='stylesheet'>
    <link href='bower_components/imgareaselect/css/imgareaselect-deprecated.css' rel='stylesheet'>

    <link href='css/jquery.noty.css' rel='stylesheet'>
    <link href='css/noty_theme_default.css' rel='stylesheet'>
    <link href='css/elfinder.min.css' rel='stylesheet'>
    <link href='css/elfinder.theme.css' rel='stylesheet'>
    <link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='css/uploadify.css' rel='stylesheet'>
    <link href='css/animate.min.css' rel='stylesheet'>
    <link rel="stylesheet" type="text/css" href="bower_components/bootstrap-datepicker/css/datepicker.css"/>
    <link href='bower_components/bootstrap-select-1.12.4/dist/css/bootstrap-select.min.css' rel='stylesheet'>

    <link href='css/alertify.bootstrap.css' rel='stylesheet'>
    <link href='css/alertify.core.css' rel='stylesheet'>
    <link href='css/alertify.default.css' rel='stylesheet'>

    <link href='css/alertify.default.css' rel='stylesheet'>

    <link href='css/font-awesome.min.css' rel='stylesheet'>
    <link href='css/editor.css' rel='stylesheet'>

    <!-- jQuery -->
    <script src="bower_components/jquery/jquery.min.js"></script>
    <script src="bower_components/jquery/bootbox.js"></script>

    <script type="text/javascript" src="bower_components/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="bower_components/bootstrap-datepicker/js/bootstrap-datepicker-noconflict.js"></script>
    <script type="text/javascript" src="bower_components/bootstrap-datepicker/js/locales/bootstrap-datepicker.es.js"></script>
    <script type="text/javascript" src="bower_components/bootstrap-select-1.12.4/dist/js/bootstrap-select.min.js"></script>

    <script type="text/javascript" src="bower_components/imgareaselect/scripts/jquery.imgareaselect.js"></script>
    <script type="text/javascript" src="bower_components/imgareaselect/scripts/jquery.imgareaselect.min.js"></script>
    <script type="text/javascript" src="bower_components/imgareaselect/scripts/jquery.imgareaselect.pack.js"></script>

    <script type="text/javascript" src="js/alertify.js"></script>
    <script type="text/javascript" src="js/editor.js"></script>
<!--
    <script type="text/javascript" src="js/insercion.js"></script>
-->    
    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- The fav icon -->
    <link rel="shortcut icon" href="img/favicon.ico">
</head>

<body>
<?php if (!isset($no_visible_elements) || !$no_visible_elements) { ?>
    <!-- topbar starts -->
    <div class="navbar navbar-default" role="navigation">

        <div class="navbar-inner">
            <button type="button" class="navbar-toggle pull-left animated flip">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.php?r=cruge/ui/login"> 
                <span>Ziwa 2.5.1</span></a>

            <!-- user dropdown starts -->
            <?php if(!Yii::app()->user->isGuest)
            echo "<div class='btn-group pull-right'>
                <button class='btn btn-info btn-large dropdown-toggle' data-toggle='dropdown'>
                    <span><i class='glyphicon glyphicon-user icon-white'></i>   Mi perfil</span>
                    <span class='caret'></span>
                </button>
                <ul class='dropdown-menu'>
                        <li><a href='index.php?r=config/viewOwnActivity'><i class='glyphicon glyphicon-list'></i>  Ver mi actividad</a></li>
                        <li class='divider'></li>
                        <li><a href='index.php?r=config/formato'><i class='glyphicon glyphicon-file'></i>  Seleccionar formato de reportes</a></li>
                        <li class='divider'></li>
                        <li><a href='index.php?r=config/establecimiento'><i class='glyphicon glyphicon-home'></i>  Seleccionar establecimiento actual</a></li>
                        <li class='divider'></li>                                        
                        <li><a href='index.php?r=cruge/ui/editprofile'><i class='glyphicon glyphicon-user'></i>  Administrar identidad</a></li>
                        <li class='divider'></li>
                        <li><a href='index.php?r=cruge/ui/logout'><i class='glyphicon glyphicon-off'></i>  Salir (".Yii::app()->user->um->getFieldValue(Yii::app()->user->id,"nombre").")</a></li>
                </ul>
            </div>"; 
            else
                echo "<div class='btn-group pull-right'>
                        <a class='btn btn-info btn-large' href='index.php?r=cruge/ui/login'>
                            <i class='glyphicon glyphicon-user icon-white'></i>
                                Entrar
                        </a>
                    </div>";
            ?>
        </div>
    </div>
    <!-- topbar ends -->
<?php } ?>

<div class="ch-container">
    <div class="row">
        <?php if (!isset($no_visible_elements) || !$no_visible_elements) { ?>

    <!-- left menu starts -->
    <?php if(!Yii::app()->user->isGuest){
    echo '<div class="col-sm-2 col-lg-2">
            <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">
                    </div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                        <li class="nav-header">Menú principal</li>
                                <li class="accordion">
                                    <a href="#"><i class="glyphicon glyphicon-list-alt"></i><span> Aspirantes no procesados</span></a>
                                        <ul class="nav nav-pills nav-stacked">
                                            <li><a href="index.php?r=aspirantes/index&_estado=-1"><i class="glyphicon glyphicon-pencil"></i> Datos personales</a></li>
                                            <li><a href="index.php?r=aspirantes/datos&_estado=-1"><i class="glyphicon glyphicon-pencil"></i> Currículum Vitae</a></li>                                        
                                        </ul>
                                </li>';
                                if(Yii::app()->user->um->getFieldValue(Yii::app()->user->id,"area") == '0-0-0-0'){
                                echo '
                                <li class="accordion">
                                    <a href="#"><i class="glyphicon glyphicon-list-alt"></i><span> Aspirantes procesados</span></a>
                                        <ul class="nav nav-pills nav-stacked">
                                            <li><a href="index.php?r=aspirantes/index&_estado=0"><i class="glyphicon glyphicon-pencil"></i> Datos personales</a></li>
                                            <li><a href="index.php?r=aspirantes/datos&_estado=0"><i class="glyphicon glyphicon-pencil"></i> Currículum Vitae</a></li>                                        
                                        </ul>
                                </li>
                                <li><a href="index.php?r=rank/index"><i class="glyphicon glyphicon-list"></i> Ranking</a></li>
                                <li><a href="index.php?r=puntajes/seleccion"><i class="glyphicon glyphicon-check"></i> Seleccionados</a></li>
                                <li><a href="index.php?r=puntajes/comision"><i class="glyphicon glyphicon-fullscreen"></i> Comisión</a></li>
                                <li><a href="index.php?r=puntajes/admision"><i class="glyphicon glyphicon-thumbs-up"></i> Admitidos</a></li>                                
                                <li><a href="index.php?r=aspirantes/procesados"><i class="glyphicon glyphicon-road"></i> Trabajadores activos</a></li>
                                <li><a href="index.php?r=aspirantes/descartados"><i class="glyphicon glyphicon-fire"></i> Trabajadores descartados</a></li>
                                <li class="accordion">
                                    <a href="#"><i class="glyphicon glyphicon-tags"></i><span>  Nomencladores</span></a>
                                    <ul class="nav nav-pills nav-stacked">
                                        <li><a href="index.php?r=escalasCapacitaciones/index"><i class="glyphicon glyphicon-shopping-cart"></i> Escalas Capacitaciones</a></li>
                                        <li><a href="index.php?r=escalasOcupaciones/index"><i class="glyphicon glyphicon-map-marker"></i> Escalas Ocupaciones</a></li>
                                        <li><a href="index.php?r=escalasCertificaciones/index"><i class="glyphicon glyphicon-globe"></i> Escalas Certificaciones</a></li>
                                        <li><a href="index.php?r=cargos/index"><i class="glyphicon glyphicon-refresh"></i> Cargos</a></li>
                                        <li><a href="index.php?r=formas/index"><i class="glyphicon glyphicon-file"></i> Formas</a></li>
                                        <li><a href="index.php?r=centros/index"><i class="glyphicon glyphicon-home"></i> Centros capacitadores</a></li>
                                        <li><a href="index.php?r=cargoCapacitaciones/index"><i class="glyphicon glyphicon-shopping-cart"></i> Cargos Capacitaciones</a></li>
                                        <li><a href="index.php?r=cargoOcupaciones/index"><i class="glyphicon glyphicon-map-marker"></i> Cargos Ocupaciones</a></li>
                                        <li><a href="index.php?r=cargoCertificaciones/index"><i class="glyphicon glyphicon-globe"></i> Cargos Certificaciones</a></li>
                                        <li><a href="index.php?r=IdiomasRelevancia/index"><i class="glyphicon glyphicon-volume-up"></i> Relevancia idiomas</a></li>
                                        <li><a href="index.php?r=Empresas/index"><i class="glyphicon glyphicon-volume-up"></i> Empresas</a></li>
                                    </ul>
                                </li>
                                <li class="nav-header hidden-md">Análisis y reportes</li>
                                <li class="accordion">
                                    <a href="#"><i class="glyphicon glyphicon-file"></i><span> Reportes</span></a>
                                        <ul class="nav nav-pills nav-stacked">
                                        </ul>
                                </li>                                
                                <li class="accordion">
                                    <a href="#"><i class="glyphicon glyphicon-tasks"></i><span> Análisis y consolidados</span></a>
                                        <ul class="nav nav-pills nav-stacked">
                                        </ul>
                                </li>                                
                                <li class="nav-header hidden-md">Administración de sistema</li>
                                <li class="accordion">
                                    <a href="#"><i class="glyphicon glyphicon-user"></i><span> Control de usuarios</span></a>
                                    <ul class="nav nav-pills nav-stacked">
                                        <li><a class="ajax-link" href="index.php?r=cruge/ui/usermanagementadmin"><i class="glyphicon glyphicon-flag"></i><span> Gestión de usuarios</span></a></li>
                                        <li><a class="ajax-link" href="index.php?r=cruge/ui/usermanagementcreate"><i class="glyphicon glyphicon-plus"></i><span> Crear usuario</span></a></li>
                                    </ul>
                                </li>
                                <li class="accordion">
                                    <a href="#"><i class="glyphicon glyphicon-lock"></i><span> Accesos/Seguridad</span></a>
                                    <ul class="nav nav-pills nav-stacked">
                                        <li><a class="ajax-link" href="index.php?r=cruge/ui/rbaclistroles"><i class="glyphicon glyphicon-road"></i><span> Gestión de roles</span></a></li>
                                        <li><a class="ajax-link" href="index.php?r=cruge/ui/rbaclisttasks"><i class="glyphicon glyphicon-road"></i><span> Gestión de tareas</span></a></li>
                                        <li><a class="ajax-link" href="index.php?r=cruge/ui/rbaclistops"><i class="glyphicon glyphicon-road"></i><span> Gestión de operaciones</span></a></li>
                                        <li><a class="ajax-link" href="index.php?r=cruge/ui/rbacusersassignments"><i class="glyphicon glyphicon-road"></i><span> Asignación de roles</span></a></li>
                                        <li><a class="ajax-link" href="index.php?r=cruge/ui/sessionadmin"><i class="glyphicon glyphicon-road"></i><span> Gestor de sesiones</span></a></li>
                                        <li><a class="ajax-link" href="index.php?r=cruge/ui/systemupdate"><i class="glyphicon glyphicon-road"></i><span> Variables de sistema</span></a></li>
                                    </ul>
                                </li>'; }                               
                    echo '
                                <li class="accordion">
                                    <a href="#"><i class="glyphicon glyphicon-bullhorn"></i><span> Configuraciones globales</span></a>
                                    <ul class="nav nav-pills nav-stacked">
                                        <li><a href="index.php?r=config/topAspirantesSeleccionados"><i class="glyphicon glyphicon-file"></i> Top aspirantes a retornar</a></li>
                                        <li><a href="index.php?r=clasificador%2Findex&Clasificador%5Bclasificacion%5D=Grado+científico"><i class="glyphicon glyphicon-file"></i> Clasificadores generales</a></li>
                                        <li><a class="ajax-link" href="index.php?r=config/creditos"><i class="glyphicon glyphicon-road"></i><span> créditos</span></a></li>
                                        <li><a class="ajax-link" href="index.php?r=config/SystemCurrentDate"><i class="glyphicon glyphicon-random"></i><span> Fecha del sistema</span></a></li>                                                                             
                                    </ul>
                                </li>
                            </ul>
                </div>
            </div>
            <br>
            <div class="well">
                <div style="font-size: 30px" align="center">
                    <span>
                        <a data-toggle="tooltip" title="Salvas y restauras del sistema" href="index.php?r=backup/default/index"><i class="glyphicon glyphicon-download-alt green"></i></a>
                        <a data-toggle="tooltip" title="Importaciones de datos" href="index.php?r=importaciones/index"><i class="glyphicon glyphicon-refresh blue"></i></a>
                    </span>
                </div>
            </div>

            <div class="well">
                    <strong>Fecha sistema: </strong> '.CrugeSystem::get_current_date().'
            </div>

            <div class="well">
                <div style="font-size: 30px" align="center">
            </div>
        </div>
        </div>

        '; } ?>
    <?php if(!Yii::app()->user->isGuest)
        echo '<div id="content" class="col-lg-10 col-sm-10">';
            else
        echo '<div id="content" class="col-lg-12 col-sm-12">';
    ?>
            <!-- content starts -->
            <?php } ?>

