<?php
/* @var $this AspirantesController */
/* @var $model Aspirantes */

$this->breadcrumbs=array(
	'Aspirantes'=>array('index'),
	'Manage',
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle('slow');
	return false;
});
$('.search-form form').submit(function(){
	$('#aspirantes-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<?php $this->headers = ' Datos de trabajadores en activo'; ?>
<?php echo CHtml::link(' Filtro...','#',array('class'=>'search-button btn btn-warning btn-round glyphicon glyphicon-filter icon-white', 'title'=>'Seleccionar y establecer valores para filtraje de los datos.', 'data-toggle'=>'tooltip')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search_procesados',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<div class="clearfix"></div><br>

<?php 
	Yii::app()->user->returnUrl = Yii::app()->request->requestUri;
	$this->widget('ext.bootstrap.widgets.TbGridView', array(
	'type'=>array('striped','condensed'),
	'id'=>'aspirantes-grid',
	'dataProvider'=>$model->search_procesados(),
	'ajaxUpdate' => false,
	'columns'=>array(
		array(
            'header'=>'',
            'value'=>'CHtml::image(Yii::app()->request->baseUrl."/imagenes/thumbs/".Fotos::has_picture($data->id))',
			'type'=>'raw',
			'htmlOptions'=>array('style'=>('width:55px;')),
        ),
		array(
			'name'=>'id',
			'type'=>'raw',
			'value'=>'$data->id',
			'htmlOptions'=>array('style'=>('width:60px;')),
		),
		array(
			'name'=>'ci',
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->ci), array("view&id=$data->id"))',
		),
		'nombre_apellidos',
		'sexo',
		array(
			'name'=>'Edad',
			'type'=>'raw',
			'value'=>'$data->get_edad($data->ci)',
		),
		array(
			'name'=>'estado',
			'type'=>'raw',
			'value'=>'$data->get_meses($data->estado, $data->fecha_aprobacion)',
		),		
		//get_meses
		'cargo_en_curso',
	array(
		'class'=>'CButtonColumn',
		'htmlOptions'=>array('style'=>('width:260px;')),
		'template'=>'{update}{delete}{imagenes}{retorno}{descartes}',
            'buttons' => array(
	            'update' => array(
	                'imageUrl'=>Yii::app()->baseUrl.'/img/edit_new_42.png',
	                'label'=> 'Modificar registro',
		        ),
		        'delete' => array(
	                'imageUrl'=>Yii::app()->baseUrl.'/img/delete_new_42.png',
	                'label'=> 'Eliminar registro',
		            'icon'  => 'trash',
					'url'   => 'Yii::app()->controller->createAbsoluteUrl("delete", array("id" => $data->id))',
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
	            'imagenes' => array(
	            	'label'=> 'Foto personal',
	            	'imageUrl'=>Yii::app()->baseUrl.'/images/desglose_new_42.png',
                	'url'=>'Yii::app()->createUrl("aspirantes/upload",array("id"=>$data->id))',
		        ),
	            'retorno' => array(
	            	'label'=> 'Retorno a Reserva',
	            	'imageUrl'=>Yii::app()->baseUrl.'/images/obito_new_42.png',
                	'url'=>'Yii::app()->createUrl("aspirantes/retorno",array("id"=>$data->id))',
                   	'options' => array('confirm' => 'Procederá a reintegrar este trabajador a la Reserva Laboral. Desea continuar?',),                	
		        ),
	            'descartes' => array(
	            	'label'=> 'Descarte de sistema',
	            	'imageUrl'=>Yii::app()->baseUrl.'/images/descartes.png',
                	'url'=>'Yii::app()->createUrl("aspirantes/descarteS",array("id"=>$data->id))',
                   	'options' => array('confirm' => 'Procederá a descartar este trabajador de su sistema. Desea continuar?',),                	
		        ),
        	),
		),
	),
)); ?>