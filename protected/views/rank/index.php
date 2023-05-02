<?php
/* @var $this RankController */
/* @var $model Rank */

$this->breadcrumbs=array(
	'Ranks'=>array('index'),
	'Manage',
);

Yii::app()->clientScript->registerScript('search', "
	$('.selectbox').change(function(){
		$('.search-form form').submit();
	});
");
?>


<?php $this->headers = ' Rank'; ?>
<div class="search-form">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<div class="clearfix"></div><br>
<?php echo CHtml::beginForm(); ?>
	<div class="form-horizontal">
		<div align="right">
			<?php echo CHtml::submitButton('Efectuar preselección', array('name' =>'ApproveButton', 'class'=>'btn btn-warning btn-large', 'id'=>'_submit_selection', 'confirm' => 'Procederá a preseleccionar los aspirantes marcados. Desea continuar?')); ?>
			<?php echo CHtml::ActivehiddenField($model, 'cargo_id', array('style'=>'width:120px;', 'id'=>'_cargo_criteria_id')); ?>
		</div>			
	</div>

	<div class="clearfix"></div> <br>

	<?php
	Yii::app()->user->returnUrl = Yii::app()->request->requestUri;
	$this->widget('ext.bootstrap.widgets.TbGridView', array(
	'type'=>array('striped','condensed'),
	'id'=>'rank-grid',
	'dataProvider'=>$model->search(),
	'selectableRows'=>2,
	'columns'=>array(
		array(
            'id'=>'selectedIds',
           	'class'=>'CCheckBoxColumn',
           	'htmlOptions'=>array('style'=>('width:10px;')),
           	//'headerTemplate'=> false,
       	),
       	array(
            'header'=>'foto',
            'value'=>'CHtml::image(Yii::app()->request->baseUrl."/imagenes/thumbs/".Fotos::has_picture($data->aspirante_id))',
			'type'=>'raw',
			'htmlOptions'=>array('style'=>('width:55px;')),
        ),		
		array(
			'name'=>'aspirante_id',
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->Aspirantes->nombre_apellidos), array("aspirantes/view&id=$data->aspirante_id"))',
		),
		'valor',
		array(
			'name'=>'Cantidad selecciones generales',
			'type'=>'raw',
			'value'=>'Puntajes::get_veces_seleccionado_general($data->aspirante_id)',
		),
		/*
		array(
			'name'=>'Sumatoria selecciones generales',
			'type'=>'raw',
			'value'=>'Puntajes::get_valor_seleccionado_general($data->aspirante_id)',
		),
		*/
		array(
			'name'=>'Promedio valor general',
			'type'=>'raw',
			'value'=>'Puntajes::get_promedio_seleccionado_general($data->aspirante_id)',
		),		
		array(
			'name'=>'Cantidad selecciones cargo',
			'type'=>'raw',
			'value'=>'Puntajes::get_veces_seleccionado_cargo($data->aspirante_id, $data->cargo_id)',
		),
		/*
		array(
			'name'=>'Sumatoria selecciones cargo',
			'type'=>'raw',
			'value'=>'Puntajes::get_valor_seleccionado_cargo($data->aspirante_id, $data->cargo_id)',
		),
		*/
		array(
			'name'=>'Promedio valor cargo',
			'type'=>'raw',
			'value'=>'Puntajes::get_promedio_seleccionado_cargo($data->aspirante_id, $data->cargo_id)',
		),
	array(
		'class'=>'CButtonColumn',
		'htmlOptions'=>array('style'=>('width:110px;')),
		'template'=>'{trayectoria}{designacion}',
            'buttons' => array(
	            'trayectoria' => array(
	                'imageUrl'=>Yii::app()->baseUrl.'/images/trayectoria.png',
	                'label'=> 'Trayectoria',
	                'url'=>'Yii::app()->createUrl("puntajes/list", array("id"=>$data->aspirante_id))',
		        ),
	            'designacion' => array(
	                'imageUrl'=>Yii::app()->baseUrl.'/images/designado.png',
	                'label'=> 'Designado',
	                'url'=>'Yii::app()->createUrl("rank/designacion", array("aspirante_id"=>$data->aspirante_id, "cargo_id"=>$data->cargo_id, "id"=>$data->id))',
                   	'options' => array('confirm' => 'Procederá a designar la admisión directa de este aspirante en la empresa. Desea continuar?',),	                
		        ),
        	),
		),		
	),
)); ?>

<?php echo CHtml::endForm(); ?>