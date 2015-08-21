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
            'firstname' => Yii::t('app', 'Firstname'),
            'lastname' => Yii::t('app', 'Lastname'),
            'address1' => Yii::t('app', 'Address1'),
            'address2' => Yii::t('app', 'Address2'),
            'city' => Yii::t('app', 'City'),
            'country' => Yii::t('app', 'Country'),
            'province' => Yii::t('app', 'Province'),
            'state' => Yii::t('app', 'State'),
            'zip' => Yii::t('app', 'Zip'),
            'phone1' => Yii::t('app', 'Phone1'),
            'phone2' => Yii::t('app', 'Phone2'),
            'phone3' => Yii::t('app', 'Phone3'),
            'ptype1' => Yii::t('app', 'Ptype1'),
            'ptype2' => Yii::t('app', 'Ptype2'),
            'ptype3' => Yii::t('app', 'Ptype3'),
            'email' => Yii::t('app', 'Email'),
            'skypeid' => Yii::t('app', 'Skypeid'),
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
