<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "dialog".
 *
 * @property string $dlg_id
 * @property string $callid
 * @property string $from_uri
 * @property string $from_tag
 * @property string $to_uri
 * @property string $to_tag
 * @property string $mangled_from_uri
 * @property string $mangled_to_uri
 * @property string $caller_cseq
 * @property string $callee_cseq
 * @property integer $caller_ping_cseq
 * @property integer $callee_ping_cseq
 * @property string $caller_route_set
 * @property string $callee_route_set
 * @property string $caller_contact
 * @property string $callee_contact
 * @property string $caller_sock
 * @property string $callee_sock
 * @property integer $state
 * @property integer $start_time
 * @property integer $timeout
 * @property resource $vars
 * @property string $profiles
 * @property integer $script_flags
 * @property integer $flags
 */
class Dialog extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'dialog';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['dlg_id', 'callid', 'from_uri', 'from_tag', 'to_uri', 'to_tag', 'caller_cseq', 'callee_cseq', 'caller_ping_cseq', 'callee_ping_cseq', 'caller_contact', 'callee_contact', 'caller_sock', 'callee_sock', 'state', 'start_time', 'timeout'], 'required'],
            [['dlg_id', 'caller_ping_cseq', 'callee_ping_cseq', 'state', 'start_time', 'timeout', 'script_flags', 'flags'], 'integer'],
            [['caller_route_set', 'callee_route_set', 'vars', 'profiles'], 'string'],
            [['callid'], 'string', 'max' => 255],
            [['from_uri', 'to_uri', 'caller_contact', 'callee_contact'], 'string', 'max' => 128],
            [['from_tag', 'to_tag', 'mangled_from_uri', 'mangled_to_uri', 'caller_sock', 'callee_sock'], 'string', 'max' => 64],
            [['caller_cseq', 'callee_cseq'], 'string', 'max' => 11]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'dlg_id' => Yii::t('app', 'Dlg ID'),
            'callid' => Yii::t('app', 'Callid'),
            'from_uri' => Yii::t('app', 'From Uri'),
            'from_tag' => Yii::t('app', 'From Tag'),
            'to_uri' => Yii::t('app', 'To Uri'),
            'to_tag' => Yii::t('app', 'To Tag'),
            'mangled_from_uri' => Yii::t('app', 'Mangled From Uri'),
            'mangled_to_uri' => Yii::t('app', 'Mangled To Uri'),
            'caller_cseq' => Yii::t('app', 'Caller Cseq'),
            'callee_cseq' => Yii::t('app', 'Callee Cseq'),
            'caller_ping_cseq' => Yii::t('app', 'Caller Ping Cseq'),
            'callee_ping_cseq' => Yii::t('app', 'Callee Ping Cseq'),
            'caller_route_set' => Yii::t('app', 'Caller Route Set'),
            'callee_route_set' => Yii::t('app', 'Callee Route Set'),
            'caller_contact' => Yii::t('app', 'Caller Contact'),
            'callee_contact' => Yii::t('app', 'Callee Contact'),
            'caller_sock' => Yii::t('app', 'Caller Sock'),
            'callee_sock' => Yii::t('app', 'Callee Sock'),
            'state' => Yii::t('app', 'State'),
            'start_time' => Yii::t('app', 'Start Time'),
            'timeout' => Yii::t('app', 'Timeout'),
            'vars' => Yii::t('app', 'Vars'),
            'profiles' => Yii::t('app', 'Profiles'),
            'script_flags' => Yii::t('app', 'Script Flags'),
            'flags' => Yii::t('app', 'Flags'),
        ];
    }

    /**
     * @inheritdoc
     * @return DialogQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new DialogQuery(get_called_class());
    }
}
