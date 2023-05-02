<div class="form">
<?php
	$this->headers = ' Sesiones de usuario';
?>

<?php 
	$this->widget('ext.bootstrap.widgets.TbGridView', array(
    'dataProvider'=>$dataProvider,
    'columns'=>array(
		'idsession',
		array('name'=>'iduser','htmlOptions'=>array('width'=>'50px')),
		array('name'=>'sessionname','filter'=>''),
		array('name'=>'status','value'=>'$data->status==1 ? \'activa\' : \'cerrada\' '),
		array('name'=>'created','type'=>'datetime'),
		array('name'=>'lastusage','type'=>'datetime'),
		array('name'=>'usagecount','type'=>'number'),
		array('name'=>'expire','type'=>'datetime'),
		'ipaddress',
		/*
		array(
			'class'=>'CButtonColumn',
			'template' => '{delete}',
			'deleteConfirmation'=>CrugeTranslator::t("Esta seguro de eliminar esta sesion ?"),
			'buttons' => array(
					'delete'=>array(
						'label'=>CrugeTranslator::t("eliminar sesion"),
						'imageUrl'=>Yii::app()->user->ui->getResource("delete.png"),
						'url'=>'array("sessionadmindelete","id"=>$data->getPrimaryKey())'
					),
				),	
		)
		*/	
	),
));
?>
</div>