<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "dialplan".
 *
 * @property integer $id
 * @property integer $dpid
 * @property integer $pr
 * @property integer $match_op
 * @property string $match_exp
 * @property integer $match_flags
 * @property string $subst_exp
 * @property string $repl_exp
 * @property integer $disabled
 * @property string $attrs
 */
class Dialplan extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'dialplan';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['dpid', 'pr', 'match_op', 'match_exp', 'match_flags', 'subst_exp', 'repl_exp', 'attrs'], 'required'],
            [['dpid', 'pr', 'match_op', 'match_flags', 'disabled'], 'integer'],
            [['match_exp', 'subst_exp'], 'string', 'max' => 64],
            [['repl_exp', 'attrs'], 'string', 'max' => 32]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'dpid' => 'Tenant',
            'pr' => 'Priority',
            'match_op' => 'Match Op.',
            'match_exp' => 'Match Exp.',
            'match_flags' => 'Match Flags',
            'subst_exp' => 'Subst Exp.',
            'repl_exp' => 'Repl Exp.',
            'disabled' => 'Disabled',
            'attrs' => 'Attributes',
        ];
    }
}
