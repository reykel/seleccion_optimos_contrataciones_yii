<?php
/* @var $this PuntajesController */
/* @var $data Puntajes */
?>

<div class="clearfix"></div> <br>

<div class="view well">
	<b><?php echo CHtml::encode($data->getAttributeLabel('puntaje')); ?>:</b>
	<?php echo CHtml::encode($data->puntaje); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('memo_preseleccion')); ?>:</b>
	<?php echo CHtml::encode($data->memo_preseleccion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('memo_seleccion')); ?>:</b>
	<?php echo CHtml::encode($data->memo_seleccion); ?>
	<br />
</div>