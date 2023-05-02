<?php

/**
 * This is the model class for table "tbl_cargo_certificacion".
 *
 * The followings are the available columns in table 'tbl_cargo_certificacion':
 * @property integer $id
 * @property integer $escala_certificacion_id
 * @property integer $cargo_id
 * @property double $valor
 *
 * The followings are the available model relations:
 * @property Cargos $Cargos
 * @property EscalasCertificaciones $EscalaCertificacions
 */
class CargoCertificaciones extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_cargo_certificacion';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('escala_certificacion_id, cargo_id, valor', 'required'),
			array('escala_certificacion_id, cargo_id, requerido', 'numerical', 'integerOnly'=>true),
			array('valor', 'numerical'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, escala_certificacion_id, cargo_id, valor, requerido', 'safe', 'on'=>'search'),
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
			'EscalasCertificaciones' => array(self::BELONGS_TO, 'EscalasCertificaciones', 'escala_certificacion_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'escala_certificacion_id' => 'Escala Certificacion',
			'cargo_id' => 'Cargo',
			'valor' => 'Valor',
			'requerido'=>'Relevancia'			
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
		$criteria->compare('escala_certificacion_id',$this->escala_certificacion_id);
		$criteria->compare('cargo_id',$this->cargo_id);
		$criteria->compare('valor',$this->valor);
		$criteria->compare('requerido',$this->requerido);		

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
	 * @return CargoCertificaciones the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function get_score($_escala_certificacion_id, $_cargo_id)
	{
		$criteria = new CDbCriteria;

		$criteria->compare('escala_certificacion_id', $_escala_certificacion_id);
		$criteria->compare('cargo_id', $_cargo_id);

		$model = self::model()->find($criteria);

		if($model != null)
			return $model->valor;
		else
			return 0;
	}

	public function get_valor_requerido($_cargo_id)
	{
		$_valor = 0;

		$criteria = new CDbCriteria;

		$criteria->compare('cargo_id', $_cargo_id);

		$model = self::model()->findAll($criteria);

		foreach ($model as $p) {
			$_valor += $p->requerido;
		}

		return $_valor;
	}	
}
