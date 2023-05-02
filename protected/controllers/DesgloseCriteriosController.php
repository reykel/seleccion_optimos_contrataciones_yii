<?php

class DesgloseCriteriosController extends Controller
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

		$criteria->compare('puntaje_id', $id);

		$dataProvider = new CActiveDataProvider(DesgloseCriterios::model(), array('criteria'=>$criteria));

		$this->render('view',array(
			'dataProvider' => $dataProvider,
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate($_puntaje_id, $_status)
	{
		$model=new DesgloseCriterios;

		$this->performAjaxValidation($model);
		$model->puntaje_id = $_puntaje_id;

		$model->autor = Yii::app()->user->um->getFieldValue(Yii::app()->user->id,"nombre");
		$model->fecha = date('Y-m-d');
		$model->estado = $_status;

		if(isset($_POST['DesgloseCriterios']))
		{
			$model->attributes=$_POST['DesgloseCriterios'];
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
		$model->fecha = date('Y-m-d');		

		if(isset($_POST['DesgloseCriterios']))
		{
			$model->attributes=$_POST['DesgloseCriterios'];
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
	public function actionIndex($id, $_status, $_retorno)
	{
		$model=new DesgloseCriterios('search');
		$model->unsetAttributes();  // clear any default values

		if(isset($_GET['DesgloseCriterios']))
			$model->attributes=$_GET['DesgloseCriterios'];

		$this->render('index',array(
			'model'=>$model,
			'_puntaje_id'=>$id,
			'_status'=>$_status,
			'_retorno'=>$_retorno,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return DesgloseCriterios the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=DesgloseCriterios::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param DesgloseCriterios $model the model to be validated
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
			$mPDF1->SetTitle("Reporte DesgloseCriterios");
			$mPDF1->SetDisplayMode('fullpage');
			$mPDF1->WriteHTML($this->renderPartial('excel', '', true));
			$mPDF1->Output('Reporte_DesgloseCriterios.pdf','I');
			exit;
		}else{
			$content = $this->renderPartial("excel", '',true);
			yii::app()->request->sendfile("Reporte_DesgloseCriterios.".$_extension , $content);
		}
    }	
}
