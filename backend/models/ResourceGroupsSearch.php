<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\ResourceGroups;

/**
 * ResourceGroupsSearch represents the model behind the search form about `app\models\ResourceGroups`.
 */
class ResourceGroupsSearch extends ResourceGroups
{
    public function rules()
    {
        return [
            [['id', 'ani_dp_id', 'dnis_dp_id', 'max_concurrent', 'max_cps', 'use_rtpproxy', 'rtp_proxy_set_id', 'do_lnp_dip', 'do_sip_trace', 'do_isup_oli', 'fr_timer', 'fr_inv_timer', 'do_cname_dip'], 'integer'],
            [['name', 'description', 'blocked_olis', 'prefered_codec'], 'safe'],
        ];
    }

    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = ResourceGroups::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'ani_dp_id' => $this->ani_dp_id,
            'dnis_dp_id' => $this->dnis_dp_id,
            'max_concurrent' => $this->max_concurrent,
            'max_cps' => $this->max_cps,
            'use_rtpproxy' => $this->use_rtpproxy,
            'rtp_proxy_set_id' => $this->rtp_proxy_set_id,
            'do_lnp_dip' => $this->do_lnp_dip,
            'do_sip_trace' => $this->do_sip_trace,
            'do_isup_oli' => $this->do_isup_oli,
            'fr_timer' => $this->fr_timer,
            'fr_inv_timer' => $this->fr_inv_timer,
            'do_cname_dip' => $this->do_cname_dip,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'blocked_olis', $this->blocked_olis])
            ->andFilterWhere(['like', 'prefered_codec', $this->prefered_codec]);

        return $dataProvider;
    }
}
