<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "countries".
 *
 * @property integer $countries_id
 * @property string $name
 * @property integer $countries_type
 * @property integer $parent_id
 * @property integer $is_visible
 */
class Countries extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'countries';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'countries_type', 'parent_id', 'is_visible'], 'required'],
            [['countries_type', 'parent_id', 'is_visible'], 'integer'],
            [['name'], 'string', 'max' => 30]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'countries_id' => Yii::t('app', 'Countries ID'),
            'name' => Yii::t('app', 'Name'),
            'countries_type' => Yii::t('app', 'Countries Type'),
            'parent_id' => Yii::t('app', 'Parent ID'),
            'is_visible' => Yii::t('app', 'Is Visible'),
        ];
    }

    /**
     * @inheritdoc
     * @return CountriesQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new CountriesQuery(get_called_class());
    }
}
