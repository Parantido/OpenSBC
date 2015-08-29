<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\DrRules;

/**
 * DrRulesSearch represents the model behind the search form about `app\models\DrRules`.
 */
class DrRulesSearch extends DrRules
{
    public function rules()
    {
        return [
            [['ruleid', 'priority'], 'integer'],
            [['groupid', 'prefix', 'timerec', 'routeid', 'gwlist', 'attrs', 'description'], 'safe'],
        ];
    }

    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = DrRules::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'ruleid' => $this->ruleid,
            'priority' => $this->priority,
        ]);

        $query->andFilterWhere(['like', 'groupid', $this->groupid])
            ->andFilterWhere(['like', 'prefix', $this->prefix])
            ->andFilterWhere(['like', 'timerec', $this->timerec])
            ->andFilterWhere(['like', 'routeid', $this->routeid])
            ->andFilterWhere(['like', 'gwlist', $this->gwlist])
            ->andFilterWhere(['like', 'attrs', $this->attrs])
            ->andFilterWhere(['like', 'description', $this->description]);

        return $dataProvider;
    }
}
