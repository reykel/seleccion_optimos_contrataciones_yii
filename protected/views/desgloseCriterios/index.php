<?php
/* @var $this DesgloseCriteriosController */
/* @var $model DesgloseCriterios */

$this->breadcrumbs=array(
	'Desglose criterioses'=>array('index'),
	'Manage',
);
?>

<?php $this->headers = ' Desglose criterios'; ?>

<div  align="right">
        <?php echo '<a class="btn btn-info btn-large" href="index.php?r=desgloseCriterios/create&_puntaje_id='.$_puntaje_id.'&_status='.$_status.'">'; ?> 
            <i class="glyphicon glyphicon-leaf icon-white"></i>
                Agregar registro
        </a>
</div>

<div class="clearfix"></div><br>

<?php 
	Yii::app()->user->returnUrl = Yii::app()->request->requestUri;
	$this->widget('ext.bootstrap.widgets.TbGridView', array(
	'type'=>array('striped','condensed'),
	'id'=>'desglose-criterios-grid',
	'dataProvider'=>$model->search($_puntaje_id, $_status),
	'ajaxUpdate' => false,
	'columns'=>array(
		'criterio',
		'autor',
		'fecha',
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
