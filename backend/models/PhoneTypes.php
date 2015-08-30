<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "phone_types".
 *
 * @property integer $1
 * @property string $type
 * @property string $regex
 */
class PhoneTypes extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'phone_types';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['type', 'regex'], 'required'],
            [['type'], 'string', 'max' => 64],
            [['regex'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            '1' => Yii::t('app', '1'),
            'type' => Yii::t('app', 'Type'),
            'regex' => Yii::t('app', 'Regex'),
        ];
    }

    /**
     * @inheritdoc
     * @return PhoneTypesQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new PhoneTypesQuery(get_called_class());
    }
}
