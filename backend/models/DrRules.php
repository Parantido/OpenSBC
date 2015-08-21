<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "dr_rules".
 *
 * @property integer $ruleid
 * @property string $groupid
 * @property string $prefix
 * @property string $timerec
 * @property integer $priority
 * @property string $routeid
 * @property string $gwlist
 * @property string $attrs
 * @property string $description
 */
class DrRules extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'dr_rules';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['groupid', 'prefix', 'timerec', 'gwlist'], 'required'],
            [['priority'], 'integer'],
            [['groupid', 'timerec', 'routeid', 'gwlist', 'attrs'], 'string', 'max' => 255],
            [['prefix'], 'string', 'max' => 64],
            [['description'], 'string', 'max' => 128]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ruleid' => 'Ruleid',
            'groupid' => 'Groupid',
            'prefix' => 'Prefix',
            'timerec' => 'Timerec',
            'priority' => 'Priority',
            'routeid' => 'Routeid',
            'gwlist' => 'Gwlist',
            'attrs' => 'Attrs',
            'description' => 'Description',
        ];
    }
}
