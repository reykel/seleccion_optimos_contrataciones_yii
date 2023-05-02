<?php

/**
 * This is the model class for table "tbl_items".
 *
 * The followings are the available columns in table 'tbl_items':
 * @property integer $id
 * @property integer $instrumento_id
 * @property string $item
 * @property integer $tipo_id
 * @property integer $categoria_id
 * @property integer $valor
 *
 * The followings are the available model relations:
 * @property Categorias $Categorias
 * @property Instrumentos $Instrumentos
 * @property Tipos $Tipos
 */
class Items extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_items';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('instrumento_id, tipo_id, categoria_id', 'numerical', 'integerOnly'=>true),
			array('item', 'length', 'max'=>50),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, instrumento_id, item, tipo_id, categoria_id', 'safe', 'on'=>'search'),
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
			'Categorias' => array(self::BELONGS_TO, 'Categorias', 'categoria_id'),
			'Instrumentos' => array(self::BELONGS_TO, 'Instrumentos', 'instrumento_id'),
			'Tipos' => array(self::BELONGS_TO, 'Tipos', 'tipo_id'),
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
			'item' => 'Item',
			'tipo_id' => 'Tipo',
			'categoria_id' => 'Categoria',
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
	public function search($id)
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('instrumento_id', $id);
		$criteria->compare('item',$this->item,true);
		$criteria->compare('tipo_id',$this->tipo_id);
		$criteria->compare('categoria_id',$this->categoria_id);

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
	 * @return Items the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function toList()
	{
		$model = self::model()->findAll();
		return CHtml::listData($model, 'id', 'item');
	}

	public function get_instrumento($id)
	{
		$model = self::model()->findByPk($id);
		return $model->instrumento_id;
	}	
}
