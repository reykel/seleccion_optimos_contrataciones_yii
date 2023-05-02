<?php
/* @var $this CapacitacionesController */
/* @var $model Capacitaciones */

$this->breadcrumbs=array(
	'Capacitaciones'=>array('index'),
	'Manage',
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle('slow');
	return false;
});
$('.search-form form').submit(function(){
	$('#capacitaciones-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<?php $this->headers = ' Capacitaciones de '.Aspirantes::get_aspirante($_aspirante_id); ?>

<div  align="right">
        <?php echo '<a class="btn btn-info btn-large" href="index.php?r=capacitaciones/create&_aspirante_id='.$_aspirante_id.'">'; ?>
            <i class="glyphicon glyphicon-leaf icon-white"></i>
                Agregar registro
        </a>
</div>

<div class="clearfix"></div><br>


<?php 
	Yii::app()->user->returnUrl = Yii::app()->request->requestUri;
	$this->widget('ext.bootstrap.widgets.TbGridView', array(
	'type'=>array('striped','condensed'),
	'id'=>'capacitaciones-grid',
	'dataProvider'=>$model->search($_aspirante_id),
	'ajaxUpdate' => false,
	'columns'=>array(
		array(
            'header'=>'foto',
            'value'=>'CHtml::image(Yii::app()->request->baseUrl."/imagenes/thumbs/".Archivos::has_picture($data->id))',
			'type'=>'raw',
			'htmlOptions'=>array('style'=>('width:55px;')),
        ),
		array(
			'name'=>'titulo',
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->titulo), array("capacitaciones/download&id=$data->id"))',
		),
		//'tema',
		array(
			'name'=>'forma_id',
			'type'=>'raw',
			'value'=>'$data->Formas->forma',
		),		
		'ano',
		/*
		'centro_id',
		array(
			'name'=>'escala_capacitacion_id',
			'type'=>'raw',
			'value'=>'$data->Escala_capacitacions->escala_capacitacion',
		),
				*/
	array(
		'class'=>'CButtonColumn',
		'htmlOptions'=>array('style'=>('width:220px;')),
		'template'=>'{update}{delete}{imagenes}{erase}',
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
	            	'label'=> 'Facsímiles',
	            	'imageUrl'=>Yii::app()->baseUrl.'/images/desglose_new_42.png',
                	'url'=>'Yii::app()->createUrl("capacitaciones/upload",array("id"=>$data->id))',
		        ),
	            'erase' => array(
	                'label'=> 'Eliminar archivo',
	                'imageUrl'=>Yii::app()->baseUrl.'/images/erase.png',
                   	'url'=>'Yii::app()->createUrl("capacitaciones/erase",array("id"=>$data->id))',
                   	'options' => array('confirm' => '¿Procederá a eliminar este archivo. Desea continuar?',),                   	
		        ),
        	),
		),
	),
)); ?>
<br>
<div  align="left">
        <?php echo "<a class='btn btn-danger btn-large' href='".$_retorno."'>"; ?>
            <i class="glyphicon glyphicon-chevron-left icon-white"></i>
                Regresar...
        </a>
</div>