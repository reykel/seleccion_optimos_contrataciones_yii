<?php
/* @var $this SiteController */
/* @var $model LoginForm */
/* @var $form CActiveForm  */

$this->pageTitle=Yii::app()->name . ' - Login';
$this->breadcrumbs=array(
	'Login',
);

?>

<?php 
	if(!Yii::app()->user->isGuest)
		$this->redirect("index.php");
?>


    <div class="row">
        <div class="well col-lg-4 col-md-6 col-sm-6 col-xs-10 center login-box">
	    	<div class="alert alert-info">
	            Por favor introduzca su nombre de usuario y contraseña.
	        </div>
        <div class="form-horizontal">
        	
			<?php $form=$this->beginWidget('CActiveForm', array(
				'id'=>'logon-form',
				'enableClientValidation'=>false,
				'clientOptions'=>array(
					'validateOnSubmit'=>true,
				),
			)); ?>

			    <div class="input-group input-group-lg">
			    <span class="input-group-addon"> <?php echo "<img src=".Yii::app()->baseUrl."/img/user.png width='23' height='23' />"?></span>
					<?php echo $form->textField($model,'username', array('class'=>'form-control', 'style'=>'font-size:13px;', 'placeholder'=>'Nombre de usuario')); ?>
				</div>
					<?php echo $form->error($model,'username'); ?>

				<div class="clearfix"></div><br>
			    
			    <div class="input-group input-group-lg">
			    <span class="input-group-addon"> <?php echo "<img src=".Yii::app()->baseUrl."/img/lock.png width='23' height='23' />"?></span>
					<?php echo $form->passwordField($model,'password',array('class'=>'form-control', 'style'=>'font-size:13px;', 'placeholder'=>'Contraseña')); ?>
				</div>
					<?php echo $form->error($model,'password'); ?>

	<p class="center col-lg-4 col-md-6 col-sm-7 col-xs-8">
		<?php echo CHtml::submitButton('Entrar', array('class'=>'btn btn-info btn-large')); ?>
	</p>

	<?php
		//	si el componente CrugeConnector existe lo usa:
		//
		if(Yii::app()->getComponent('crugeconnector') != null){
		if(Yii::app()->crugeconnector->hasEnabledClients){ 
	?>
	<div class='crugeconnector'>
		<span><?php echo CrugeTranslator::t('logon', 'You also can login with');?>:</span>
		<ul>
		<?php 
			$cc = Yii::app()->crugeconnector;
			foreach($cc->enabledClients as $key=>$config){
				$image = CHtml::image($cc->getClientDefaultImage($key));
				echo "<li>".CHtml::link($image,
					$cc->getClientLoginUrl($key))."</li>";
			}
		?>
		</ul>
	</div>
	<?php }} ?>
	

<?php $this->endWidget(); ?>
</div>

