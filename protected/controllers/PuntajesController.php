<?php
yii::import('application.vendor.mpdf.*');

class PuntajesController extends Controller
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

	public function actionList($id)
	{
		$criteria=new CDbCriteria;

		$criteria->compare('aspirante_id', $id);

		$dataProvider = new CActiveDataProvider(Puntajes::model(), array('criteria'=>$criteria));

		$this->render('list',array(
			'dataProvider' => $dataProvider,
			'id'=>$id,
		));
	}
	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Puntajes;

		$this->performAjaxValidation($model);

		if(isset($_POST['Puntajes']))
		{
			$model->attributes=$_POST['Puntajes'];
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

		if(isset($_POST['Puntajes']))
		{
			$model->attributes=$_POST['Puntajes'];
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
	public function actionSeleccion()
	{
		$model=new Puntajes('search');
		$model->unsetAttributes();  // clear any default values

		if(isset($_GET['Puntajes']))
			$model->attributes=$_GET['Puntajes'];

	    	if (isset($_POST['ApproveButton']))
	    	{
	        	if (isset($_POST['selectedIds']))
		        {
		            foreach ($_POST['selectedIds'] as $id)
	    	        {
	    	        	Puntajes::seleccionar($id);
		            }
		            
					$this->redirect(Yii::app()->user->returnUrl);
	    	    }
		    }		

		$this->render('index',array(
			'model'=>$model,
			'_status'=>"-1",
		));
	}

	public function actionComision()
	{
		$model=new Puntajes('search');
		$model->unsetAttributes();  // clear any default values

		if(isset($_GET['Puntajes']))
			$model->attributes=$_GET['Puntajes'];

	    	if (isset($_POST['ApproveButton']))
	    	{
	        	if (isset($_POST['selectedIds']))
		        {
		            foreach ($_POST['selectedIds'] as $id)
	    	        {
	    	        	Puntajes::seleccionar($id);
		            }
		            
					$this->redirect(Yii::app()->user->returnUrl);
	    	    }
		    }		

		$this->render('index',array(
			'model'=>$model,
			'_status'=>"0",
		));
	}


	public function actionAdmision()
	{
		$model=new Puntajes('search');
		$model->unsetAttributes();  // clear any default values

		if(isset($_GET['Puntajes']))
			$model->attributes=$_GET['Puntajes'];

	    	if (isset($_POST['ApproveButton']))
	    	{
	        	if (isset($_POST['selectedIds']))
		        {
		            foreach ($_POST['selectedIds'] as $id)
	    	        {
	    	        	Puntajes::seleccionar($id);
		            }
	    	    }

				Preselecciones::aspirantes_pass_active($_GET['Puntajes']['_cargo_id']);
				$this->redirect(Yii::app()->user->returnUrl);	    	    
		    }		

		$this->render('index',array(
			'model'=>$model,
			'_status'=>"2",
		));
	}	
	
	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Puntajes the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Puntajes::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Puntajes $model the model to be validated
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
			$mPDF1->SetTitle("Reporte Puntajes");
			$mPDF1->SetDisplayMode('fullpage');
			$mPDF1->WriteHTML($this->renderPartial('excel', '', true));
			$mPDF1->Output('Reporte_Puntajes.pdf','I');
			exit;
		}else{
			$content = $this->renderPartial("excel", '',true);
			yii::app()->request->sendfile("Reporte_Puntajes.".$_extension , $content);
		}
    }

	public function actionReporteProceso($id)
    {
		$mPDF1 = Yii::app()->ePdf->mpdf('utf-8','Letter','','',15,15,15,15,9,9,'P');
		$mPDF1->useOnlyCoreFonts = true;
		$mPDF1->SetTitle("Reporte resumen evaluacion");
		$mPDF1->SetDisplayMode('fullpage');
		$mPDF1->WriteHTML($this->renderPartial('proceso_evaluacion', array('model'=>Puntajes::model()->find('aspirante_id = ?', array($id))), true));
		$mPDF1->Output('Reporte_de_evaluacion.pdf','I');
		exit;
    }    
}
