<?php
/* @var $this PuntajesController */
/* @var $model Puntajes */

$this->breadcrumbs=array(
	'Puntajes'=>array('index'),
	'Manage',
);

Yii::app()->clientScript->registerScript('search', "
	$('.selectbox').change(function(){
		$('.search-form form').submit();
	});
");
?>
<?php
	$_descripcion = "";

	if($_status == -1)
		$_descripcion = "selección";
	elseif($_status == 0)
		$_descripcion = "comisión";
	else
		$_descripcion = "admitidos";		
?>

<?php $this->headers = ' Procesamiento de '.$_descripcion; ?>


<div class="search-form">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
	'_status'=>$_status
)); ?>
</div><!-- search-form -->

<div class="clearfix"></div><br>

<?php echo CHtml::beginForm(); ?>
	<div class="form-horizontal">
		<div align="right">
			<?php echo CHtml::submitButton('Efectuar procesamiento de '.$_descripcion, array('name' =>'ApproveButton', 'class'=>'btn btn-warning btn-large', 'id'=>'_submit_selection', 'confirm' => 'Procederá a seleccionar los aspirantes marcados. Desea continuar?')); ?>
		</div>			
	</div>

	<div class="clearfix"></div> <br>

	<?php
	Yii::app()->user->returnUrl = Yii::app()->request->requestUri;
	$this->widget('ext.bootstrap.widgets.TbGridView', array(
	'type'=>array('striped','condensed'),
	'id'=>'puntajes-grid',
	'dataProvider'=>$model->search($_status),
	'selectableRows'=>2,
	'columns'=>array(
		array(
            'id'=>'selectedIds',
           	'class'=>'CCheckBoxColumn',
           	'htmlOptions'=>array('style'=>('width:10px;')),
           	//'headerTemplate'=> false,
       	),
       	array(
            'header'=>'',
            'value'=>'CHtml::image(Yii::app()->request->baseUrl."/imagenes/thumbs/".Fotos::has_picture($data->Aspirantes->id))',
			'type'=>'raw',
			'htmlOptions'=>array('style'=>('width:55px;')),
        ),
		array(
			'name'=>'aspirante_id',
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->Aspirantes->nombre_apellidos), array("aspirantes/view&id=$data->aspirante_id"))',
		),
		array(
			'name'=>'CI',
			'type'=>'raw',
			'value'=>'$data->Aspirantes->ci',
		),
		array(
			'name'=>'Sexo',
			'type'=>'raw',
			'value'=>'$data->Aspirantes->sexo',
		),
		array(
			'name'=>'Edad',
			'type'=>'raw',
			'value'=>'Aspirantes::get_edad($data->Aspirantes->ci)',
		),		
		//'preseleccion_id',
		//'puntaje',
		//'memo_preseleccion',
		//'memo_seleccion',
		//'status',
	array(
		'class'=>'CButtonColumn',
		'htmlOptions'=>array('style'=>('width:160px;')),
		'template'=>'{update}{trayectoria}{reporte}',
            'buttons' => array(
	            'update' => array(
	            	//'visible'=>'$data->status !== "ADMITIDO"',
                   	'url'=>'Yii::app()->createUrl("desgloseCriterios/index",array("id"=>$data->id, "_status"=>'.$_status.', "_retorno"=>"'.Yii::app()->request->requestUri.'"))',	            	
	                'imageUrl'=>Yii::app()->baseUrl.'/img/memo.png',
	                'label'=> 'Añadir criterio',
		        ),
	            'trayectoria' => array(
	                'imageUrl'=>Yii::app()->baseUrl.'/images/trayectoria.png',
	                'label'=> 'Trayectoria',
	                'url'=>'Yii::app()->createUrl("desgloseCriterios/view", array("id"=>$data->id))',
		        ),
	            'reporte' => array(
	                'imageUrl'=>Yii::app()->baseUrl.'/images/print_report.png',
	                'label'=> 'Reporte',
	                'url'=>'Yii::app()->createUrl("puntajes/reporteProceso", array("id"=>$data->aspirante_id))',
		        ),
        	),
		),
	),
)); ?>

<?php echo CHtml::endForm(); ?>