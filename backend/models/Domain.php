<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "domain".
 *
 * @property integer $id
 * @property string $domain
 * @property string $last_modified
 *
 * @property Customers[] $customers
 */
class Domain extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'domain';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['last_modified'], 'filter', 'filter' => 'dateOnNull'],
            [['domain'], 'string', 'max' => 64],
            [['domain'], 'unique'],
        ];
    }

    /**
     * Return MySQL Date&Time on Null value
     * @param $value
     * @return null
     */
    function dateOnNull($value) {
        if($value === null)
            return date('Y-m-d H:i:s');

        return $value;
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'domain' => Yii::t('app', 'Domain'),
            'last_modified' => Yii::t('app', 'Latest Change'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCustomers()
    {
        return $this->hasMany(Customers::className(), ['domain_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return DomainQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new DomainQuery(get_called_class());
    }
}
