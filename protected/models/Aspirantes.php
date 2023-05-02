<?php

/**
 * This is the model class for table "tbl_aspirantes".
 *
 * The followings are the available columns in table 'tbl_aspirantes':
 * @property integer $id
 * @property string $ci
 * @property string $nombre_apellidos
 * @property string $direccion
 * @property string $sexo
 * @property string $nivel_escolar
 * @property string $foto
 * @property string $egresado_especialidad
 * @property string $categoria_academica
 * @property string $grado_cientifico
 *
 * The followings are the available model relations:
 * @property Capacitaciones[] $Capacitaciones
 * @property Certificaciones[] $Certificaciones
 * @property Ocupaciones[] $Ocupaciones
 */
class Aspirantes extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public $date_first_fecha;
	public $date_last_fecha;

	public function tableName()
	{
		return 'tbl_aspirantes';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('ci, nombre_apellidos, direccion, sexo, nivel_escolar, egresado_especialidad, categoria_academica, grado_cientifico, fecha_solicitud, fuente_id, color_piel', 'required'),
			array('ci, nombre_apellidos, direccion, sexo, nivel_escolar, foto, egresado_especialidad, categoria_academica, grado_cientifico, fecha_solicitud, color_piel, mail, phone, estado_civil, integracion, procesado, en_solicitud_activa, cargo_en_curso, estado, fecha_aprobacion', 'length', 'max'=>255),
			array('documentos_requeridos', 'numerical', 'integerOnly'=>true),
			array('importe', 'numerical'),			
			array('mail', 'email'),
			array('ci', 'unique'),
			array('ci', 'length', 'min'=>11, 'max'=>11),
			array('ci', 'match' ,
        		'pattern'=> '/^[0-9]+$/u',
        		'message'=> 'El CI solo puede contener caracteres numéricos'
    		),
			array('id, ci, nombre_apellidos, direccion, sexo, nivel_escolar, foto, egresado_especialidad, categoria_academica, grado_cientifico, fecha_solicitud, date_first_fecha, date_last_fecha, fuente_id, sancion_laboral, familiares_ecsm, color_piel, mail, phone, estado_civil, integracion, procesado, en_solicitud_activa, documentos_requeridos, importe, cargo_en_curso, estado, fecha_aprobacion', 'safe', 'on'=>'search'),
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
			'Capacitaciones' => array(self::HAS_MANY, 'Capacitaciones', 'aspirante_id'),
			'Certificaciones' => array(self::HAS_MANY, 'Certificaciones', 'aspirante_id'),
			'Ocupaciones' => array(self::HAS_MANY, 'Ocupaciones', 'aspirante_id'),
			'AspirantePrioridades' => array(self::HAS_MANY, 'AspirantePrioridades', 'aspirante_id'),
			'Idiomas' => array(self::HAS_MANY, 'Idiomas', 'aspirante_id'),
			'Fuentes' => array(self::BELONGS_TO, 'Fuentes', 'fuente_id'),
			'Puntajes' => array(self::HAS_MANY, 'Puntajes', 'aspirante_id'),			
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'Folio',
			'ci' => 'CI',
			'nombre_apellidos' => 'Nombre y Apellidos',
			'direccion' => 'Dirección',
			'sexo' => 'Sexo',
			'nivel_escolar' => 'Nivel Escolar',
			'foto' => 'Foto',
			'egresado_especialidad' => 'Egresado Especialidad',
			'categoria_academica' => 'Categoria Académica',
			'grado_cientifico' => 'Grado Cientifíco',
			'fecha_solicitud' => 'Fecha de solicitud',
			'date_first_fecha'=> 'Desde',
			'date_last_fecha'=> 'Hasta',
			'fuente_id'=>'Fuente',
			'sancion_laboral'=>'Sanción laboral',
			'familiares_ecsm'=>'Familiares ECSM',
			'color_piel'=>'Color de la piel',
			'mail'=>'Correo electrónico',
			'phone'=>'Teléfono',
			'integracion'=>'Integración',
			'documentos_requeridos'=>'Documentos requeridos',
			'cargo_en_curso'=>'Cargo',			
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
	public function search($_estado=0)
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		if((isset($this->date_first_fecha) && trim($this->date_first_fecha) != "") && (isset($this->date_last_fecha) && trim($this->date_last_fecha) != ""))
	 		$criteria->addBetweenCondition('fecha_solicitud', ''.$this->date_first_fecha.'', ''.$this->date_last_fecha.'');		

		$criteria->compare('id',$this->id);
		$criteria->compare('ci',$this->ci,true);
		$criteria->compare('nombre_apellidos',$this->nombre_apellidos,true);
		$criteria->compare('direccion',$this->direccion,true);
		$criteria->compare('sexo',$this->sexo,true);
		$criteria->compare('nivel_escolar',$this->nivel_escolar,true);
		$criteria->compare('foto',$this->foto,true);
		$criteria->compare('egresado_especialidad',$this->egresado_especialidad,true);
		$criteria->compare('categoria_academica',$this->categoria_academica,true);
		$criteria->compare('grado_cientifico',$this->grado_cientifico,true);
		$criteria->compare('fuente_id',$this->fuente_id,true);
		$criteria->compare('sancion_laboral',$this->sancion_laboral,true);
		$criteria->compare('familiares_ecsm',$this->familiares_ecsm,true);
		$criteria->compare('color_piel',$this->color_piel,true);
		$criteria->compare('mail',$this->mail,true);
		$criteria->compare('phone',$this->phone,true);
		$criteria->compare('estado_civil',$this->estado_civil,true);
		$criteria->compare('integracion',$this->integracion,true);
		$criteria->compare('documentos_requeridos',$this->documentos_requeridos);
		$criteria->compare('en_solicitud_activa', "SI");

		if(Yii::app()->user->um->getFieldValue(Yii::app()->user->id,"area") == '0-0-0-0'){
			$criteria->compare('procesado', $_estado == -1 ? "NO" : "SI" );
		}else{
			$criteria->compare('procesado', "NO");
		}

		$criteria->order = 'id DESC';

		$_SESSION['datos_filtrados'] = new CActiveDataProvider($this, array(
                        'criteria'=>$criteria,
                        'pagination'=>false,));

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}


	public function search_procesados()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		if((isset($this->date_first_fecha) && trim($this->date_first_fecha) != "") && (isset($this->date_last_fecha) && trim($this->date_last_fecha) != ""))
	 		$criteria->addBetweenCondition('fecha_solicitud', ''.$this->date_first_fecha.'', ''.$this->date_last_fecha.'');		

		$criteria->compare('id',$this->id);
		$criteria->compare('ci',$this->ci,true);
		$criteria->compare('nombre_apellidos',$this->nombre_apellidos,true);
		$criteria->compare('direccion',$this->direccion,true);
		$criteria->compare('sexo',$this->sexo,true);
		$criteria->compare('nivel_escolar',$this->nivel_escolar,true);
		$criteria->compare('foto',$this->foto,true);
		$criteria->compare('egresado_especialidad',$this->egresado_especialidad,true);
		$criteria->compare('categoria_academica',$this->categoria_academica,true);
		$criteria->compare('grado_cientifico',$this->grado_cientifico,true);
		$criteria->compare('fuente_id',$this->fuente_id,true);
		$criteria->compare('sancion_laboral',$this->sancion_laboral,true);
		$criteria->compare('familiares_ecsm',$this->familiares_ecsm,true);
		$criteria->compare('color_piel',$this->color_piel,true);
		$criteria->compare('mail',$this->mail,true);
		$criteria->compare('phone',$this->phone,true);
		$criteria->compare('estado_civil',$this->estado_civil,true);
		$criteria->compare('integracion',$this->integracion,true);
		$criteria->compare('documentos_requeridos',$this->documentos_requeridos);
		$criteria->compare('en_solicitud_activa', "NO");		

		$criteria->compare('cargo_en_curso',$this->cargo_en_curso,true);
		$criteria->compare('estado',$this->estado);

		$criteria->order = 'id DESC';

		$_SESSION['datos_filtrados'] = new CActiveDataProvider($this, array(
                        'criteria'=>$criteria,
                        'pagination'=>false,));

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	public function search_descartes()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		if((isset($this->date_first_fecha) && trim($this->date_first_fecha) != "") && (isset($this->date_last_fecha) && trim($this->date_last_fecha) != ""))
	 		$criteria->addBetweenCondition('fecha_solicitud', ''.$this->date_first_fecha.'', ''.$this->date_last_fecha.'');		

		$criteria->compare('id',$this->id);
		$criteria->compare('ci',$this->ci,true);
		$criteria->compare('nombre_apellidos',$this->nombre_apellidos,true);
		$criteria->compare('direccion',$this->direccion,true);
		$criteria->compare('sexo',$this->sexo,true);
		$criteria->compare('nivel_escolar',$this->nivel_escolar,true);
		$criteria->compare('foto',$this->foto,true);
		$criteria->compare('egresado_especialidad',$this->egresado_especialidad,true);
		$criteria->compare('categoria_academica',$this->categoria_academica,true);
		$criteria->compare('grado_cientifico',$this->grado_cientifico,true);
		$criteria->compare('fuente_id',$this->fuente_id,true);
		$criteria->compare('sancion_laboral',$this->sancion_laboral,true);
		$criteria->compare('familiares_ecsm',$this->familiares_ecsm,true);
		$criteria->compare('color_piel',$this->color_piel,true);
		$criteria->compare('mail',$this->mail,true);
		$criteria->compare('phone',$this->phone,true);
		$criteria->compare('estado_civil',$this->estado_civil,true);
		$criteria->compare('integracion',$this->integracion,true);
		$criteria->compare('documentos_requeridos',$this->documentos_requeridos);
		$criteria->compare('en_solicitud_activa', "DESCARTADO");		

		$criteria->compare('cargo_en_curso',$this->cargo_en_curso,true);
		$criteria->compare('estado',$this->estado);

		$criteria->order = 'id DESC';

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
	 * @return Aspirantes the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function toList()
	{
		$model = self::model()->findAll();
		return CHtml::listData($model, 'id', 'nombre_apellidos');
	}

	public function sexoList()
	{
		$model = array(
			array('id'=>'Masculino', 'value'=>'Masculino'),
			array('id'=>'Femenino', 'value'=>'Femenino'),
		);
		return CHtml::listData($model,'id','value');
	}

	public function nivelList()
	{
		$model = array(
			array('id'=>'Obrero calificado', 'value'=>'Obrero calificado'),
			array('id'=>'Técnico Medio', 'value'=>'Técnico Medio'),
			array('id'=>'Preuniversitario', 'value'=>'Preuniversitario'),
			array('id'=>'Universitario', 'value'=>'Universitario'),			
		);
		return CHtml::listData($model,'id','value');
	}

	public function categoriaList()
	{
		$model = array(
			array('id'=>'Sin categorizar', 'value'=>'Sin categorizar'),
			array('id'=>'Instructor', 'value'=>'Instructor'),
			array('id'=>'Asistente', 'value'=>'Asistente'),
			array('id'=>'P. Auxiliar', 'value'=>'P. Auxiliar'),
			array('id'=>'P. Titular', 'value'=>'P. Titular'),			
		);
		return CHtml::listData($model,'id','value');
	}

	public function gradoList()
	{
		$model = array(
			array('id'=>'No determinado', 'value'=>'No determinado'),
			array('id'=>'Doctor', 'value'=>'Doctor'),
			array('id'=>'Master', 'value'=>'Master'),
			array('id'=>'Especialista', 'value'=>'Especialista'),
		);
		return CHtml::listData($model,'id','value');
	}

	public function booleanList()
	{
		$model = array(
			array('id'=>'NO', 'value'=>'NO'),
			array('id'=>'SI', 'value'=>'SI'),
		);
		return CHtml::listData($model,'id','value');
	}

	public function get_calificacion_cargo($_aspirante_id, $_cargo_id)
	{
		return Capacitaciones::get_rate($_aspirante_id, $_cargo_id) + Certificaciones::get_rate($_aspirante_id, $_cargo_id) + Ocupaciones::get_rate($_aspirante_id, $_cargo_id) + AspirantePrioridades::get_rate($_aspirante_id) + self::get_rank($_aspirante_id);
	}

	public function get_rank($_aspirante_id)
	{
		$model = self::model()->findByPk($_aspirante_id);

		//egresado_especialidad, 

		if($model != null)
			return self::get_grado_rank($model->grado_cientifico) + self::get_categoria_rank($model->categoria_academica) + self::get_nivel_rank($model->nivel_escolar) + self::get_fuente_rank($model->fuente_id) + self::get_rank_familiares($model->id) + self::get_rank_sancion($model->id) + Idiomas::get_score($model->id) + self::get_valor_grupo_etario(self::get_edad($model->ci));
		else
			return 0;
	}

	public function get_grado_rank($_valor)
	{
		$_ranking = array();

		$_ranking['No determinado'] = 0;
		$_ranking['Doctor'] = Clasificador::get_valor('Doctor');
		$_ranking['Master'] = Clasificador::get_valor('Master');
		$_ranking['Especialista'] = Clasificador::get_valor('Especialista');

		return $_ranking[$_valor];
	}

	public function get_categoria_rank($_valor)
	{
		$_ranking = array();

		$_ranking['Sin categorizar'] = 0;
		$_ranking['Instructor'] = Clasificador::get_valor('Instructor');
		$_ranking['Asistente'] = Clasificador::get_valor('Asistente');
		$_ranking['P. Auxiliar'] = Clasificador::get_valor('P. Auxiliar');
		$_ranking['P. Titular'] = Clasificador::get_valor('P. Titular');

		return $_ranking[$_valor];
	}

	public function get_nivel_rank($_valor)
	{
		$_ranking = array();

		$_ranking['Obrero calificado'] = Clasificador::get_valor('Obrero calificado');
		$_ranking['Técnico Medio'] = Clasificador::get_valor('Técnico Medio');
		$_ranking['Preuniversitario'] = Clasificador::get_valor('Preuniversitario');
		$_ranking['Universitario'] = Clasificador::get_valor('Universitario');

		return $_ranking[$_valor];
	}

	public function get_fuente_rank($_valor)
	{
		$model = Fuentes::model()->findByPk($_valor);

		if($model->categoria_fuente == "Interna")
			return 0.02;
		else
			return 0.01;			
	}

	public function get_rank_sancion($_aspirante_id)
	{
		$model = self::model()->findByPk($_aspirante_id);

		if($model != null)
			if($model->sancion_laboral == "SI")
				return 0;
			else
				return 0.01;				
		else
			return 0;
	}

	public function get_rank_familiares($_aspirante_id)
	{
		$model = self::model()->findByPk($_aspirante_id);

		if($model != null)
			if($model->familiares_ecsm == "SI")
				return 0.01;
			else
				return 0;				
		else
			return 0;
	}

	public function colorList()
	{
		$model = array(
			array('id'=>'Blanco', 'value'=>'Blanco'),
			array('id'=>'Negro', 'value'=>'Negro'),
			array('id'=>'Mestizo', 'value'=>'Mestizo'),			
		);
		return CHtml::listData($model,'id','value');
	}	

	public static function get_edad($_CI)
	{
		if(substr($_CI, 0, 2) == "00")
			return ((int) date("Y")) - ((int) "20" . substr($_CI, 0, 2)) - self::get_birth_plus($_CI);
		else
			return ((int) date("Y")) - ((int) "19" . substr($_CI, 0, 2)) - self::get_birth_plus($_CI);		
	}

	private static function get_birth_plus($_CI)
	{
		if(((int) date("m").date("d")) >=  ((int) substr($_CI, 2, 4)))
			return 0;
		else
			return 1;
	}

	public function get_valor_grupo_etario($_edad)
	{
		$_nivel = array();

		$id = self::get_grupo_etario($_edad);

		$_nivel[1] = 0.5;
		$_nivel[2] = 0.4;
		$_nivel[3] = 0.3;
		$_nivel[4] = 0.2;
		$_nivel[5] = 0.1;
		$_nivel[6] = 0.0;

		return $_nivel[$id];
	}

	private function get_grupo_etario($_edad)
	{
		if($_edad < 26)
			return 1;
		elseif ($_edad < 36)
			return 2;
		elseif ($_edad < 46)
			return 3;
		elseif ($_edad < 56)
			return 4;
		elseif ($_edad < 66)
			return 5;
		else
			return 6;			
	}

	public function topList()
	{
		$model = array(
			array('id'=>'5', 'value'=>'5'),
			array('id'=>'10', 'value'=>'10'),
			array('id'=>'15', 'value'=>'15'),
			array('id'=>'20', 'value'=>'20'),
			array('id'=>'25', 'value'=>'25'),
			array('id'=>'30', 'value'=>'30'),
			array('id'=>'50', 'value'=>'50'),
			array('id'=>'100', 'value'=>'100'),
			array('id'=>'500', 'value'=>'500'),

		);
		return CHtml::listData($model,'id','value');
	}

	public function estado_civil_List()
	{
		$model = array(
			array('id'=>'Soltero(a)', 'value'=>'Soltero(a)'),
			array('id'=>'Casado(a)', 'value'=>'Casado(a)'),
			array('id'=>'Divorciado(a)', 'value'=>'Divorciado(a)'),
			array('id'=>'Viudo(a)', 'value'=>'Viudo(a)'),
		);
		return CHtml::listData($model,'id','value');
	}

	public function relevancia_list()
	{
		$model = array(
			array('id'=>'0', 'value'=>'Opcional'),
			array('id'=>'-1', 'value'=>'Requerido'),
		);
		return CHtml::listData($model,'id','value');
	}

	public function get_aspirante($id)
	{
		$model = Aspirantes::model()->findByPk($id);
		return $model->nombre_apellidos;
	}

	public function switch_disponibilidad($id, $_estado)
	{
		$model = Aspirantes::model()->findByPk($id);
		$model->en_solicitud_activa = $_estado;
		$model->cargo_en_curso =  Cargos::get_cargo_descripcion(Preselecciones::get_cargo_id(Puntajes::get_preseleccion_id($model->id)));
		$model->estado = "Prueba";
		$model->fecha_aprobacion = date('Y-m-d');
		$model->save();
	}

	public function es_disponible($id)
	{
		$model = Aspirantes::model()->findByPk($id);
		return $model->en_solicitud_activa;
	}	

	public function get_procesado($id)
	{
		$model = Aspirantes::model()->findByPk($id);
		return $model->procesado;
	}

	public function documentsToPrintList()
	{
		$model = array(
			array('id'=>'0', 'value'=>'0'),
			array('id'=>'1', 'value'=>'1'),
			array('id'=>'2', 'value'=>'2'),
			array('id'=>'3', 'value'=>'3'),			
			array('id'=>'4', 'value'=>'4'),			
			array('id'=>'5', 'value'=>'5'),			
			array('id'=>'6', 'value'=>'6'),
		);
		return CHtml::listData($model,'id','value');
	}

	public static function TotalImporte($provider)
	{
    	$total=0;

    	$provider->pagination = false;

    	foreach($provider->data as $item)
        	$total+=$item->importe;
    	return number_format($total, 2, '.', '');
	}

	public function get_importeJornada($_fecha)
	{
    	$total=0;

		$criteria=new CDbCriteria;

	 	$criteria->compare('fecha_solicitud', $_fecha);

	 	$model = self::model()->findAll($criteria);

    	foreach($model as $item)
        	$total+=$item->importe;

    	return number_format($total, 2, '.', '');	 	
	}

	public static function TotalImporteGeneral($provider)
	{
    	$total=0;

    	foreach($provider as $item)
        	$total+=$item->importe;
    	return number_format($total, 2, '.', '');
	}
	
	public function estadolist()
	{
		$model = array(
			array('id'=>'Prueba', 'value'=>'Prueba'),
			array('id'=>'Activo', 'value'=>'Activo'),
		);
		return CHtml::listData($model,'id','value');
	}

	public function get_meses($_estado, $_fecha_inicio)
	{
		$fechainicial = new DateTime($_fecha_inicio);
		$fechafinal = new DateTime(date('Y-m-d'));

		$diferencia = $fechainicial->diff($fechafinal);
		$meses = ( $diferencia->y * 12 ) + $diferencia->m;

		if($_estado == "Prueba")
			return $_estado." por ".$meses.($meses == 1 ? " mes " : " meses ");
		else
			return $_estado;			
	}
}