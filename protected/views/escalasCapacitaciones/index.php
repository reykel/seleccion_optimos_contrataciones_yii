<?php
/* @var $this EscalasCapacitacionesController */
/* @var $model EscalasCapacitaciones */

$this->breadcrumbs=array(
	'Escalas capacitaciones'=>array('index'),
	'Manage',
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle('slow');
	return false;
});
$('.search-form form').submit(function(){
	$('#escalas-capacitaciones-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<?php $this->headers = ' Escalas capacitaciones'; ?>
<?php echo CHtml::link(' Filtro...','#',array('class'=>'search-button btn btn-warning btn-round glyphicon glyphicon-filter icon-white', 'title'=>'Seleccionar y establecer valores para filtraje de los datos.', 'data-toggle'=>'tooltip')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<a class="btn btn-success btn-large" href="index.php?r=EscalasCapacitaciones/reporte"> 
	<i class="glyphicon glyphicon-print icon-white", title="Impresión de datos.", data-toggle="tooltip"></i>
</a>


<div  align="right">
        <a class="btn btn-info btn-large" href="index.php?r=EscalasCapacitaciones/create"> 
            <i class="glyphicon glyphicon-leaf icon-white"></i>
                Agregar registro
        </a>
</div>

<div class="clearfix"></div><br>


<?php 
	Yii::app()->user->returnUrl = Yii::app()->request->requestUri;
	$this->widget('ext.bootstrap.widgets.TbGridView', array(
	'type'=>array('striped','condensed'),
	'id'=>'escalas-capacitaciones-grid',
	'dataProvider'=>$model->search(),
	'ajaxUpdate' => false,
	'columns'=>array(
		array(
			'name'=>'escala_capacitacion',
			'type'=>'raw',
					'value'=>'CHtml::link(CHtml::encode($data->escala_capacitacion), array("view&id=$data->id"))',
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
