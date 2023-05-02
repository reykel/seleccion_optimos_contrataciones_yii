<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');
   Yii::setPathOfAlias('highcharts', dirname(__FILE__).'/../extensions/highcharts');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
return array(
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'SISTEMA DE INFORMACIÓN DIANA 1.0.0',
	'language'=>'es',
	'defaultController' => 'cruge/ui/welcome',

	// preloading 'log' component
	'preload'=>array('log', 'highcharts'),

	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
		'application.components.*',
		'application.modules.cruge.components.*',
		'application.modules.cruge.extensions.crugemailer.*',
		'ext.easyimage.EasyImage',
	),

	'modules'=>array(
		'cruge'=>array(
			'tableprefix'=>'cruge_',
			'availableAuthMethods'=>array('default'),
			'availableAuthModes'=>array('username','email'),
			'baseUrl'=>'http://coco.com/',
			'debug'=>false,
			'rbacSetupEnabled'=>false,
			'allowUserAlways'=>false,
			'useEncryptedPassword' => true,
			'hash' => 'md5',
			'afterLoginUrl'=>'index.php',
			'afterLogoutUrl'=>'index.php?r=cruge/ui/login',
			'afterSessionExpiredUrl'=>'index.php?r=cruge/ui/login',
			'loginLayout'=>'//layouts/column2',
			'registrationLayout'=>'//layouts/column2',
			'activateAccountLayout'=>'//layouts/column2',
			'editProfileLayout'=>'//layouts/column2',
			'generalUserManagementLayout'=>'ui',
			'userDescriptionFieldsArray'=>array('email'), 
			'superuserName'=>'root',
		),

		'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>'770213',
			// If removed, Gii defaults to localhost only. Edit carefully to taste.
			'ipFilters'=>array('127.0.0.1','::1'),
		),

		'backup'=> array(
			'path' => __DIR__.'/../_backup/'
		),		
	),

	// application components
	'components'=>array(
		'user'=>array(
			'allowAutoLogin'=>true,
			'class' => 'application.modules.cruge.components.CrugeWebUser',
			'loginUrl' => array('/cruge/ui/login'),
		),
		'authManager' => array(
			'class' => 'application.modules.cruge.components.CrugeAuthManager',
		),
		'crugemailer'=>array(
			'class' => 'application.modules.cruge.components.CrugeMailer',
			'mailfrom' => 'email-desde-donde-quieres-enviar-los-mensajes@xxxx.com',
			'subjectprefix' => 'Tu Encabezado del asunto - ',
			'debug' => true,
		),
		'format' => array(
			'datetimeFormat'=>"d M, Y h:m:s a",
		),

		'excel'=>array(
           'class'=>'application.vendor.phpexcel.PHPExcel',
        ),

		'ePdf' => array(
			'class' => 'ext.yii-pdf.EYiiPdf',
			'params' => array(
				'mpdf' => array(
					'librarySourcePath' => 'application.vendors.mpdf.*',
					'constants' => array(
						'_MPDF_TEMP_PATH' => Yii::getPathOfAlias('application.runtime'),
					),
					'class'=>'mpdf',
				),
			),
		),
		  'easyImage' => array(
		    'class' => 'application.extensions.easyimage.EasyImage',
		    //'driver' => 'GD',
		    //'quality' => 100,
		    //'cachePath' => '/assets/easyimage/',
		    //'cacheTime' => 2592000,
		    //'retinaSupport' => false,
		    //'isProgressiveJpeg' => false,
		  ),		
/*
		'widgetFactory'=>array(
			'widgets'=>array(
				'CGridView'=>array(
					'cssFile'=>false,
					'pager'=>array('cssFile'=>false),
					'pagerCssClass'=>'paginator'
				),
			),
		),
*/
		'bootstrap'=>array(
				'class'=>'ext.bootstrap.components.bootstrap',
				'responsiveCss' =>true,
			),

		// uncomment the following to enable URLs in path-format
		/*
		'urlManager'=>array(
			'urlFormat'=>'path',
			'rules'=>array(
				'<controller:\w+>/<id:\d+>'=>'<controller>/view',
				'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
			),
		),
		*/
/*
		'db'=>array(
			'connectionString' => 'sqlite:'.dirname(__FILE__).'/../data/db_TEMP.db',
		),
*/
		// uncomment the following to use a MySQL database

		'db'=>array(
			'connectionString' => 'mysql:host=localhost;dbname=db_turismo',
			'emulatePrepare' => true,
			'username' => 'root',
			'password' => '770213',
			'charset' => 'utf8',
		),

		'errorHandler'=>array(
			// use 'site/error' action to display errors
			'errorAction'=>'site/error',
		),
/*
		'authManager'=>array(
			'class'=>'CDbAuthManager',
			'connectionID'=>'db',
		),
*/
		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, info, rbac',
				),
				// uncomment the following to show log messages on web pages
				/*
				array(
					'class'=>'CWebLogRoute',
				),
				*/
			),
		),
	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>array(
		// this is used in contact page
		'adminEmail'=>'webmaster@example.com',
	),
);