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
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'flags', 'state'], 'integer'],
            [['carrierid', 'gwlist', 'attrs', 'description'], 'safe'],
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
        $query = DrCarriers::find();

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
