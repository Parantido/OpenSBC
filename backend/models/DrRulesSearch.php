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
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ruleid', 'priority'], 'integer'],
            [['groupid', 'prefix', 'timerec', 'routeid', 'gwlist', 'attrs', 'description'], 'safe'],
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
        $query = DrRules::find();

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
