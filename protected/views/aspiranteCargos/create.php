<?php
/* @var $this AspiranteCargosController */
/* @var $model AspiranteCargos */

$this->breadcrumbs=array(
	'Aspirante cargoses'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar Aspirante cargos'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>