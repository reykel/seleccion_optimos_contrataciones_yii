<?php
/* @var $this ProductosController */
/* @var $model Productos */

$this->breadcrumbs=array(
	'Salva/restaura'=>array('index'),
	'Indice',
);

Yii::app()->clientScript->registerScript('generate', "
	$('#generar').click(function() {
	    alertify.confirm('Procederá a avanzar un día en la fecha actual del sistema, desea continuar?', function(confirm) {
			if (confirm) {
				window.location = 'index.php?r=backup/default/create';
				noty({'text':'Operación concluida exitosamente','layout':'topCenter','type':'success','animateOpen': {'opacity': 'show'}});
			}else{
				noty({'text':'Operación cancelada','layout':'topCenter','type':'warning','animateOpen': {'opacity': 'show'}});
			}
		});
	});
");
?>

<?php
	$this->headers = ' Salva/restaura';
?>
<div class="clearfix"> <br>

<?php
	Yii::app()->user->returnUrl = Yii::app()->request->requestUri; 
	$this->widget('ext.bootstrap.widgets.TbGridView', array(
	'id' => 'install-grid',
	'dataProvider' => $dataProvider,
	'columns' => array(
		'name',
		'size',
		'create_time',
		array(
			'class'=>'CButtonColumn',
			'htmlOptions'=>array('style'=>('width:150px;')),
			'template'=>'{download}{restore}{delete}',
	            'buttons' => array(
		            'download' => array(
		                'imageUrl'=>Yii::app()->baseUrl.'/img/download_file.png',
		                'label'=> 'Descargar archivo',
	                	'url'=>'Yii::app()->createUrl("backup/default/download", array("file"=>$data["name"]))',
			        ),
		            'restore' => array(
		                'imageUrl'=>Yii::app()->baseUrl.'/img/upload_file.png',
		                'label'=> 'Restaurar archivo',
	                	'url'=>'Yii::app()->createUrl("backup/default/restore", array("file"=>$data["name"]))',
			        ),
			        'delete' => array(
		                'imageUrl'=>Yii::app()->baseUrl.'/img/delete_file.png',
		                'label'=> 'Eliminar registro',
			            'icon'  => 'trash',
						'url'   => 'Yii::app()->createUrl("backup/default/delete", array("file" =>$data["name"]))',
						'click' => 'js:function(e) {
			                e.preventDefault();
			                var location = $(this).attr("href");
			                alertify.confirm("Procederá a eliminar el registro seleccionado, desea continuar?", function(confirm) {
			                    if (confirm) {
			                    	window.location = location;
			                    	noty({"text":"Eliminación correctamente efectuada","layout":"topCenter","type":"success","animateOpen": {"opacity": "show"}});
			                	}else{
			                    	noty({"text":"Eliminación cancelada","layout":"topCenter","type":"error","animateOpen": {"opacity": "show"}});		                		
			                	}
			            	});
			                return false;
			            }',
			        ),
	        	),
			),
		),
	)
);
?>

<div  align="left">
        <a id= "generar" class="btn btn-warning btn-large" href="#" data-toggle="tooltip" title="Agrega un nuevo archivo de salva generado de acuerdo a los datos actuales">
            <i class="glyphicon glyphicon-plus icon-white"></i>
                Generar archivo de salva...
        </a>
</div>