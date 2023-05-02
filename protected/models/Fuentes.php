<?php

/**
 * This is the model class for table "tbl_fuentes".
 *
 * The followings are the available columns in table 'tbl_fuentes':
 * @property integer $id
 * @property string $fuente
 * @property string $categoria_fuente
 *
 * The followings are the available model relations:
 * @property Aspirantes[] $Aspirantes
 */
class Fuentes extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_fuentes';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('fuente, categoria_fuente', 'required'),
			array('fuente, categoria_fuente', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, fuente, categoria_fuente', 'safe', 'on'=>'search'),
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
			'Aspirantes' => array(self::HAS_MANY, 'Aspirantes', 'fuente_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'fuente' => 'Fuente',
			'categoria_fuente' => 'Categoria Fuente',
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
		$criteria->compare('fuente',$this->fuente,true);
		$criteria->compare('categoria_fuente',$this->categoria_fuente,true);

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
	 * @return Fuentes the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function toList()
	{
		$model = self::model()->findAll();
		return CHtml::listData($model, 'id', 'fuente');
	}	
}