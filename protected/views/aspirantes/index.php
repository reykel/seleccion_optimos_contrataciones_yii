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

<?php $this->headers = ' Datos de aspirantes'; ?>
<?php echo CHtml::link(' Filtro...','#',array('class'=>'search-button btn btn-warning btn-round glyphicon glyphicon-filter icon-white', 'title'=>'Seleccionar y establecer valores para filtraje de los datos.', 'data-toggle'=>'tooltip')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
	'_estado'=>$_estado,
)); ?>
</div><!-- search-form -->

<a class="btn btn-success btn-large" href="index.php?r=Aspirantes/resumen"> 
	<i class="glyphicon glyphicon-print icon-white", title="Impresión de resumen de jornada.", data-toggle="tooltip"></i>
</a>

<a class="btn btn-danger btn-large" href="index.php?r=Aspirantes/general"> 
	<i class="glyphicon glyphicon-print icon-white", title="Impresión de resumen general.", data-toggle="tooltip"></i>
</a>

<a class="btn btn-warning btn-large" href="index.php?r=Aspirantes/resumenfecha"> 
	<i class="glyphicon glyphicon-print icon-white", title="Impresión de resumen x fecha sistema.", data-toggle="tooltip"></i>
</a>


<div  align="right">
        <a class="btn btn-info btn-large" href="index.php?r=Aspirantes/create"> 
            <i class="glyphicon glyphicon-leaf icon-white"></i>
                Agregar registro
        </a>
</div>

<div class="clearfix"></div><br>


<?php 
	Yii::app()->user->returnUrl = Yii::app()->request->requestUri;
	$this->widget('ext.bootstrap.widgets.TbGridView', array(
	'type'=>array('striped','condensed'),
	'id'=>'aspirantes-grid',
	'dataProvider'=>$model->search($_estado),
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
			'name'=>'importe',
			'type'=>'raw',
			'value'=>'$data->importe',
			'footer'=>"<div class=well> <STRONG>".Aspirantes::TotalImporte($model->search($_estado))." $ Total</STRONG> </div>",
		),		
	array(
		'class'=>'CButtonColumn',
		'htmlOptions'=>array('style'=>('width:250px;')),
		'template'=>'{update}{delete}{cargos}{imagenes}{reporte}',
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
	            'erase' => array(
	                'label'=> 'Eliminar archivo',
	                'imageUrl'=>Yii::app()->baseUrl.'/images/erase.png',
                   	'url'=>'Yii::app()->createUrl("aspirantes/erase",array("id"=>$data->id))',
                   	'options' => array('confirm' => '¿Procederá a eliminar este archivo. Desea continuar?',),                   	
		        ),
	            'reporte' => array(
	                'label'=> 'Reporte planilla',
	                'imageUrl'=>Yii::app()->baseUrl.'/images/reporte.png',
                   	'url'=>'Yii::app()->createUrl("aspirantes/reporte", array("id"=>$data->id))',
		        ),
	            'cargos' => array(
	            	'label'=> 'Cargos por los que opta',
	            	'imageUrl'=>Yii::app()->baseUrl.'/images/obito_new_42.png',
                	'url'=>'Yii::app()->createUrl("aspiranteCargos/index",array("id"=>$data->id, "_estado"=>'.$_estado.', "_retorno"=>"'.Yii::app()->user->returnUrl.'"))',
		        ),		        
        	),
		),
	),
)); ?>


<div class='box-content row'>
	<div class='col-lg-12 col-md-12'>
        <div class='well'>
        	<h5><STRONG><?php echo "  "; ?> Monto total de jornada <?php echo " (".date('Y-m-d').") :  </STRONG>".Aspirantes::get_importeJornada(date('Y-m-d'))." $"; ?></h5>
        	<h5><STRONG><?php echo "  "; ?> Monto total acumulado <?php echo " :  </STRONG>".Aspirantes::get_importeJornada("")." $"; ?></h5>
        </div>
    </div>
</div>            

