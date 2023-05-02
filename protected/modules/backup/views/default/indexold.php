<?php
$this->breadcrumbs=array(
	'Manage'=>array('index'),
);?>
<h1><div class="alert">Salva/Restaura</div></h1>


<div  align="right">
        <a class="btn btn-info btn-large" href="index.php?r=backup/default/create">
            <i class="glyphicon glyphicon-leaf icon-white"></i>
                Agregar registro
        </a>
</div>

<?php $this->renderPartial('_list', array(
		'dataProvider'=>$dataProvider,
));
?>
