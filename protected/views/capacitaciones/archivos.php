<?php
/* @var $this ImagenesController */
/* @var $model Imagenes */

$this->breadcrumbs=array(
	'Imagenes'=>array('index'),
	'Manage',
);
?>


<?php $this->headers = ' Archivos'; ?>

<div  align="right">
        <?php echo '<a class="btn btn-info btn-large" href="index.php?r=capacitaciones/upload&id='.$_capacitacion_id.'">'; ?>
            <i class="glyphicon glyphicon-leaf icon-white"></i>
                Subir archivo
        </a>
</div>

<?php 
	Yii::app()->user->returnUrl = Yii::app()->request->requestUri;
	$this->widget('ext.bootstrap.widgets.TbGridView', array(
	'type'=>array('striped','condensed'),
	'id'=>'imagenes-grid',
	'dataProvider'=>$model->search($_capacitacion_id),
	'ajaxUpdate' => false,
	'columns'=>array(
		array(
            'header'=>'foto',
            'value'=>'CHtml::image(Yii::app()->request->baseUrl."/imagenes/thumbs/".$data->archivo)',
			'type'=>'raw',
			'htmlOptions'=>array('style'=>('width:55px;')),
        ),
		array(
			'name'=>'archivo',
			'type'=>'raw',
			'value'=>'CHtml::link(CHtml::encode($data->archivo), array("capacitaciones/download&id=$data->id"))',
		),
		array(
			'header'=>' ... ',
			'class'=>'CButtonColumn',
			'htmlOptions'=>array('style'=>('width:55px;')),
			'template'=>'{erase}',
            'buttons'=>array(
	            'erase' => array(
	                'label'=> 'Eliminar archivo',
	                'imageUrl'=>Yii::app()->baseUrl.'/img/delete_new_42.png',
                   	'url'=>'Yii::app()->createUrl("capacitaciones/erase",array("id"=>$data->id))',
                   	'options' => array('confirm' => '¿Procederá a eliminar este archivo. Desea continuar?',),                   	
		        ),
            ),
		),
	),
)); ?>
<br>
<div  align="left">
        <?php echo "<a class='btn btn-danger btn-large' href='index.php?r=capacitaciones/index&id=".$_aspirante_id."'>"; ?>
            <i class="glyphicon glyphicon-chevron-left icon-white"></i>
                Regresar...
        </a>
</div>