<?php

/**
 * This is the model class for table "cruge_session".
 *
 * The followings are the available columns in table 'cruge_session':
 * @property integer $idsession
 * @property integer $iduser
 * @property string $created
 * @property string $expire
 * @property integer $status
 * @property string $ipaddress
 * @property integer $usagecount
 * @property string $lastusage
 * @property string $logoutdate
 * @property string $ipaddressout
 */
class CrugePersonalSession extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'cruge_session';
	}

	public function attributeLabels()
	{
		return array(
			'idsession' => 'Idsession',
			'iduser' => 'Iduser',
			'created' => 'Creación',
			'expire' => 'Expiración',
			'status' => 'Estado',
			'ipaddress' => 'Dirección IP',
			'lastusage' => 'Ultimo uso',
			'logoutdate' => 'Fecha cerrada',
		);
	}

	public function search()
	{
		$criteria=new CDbCriteria;

		$criteria->compare('idsession',$this->idsession);
		$criteria->compare('iduser', Yii::app()->user->id);
		$criteria->compare('created',$this->created,true);
		$criteria->compare('expire',$this->expire,true);
		$criteria->compare('status',$this->status);
		$criteria->compare('ipaddress',$this->ipaddress,true);
		$criteria->compare('usagecount',$this->usagecount);
		$criteria->compare('lastusage',$this->lastusage,true);
		$criteria->compare('logoutdate',$this->logoutdate,true);
		$criteria->compare('ipaddressout',$this->ipaddressout,true);

		$criteria->order = 'idsession DESC';

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
