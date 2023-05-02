<?php

/**
 * This is the model class for table "tbl_aspirante_cargos".
 *
 * The followings are the available columns in table 'tbl_aspirante_cargos':
 * @property integer $id
 * @property integer $aspirante_id
 * @property integer $cargo_id
 *
 * The followings are the available model relations:
 * @property Aspirantes $Aspirantes
 * @property Cargos $Cargos
 */
class AspiranteCargos extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_aspirante_cargos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('aspirante_id, cargo_id', 'required'),
			array('aspirante_id, cargo_id', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, aspirante_id, cargo_id', 'safe', 'on'=>'search'),
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
			'Cargos' => array(self::BELONGS_TO, 'Cargos', 'cargo_id'),
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
			'cargo_id' => 'Cargo',
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
		$criteria->compare('aspirante_id',$_aspirante_id);
		$criteria->compare('cargo_id',$this->cargo_id);

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
	 * @return AspiranteCargos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function getArrayReturn($_cargo_id)
	{
		$_valor_referencia = CargoCapacitaciones::get_valor_requerido($_cargo_id);

		$elementos = array();
		$model = self::model()->findAll('cargo_id = ?', array($_cargo_id));

		foreach ($model as $p) {
			if((Capacitaciones::get_valor_acumulado($p->aspirante_id, $_cargo_id) == $_valor_referencia) && (Puntajes::get_seleccionado_activo_cargo($p->aspirante_id, $_cargo_id) == 0) && Aspirantes::es_disponible($p->aspirante_id) == "SI" && Aspirantes::get_procesado($p->aspirante_id) == "SI")
				array_push($elementos, $p->aspirante_id);
		}

		return $elementos;
	}	
}