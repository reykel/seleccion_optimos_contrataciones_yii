<?php
/* @var $this DesgloseCriteriosController */
/* @var $model DesgloseCriterios */

$this->breadcrumbs=array(
	'Desglose criterioses'=>array('index'),
	'Detalle',
);
?>

<?php $this->headers = ' Detalle Desglose criterios'; ?>
<div  align="left">
    <a id ='btn_return' title='Regresar...' data-toggle='tooltip' href= <?php echo Yii::app()->user->returnUrl; ?> class='btn btn-default btn-round btn-large alert-info'>
        <span><i class="glyphicon glyphicon-chevron-left red"></i></span>
    </a>
</div>
<br>

<?php $this->widget('ext.bootstrap.widgets.TbListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
<br>
