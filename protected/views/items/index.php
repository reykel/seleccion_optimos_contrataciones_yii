<?php
/* @var $this ItemsController */
/* @var $model Items */

$this->breadcrumbs=array(
	'Items'=>array('index'),
	'Manage',
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle('slow');
	return false;
});
$('.search-form form').submit(function(){
	$('#items-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<?php $this->headers = ' Items'; ?>
<?php echo CHtml::link(' Filtro...','#',array('class'=>'search-button btn btn-warning btn-round glyphicon glyphicon-filter icon-white', 'title'=>'Seleccionar y establecer valores para filtraje de los datos.', 'data-toggle'=>'tooltip')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<a class="btn btn-success btn-large" href="index.php?r=Items/reporte"> 
	<i class="glyphicon glyphicon-print icon-white", title="Impresión de datos.", data-toggle="tooltip"></i>
</a>


<div  align="right">
        <?php echo '<a class="btn btn-info btn-large" href="index.php?r=Items/create&id='.$id.'">' ?>
            <i class="glyphicon glyphicon-leaf icon-white"></i>
                Agregar registro
        </a>
</div>

<div class="clearfix"></div><br>


<?php 
	Yii::app()->user->returnUrl = Yii::app()->request->requestUri;
	$this->widget('ext.bootstrap.widgets.TbGridView', array(
	'type'=>array('striped','condensed'),
	'id'=>'items-grid',
	'dataProvider'=>$model->search($id),
	'ajaxUpdate' => false,
	'columns'=>array(
		'item',
		array(
			'name'=>'tipo_id',
			'type'=>'raw',
			'value'=>'$data->Tipos->tipo',
		),
				array(
			'name'=>'categoria_id',
			'type'=>'raw',
			'value'=>'$data->Categorias->categoria',
		),
				'valor',
	array(
		'class'=>'CButtonColumn',
		'htmlOptions'=>array('style'=>('width:170px;')),
		'template'=>'{update}{delete}{desglose}',
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
	            'desglose' => array(
	                'label'=> 'Componentes',
	                'imageUrl'=>Yii::app()->baseUrl.'/img/desglose_new_42.png',
                   	'url'=>'Yii::app()->createUrl("subitems/index&id=$data->id")',
		        ),
        	),
		),
	),
)); ?>


<div  align="left">
        <?php echo "<a class='btn btn-success btn-small' href='index.php?r=instrumentos/index'>"; ?>
            <i class="glyphicon glyphicon-back icon-white"></i>
                Regresar
        </a>
</div>