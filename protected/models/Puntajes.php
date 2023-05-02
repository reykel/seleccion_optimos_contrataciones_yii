<?php

/**
 * This is the model class for table "tbl_puntajes".
 *
 * The followings are the available columns in table 'tbl_puntajes':
 * @property integer $id
 * @property integer $aspirante_id
 * @property integer $preseleccion_id
 * @property double $puntaje
 *
 * The followings are the available model relations:
 * @property Aspirantes $Aspirantes
 * @property Preselecciones $Preseleccions
 */
class Puntajes extends CActiveRecord
{
	public $_cargo_id;
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_puntajes';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('aspirante_id, preseleccion_id', 'required'),
			array('aspirante_id, preseleccion_id', 'numerical', 'integerOnly'=>true),
			array('puntaje', 'numerical'),
			array('status', 'length', 'max'=>255),
			array('memo_preseleccion, memo_seleccion, memo_admision, firma_preseleccion, firma_seleccion, firma_admision, fecha_preseleccion, fecha_seleccion, fecha_admision', 'safe'),
			array('id, aspirante_id, preseleccion_id, puntaje, _cargo_id, status', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'Aspirantes' => array(self::BELONGS_TO, 'Aspirantes', 'aspirante_id'),
			'Preselecciones' => array(self::BELONGS_TO, 'Preselecciones', 'preseleccion_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'aspirante_id' => 'Aspirante',
			'preseleccion_id' => 'Preseleccion',
			'puntaje' => 'Puntaje',
			'_cargo_id' => 'Cargo',
			'memo_preseleccion'=>'Criterio',
			'memo_seleccion'=>'Criterio',
			'memo_admision'=>'Criterio',
			'firma_preseleccion'=>'Evaluador',
			'firma_seleccion'=>'Evaluador',
			'firma_admision'=>'Evaluador',
			'fecha_preseleccion'=>'Fecha',
			'fecha_seleccion'=>'Fecha',
			'fecha_admision'=>'Fecha',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search($_status)
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->with = array('Preselecciones' => array('joinType'=>'INNER JOIN',),);		

		if(strlen($this->_cargo_id) > 0){
			$criteria->compare('cargo_id', $this->_cargo_id);
		}else{
			$criteria->compare('cargo_id', "-1");
		}

		$criteria->compare('activo', "SI");

		if($_status == -1)
			$criteria->compare('status', "SIN SELECCIONAR");
		elseif($_status == 0)
			$criteria->compare('status', "SELECCIONADO");
		elseif($_status == 2)
			$criteria->compare('status', "APROBADO");
		else
			$criteria->compare('status', "ADMITIDO");

		//$criteria->compare('status', $_status == -1 ? "SIN SELECCIONAR" : "SELECCIONADO");

		$_SESSION['datos_filtrados'] = new CActiveDataProvider($this, array(
                        'criteria'=>$criteria,
                        'pagination'=>false,));

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Puntajes the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function add_puntaje($_aspirante_id, $_preseleccion_id, $id)
	{
		$model = new Puntajes;
		$model->aspirante_id = $_aspirante_id;
		$model->preseleccion_id = $_preseleccion_id;
		$model->puntaje = Rank::get_valor($id);
		$model->save();
	}

	public function get_veces_seleccionado_general($_aspirante_id)
	{
		$model = self::model()->count('aspirante_id = ?', array($_aspirante_id));
		return $model;
	}

	public function get_veces_seleccionado_cargo($_aspirante_id, $_cargo_id)
	{
		$model = self::model()->with('Preselecciones')->count('aspirante_id = ? AND cargo_id = ?', array($_aspirante_id, $_cargo_id));
		return $model;
	}

	public function get_valor_seleccionado_general($_aspirante_id)
	{
		$_cantidad = 0;

		$model = self::model()->findAll('aspirante_id = ?', array($_aspirante_id));

		foreach ($model as $p) {
			$_cantidad += $p->puntaje;	
		}

		return $_cantidad;
	}

	public function get_valor_seleccionado_cargo($_aspirante_id, $_cargo_id)
	{
		$_cantidad = 0;

		$model = self::model()->with('Preselecciones')->findAll('aspirante_id = ? AND cargo_id = ?', array($_aspirante_id, $_cargo_id));

		foreach ($model as $p) {
			$_cantidad += $p->puntaje;	
		}

		return $_cantidad;
	}

	public function get_promedio_seleccionado_general($_aspirante_id)
	{
		$_cantidades = self::get_veces_seleccionado_general($_aspirante_id);
		$_valor = self::get_valor_seleccionado_general($_aspirante_id);

		if($_cantidades > 0)
			return number_format($_valor / $_cantidades, 2, '.', '');
		else
			return 0;
	}

	public function get_promedio_seleccionado_cargo($_aspirante_id, $_cargo_id)
	{
		$_cantidades = self::get_veces_seleccionado_cargo($_aspirante_id, $_cargo_id);
		$_valor = self::get_valor_seleccionado_cargo($_aspirante_id, $_cargo_id);

		if($_cantidades > 0)
			return number_format($_valor / $_cantidades, 2, '.', '');
		else
			return 0;
	}

	public function get_seleccionado_activo_cargo($_aspirante_id, $_cargo_id)
	{
		$model = self::model()->with('Preselecciones')->find('aspirante_id = ? AND cargo_id = ? AND activo = ?', array($_aspirante_id, $_cargo_id, "SI"));

		if($model != null)
			return -1;
		else
			return 0;
	}

	public function seleccionar($id)
	{
		$model=Puntajes::model()->findByPk($id);

		if($model->status == "SIN SELECCIONAR"){
			$model->status = "SELECCIONADO";
		}elseif($model->status == "SELECCIONADO"){
			$model->status = "APROBADO";
		}elseif($model->status == "APROBADO"){
			$model->status = "ADMITIDO";
			Aspirantes::switch_disponibilidad(self::get_aspirante_id($id), "NO");
		}else{
			$model->status == "SIN SELECCIONAR";
		}

		$model->save();
	}

	private function get_aspirante_id($id)
	{
		$model=Puntajes::model()->findByPk($id);

		return $model->aspirante_id;
	}

	public function get_preseleccion_id($_aspirante_id)
	{
		$model=Puntajes::model()->find('aspirante_id = ? AND status = ?', array($_aspirante_id, "APROBADO"));

		return $model->preseleccion_id;
	}

	public function add_admision($_aspirante_id, $_preseleccion_id, $id)
	{
		$model = new Puntajes;
		$model->aspirante_id = $_aspirante_id;
		$model->preseleccion_id = $_preseleccion_id;
		$model->puntaje = Rank::get_valor($id);
		$model->status = "APROBADO";
		$model->save();
	}	
}
