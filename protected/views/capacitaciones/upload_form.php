<?php
/* @var $this ImagenesController */
/* @var $model Imagenes */
/* @var $form CActiveForm */
?>

<?php $this->headers = ' Subir archivos...'; ?>

<div class="form-horizontal well">
	<form method="post" enctype="multipart/form-data">
		<input type="file" name="archive"/>
		<br><br> 
		<input type="submit" name="enviar" value="Actualizar" class="btn btn-primary btn-info btn-large"/>
	</form>
</div><!-- form -->