<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "customers".
 *
 * @property integer $id
 * @property string $firstname
 * @property string $lastname
 * @property string $address1
 * @property string $address2
 * @property string $city
 * @property string $country
 * @property string $province
 * @property string $state
 * @property string $zip
 * @property string $phone1
 * @property string $phone2
 * @property string $phone3
 * @property string $ptype1
 * @property string $ptype2
 * @property string $ptype3
 * @property string $email
 * @property string $skypeid
 * @property integer $location
 * @property string $notes
 * @property string $username
 * @property string $password
 * @property integer $status
 * @property integer $domain_id
 */
class Customers extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'customers';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['location', 'status', 'domain_id'], 'integer'],
            [['notes'], 'string'],
            [['firstname', 'lastname', 'city', 'state', 'phone1', 'phone2', 'phone3', 'ptype1', 'ptype2', 'ptype3', 'email', 'username'], 'string', 'max' => 50],
            [['address1', 'address2'], 'string', 'max' => 200],
            [['country', 'province', 'skypeid', 'password'], 'string', 'max' => 255],
            [['username', 'password', 'firstname', 'lastname'], 'required'],
            [['zip'], 'string', 'max' => 12]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'firstname' => Yii::t('app', 'First Name'),
            'lastname' => Yii::t('app', 'Last Name'),
            'address1' => Yii::t('app', '1st Address'),
            'address2' => Yii::t('app', '2nd Address'),
            'city' => Yii::t('app', 'City'),
            'country' => Yii::t('app', 'Country'),
            'province' => Yii::t('app', 'Province'),
            'state' => Yii::t('app', 'State'),
            'zip' => Yii::t('app', 'Zip'),
            'phone1' => Yii::t('app', '1st Phone'),
            'phone2' => Yii::t('app', '2nd Phone'),
            'phone3' => Yii::t('app', '3rd Phone'),
            'ptype1' => Yii::t('app', '1st Phone Type'),
            'ptype2' => Yii::t('app', '2nd Phone Type'),
            'ptype3' => Yii::t('app', '3rd Phone Type'),
            'email' => Yii::t('app', 'Email'),
            'skypeid' => Yii::t('app', 'Skype Id'),
            'location' => Yii::t('app', 'Location'),
            'notes' => Yii::t('app', 'Notes'),
            'username' => Yii::t('app', 'Username'),
            'password' => Yii::t('app', 'Password'),
            'status' => Yii::t('app', 'Status'),
            'domain_id' => Yii::t('app', 'Domain ID'),
        ];
    }

    /**
     * @inheritdoc
     * @return CustomersQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new CustomersQuery(get_called_class());
    }
}
