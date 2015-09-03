<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "dr_gateways".
 *
 * @property integer $id
 * @property string $gwid
 * @property integer $cust_id
 * @property integer $type
 * @property string $address
 * @property integer $strip
 * @property string $pri_prefix
 * @property string $attrs
 * @property integer $probe_mode
 * @property integer $state
 * @property string $socket
 * @property string $description
 *
 * @property CustomersGatewaysRel $customersGatewaysRel
 * @property Customers $cust
 */
class DrGateways extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'dr_gateways';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cust_id', 'address'], 'required'],
            [['cust_id', 'type', 'strip', 'probe_mode', 'state'], 'integer'],
            [['gwid'], 'string', 'max' => 64],
            [['address', 'socket', 'description'], 'string', 'max' => 128],
            [['pri_prefix'], 'string', 'max' => 16],
            [['attrs'], 'string', 'max' => 255],
            [['gwid'], 'unique'],
            [['address'], 'ipPortValidate']
        ];
    }

    public function ipPortValidate($attribute) {
        if (!preg_match(
            '/\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)
            (?::
              (?![7-9]\d\d\d\d) #Ignrore anything above 7....
              (?!6[6-9]\d\d\d)  #Ignore anything abovr 69...
              (?!65[6-9]\d\d)   #etc...
              (?!655[4-9]\d)
              (?!6553[6-9])
              (?!0+)            #ignore complete 0(s)
              (?P<Port>\d{1,5})
            )?\b/x', $attribute)
        ) {
            $this->addError($attribute, Yii::t('user', 'Invalid address entered.'));
        }
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'gwid' => Yii::t('app', 'Gwid'),
            'cust_id' => Yii::t('app', 'Customer'),
            'type' => Yii::t('app', 'Type'),
            'address' => Yii::t('app', 'Gw Address'),
            'strip' => Yii::t('app', 'Strip'),
            'pri_prefix' => Yii::t('app', 'Prefix'),
            'attrs' => Yii::t('app', 'Attributes'),
            'probe_mode' => Yii::t('app', 'Probeing Mode'),
            'state' => Yii::t('app', 'State'),
            'socket' => Yii::t('app', 'Socket'),
            'description' => Yii::t('app', 'Description'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCustomersGatewaysRel()
    {
        return $this->hasOne(CustomersGatewaysRel::className(), ['dr_gw_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCust()
    {
        return $this->hasOne(Customers::className(), ['id' => 'cust_id']);
    }

    /**
     * @inheritdoc
     * @return DrGatewaysQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new DrGatewaysQuery(get_called_class());
    }
}
