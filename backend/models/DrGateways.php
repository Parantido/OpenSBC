<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "dr_gateways".
 *
 * @property integer $id
 * @property string $gwid
 * @property integer $type
 * @property string $address
 * @property integer $strip
 * @property string $pri_prefix
 * @property string $attrs
 * @property integer $probe_mode
 * @property integer $state
 * @property string $socket
 * @property string $description
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
            [['gwid', 'address'], 'required'],
            [['type', 'strip', 'probe_mode', 'state'], 'integer'],
            [['gwid'], 'string', 'max' => 64],
            [['address', 'socket', 'description'], 'string', 'max' => 128],
            [['pri_prefix'], 'string', 'max' => 16],
            [['attrs'], 'string', 'max' => 255],
            [['gwid'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'gwid' => 'Gwid',
            'type' => 'Type',
            'address' => 'Address',
            'strip' => 'Strip',
            'pri_prefix' => 'Pri Prefix',
            'attrs' => 'Attrs',
            'probe_mode' => 'Probe Mode',
            'state' => 'State',
            'socket' => 'Socket',
            'description' => 'Description',
        ];
    }
}
