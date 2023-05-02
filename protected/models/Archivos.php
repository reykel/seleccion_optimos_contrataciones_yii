<?php

/**
 * This is the model class for table "tbl_archivos".
 *
 * The followings are the available columns in table 'tbl_archivos':
 * @property integer $id
 * @property string $archivo
 * @property integer $afiliado_id
 *
 * The followings are the available model relations:
 * @property Afiliados $Afiliados
 */
class Archivos extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_archivos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('archivo, capacitacion_id', 'required'),
			array('capacitacion_id, foto', 'numerical', 'integerOnly'=>true),
			array('archivo', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, archivo, capacitacion_id, foto', 'safe', 'on'=>'search'),
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
			'Capacitaciones' => array(self::BELONGS_TO, 'Capacitaciones', 'capacitacion_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'archivo' => 'Archivo',
			'capacitacion_id' => 'Aspirante',
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
	public function search($_capacitacion_id)
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id', $this->id);
		$criteria->compare('archivo', $this->archivo,true);
		$criteria->compare('capacitacion_id', $_capacitacion_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Archivos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function has_picture($id)
	{
		$model = self::model()->find('capacitacion_id = ?', array($id));

		if($model != null)
			return $model->archivo;
		else
			return "FTP-icon1.jpg";			
	}	
}
