<?php

class SiteController extends Controller
{
	/**
	 * Declares class-based actions.
	 */
	public function actions()
	{
		return array(
			// captcha action renders the CAPTCHA image displayed on the contact page
			'captcha'=>array(
				'class'=>'CCaptchaAction',
				'backColor'=>0xFFFFFF,
			),
			// page action renders "static" pages stored under 'protected/views/site/pages'
			// They can be accessed via: index.php?r=site/page&view=FileName
			'page'=>array(
				'class'=>'CViewAction',
			),
		);
	}

	public function filters()
	{
    	return array(array('CrugeAccessControlFilter'));
	}
	
	public function actionChange($id=null)
	{
		$model = new ChangeForm;

		if(isset($_POST['ChangeForm']))
		{
			$model->attributes = $_POST['ChangeForm'];

			if($model->validate())
			{
				if($model->change($id))
				{
					yii::app()->user->setFlash('success','Password cambiado correctamente');	
					$model = new ChangeForm;
				}
				else
				{
					yii::app()->user->setFlash('error','No se pudo cambiar el password');	
					$model = new ChangeForm;
				}

			}  
		}

		$this->render('change',array('model'=>$model,));
	}

	public function actionRegister()
	{
		$model = new Usuario;

		if(isset($_POST['Usuario']))
		{
			$model->attributes = $_POST['Usuario'];
			$cleanPassword = $model->password;
			$model->password = md5($model->password);

			if($model->save())
			{
				$loginForm = new LoginForm;

				$loginForm->username = $model->nick;
				$loginForm->password = $cleanPassword;
				$loginForm->nombapel = $model->nombapel;
				$loginForm->sexo = $model->sexo;
				$loginForm->CodMunicipio = $model->CodMunicipio;

				$loginForm->cargo = $model->cargo;
				$loginForm->CodDepartamento_plantilla = $model->CodDepartamento_plantilla;
				$loginForm->CodDepartamento_tributa = $model->CodDepartamento_tributa;

				$loginForm->cat_docente = $model->cat_docente;
				$loginForm->mail = $model->mail;

				yii::app()->authManager->assign("usuario",$model->id);

				if(Yii::app()->user->isGuest){
					if($loginForm->login())
						$this->redirect(array('index'));
				}
				else
					$this->redirect(array('usuario/index'));

			}
			else
			{
				yii::app()->user->setFlash('error','No se pudo registrar el usuario');
			}
		}

		$this->render('register', array("model"=>$model,));
	}

	/**
	 * This is the default 'index' action that is invoked
	 * when an action is not explicitly requested by users.
	 */
	public function actionIndex()
	{
		// renders the view file 'protected/views/site/index.php'
		// using the default layout 'protected/views/layouts/main.php'
		$this->render('index');
	}

	/**
	 * This is the action to handle external exceptions.
	 */
	public function actionError()
	{
		if($error=Yii::app()->errorHandler->error)
		{
			if(Yii::app()->request->isAjaxRequest)
				echo $error['message'];
			else
				$this->render('error', $error);
		}
	}

	/**
	 * Displays the contact page
	 */
	public function actionContact()
	{
		$model=new ContactForm;
		if(isset($_POST['ContactForm']))
		{
			$model->attributes=$_POST['ContactForm'];
			if($model->validate())
			{
				$name='=?UTF-8?B?'.base64_encode($model->name).'?=';
				$subject='=?UTF-8?B?'.base64_encode($model->subject).'?=';
				$headers="From: $name <{$model->email}>\r\n".
					"Reply-To: {$model->email}\r\n".
					"MIME-Version: 1.0\r\n".
					"Content-Type: text/plain; charset=UTF-8";

				mail(Yii::app()->params['adminEmail'],$subject,$model->body,$headers);
				Yii::app()->user->setFlash('contact','Thank you for contacting us. We will respond to you as soon as possible.');
				$this->refresh();
			}
		}
		$this->render('contact',array('model'=>$model));
	}

	/**
	 * Displays the login page
	 */
/*	
	public function actionLogin()
	{
		$model=new LoginForm;

		// if it is ajax validation request
		if(isset($_POST['ajax']) && $_POST['ajax']==='login-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}

		// collect user input data
		if(isset($_POST['LoginForm']))
		{
			$model->attributes=$_POST['LoginForm'];
			// validate user input and redirect to the previous page if valid
			if($model->validate() && $model->login())
				$this->redirect(Yii::app()->user->returnUrl);
		}
		// display the login form
		if(yii::app()->user->isGuest)
			$this->render('login',array('model'=>$model));
		else
			$this->render('index',array('model'=>$model));
	}
*/
	/**
	 * Logs out the current user and redirect to homepage.
	 */
/*	
	public function actionLogout()
	{
		Yii::app()->user->logout();
		$this->redirect(Yii::app()->homeUrl);
	}
*/
	public function actionProducto()
	{
		$this->render('producto');
	}
}