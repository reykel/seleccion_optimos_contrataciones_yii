<?php

/**
 * This is the model class for table "cruge_fieldvalue".
 *
 * The followings are the available columns in table 'cruge_fieldvalue':
 * @property integer $idfieldvalue
 * @property integer $iduser
 * @property integer $idfield
 * @property string $value
 *
 * The followings are the available model relations:
 * @property CrugeField $idfield0
 * @property CrugeUser $iduser0
 */
class Cruge_Fieldvalue extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'cruge_fieldvalue';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('iduser, idfield', 'required'),
			array('iduser, idfield', 'numerical', 'integerOnly'=>true),
			array('value', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('idfieldvalue, iduser, idfield, value', 'safe', 'on'=>'search'),
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
			'CrugeField' => array(self::BELONGS_TO, 'CrugeField', 'idfield'),
			'CrugeUser' => array(self::BELONGS_TO, 'CrugeUser', 'iduser'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'idfieldvalue' => 'Idfieldvalue',
			'iduser' => 'Iduser',
			'idfield' => 'Idfield',
			'value' => 'Value',
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

		$criteria->compare('idfieldvalue',$this->idfieldvalue);
		$criteria->compare('iduser', Yii::app()->user->id);
		$criteria->compare('idfield', 4);
		$criteria->compare('value',$this->value,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return CrugeFieldvalue the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function reportesToList()
	{
		$model = array(
			array('codigo'=>1, 'descripcion'=>'Formato Web'),
			array('codigo'=>2, 'descripcion'=>'Formato CSV'),
			array('codigo'=>3, 'descripcion'=>'Formato Word'),
			array('codigo'=>4, 'descripcion'=>'Formato Excel'),
			array('codigo'=>5, 'descripcion'=>'Formato pdf'),
		);

		return CHtml::listData($model, 'codigo', 'descripcion');
	}

	public function get_reporte_value()
	{
		$model = Cruge_Fieldvalue::model()->find('iduser = ? AND idfield = ?', array(Yii::app()->user->id, 4));

		if($model != null)
			return $model->value;
		else
			return 1;
	}

	public function get_format_extension($_key)
	{
		$_extensiones[0]= "html";
		$_extensiones[1]= "csv";
		$_extensiones[2]= "doc";
		$_extensiones[3]= "xls";
		$_extensiones[4]= "pdf";

		return $_extensiones[$_key - 1];
	}

	private function edit_default_establecimiento($_establecimiento)
	{
		$model = self::model()->find('iduser = ? AND idfield = ?', array(Yii::app()->user->id, 5));

		$model->value = $_establecimiento;
		$model->save();
	}

	private function add_default_establecimiento($_establecimiento)
	{
		$model = new self;

		$model->iduser = Yii::app()->user->id;
		$model->idfield = 5;
		$model->value = $_establecimiento;
		$model->save();
	}

	public function set_default_establecimiento($_establecimiento)
	{
		$model = self::model()->find('iduser = ? AND idfield = ?', array(Yii::app()->user->id, 5));
		
		if($model != null)
			self::edit_default_establecimiento($_establecimiento);
		else
			self::add_default_establecimiento($_establecimiento);
	}

	public function get_default_establecimiento()
	{
		$model = self::model()->find('iduser = ? AND idfield = ?', array(Yii::app()->user->id, 5));
		
		if($model != null)
			return $model->value;
		else
			return Establecimientos::get_default_establecimiento();
	}

	public function get_scope($_array_data)
	{
		$_criterios = array(
				'_establecimiento'=> $_array_data[3] > 0 ? $_array_data[3] : '',
				'_distrito'=> $_array_data[2] > 0 ? $_array_data[2] : '',
				'_municipio'=> $_array_data[1] > 0 ? $_array_data[1] : '',
				'_ueb'=> $_array_data[0] > 0 ? $_array_data[0] : '',
			);
		return $_criterios;
	}

    public function sendEmail($from, $to, $subject, $body)
    {
        $from = $from;

		$cc = '';
		$bcc='';
		$reply='';

		if($cc != '')
			$cc = 'Cc: '.$cc."\r\n";
		
		if($bcc != '') 
			$bcc = 'Bcc: '.$bcc."\r\n";

        $_subject = $subject;

        $headers = "To: {$to}\r\nFrom: {$from}\r\n";
		$headers .= $reply;
		$headers .= $cc;
		$headers .= $bcc;
        $headers .= "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type: text/html; charset=utf-8" . "\r\n";

        $ret = @mail($to, $_subject, $body, $headers);

        $tmp = "to:".$to."\nsubject:".$_subject."\nheaders:\n".$headers."\nbody:".$body."\n";

        Yii::log(__METHOD__."\nreturns:".$ret."\n".$tmp,"email");

        return $ret;
    }

    public function normalize_nombres($nombre)
    {
		return	str_replace(" ", "", $nombre);
    }
}
