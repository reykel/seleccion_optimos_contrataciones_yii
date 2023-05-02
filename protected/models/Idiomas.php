<?php

/**
 * This is the model class for table "tbl_idiomas".
 *
 * The followings are the available columns in table 'tbl_idiomas':
 * @property integer $id
 * @property string $idioma
 * @property string $nivel
 * @property integer $aspirante_id
 *
 * The followings are the available model relations:
 * @property Aspirantes $Aspirantes
 */
class Idiomas extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_idiomas';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('idioma_id, nivel, aspirante_id', 'required'),
			array('aspirante_id, nivel', 'numerical', 'integerOnly'=>true),
			array('idioma_id, nivel', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, idioma_id, nivel, aspirante_id', 'safe', 'on'=>'search'),
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
			'IdiomasRelevancia' => array(self::BELONGS_TO, 'IdiomasRelevancia', 'idioma_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'idioma_id' => 'Idioma',
			'nivel' => 'Nivel',
			'aspirante_id' => 'Aspirante',
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
	public function search($_aspirante_id)
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('idioma_id',$this->idioma_id,true);
		$criteria->compare('nivel',$this->nivel,true);
		$criteria->compare('aspirante_id',$_aspirante_id);

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
	 * @return Idiomas the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function nivelToList()
	{
		$model = array(
			array('id'=>'1', 'value'=>'Primero'),
			array('id'=>'2', 'value'=>'Segundo'),
			array('id'=>'3', 'value'=>'Tercero'),
			array('id'=>'4', 'value'=>'Cuarto'),
			array('id'=>'5', 'value'=>'Quinto'),
			array('id'=>'6', 'value'=>'Sexto'),			
		);
		return CHtml::listData($model,'id','value');
	}

	public function get_score($_aspirante_id)
	{
		$criteria = new CDbCriteria;

		$criteria->compare('aspirante_id', $_aspirante_id);

		$model = self::model()->find($criteria);

		if($model != null)
			return $model->IdiomasRelevancia->valor * $model->nivel;
		else
			return 0;
	}

	public function get_nivel($id)
	{
		$_nivel = array();

		$_nivel[1] = "Primero";
		$_nivel[2] = "Segundo";
		$_nivel[3] = "Tercero";
		$_nivel[4] = "Cuarto";
		$_nivel[5] = "Quinto";
		$_nivel[6] = "Sexto";

		return $_nivel[$id];
	}	
}
