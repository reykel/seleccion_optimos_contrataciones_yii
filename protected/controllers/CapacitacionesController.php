<?php

class CapacitacionesController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/main';

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
			//'postOnly + delete', // we only allow deletion via POST request
			array('CrugeAccessControlFilter')
		);
	}

	public function actionView($id)
	{
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate($_aspirante_id)
	{
		$model=new Capacitaciones;
		$model->aspirante_id = $_aspirante_id;

		$this->performAjaxValidation($model);

		if(isset($_POST['Capacitaciones']))
		{
			$model->attributes=$_POST['Capacitaciones'];

			if($model->save())
				$this->redirect(Yii::app()->user->returnUrl);
		}

		$this->render('create',array(
			'model'=>$model,
		));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);

		$this->performAjaxValidation($model);

		if(isset($_POST['Capacitaciones']))
		{
			$model->attributes=$_POST['Capacitaciones'];
			
			if($model->save())
				$this->redirect(Yii::app()->user->returnUrl);
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		$this->loadModel($id)->delete();
		$this->redirect(Yii::app()->user->returnUrl);
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex($id, $_estado, $_retorno)
	{
		$model=new Capacitaciones('search');
		$model->unsetAttributes();  // clear any default values

		if(isset($_GET['Capacitaciones']))
			$model->attributes=$_GET['Capacitaciones'];

		$this->render('index',array(
			'model'=>$model,
			'_aspirante_id'=>$id,
			'_estado'=>$_estado,
			'_retorno'=>$_retorno,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Capacitaciones the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Capacitaciones::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Capacitaciones $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(yii::app()->getRequest()->getIsAjaxRequest())
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}

	public function actionReporte()
    {
		$_extension = trim(Cruge_Fieldvalue::get_format_extension(Cruge_Fieldvalue::get_reporte_value()));

		if($_extension == 'pdf'){
			$mPDF1 = Yii::app()->ePdf->mpdf('utf-8','A4','','',15,15,35,25,9,9,'P');
			$mPDF1->useOnlyCoreFonts = true;
			$mPDF1->SetTitle("Reporte Capacitaciones");
			$mPDF1->SetDisplayMode('fullpage');
			$mPDF1->WriteHTML($this->renderPartial('excel', '', true));
			$mPDF1->Output('Reporte_Capacitaciones.pdf','I');
			exit;
		}else{
			$content = $this->renderPartial("excel", '',true);
			yii::app()->request->sendfile("Reporte_Capacitaciones.".$_extension , $content);
		}
    }

	public function actionArchivos($id, $_aspirante_id)
	{
		$model=new Archivos('search');
		$model->unsetAttributes();  // clear any default values

		$this->render('archivos',array(
			'model'=>$model,
			'_capacitacion_id'=>$id,
			'_aspirante_id'=>$_aspirante_id
		));
	}

	public function actionUpload($id)
	{
		if(isset($_FILES['archive']))
		{
			$model = Archivos::model()->find('capacitacion_id = ?', array($id));

			if($model != null){
				$enlace = "imagenes/upload/".$model->archivo;
				unlink($enlace);
				$thumb = "imagenes/thumbs/".$model->archivo;
				unlink($thumb);
				
				$model->delete();
			}

			$model = new Archivos;
			
			$_nombre_hash = hash("md5", $_FILES['archive']['name'].date('l jS \of F Y h:i:s A'));
			move_uploaded_file($_FILES['archive']['tmp_name'], "imagenes/upload/".$_nombre_hash);

/*
			$zip = new ZipArchive;

			if($zip->open("imagenes/upload/".base64_encode($_FILES['archive']['name']) , ZipArchive::CREATE) === TRUE){
				$zip->addFile("imagenes/upload/".$_FILES['archive']['name'], $_FILES['archive']['name']);
				$zip->close();
				unset($zip);

				$image = new EasyImage('imagenes/upload/'.$_FILES['archive']['name']);
				$image->resize(50, 50);
				$image->save('imagenes/thumbs/'.$_FILES['archive']['name']);

				unlink('imagenes/upload/'.$_FILES['archive']['name']);
			}
*/
			$image = new EasyImage('imagenes/upload/'.$_nombre_hash);
			$image->resize(50, 50);
			$image->save('imagenes/thumbs/'.$_nombre_hash);

			$model->archivo = $_nombre_hash;
			$model->capacitacion_id = $id;

			$model->save();

			$this->redirect(Yii::app()->user->returnUrl);
		}

		$this->render('upload_form');
	}

	public function actionDownload($id)
	{
		$model = Archivos::model()->find('capacitacion_id = ?', array($id));

		$enlace = "imagenes/upload/".$model->archivo;

//		$zip = new ZipArchive;
/*
		if($zip->open($enlace,ZipArchive::CREATE) === TRUE){
			$zip->extractTo("imagenes/upload/");
			$zip->close();
			unset($zip);
*/
			//header ("Content-Disposition: attachment; filename=".$id);
			header ("Content-Disposition: attachment; filename=\"".$model->archivo."\"");
			header ("Content-Type: application/octet-stream");
			header ("Content-Length: ".filesize("imagenes/upload/".$model->archivo));
			readfile("imagenes/upload/".$model->archivo);

			//unlink("imagenes/upload/".$model->archivo);
//		}

		$this->redirect(Yii::app()->user->returnUrl);
	}

	public function actionErase($id)
	{
		$model = Archivos::model()->find('capacitacion_id = ?', array($id));

		$enlace = "imagenes/upload/".$model->archivo;

		unlink($enlace);

		$thumb = "imagenes/thumbs/".$model->archivo;

		unlink($thumb);

		$model->delete();

		$this->redirect(Yii::app()->user->returnUrl);
	}
}
