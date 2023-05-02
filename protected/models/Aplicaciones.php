<?php

/**
 * This is the model class for table "tbl_aplicaciones".
 *
 * The followings are the available columns in table 'tbl_aplicaciones':
 * @property integer $id
 * @property integer $instrumento_id
 * @property integer $area_id
 * @property string $fecha
 * @property integer $coordinador
 *
 * The followings are the available model relations:
 * @property Areas $Areas
 * @property Instrumentos $Instrumentos
 * @property DesgloseAplicacion[] $DesgloseAplicacion
 */
class Aplicaciones extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_aplicaciones';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('instrumento_id, area_id, coordinador', 'numerical', 'integerOnly'=>true),
			array('fecha', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, instrumento_id, area_id, fecha, coordinador', 'safe', 'on'=>'search'),
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
			'Areas' => array(self::BELONGS_TO, 'Areas', 'area_id'),
			'Instrumentos' => array(self::BELONGS_TO, 'Instrumentos', 'instrumento_id'),
			'DesgloseAplicacion' => array(self::HAS_MANY, 'DesgloseAplicacion', 'aplicacion_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'instrumento_id' => 'Instrumento',
			'area_id' => 'Area',
			'fecha' => 'Fecha',
			'coordinador' => 'Coordinador',
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
		$criteria->compare('instrumento_id',$this->instrumento_id);
		$criteria->compare('area_id',$this->area_id);
		$criteria->compare('fecha',$this->fecha,true);
		$criteria->compare('coordinador',$this->coordinador);

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
	 * @return Aplicaciones the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function toList()
	{
		$model = self::model()->findAll();
		return CHtml::listData($model, 'id', 'aplicacione');
	}	
}
