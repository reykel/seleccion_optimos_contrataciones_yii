<?php

/**
 * This is the model class for table "tbl_escalas_capacitaciones".
 *
 * The followings are the available columns in table 'tbl_escalas_capacitaciones':
 * @property integer $id
 * @property string $escala_capacitacion
 *
 * The followings are the available model relations:
 * @property Capacitaciones[] $Capacitaciones
 * @property CargoCapacitaciones[] $CargoCapacitaciones
 */
class EscalasCapacitaciones extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_escalas_capacitaciones';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('escala_capacitacion', 'required'),
			array('escala_capacitacion', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, escala_capacitacion', 'safe', 'on'=>'search'),
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
			'Capacitaciones' => array(self::HAS_MANY, 'Capacitaciones', 'escala_capacitacion_id'),
			'CargoCapacitaciones' => array(self::HAS_MANY, 'CargoCapacitaciones', 'escala_capacitacion_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'escala_capacitacion' => 'Escala Capacitacion',
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
		$criteria->compare('escala_capacitacion',$this->escala_capacitacion,true);

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
	 * @return EscalasCapacitaciones the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function toList()
	{
		$model = self::model()->findAll();
		return CHtml::listData($model, 'id', 'escala_capacitacion');
	}	
}
