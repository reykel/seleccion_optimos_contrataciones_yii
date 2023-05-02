<?php

/**
 * This is the model class for table "tbl_desglose_aplicacion".
 *
 * The followings are the available columns in table 'tbl_desglose_aplicacion':
 * @property integer $id
 * @property integer $aplicacion_id
 * @property integer $item_id
 * @property string $respuesta
 * @property string $observaciones
 *
 * The followings are the available model relations:
 * @property Aplicaciones $Aplicacions
 */
class DesgloseAplicacion extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_desglose_aplicacion';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('aplicacion_id, item_id', 'numerical', 'integerOnly'=>true),
			array('respuesta, observaciones', 'length', 'max'=>50),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, aplicacion_id, item_id, respuesta, observaciones', 'safe', 'on'=>'search'),
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
			'Aplicaciones' => array(self::BELONGS_TO, 'Aplicaciones', 'aplicacion_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'aplicacion_id' => 'Aplicacion',
			'item_id' => 'Item',
			'respuesta' => 'Respuesta',
			'observaciones' => 'Observaciones',
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
		$criteria->compare('aplicacion_id',$this->aplicacion_id);
		$criteria->compare('item_id',$this->item_id);
		$criteria->compare('respuesta',$this->respuesta,true);
		$criteria->compare('observaciones',$this->observaciones,true);

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
	 * @return DesgloseAplicacion the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function toList()
	{
		$model = self::model()->findAll();
		return CHtml::listData($model, 'id', 'desgloseAplicacio');
	}	
}
