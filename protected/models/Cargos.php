<?php

/**
 * This is the model class for table "tbl_cargos".
 *
 * The followings are the available columns in table 'tbl_cargos':
 * @property integer $id
 * @property string $cargo
 *
 * The followings are the available model relations:
 * @property CargoCapacitaciones[] $CargoCapacitaciones
 * @property CargoCertificacion[] $CargoCertificacion
 * @property CargoOcupacion[] $CargoOcupacion
 */
class Cargos extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_cargos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('cargo', 'required'),
			array('cargo', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, cargo', 'safe', 'on'=>'search'),
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
			'CargoCapacitaciones' => array(self::HAS_MANY, 'CargoCapacitaciones', 'cargo_id'),
			'CargoCertificacion' => array(self::HAS_MANY, 'CargoCertificacion', 'cargo_id'),
			'CargoOcupacion' => array(self::HAS_MANY, 'CargoOcupacion', 'cargo_id'),
			'AspiranteCargos' => array(self::HAS_MANY, 'AspiranteCargos', 'cargo_id'),			
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'cargo' => 'Cargo',
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
		$criteria->compare('cargo',$this->cargo,true);

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
	 * @return Cargos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function toList($_rank = "NO")
	{
		$criteria=new CDbCriteria;

		
		if($_rank == "SI")
			$criteria->addNotInCondition('id', Preselecciones::getArrayReturn());
		else
			$criteria->addInCondition('id', Preselecciones::getArrayReturn());

		$model = self::model()->findAll($criteria);
		return CHtml::listData($model, 'id', 'cargo');
	}

	public function get_first()
	{
		$criteria=new CDbCriteria;

		$criteria->limit = 1;
		$criteria->order = 'id ASC';

		$model = Cargos::model()->find($criteria);

		return $model->id;
	}

	public function toListFree()
	{
		$model = self::model()->findAll();
		return CHtml::listData($model, 'id', 'cargo');
	}

	public function get_cargo_descripcion($id)
	{
		$model = self::model()->findByPk($id);
		return $model->cargo;
	}	
}