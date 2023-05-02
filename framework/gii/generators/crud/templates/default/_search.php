<?php
/**
 * The following variables are available in this template:
 * - $this: the CrudCode object
 */
?>
<?php echo "<?php\n"; ?>
/* @var $this <?php echo $this->getControllerClass(); ?> */
/* @var $model <?php echo $this->getModelClass(); ?> */
/* @var $form CActiveForm */
?>

<div class="form-horizontal well">

<?php echo "<?php \$form=\$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl(\$this->route),
	'method'=>'get',
)); ?>\n"; ?>

<?php foreach($this->tableSchema->columns as $column): ?>
<?php
	$field=$this->generateInputField($this->modelClass,$column);
	if(strpos($field,'password')!==false)
		continue;

	if($column->autoIncrement)
		continue;
?>
	<div class="clearfix"></div><br>
		<?php echo "<?php echo \$form->label(\$model,'{$column->name}', array('class'=>'control-label')); ?>\n"; ?>
			<?php 
			if(  substr($column->name,  strlen($column->name)-3 , 3) == "_id"  )
				echo "<?php echo \$form->dropDownList(\$model,'{$column->name}', ".strtoupper(substr($column->name, 0 , 1)).substr($column->name, 1 , strlen($column->name)-4)."s::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>\n";
			elseif(substr($column->name, 0, 5) == "fecha")
				echo "<?php \$this->widget('zii.widgets.jui.CJuiDatePicker',
					array(
					'model'=>\$model,
					'attribute'=>'{$column->name}',
					'value'=>\$model->{$column->name},
					'language' => 'es',
					'options'=>array(
						'autoSize'=>true,
						'defaultDate'=>\$model->{$column->name},
						'dateFormat'=>'yy-mm-dd',
						'buttonImage'=>Yii::app()->baseUrl.'/images/calendar.png',
						'buttonImageOnly'=>true,
						'buttonText'=>'Fecha',
						'selectOtherMonths'=>true,
						'showAnim'=>'slide',
						'showButtonPanel'=>true,
						'showOn'=>'button',
						'showOtherMonths'=>true,
						'changeMonth' => 'true',
						'changeYear' => 'true',
						),
					)
				); ?>\n";
			else
				echo "<?php echo ".$this->generateActiveField($this->modelClass,$column).", array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>\n";
			?>

<?php endforeach; ?>
	<div class="clearfix"></div> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aplicar</button>
			</div>
		</p>
<?php echo "<?php \$this->endWidget(); ?>\n"; ?>

</div><!-- search-form -->