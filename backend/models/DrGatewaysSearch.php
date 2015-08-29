<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\DrGateways;

/**
 * DrGatewaysSearch represents the model behind the search form about `app\models\DrGateways`.
 */
class DrGatewaysSearch extends DrGateways
{
    public function rules()
    {
        return [
            [['id', 'type', 'strip', 'probe_mode', 'state'], 'integer'],
            [['gwid', 'address', 'pri_prefix', 'attrs', 'socket', 'description'], 'safe'],
        ];
    }

    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = DrGateways::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'type' => $this->type,
            'strip' => $this->strip,
            'probe_mode' => $this->probe_mode,
            'state' => $this->state,
        ]);

        $query->andFilterWhere(['like', 'gwid', $this->gwid])
            ->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'pri_prefix', $this->pri_prefix])
            ->andFilterWhere(['like', 'attrs', $this->attrs])
            ->andFilterWhere(['like', 'socket', $this->socket])
            ->andFilterWhere(['like', 'description', $this->description]);

        return $dataProvider;
    }
}
