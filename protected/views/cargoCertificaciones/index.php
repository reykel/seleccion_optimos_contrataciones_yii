<?php
/* @var $this CargoCertificacionesController */
/* @var $model CargoCertificaciones */

$this->breadcrumbs=array(
	'Cargo certificaciones'=>array('index'),
	'Manage',
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle('slow');
	return false;
});
$('.search-form form').submit(function(){
	$('#cargo-certificaciones-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<?php $this->headers = ' Cargo certificaciones'; ?>
<?php echo CHtml::link(' Filtro...','#',array('class'=>'search-button btn btn-warning btn-round glyphicon glyphicon-filter icon-white', 'title'=>'Seleccionar y establecer valores para filtraje de los datos.', 'data-toggle'=>'tooltip')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<a class="btn btn-success btn-large" href="index.php?r=CargoCertificaciones/reporte"> 
	<i class="glyphicon glyphicon-print icon-white", title="Impresión de datos.", data-toggle="tooltip"></i>
</a>


<div  align="right">
        <a class="btn btn-info btn-large" href="index.php?r=CargoCertificaciones/create"> 
            <i class="glyphicon glyphicon-leaf icon-white"></i>
                Agregar registro
        </a>
</div>

<div class="clearfix"></div><br>


<?php 
	Yii::app()->user->returnUrl = Yii::app()->request->requestUri;
	$this->widget('ext.bootstrap.widgets.TbGridView', array(
	'type'=>array('striped','condensed'),
	'id'=>'cargo-certificaciones-grid',
	'dataProvider'=>$model->search(),
	'ajaxUpdate' => false,
	'columns'=>array(
		array(
			'name'=>'escala_certificacion_id',
			'type'=>'raw',
			'value'=>'$data->EscalasCertificaciones->escala_certificacion',
			),
		array(
			'name'=>'cargo_id',
			'type'=>'raw',
			'value'=>'$data->Cargos->cargo',
		),
		'valor',
		array(
			'name'=>'requerido',
			'type'=>'raw',
			'value'=>'$data->requerido == -1 ? "SI" : "NO"',
		),		
	array(
		'class'=>'CButtonColumn',
		'htmlOptions'=>array('style'=>('width:120px;')),
		'template'=>'{update}{delete}',
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
        	),
		),
	),
)); ?>
