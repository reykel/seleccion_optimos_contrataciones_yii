<?php
/**
 * The following variables are available in this template:
 * - $this: the CrudCode object
 */
?>
<?php echo "<?php\n"; ?>
/* @var $this <?php echo $this->getControllerClass(); ?> */
/* @var $model <?php echo $this->getModelClass(); ?> */

<?php
$label=$this->pluralize($this->class2name($this->modelClass));
echo "\$this->breadcrumbs=array(
	'$label'=>array('index'),
	'Detalle',
);\n";
?>
?>

<?php echo "<?php \$this->headers = ' Detalle ".$this->class2name($this->modelClass)."'; ?>"; ?>

<div  align="left">
    <a id ='btn_return' title='Regresar...' data-toggle='tooltip' href= <?php echo "<?php echo Yii::app()->user->returnUrl; ?>"; ?> class='btn btn-default btn-round btn-large alert-info'>
        <span><i class="glyphicon glyphicon-chevron-left red"></i></span>
    </a>
</div>
<br>

<?php echo "<?php"; ?> $this->widget('ext.bootstrap.widgets.TbDetailView', array(
	'data'=>$model,
	'attributes'=>array(
<?php

$nombre_columna='';
foreach($this->tableSchema->columns as $column)
{
	if($column->autoIncrement){ 
		continue;
	}
	if(  substr($column->name,  strlen($column->name)-3 , 3) == "_id"  ){ ?>
		array(
			'name'=>'<?php echo $column->name ?>',
			'type'=>'raw',
			'value'=>$model-><?php echo strtoupper(substr($column->name, 0, 1)).substr($column->name, 1, strlen($column->name)-4)."s->".substr($column->name, 0, strlen($column->name)-3); ?>,
		),
		<?php }else
			echo "\t\t'".$column->name."',\n";
} ?>
	),
)); ?>
<br>
