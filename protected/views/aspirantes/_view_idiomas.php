<?php
/* @var $this IdiomasController */
/* @var $data Idiomas */
?>

<div class="view well">

	<b><?php echo CHtml::encode($data->getAttributeLabel('idioma')); ?>:</b>
	<?php echo CHtml::encode($data->IdiomasRelevancia->idioma); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nivel')); ?>:</b>
	<?php echo CHtml::encode($data->nivel); ?>
	<br />
</div>