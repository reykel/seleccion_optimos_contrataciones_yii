<?php

class ConfigController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/column2';

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
			array('ext.bootstrap.filters.BoosterFilter - delete'),
			array('CrugeAccessControlFilter')
		);
	}

	public function actionViewOwnActivity()
	{
		$model=new CrugePersonalSession('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['CrugePersonalSession']))
			$model->attributes=$_GET['CrugePersonalSession'];

		$this->render('viewOwnActivity',array(
			'model'=>$model,
		));
	}

	public function actionFormato()
	{
		$model = Cruge_Fieldvalue::model()->find('iduser = ? AND idfield = ?', array(Yii::app()->user->id, 4));

		if(isset($_POST['Cruge_Fieldvalue']))
		{
			$model->attributes=$_POST['Cruge_Fieldvalue'];
			if($model->save())
				$this->redirect(Yii::app()->user->returnUrl);
		}

		$this->render('formato',array(
			'model'=>$model,
		));
	}

	public function actionEstablecimiento()
	{
		$model = Cruge_Fieldvalue::model()->find('iduser = ? AND idfield = ?', array(Yii::app()->user->id, 5));

		if(isset($_POST['Cruge_Fieldvalue']))
		{
			$model->attributes=$_POST['Cruge_Fieldvalue'];
			if($model->save())
				$this->redirect("index.php?r=site/index");
		}

		$this->render('establecimiento',array(
			'model'=>$model,
		));
	}	

	public function actionSystemCurrentDate()
	{
		$model = CrugeSystem::model()->findByPk(1);

		if(isset($_POST['CrugeSystem']))
		{
			//$nuevafecha = date('Y-m-d', strtotime(CrugeSystem::get_current_date()." + 1 day"));

			$model->current_system_date = $_POST['CrugeSystem']['current_system_date'];
			$model->save();
			$this->redirect("index.php?r=site/index");
		}

		$this->render('systemCurrentYear',array(
			'model'=>$model,
		));
	}

	public function actionTopAspirantesSeleccionados()
	{
		$model = CrugeSystem::model()->findByPk(1);

		if(isset($_POST['CrugeSystem']))
		{
			$model->top_aspirantes_seleccionados = $_POST['CrugeSystem']['top_aspirantes_seleccionados'];
			$model->save();
			$this->redirect("index.php?r=site/index");
		}

		$this->render('topAspirantesSeleccionados',array(
			'model'=>$model,
		));
	}

	public function actionCalendario()
	{
		$this->render('calendario');
	}

	public function actionObtenerIncidencia()
	{
		$model = Partes::model()->findAll();

		$i = 0;

		foreach($model as $data){
			$titulo[$i]['title'] = "Aves: ".Aves::get_cumplimiento($data->id);
			$titulo[$i]['start'] = $data->fecha;
			$titulo[$i]['end'] = $data->fecha;
			$titulo[$i]['id'] = Aves::get_current_id($data->id);
			$titulo[$i]['indicador'] = "aves";
			$i++;

			$titulo[$i]['title'] = "Huevos: ".Huevos::get_cumplimiento($data->id);
			$titulo[$i]['start'] = $data->fecha;
			$titulo[$i]['end'] = $data->fecha;
			$titulo[$i]['id'] = Huevos::get_current_id($data->id);
			$titulo[$i]['indicador'] = "huevos";
			$i++;

			$titulo[$i]['title'] = "Pienso: ".Pienso::get_cumplimiento_pienso($data->id);
			$titulo[$i]['start'] = $data->fecha;
			$titulo[$i]['end'] = $data->fecha;
			$titulo[$i]['id'] = Pienso::get_current_id($data->id);
			$titulo[$i]['indicador'] = "pienso";
			$i++;

			$titulo[$i]['title'] = "Calcio: ".Pienso::get_cumplimiento_calcio($data->id);
			$titulo[$i]['start'] = $data->fecha;
			$titulo[$i]['end'] = $data->fecha;
			$titulo[$i]['id'] = Pienso::get_current_id($data->id);
			$titulo[$i]['indicador'] = "pienso";
			$i++;
		}

		header("Content-type: application/json");
		echo CJSON::encode($titulo);
	}

	public function actionCreditos()
	{
		$this->render('creditos');
	}	
}
