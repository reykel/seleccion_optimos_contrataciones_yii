<?php
yii::import('application.vendor.mpdf.*');

class AspirantesController extends Controller
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
		$criteria=new CDbCriteria;

		$criteria->compare('aspirante_id', $id);

		$dataProvider_capacitaciones = new CActiveDataProvider(Capacitaciones::model(), array('criteria'=>$criteria));
		$dataProvider_idiomas = new CActiveDataProvider(Idiomas::model(), array('criteria'=>$criteria));
		$dataProvider_certificaciones = new CActiveDataProvider(Certificaciones::model(), array('criteria'=>$criteria));
		$dataProvider_prioridades = new CActiveDataProvider(AspirantePrioridades::model(), array('criteria'=>$criteria));
		$dataProvider_ocupaciones = new CActiveDataProvider(Ocupaciones::model(), array('criteria'=>$criteria));
		$dataProvider_cargos = new CActiveDataProvider(AspiranteCargos::model(), array('criteria'=>$criteria));

		$this->render('view',array(
			'model'=>$this->loadModel($id),
			'dataProvider_capacitaciones' => $dataProvider_capacitaciones,
			'dataProvider_idiomas' => $dataProvider_idiomas,
			'dataProvider_certificaciones' => $dataProvider_certificaciones,
			'dataProvider_prioridades' => $dataProvider_prioridades,			
			'dataProvider_ocupaciones' => $dataProvider_ocupaciones,
			'dataProvider_cargos' => $dataProvider_cargos,
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Aspirantes;

		$this->performAjaxValidation($model);

		if(isset($_POST['Aspirantes']))
		{
			$model->attributes=$_POST['Aspirantes'];
			$model->fecha_solicitud = date('Y-m-d');
			//$model->integracion = "[".implode(',', $_POST['Aspirantes']['integracion'])."]";
			$model->importe = $model->documentos_requeridos * 1.50;			

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
		//$model->integracion = explode(',', $model->integracion);

		$this->performAjaxValidation($model);

		if(isset($_POST['Aspirantes']))
		{
			$model->attributes=$_POST['Aspirantes'];
			//$model->integracion = $_POST['Aspirantes']['integracion'];
			$model->importe = $model->documentos_requeridos * 1.50;			

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
	public function actionIndex($_estado)
	{
		$model=new Aspirantes('search');
		$model->unsetAttributes();  // clear any default values

		if(isset($_GET['Aspirantes']))
			$model->attributes=$_GET['Aspirantes'];

		$this->render('index',array(
			'model'=>$model,
			'_estado'=>$_estado,
		));
	}

	public function actionDatos($_estado)
	{
		$model=new Aspirantes('search');
		$model->unsetAttributes();  // clear any default values

		if(isset($_GET['Aspirantes']))
			$model->attributes=$_GET['Aspirantes'];

		$this->render('datos',array(
			'model'=>$model,
			'_estado'=>$_estado,			
		));
	}

	public function actionprocesados()
	{
		$model=new Aspirantes('search');
		$model->unsetAttributes();  // clear any default values

		if(isset($_GET['Aspirantes']))
			$model->attributes=$_GET['Aspirantes'];

		$this->render('procesados',array(
			'model'=>$model,
		));
	}

	public function actionDescartados()
	{
		$model=new Aspirantes('search');
		$model->unsetAttributes();  // clear any default values

		if(isset($_GET['Aspirantes']))
			$model->attributes=$_GET['Aspirantes'];

		$this->render('descartados',array(
			'model'=>$model,
		));
	}
	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Aspirantes the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Aspirantes::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Aspirantes $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(yii::app()->getRequest()->getIsAjaxRequest())
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}

	public function actionReporte($id)
    {
		//$_extension = trim(Cruge_Fieldvalue::get_format_extension(Cruge_Fieldvalue::get_reporte_value()));

		//if($_extension == 'pdf'){

    		$model =  Aspirantes::model()->findByPk($id);

			$mPDF1 = Yii::app()->ePdf->mpdf('utf-8','A4','','',15,15,15,15,9,9,'P');
			$mPDF1->useOnlyCoreFonts = true;
			$mPDF1->SetTitle("Planilla de Aspirantes");
			$mPDF1->SetDisplayMode('fullpage');
			$mPDF1->WriteHTML($this->renderPartial('planilla', array('model'=>$model), true));
			$mPDF1->Output('Reporte_Aspirantes.pdf','I');
			exit;
		//}else{
		//	$content = $this->renderPartial("excel", '',true);
		//	yii::app()->request->sendfile("Reporte_Aspirantes.".$_extension , $content);
		//}
    }

	public function actionFotos($id)
	{
		$model=new Fotos('search');
		$model->unsetAttributes();  // clear any default values

		$this->render('archivos',array(
			'model'=>$model,
			'_aspirante_id'=>$id
		));
	}

	public function actionUpload($id)
	{
		if(isset($_FILES['archive']))
		{
			$model = Fotos::model()->find('aspirante_id = ?', array($id));

			if($model != null){
				$enlace = "imagenes/ids/".$model->archivo;
				unlink($enlace);

				$thumb = "imagenes/thumbs/".$model->archivo;
				unlink($thumb);
				
				$thumb = "imagenes/fotos/".$model->archivo;
				unlink($thumb);

				$model->delete();
			}

			$model = new Fotos;
			$_nombre_hash = hash("md5", $_FILES['archive']['name'].date('l jS \of F Y h:i:s A'));
			move_uploaded_file($_FILES['archive']['tmp_name'], "imagenes/ids/".$_nombre_hash);
/*
			$zip = new ZipArchive;

			if($zip->open("imagenes/ids/".base64_encode($_FILES['archive']['name']) , ZipArchive::CREATE) === TRUE){
				$zip->addFile("imagenes/ids/".$_FILES['archive']['name'], $_FILES['archive']['name']);
				$zip->close();
				unset($zip);

				$image = new EasyImage('imagenes/ids/'.$_FILES['archive']['name']);
				$image->resize(50, 50);
				$image->save('imagenes/thumbs/'.$_FILES['archive']['name']);

				$image = new EasyImage('imagenes/ids/'.$_FILES['archive']['name']);
				$image->resize(250, 250);
				$image->save('imagenes/fotos/'.$_FILES['archive']['name']);

				unlink('imagenes/ids/'.$_FILES['archive']['name']);
			}
*/
			$image = new EasyImage('imagenes/ids/'.$_nombre_hash);
			$image->resize(50, 50);
			$image->save('imagenes/thumbs/'.$_nombre_hash);

			$image = new EasyImage('imagenes/ids/'.$_nombre_hash);
			$image->resize(250, 250);
			$image->save('imagenes/fotos/'.$_nombre_hash);


			$model->archivo = $_nombre_hash;
			$model->aspirante_id = $id;

			$model->save();

			$this->redirect(Yii::app()->user->returnUrl);
		}

		$this->render('upload_form');
	}

	public function actionDownload($id)
	{
		$model = Fotos::model()->find('aspirante_id = ?', array($id));

		$enlace = "imagenes/ids/".base64_encode($model->archivo);

		//$zip = new ZipArchive;
/*
		if($zip->open($enlace,ZipArchive::CREATE) === TRUE){
			$zip->extractTo("imagenes/ids/");
			$zip->close();
			unset($zip);
*/
			//header ("Content-Disposition: attachment; filename=".$id);
			header ("Content-Disposition: attachment; filename=\"".$model->archivo."\"");
			header ("Content-Type: application/octet-stream");
			header ("Content-Length: ".filesize("imagenes/ids/".$model->archivo));
			readfile("imagenes/ids/".$model->archivo);

			//unlink("imagenes/ids/".$model->archivo);
//		}

		$this->redirect(Yii::app()->user->returnUrl);
	}

	public function actionErase($id)
	{
		$model = Fotos::model()->find('aspirante_id = ?', array($id));

		$enlace = "imagenes/ids/".$model->archivo;

		unlink($enlace);

		$thumb = "imagenes/thumbs/".$model->archivo;

		unlink($thumb);

		$fotos = "imagenes/fotos/".$model->archivo;

		unlink($fotos);		

		$model->delete();

		$this->redirect(Yii::app()->user->returnUrl);
	}

	public function actionResumen()
    {
		$criteria=new CDbCriteria;

	 	$criteria->compare('fecha_solicitud', date('Y-m-d'));

	 	$model = Aspirantes::model()->findAll($criteria);

		$mPDF1 = Yii::app()->ePdf->mpdf('utf-8','Letter','','',15,15,15,15,9,9,'P');
		$mPDF1->useOnlyCoreFonts = true;
		$mPDF1->SetTitle("Reporte resumen");
		$mPDF1->SetDisplayMode('fullpage');
		$mPDF1->WriteHTML($this->renderPartial('resumen', array('model'=>$model), true));
		$mPDF1->Output('Reporte_resumen_jornada.pdf','I');
		exit;
    }

	public function actionGeneral()
    {
		$mPDF1 = Yii::app()->ePdf->mpdf('utf-8','Letter','','',15,15,15,15,9,9,'P');
		$mPDF1->useOnlyCoreFonts = true;
		$mPDF1->SetTitle("Reporte resumen general");
		$mPDF1->SetDisplayMode('fullpage');
		$mPDF1->WriteHTML($this->renderPartial('general', array('model'=>$_SESSION['datos_filtrados']->getData()), true));
		$mPDF1->Output('Reporte_resumen_general.pdf','I');
		exit;
    }

	public function actionResumenFecha()
    {
		$criteria=new CDbCriteria;

	 	$criteria->compare('fecha_solicitud', CrugeSystem::get_current_date());

	 	$model = Aspirantes::model()->findAll($criteria);

		$mPDF1 = Yii::app()->ePdf->mpdf('utf-8','Letter','','',15,15,15,15,9,9,'P');
		$mPDF1->useOnlyCoreFonts = true;
		$mPDF1->SetTitle("Reporte resumen");
		$mPDF1->SetDisplayMode('fullpage');
		$mPDF1->WriteHTML($this->renderPartial('resumenfecha', array('model'=>$model), true));
		$mPDF1->Output('Reporte_resumen_jornada.pdf','I');
		exit;
    }

	public function actionRetorno($id)
	{
		$model=$this->loadModel($id);

		$model->en_solicitud_activa = "SI";
		$model->estado = null;
		$model->cargo_en_curso = null;
		$model->fecha_aprobacion = null;		

		if($model->save())
			$this->redirect(Yii::app()->user->returnUrl);
	}

	public function actionDescartes($id)
	{
		$model=$this->loadModel($id);

		$model->en_solicitud_activa = "DESCARTADO";

		if($model->save())
			$this->redirect(Yii::app()->user->returnUrl);
	}

	public function actionReingreso($id)
	{
		$model=$this->loadModel($id);

		$model->en_solicitud_activa = "SI";

		if($model->save())
			$this->redirect(Yii::app()->user->returnUrl);
	}
}