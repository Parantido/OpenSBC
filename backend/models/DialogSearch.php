<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Dialog;

/**
 * DialogSearch represents the model behind the search form about `app\models\Dialog`.
 */
class DialogSearch extends Dialog
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['dlg_id', 'caller_ping_cseq', 'callee_ping_cseq', 'state', 'start_time', 'timeout', 'script_flags', 'flags'], 'integer'],
            [['callid', 'from_uri', 'from_tag', 'to_uri', 'to_tag', 'mangled_from_uri', 'mangled_to_uri', 'caller_cseq', 'callee_cseq', 'caller_route_set', 'callee_route_set', 'caller_contact', 'callee_contact', 'caller_sock', 'callee_sock', 'vars', 'profiles'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Dialog::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'dlg_id' => $this->dlg_id,
            'caller_ping_cseq' => $this->caller_ping_cseq,
            'callee_ping_cseq' => $this->callee_ping_cseq,
            'state' => $this->state,
            'start_time' => $this->start_time,
            'timeout' => $this->timeout,
            'script_flags' => $this->script_flags,
            'flags' => $this->flags,
        ]);

        $query->andFilterWhere(['like', 'callid', $this->callid])
            ->andFilterWhere(['like', 'from_uri', $this->from_uri])
            ->andFilterWhere(['like', 'from_tag', $this->from_tag])
            ->andFilterWhere(['like', 'to_uri', $this->to_uri])
            ->andFilterWhere(['like', 'to_tag', $this->to_tag])
            ->andFilterWhere(['like', 'mangled_from_uri', $this->mangled_from_uri])
            ->andFilterWhere(['like', 'mangled_to_uri', $this->mangled_to_uri])
            ->andFilterWhere(['like', 'caller_cseq', $this->caller_cseq])
            ->andFilterWhere(['like', 'callee_cseq', $this->callee_cseq])
            ->andFilterWhere(['like', 'caller_route_set', $this->caller_route_set])
            ->andFilterWhere(['like', 'callee_route_set', $this->callee_route_set])
            ->andFilterWhere(['like', 'caller_contact', $this->caller_contact])
            ->andFilterWhere(['like', 'callee_contact', $this->callee_contact])
            ->andFilterWhere(['like', 'caller_sock', $this->caller_sock])
            ->andFilterWhere(['like', 'callee_sock', $this->callee_sock])
            ->andFilterWhere(['like', 'vars', $this->vars])
            ->andFilterWhere(['like', 'profiles', $this->profiles]);

        return $dataProvider;
    }
}
