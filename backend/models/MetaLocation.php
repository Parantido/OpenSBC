<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "meta_location".
 *
 * @property integer $id
 * @property string $iso
 * @property string $local_name
 * @property string $type
 * @property integer $in_location
 * @property double $geo_lat
 * @property double $geo_lng
 * @property string $db_id
 */
class MetaLocation extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'meta_location';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['in_location'], 'integer'],
            [['geo_lat', 'geo_lng'], 'number'],
            [['iso', 'db_id'], 'string', 'max' => 50],
            [['local_name'], 'string', 'max' => 255],
            [['type'], 'string', 'max' => 2]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'iso' => Yii::t('app', 'Iso'),
            'local_name' => Yii::t('app', 'Local Name'),
            'type' => Yii::t('app', 'Type'),
            'in_location' => Yii::t('app', 'In Location'),
            'geo_lat' => Yii::t('app', 'Geo Lat'),
            'geo_lng' => Yii::t('app', 'Geo Lng'),
            'db_id' => Yii::t('app', 'Db ID'),
        ];
    }

    /**
     * @inheritdoc
     * @return MetaLocationQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new MetaLocationQuery(get_called_class());
    }
}
