<?php
/* @var $this OcupacionesController */
/* @var $model Ocupaciones */

$this->breadcrumbs=array(
	'Ocupaciones'=>array('index'),
	'Manage',
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle('slow');
	return false;
});
$('.search-form form').submit(function(){
	$('#ocupaciones-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<?php $this->headers = ' Ocupaciones de '.Aspirantes::get_aspirante($_aspirante_id); ?>

<div  align="right">
        <?php echo '<a class="btn btn-info btn-large" href="index.php?r=ocupaciones/create&_aspirante_id='.$_aspirante_id.'">'; ?>
            <i class="glyphicon glyphicon-leaf icon-white"></i>
                Agregar registro
        </a>
</div>

<div class="clearfix"></div><br>


<?php 
	Yii::app()->user->returnUrl = Yii::app()->request->requestUri;
	$this->widget('ext.bootstrap.widgets.TbGridView', array(
	'type'=>array('striped','condensed'),
	'id'=>'ocupaciones-grid',
	'dataProvider'=>$model->search($_aspirante_id),
	'ajaxUpdate' => false,
	'columns'=>array(
		'ocupacion',
		'centro_laboral',
		'ano',
		'mejor_evaluacion',
		/*
		array(
			'name'=>'escala_ocupacion_id',
			'type'=>'raw',
			'value'=>'$data->Escala_ocupacions->escala_ocupacion',
		),
				*/
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
<br>
<div  align="left">
        <?php echo "<a class='btn btn-danger btn-large' href='".$_retorno."'>"; ?>
            <i class="glyphicon glyphicon-chevron-left icon-white"></i>
                Regresar...
        </a>
</div>