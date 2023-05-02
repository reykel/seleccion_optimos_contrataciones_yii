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

<?php $this->headers = ' Currículum de Aspirantes'; ?>
<?php echo CHtml::link(' Filtro...','#',array('class'=>'search-button btn btn-warning btn-round glyphicon glyphicon-filter icon-white', 'title'=>'Seleccionar y establecer valores para filtraje de los datos.', 'data-toggle'=>'tooltip')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
	'_estado'=>$_estado,	
)); ?>
</div><!-- search-form -->

<a class="btn btn-success btn-large" href="index.php?r=Aspirantes/reporte"> 
	<i class="glyphicon glyphicon-print icon-white", title="Impresión de datos.", data-toggle="tooltip"></i>
</a>

<div class="clearfix"></div><br>

<?php 
	Yii::app()->user->returnUrl = Yii::app()->request->requestUri;
	$this->widget('ext.bootstrap.widgets.TbGridView', array(
	'type'=>array('striped','condensed'),
	'id'=>'aspirantes-grid',
	'dataProvider'=>$model->search($_estado),
	'ajaxUpdate' => false,
	'columns'=>array(
        'id',
		array(
            'header'=>'foto',
            'value'=>'CHtml::image(Yii::app()->request->baseUrl."/imagenes/thumbs/".Fotos::has_picture($data->id))',
			'type'=>'raw',
			'htmlOptions'=>array('style'=>('width:55px;')),
        ),
		array(
			'name'=>'ci',
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->ci), array("view&id=$data->id"))',
		),
		'nombre_apellidos',
		'nivel_escolar',
		'egresado_especialidad',
	array(
		'class'=>'CButtonColumn',
		'htmlOptions'=>array('style'=>('width:230px;')),
		'template'=>'{capacitaciones}{ocupaciones}{idiomas}{prioridades}{certificaciones}',
            'buttons' => array(
	            'capacitaciones' => array(
	            	'label'=> 'Capacitaciones',
	            	'imageUrl'=>Yii::app()->baseUrl.'/images/superacion_recibida.png',
                	'url'=>'Yii::app()->createUrl("capacitaciones/index",array("id"=>$data->id, "_estado"=>'.$_estado.', "_retorno"=>"'.Yii::app()->user->returnUrl.'"))',
		        ),
	            'certificaciones' => array(
	            	'label'=> 'Certificaciones y reconocimientos',
	            	'imageUrl'=>Yii::app()->baseUrl.'/images/eventos.png',
                	'url'=>'Yii::app()->createUrl("certificaciones/index",array("id"=>$data->id, "_estado"=>'.$_estado.', "_retorno"=>"'.Yii::app()->user->returnUrl.'"))',
		        ),
	            'ocupaciones' => array(
	            	'label'=> 'Cargos ocupados',
	            	'imageUrl'=>Yii::app()->baseUrl.'/images/proyectos.png',
                	'url'=>'Yii::app()->createUrl("ocupaciones/index",array("id"=>$data->id, "_estado"=>'.$_estado.', "_retorno"=>"'.Yii::app()->user->returnUrl.'"))',
		        ),
	            'prioridades' => array(
	            	'label'=> 'Prioridades',
	            	'imageUrl'=>Yii::app()->baseUrl.'/images/habilidades.png',
                	'url'=>'Yii::app()->createUrl("aspirantePrioridades/index",array("id"=>$data->id, "_estado"=>'.$_estado.', "_retorno"=>"'.Yii::app()->user->returnUrl.'"))',
		        ),
	            'idiomas' => array(
	            	'label'=> 'Idiomas',
	            	'imageUrl'=>Yii::app()->baseUrl.'/images/idiomas.png',
                	'url'=>'Yii::app()->createUrl("idiomas/index",array("id"=>$data->id, "_estado"=>'.$_estado.', "_retorno"=>"'.Yii::app()->user->returnUrl.'"))',
		        ),
        	),
		),
	),
)); ?>
