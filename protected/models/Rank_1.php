<?php

/**
 * This is the model class for table "tbl_rank".
 *
 * The followings are the available columns in table 'tbl_rank':
 * @property integer $id
 * @property integer $aspirante_id
 * @property integer $cargo_id
 * @property double $valor
 *
 * The followings are the available model relations:
 * @property Aspirantes $Aspirantes
 * @property Cargos $Cargos
 */
class Rank extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_rank';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('aspirante_id, cargo_id, valor', 'required'),
			array('aspirante_id, cargo_id', 'numerical', 'integerOnly'=>true),
			array('valor', 'numerical'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, aspirante_id, cargo_id, valor', 'safe', 'on'=>'search'),
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
			'valor' => 'Valor',
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
		$criteria->compare('aspirante_id',$this->aspirante_id);
		$criteria->compare('cargo_id',$this->cargo_id);
		$criteria->compare('valor',$this->valor);

		$criteria->order = 'valor DESC';

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
	 * @return Rank the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function toList()
	{
		$model = self::model()->findAll();
		return CHtml::listData($model, 'id', 'ran');
	}

	public function get_aspirantes_ranking_list()
	{
		$model_aspirantes = Aspirantes::model()->findAll();
		$model_cargos = Cargos::model()->findAll();

		foreach ($model_aspirantes as $p) {
			foreach ($model_cargos as $j) {
				self::valuate_aspirantes_ranking($p->id, $j->id);
			}
		}
	}

	private function valuate_aspirantes_ranking($_aspirante_id, $_cargo_id)
	{
		$model = self::model()->find('aspirante_id = ? AND cargo_id = ?', array($_aspirante_id, $_cargo_id));

		if($model != null)
			self::edit_aspirante_ranking($model->id);
		else
			self::add_aspirante_ranking($_aspirante_id, $_cargo_id);
	}

	private function add_aspirante_ranking($_aspirante_id, $_cargo_id)
	{
		$model = new Rank;

		$model->aspirante_id = $_aspirante_id;
		$model->cargo_id = $_cargo_id;
		$model->valor = Aspirantes::get_calificacion_cargo($_aspirante_id, $_cargo_id);
		$model->save();
	}

	private function edit_aspirante_ranking($id)
	{
		$model = self::model()->findByPk($id);

		$model->valor = Aspirantes::get_calificacion_cargo($model->aspirante_id, $model->cargo_id);
		$model->save();
	}	
}
