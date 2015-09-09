<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "dr_carriers".
 *
 * @property integer $id
 * @property string $carrierid
 * @property string $gwlist
 * @property integer $flags
 * @property integer $state
 * @property string $attrs
 * @property string $description
 */
class DrCarriers extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'dr_carriers';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['carrierid', 'gwlist'], 'required'],
            [['flags', 'state'], 'integer'],
            [['carrierid'], 'string', 'max' => 64],
            [['gwlist', 'attrs'], 'string', 'max' => 255],
            [['description'], 'string', 'max' => 128],
            [['carrierid'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'carrierid' => 'Carrier Id',
            'gwlist' => 'Gateways List',
            'flags' => 'Flags',
            'state' => 'State',
            'attrs' => 'Attributes',
            'description' => 'Description',
        ];
    }
}
