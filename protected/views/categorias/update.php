<?php
/* @var $this CategoriasController */
/* @var $model Categorias */

$this->breadcrumbs=array(
	'Categoriases'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Agregar Categorias'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>