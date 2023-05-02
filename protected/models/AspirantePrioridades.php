<?php

/**
 * This is the model class for table "tbl_aspirante_prioridades".
 *
 * The followings are the available columns in table 'tbl_aspirante_prioridades':
 * @property integer $id
 * @property integer $aspirante_id
 * @property integer $prioridad_id
 *
 * The followings are the available model relations:
 * @property Aspirantes $Aspirantes
 * @property Prioridades $Prioridads
 */
class AspirantePrioridades extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_aspirante_prioridades';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('aspirante_id, prioridad_id', 'required'),
			array('aspirante_id, prioridad_id', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, aspirante_id, prioridad_id', 'safe', 'on'=>'search'),
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
			'Prioridades' => array(self::BELONGS_TO, 'Prioridades', 'prioridad_id'),
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
			'prioridad_id' => 'Prioridad',
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

		$criteria->compare('id', $this->id);
		$criteria->compare('aspirante_id', $_aspirante_id);
		$criteria->compare('prioridad_id', $this->prioridad_id);

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
	 * @return AspirantePrioridades the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function get_rate($_aspirante_id)
	{
		$_cantidad = 0;

		$criteria=new CDbCriteria;

		$criteria->with = array('Prioridades' => array('joinType'=>'INNER JOIN',),);		

		$criteria->compare('aspirante_id', $_aspirante_id);

		$model = self::model()->findAll($criteria);

		foreach ($model as $p) {
			$_cantidad =+ $p->Prioridades->valor;
		}

		return $_cantidad;
	}		
}
