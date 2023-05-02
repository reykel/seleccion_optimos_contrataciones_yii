<?php
/* @var $this AspirantesController */
/* @var $data Aspirantes */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ci')); ?>:</b>
	<?php echo CHtml::encode($data->ci); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombre_apellidos')); ?>:</b>
	<?php echo CHtml::encode($data->nombre_apellidos); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('direccion')); ?>:</b>
	<?php echo CHtml::encode($data->direccion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('sexo')); ?>:</b>
	<?php echo CHtml::encode($data->sexo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nivel_escolar')); ?>:</b>
	<?php echo CHtml::encode($data->nivel_escolar); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('foto')); ?>:</b>
	<?php echo CHtml::encode($data->foto); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('egresado_especialidad')); ?>:</b>
	<?php echo CHtml::encode($data->egresado_especialidad); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('categoria_academica')); ?>:</b>
	<?php echo CHtml::encode($data->categoria_academica); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('grado_cientifico')); ?>:</b>
	<?php echo CHtml::encode($data->grado_cientifico); ?>
	<br />

	*/ ?>

</div>