<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "address".
 *
 * @property integer $id
 * @property integer $grp
 * @property string $ip
 * @property integer $mask
 * @property integer $port
 * @property string $proto
 * @property string $pattern
 * @property string $context_info
 */
class Address extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'address';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['grp', 'mask', 'port'], 'integer'],
            [['ip'], 'required'],
            [['ip'], 'string', 'max' => 50],
            [['proto'], 'string', 'max' => 4],
            [['pattern'], 'string', 'max' => 64],
            [['context_info'], 'string', 'max' => 32]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'grp' => 'Group',
            'ip' => 'IP',
            'mask' => 'Netmask',
            'port' => 'Port',
            'proto' => 'Protocol',
            'pattern' => 'Match Pattern',
            'context_info' => 'Context Info',
        ];
    }
}
