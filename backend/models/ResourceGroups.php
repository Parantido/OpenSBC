<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "resource_groups".
 *
 * @property integer $id
 * @property string $name
 * @property integer $ani_dp_id
 * @property integer $dnis_dp_id
 * @property integer $max_concurrent
 * @property integer $max_cps
 * @property integer $use_rtpproxy
 * @property integer $rtp_proxy_set_id
 * @property string $description
 * @property integer $do_lnp_dip
 * @property integer $do_sip_trace
 * @property integer $do_isup_oli
 * @property string $blocked_olis
 * @property integer $fr_timer
 * @property integer $fr_inv_timer
 * @property integer $do_cname_dip
 * @property string $prefered_codec
 */
class ResourceGroups extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'resource_groups';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['ani_dp_id', 'dnis_dp_id', 'max_concurrent', 'max_cps', 'use_rtpproxy', 'rtp_proxy_set_id', 'do_lnp_dip', 'do_sip_trace', 'do_isup_oli', 'fr_timer', 'fr_inv_timer', 'do_cname_dip'], 'integer'],
            [['name', 'description'], 'string', 'max' => 128],
            [['blocked_olis'], 'string', 'max' => 300],
            [['prefered_codec'], 'string', 'max' => 32]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'ani_dp_id' => Yii::t('app', 'Ani Dp ID'),
            'dnis_dp_id' => Yii::t('app', 'Dnis Dp ID'),
            'max_concurrent' => Yii::t('app', 'Max Concurrent'),
            'max_cps' => Yii::t('app', 'Max Cps'),
            'use_rtpproxy' => Yii::t('app', 'Use Rtpproxy'),
            'rtp_proxy_set_id' => Yii::t('app', 'Rtp Proxy Set ID'),
            'description' => Yii::t('app', 'Description'),
            'do_lnp_dip' => Yii::t('app', 'Do Lnp Dip'),
            'do_sip_trace' => Yii::t('app', 'Do Sip Trace'),
            'do_isup_oli' => Yii::t('app', 'Do Isup Oli'),
            'blocked_olis' => Yii::t('app', 'Blocked Olis'),
            'fr_timer' => Yii::t('app', 'Fr Timer'),
            'fr_inv_timer' => Yii::t('app', 'Fr Inv Timer'),
            'do_cname_dip' => Yii::t('app', 'Do Cname Dip'),
            'prefered_codec' => Yii::t('app', 'Prefered Codec'),
        ];
    }

    /**
     * @inheritdoc
     * @return ResourceGroupsQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ResourceGroupsQuery(get_called_class());
    }
}
