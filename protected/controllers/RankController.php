<?php

class RankController extends Controller
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
	public function actionCreate()
	{
		$model=new Rank;

		$this->performAjaxValidation($model);

		if(isset($_POST['Rank']))
		{
			$model->attributes=$_POST['Rank'];
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

		if(isset($_POST['Rank']))
		{
			$model->attributes=$_POST['Rank'];
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
	public function actionIndex()
	{
		$model=new Rank('search');
		$model->unsetAttributes();

		//if(Yii::app()->user->returnUrl == "/TURISMO/index.php?r=rank/index")
		//	Rank::get_aspirantes_ranking_list();

		if(isset($_GET['Rank'])){
			$model->attributes=$_GET['Rank'];
			Rank::get_aspirantes_ranking_list($model->cargo_id);

	    	if (isset($_POST['ApproveButton']))
	    	{
	        	if (isset($_POST['selectedIds']))
		        {
					$_preseleccion_id = Preselecciones::add_preseleccion($model->cargo_id);

		            foreach ($_POST['selectedIds'] as $id)
	    	        {
	    	        	Puntajes::add_puntaje(Rank::get_aspirante($id), $_preseleccion_id, $id);
		            }

					$this->redirect("index.php?r=rank/index");
	    	    }
		    }		
		}
		
		$this->render('index',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Rank the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Rank::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Rank $model the model to be validated
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
			$mPDF1->SetTitle("Reporte Rank");
			$mPDF1->SetDisplayMode('fullpage');
			$mPDF1->WriteHTML($this->renderPartial('excel', '', true));
			$mPDF1->Output('Reporte_Rank.pdf','I');
			exit;
		}else{
			$content = $this->renderPartial("excel", '',true);
			yii::app()->request->sendfile("Reporte_Rank.".$_extension , $content);
		}
    }

	public function actionDesignacion($id, $cargo_id, $aspirante_id)
	{
		$_preseleccion_id = Preselecciones::add_preseleccion($cargo_id);
   		Puntajes::add_admision($aspirante_id, $_preseleccion_id, $id);
		
		$this->redirect("index.php?r=rank/index");
	}
}
