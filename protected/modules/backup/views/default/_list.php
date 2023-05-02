<?php $this->widget('bootstrap.widgets.TbGridView', array(
	'id' => 'install-grid',
	'dataProvider' => $dataProvider,
	'columns' => array(
		'name',
		'size',
		'create_time',
		array(
			'class' => 'CButtonColumn',
			'template' => '{download}  {restore}',
			  'buttons'=>array
			    (
			        'download' => array
			        (
		                'label'=> 'Descargar',
	    	            'imageUrl' => Yii::app()->baseUrl.'/images/open.bmp',
			            'url'=>'Yii::app()->createUrl("backup/default/download", array("file"=>$data["name"]))',
			        ),
			        'restore' => array
			        (
		                'label'=> 'Restaurar',
		                //'visible' => '(yii::app()->user->checkAccess("contador")||yii::app()->user->checkAccess("administrador"))',
	    	            'imageUrl' => Yii::app()->baseUrl.'/images/Alta.png',
			            'url'=>'Yii::app()->createUrl("backup/default/restore", array("file"=>$data["name"]))',
					),
			        'delete' => array
			        (
			            'url'=>'Yii::app()->createUrl("backup/default/delete", array("file"=>$data["name"]))',
			        ),
			    ),		
		),
		array(
			'class' => 'CButtonColumn',
			'template' => '{delete}',
			  'buttons'=>array
			    (
			        'delete' => array
			        (
		                'label'=> 'Eliminar',
			            'url'=>'Yii::app()->createUrl("backup/default/delete", array("file"=>$data["name"]))',
			        ),
			    ),		
		),
	),
)); ?>