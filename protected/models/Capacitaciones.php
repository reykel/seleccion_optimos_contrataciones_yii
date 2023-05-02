<?php

/**
 * This is the model class for table "tbl_capacitaciones".
 *
 * The followings are the available columns in table 'tbl_capacitaciones':
 * @property integer $id
 * @property integer $aspirante_id
 * @property string $titulo
 * @property string $tema
 * @property string $forma_id
 * @property string $ano
 * @property string $centro_id
 * @property integer $escala_capacitacion_id
 *
 * The followings are the available model relations:
 * @property Aspirantes $Aspirantes
 * @property EscalasCapacitaciones $EscalaCapacitacions
 */
class Capacitaciones extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_capacitaciones';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('aspirante_id, titulo, tema, forma_id, ano, centro_id, escala_capacitacion_id', 'required'),
			array('aspirante_id, escala_capacitacion_id', 'numerical', 'integerOnly'=>true),
			array('titulo, tema, forma_id, ano, centro_id', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, aspirante_id, titulo, tema, forma_id, ano, centro_id, escala_capacitacion_id', 'safe', 'on'=>'search'),
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
			'EscalasCapacitaciones' => array(self::BELONGS_TO, 'EscalasCapacitaciones', 'escala_capacitacion_id'),
			'Archivos' => array(self::HAS_MANY, 'Archivos', 'capacitacion_id'),
			'Formas' => array(self::BELONGS_TO, 'Formas', 'forma_id'),
			'Centros' => array(self::BELONGS_TO, 'Centros', 'centro_id'),
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
			'titulo' => 'Titulo',
			'tema' => 'Tema',
			'forma_id' => 'Forma',
			'ano' => 'Año',
			'centro_id' => 'Centro Capacitador',
			'escala_capacitacion_id' => 'Escala Capacitacion',
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
		$criteria->compare('titulo',$this->titulo,true);
		$criteria->compare('tema',$this->tema,true);
		$criteria->compare('forma_id',$this->forma_id,true);
		$criteria->compare('ano',$this->ano,true);
		$criteria->compare('centro_id',$this->centro_id,true);
		$criteria->compare('escala_capacitacion_id',$this->escala_capacitacion_id);

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
	 * @return Capacitaciones the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function get_rate($_aspirante_id, $_cargo_id)
	{
		$_cantidad = 0;

		$criteria=new CDbCriteria;

		$criteria->compare('aspirante_id', $_aspirante_id);

		$model = self::model()->findAll($criteria);

		foreach ($model as $p) {
			$_cantidad =+ (CargoCapacitaciones::get_score($p->escala_capacitacion_id, $_cargo_id) - self::get_vigencia($p->id));
		}

		return $_cantidad;
	}

	public function get_vigencia($id)
	{
		$model = self::model()->findByPk($id);

		return (((int) date('Y')) - ((int) $model->ano)) * 0.001;
	}

	public function get_valor_acumulado($_aspirante_id, $_cargo_id)
	{
		$_valor = 0;

		$criteria = new CDbCriteria;

		$criteria->with = array(
		    'EscalasCapacitaciones' => array(
	    	    'joinType'=>'INNER JOIN',
		    	   'with' => array(
		    	   		'CargoCapacitaciones' => array('joinType' => 'INNER JOIN')
		        )
		    ),
		);				

		$criteria->compare('cargo_id', $_cargo_id);
		$criteria->compare('aspirante_id', $_aspirante_id);

		$model = self::model()->findAll($criteria);

		foreach ($model as $p) {
			$_valor += CargoCapacitaciones::get_valor_cargo($_cargo_id, $p->escala_capacitacion_id);
		}

		return $_valor;
	}	
}
