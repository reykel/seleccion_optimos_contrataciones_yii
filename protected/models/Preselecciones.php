<?php

/**
 * This is the model class for table "tbl_preselecciones".
 *
 * The followings are the available columns in table 'tbl_preselecciones':
 * @property integer $id
 * @property integer $cargo_id
 * @property string $fecha
 *
 * The followings are the available model relations:
 * @property Cargos $Cargos
 * @property Puntajes[] $Puntajes
 */
class Preselecciones extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_preselecciones';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('cargo_id', 'numerical', 'integerOnly'=>true),
			array('fecha, activo', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, cargo_id, fecha, activo', 'safe', 'on'=>'search'),
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
			'Cargos' => array(self::BELONGS_TO, 'Cargos', 'cargo_id'),
			'Puntajes' => array(self::HAS_MANY, 'Puntajes', 'preseleccion_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'cargo_id' => 'Cargo',
			'fecha' => 'Fecha',
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
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('cargo_id',$this->cargo_id);
		$criteria->compare('fecha',$this->fecha,true);

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
	 * @return Preselecciones the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function add_preseleccion($id)
	{
		self::aspirantes_pass_active($id);

		$model = new Preselecciones;
		$model->cargo_id = $id;
		$model->fecha = $nuevafecha = date('Y-m-d');
		$model->activo = "SI";
		$model->save();

		return $model->id;
	}

	public function aspirantes_pass_active($_cargo_id)
	{
		$model = self::model()->findAll('cargo_id = ?', array($_cargo_id));

		foreach ($model as $p) {
			$p->activo = "NO";
			$p->save();
		}
	}

	public function getArrayReturn()
	{
		$elementos = array();
		$model = self::model()->findAll('activo = ?', array("SI"));

		foreach ($model as $p) {
				array_push($elementos, $p->cargo_id);
		}

		return $elementos;
	}

	public function get_cargo_id($id)
	{
		$model = self::model()->findByPk($id);
		return $model->cargo_id;
	}
}