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
	'Manage',
);\n";
?>

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle('slow');
	return false;
});
$('.search-form form').submit(function(){
	$('#<?php echo $this->class2id($this->modelClass); ?>-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<?php echo "<?php \$this->headers = ' ".$this->class2name($this->modelClass)."'; ?>"; ?>

<?php echo "<?php echo CHtml::link(' Filtro...','#',array('class'=>'search-button btn btn-warning btn-round glyphicon glyphicon-filter icon-white', 'title'=>'Seleccionar y establecer valores para filtraje de los datos.', 'data-toggle'=>'tooltip')); ?>"; ?>

<div class="search-form" style="display:none">
<?php echo "<?php \$this->renderPartial('_search',array(
	'model'=>\$model,
)); ?>\n"; ?>
</div><!-- search-form -->

<?php echo '<a class="btn btn-success btn-large" href="index.php?r='.$this->modelClass.'/reporte">'; ?> 
	<i class="glyphicon glyphicon-print icon-white", title="Impresión de datos.", data-toggle="tooltip"></i>
</a>


<div  align="right">
        <?php echo '<a class="btn btn-info btn-large" href="index.php?r='.$this->modelClass.'/create">'; ?> 
            <i class="glyphicon glyphicon-leaf icon-white"></i>
                Agregar registro
        </a>
</div>

<div class="clearfix"></div><br>


<?php echo "<?php"; ?> 
	Yii::app()->user->returnUrl = Yii::app()->request->requestUri;
	$this->widget('ext.bootstrap.widgets.TbGridView', array(
	'type'=>array('striped','condensed'),
	'id'=>'<?php echo $this->class2id($this->modelClass); ?>-grid',
	'dataProvider'=>$model->search(),
	'ajaxUpdate' => false,
	'columns'=>array(
<?php
$count=0;
$nombre_columna='';
foreach($this->tableSchema->columns as $column)
{
	if(++$count==7)
		echo "\t\t/*\n";

	if($column->autoIncrement){ 
		$nombre_columna = $column->name;
		continue;
	?>
	<?php		
	}
	if($nombre_columna !== ''){?>
		array(
			'name'=>'<?php echo $column->name ?>',
			'type'=>'raw',
		<?php if(  substr($column->name,  strlen($column->name)-3 , 3) == "_id"  ){ ?>
			'value'=>'CHtml::link(CHtml::encode($data-><?php echo strtoupper(substr($column->name, 0, 1)).substr($column->name, 1, strlen($column->name)-4)."s->".substr($column->name, 0, strlen($column->name)-3); ?>), array("view&id=$data-><?php echo $nombre_columna ?>"))',
			),
		<?php }else{ ?>
			'value'=>'CHtml::link(CHtml::encode($data-><?php echo $column->name ?>), array("view&id=$data-><?php echo $nombre_columna ?>"))',
		),
		<?php } ?>
	<?php
	$nombre_columna = ''; 
	}
	else{
		if(  substr($column->name,  strlen($column->name)-3 , 3) == "_id"  ){ ?>
		array(
			'name'=>'<?php echo $column->name ?>',
			'type'=>'raw',
			'value'=>'$data-><?php echo strtoupper(substr($column->name, 0, 1)).substr($column->name, 1, strlen($column->name)-4)."s->".substr($column->name, 0, strlen($column->name)-3); ?>',
		),
		<?php }else
			echo "\t\t'".$column->name."',\n";
	}
}
if($count>=7)
	echo "\t\t*/\n";
?>
	array(
		'class'=>'CButtonColumn',
		'htmlOptions'=>array('style'=>('width:120px;')),
		'template'=>'{update}{delete}',
            'buttons' => array(
	            'update' => array(
	                'imageUrl'=>Yii::app()->baseUrl.'/img/edit_new_42.png',
	                'label'=> 'Modificar registro',
		        ),
		        'delete' => array(
	                'imageUrl'=>Yii::app()->baseUrl.'/img/delete_new_42.png',
	                'label'=> 'Eliminar registro',
		            'icon'  => 'trash',
					'url'   => 'Yii::app()->controller->createAbsoluteUrl("delete", array("id" => $data->id))',
					'click' => 'js:function(e) {
		                e.preventDefault();
		                var location = $(this).attr("href");
		                alertify.confirm("Procederá a eliminar el registro seleccionado, desea continuar?", function(confirm) {
		                    if (confirm) {
		                    	window.location = location;
		                    	noty({"text":"Eliminación correctamente efectuada","layout":"topCenter","type":"success","animateOpen": {"opacity": "show"}});
		                	}else{
		                    	noty({"text":"Eliminación cancelada","layout":"topCenter","type":"error","animateOpen": {"opacity": "show"}});		                		
		                	}
		            	});
		                return false;
		            }',
		        ),
        	),
		),
	),
)); ?>
