<?php 

$cols = array();

// presenta los campos de ICrugeStoredUser
foreach(Yii::app()->user->um->getSortFieldNamesForICrugeStoredUser() as $key=>$fieldName){
	$value=null; // default
	$filter=null; // default, textbox
	$type='text';
	if($fieldName == 'state'){
		$value = '$data->getStateName()';
		$filter = Yii::app()->user->um->getUserStateOptions();
	}
	if($fieldName == 'logondate'){
		$type='datetime';
	}
	$cols[] = array('name'=>$fieldName,'value'=>$value,'filter'=>$filter,'type'=>$type);
}
	
$cols[] = array(
	'class'=>'CButtonColumn',
	
	'template' => '{update} {eliminar}',
	'deleteConfirmation'=>CrugeTranslator::t('admin', 'Are you sure you want to delete this user'),
	'buttons' => array(
			'update'=>array(
				'label'=>CrugeTranslator::t('admin', 'Update User'),
				'url'=>'array("usermanagementupdate","id"=>$data->getPrimaryKey())',
				'imageUrl'=>Yii::app()->baseUrl.'/img/edit_new_20.png',
			),
			'eliminar'=>array(
				'label'=>CrugeTranslator::t('admin', 'Delete User'),
				'imageUrl'=>Yii::app()->baseUrl.'/img/delete_new_20.png',
				'url'=>'array("usermanagementdelete","id"=>$data->getPrimaryKey())'
			),
		),	
);
$this->widget('ext.bootstrap.widgets.TbGridView', 
	array(
    'dataProvider'=>$dataProvider,
    'columns'=>$cols,
	//'filter'=>$model,
));

?>