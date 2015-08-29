<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\DrCarriers;

/**
 * DrCarriersSearch represents the model behind the search form about `app\models\DrCarriers`.
 */
class DrCarriersSearch extends DrCarriers
{
    public function rules()
    {
        return [
            [['id', 'flags', 'state'], 'integer'],
            [['carrierid', 'gwlist', 'attrs', 'description'], 'safe'],
        ];
    }

    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = DrCarriers::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'flags' => $this->flags,
            'state' => $this->state,
        ]);

        $query->andFilterWhere(['like', 'carrierid', $this->carrierid])
            ->andFilterWhere(['like', 'gwlist', $this->gwlist])
            ->andFilterWhere(['like', 'attrs', $this->attrs])
            ->andFilterWhere(['like', 'description', $this->description]);

        return $dataProvider;
    }
}
