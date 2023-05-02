<?php
/* @var $this AspirantesController */
/* @var $model Aspirantes */

$this->breadcrumbs=array(
	'Aspirantes'=>array('index'),
	'Detalle',
);
?>

<?php $this->headers = ' Detalle Aspirantes'; ?>
<div  align="left">
    <a id ='btn_return' title='Regresar...' data-toggle='tooltip' href= <?php echo Yii::app()->user->returnUrl; ?> class='btn btn-default btn-round btn-large alert-info'>
        <span><i class="glyphicon glyphicon-chevron-left red"></i></span>
    </a>
</div>
<!--
<div>
<form name="recortes" method="post">
<img src="imagenes/fotos/13706219_1161220717232437_493236122_n.jpg" id="picture" class="img-responsive" />
<input type="text" name="x" />
<input type="text" name="y" />
<input type="text" name="width" />
<input type="text" name="height" />
<input type="submit" name="recortes" value="Enviar" id="Submit">
</form>
</div>
<script type="text/javascript">
$(document).ready(function () {
jQuery("img#picture").imgAreaSelect({
maxWidth: 3000,
maxHeight: 800,
handles: true,
onSelectEnd: function (img, selection) {
console.log(selection);
jQuery('input[name="x"]').val(selection.x1);
jQuery('input[name="y"]').val(selection.y1);
jQuery('input[name="width"]').val(selection.width);
jQuery('input[name="height"]').val(selection.height);
}
});
});
</script>
-->
<br>
<div><h3><strong>Datos Personales</strong></h3></div>
<br>
<?php $this->widget('ext.bootstrap.widgets.TbDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		array(
            'name'=>'Foto personal',
            'value'=>CHtml::image(Yii::app()->request->baseUrl."/imagenes/fotos/".Fotos::has_picture($model->id)),
			'type'=>'raw',
			'htmlOptions'=>array('style'=>('width:70px;')),
        ),		
		'ci',
		'nombre_apellidos',
		'direccion',
		'sexo',
		'estado_civil',
		array(
			'name'=>'Edad',
			'type'=>'raw',
			'value'=>$model->get_edad($model->ci),
		),		
		'color_piel',
		'nivel_escolar',
		'egresado_especialidad',
		'categoria_academica',
		'grado_cientifico',
		'integracion',
		array(
			'name'=>'fuente_id',
			'type'=>'raw',
			'value'=>$model->Fuentes->fuente,
		), 
		'sancion_laboral', 
		'familiares_ecsm',
		'mail',
		'phone',
		'procesado',
		'documentos_requeridos',
		'importe',
	),
)); ?>
<br>
<div><h3><strong>Cargos a los que aspira</strong></h3></div>
<br>
<?php $this->widget('ext.bootstrap.widgets.TbListView', array(
	'dataProvider'=>$dataProvider_cargos,
	'itemView'=>'_view_cargos',
)); ?>
<br>
<div><h3><strong>Capacitaciones</strong></h3></div>
<br>
<?php $this->widget('ext.bootstrap.widgets.TbListView', array(
	'dataProvider'=>$dataProvider_capacitaciones,
	'itemView'=>'_view_capacitaciones',
)); ?>
<br>
<div><h3><strong>Idiomas</strong></h3></div>
<br>
<?php $this->widget('ext.bootstrap.widgets.TbListView', array(
	'dataProvider'=>$dataProvider_idiomas,
	'itemView'=>'_view_idiomas',
)); ?>
<br>
<div><h3><strong>Certificaciones</strong></h3></div>
<br>
<?php $this->widget('ext.bootstrap.widgets.TbListView', array(
	'dataProvider'=>$dataProvider_certificaciones,
	'itemView'=>'_view_certificaciones',
)); ?>
<br>
<div><h3><strong>Prioridades</strong></h3></div>
<br>
<?php $this->widget('ext.bootstrap.widgets.TbListView', array(
	'dataProvider'=>$dataProvider_prioridades,
	'itemView'=>'_view_prioridades',
)); ?>
<br>
<div><h3><strong>Ocupaciones</strong></h3></div>
<br>
<?php $this->widget('ext.bootstrap.widgets.TbListView', array(
	'dataProvider'=>$dataProvider_ocupaciones,
	'itemView'=>'_view_ocupaciones',
)); ?>