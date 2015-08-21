<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Address;

/**
 * AddressSearch represents the model behind the search form about `app\models\Address`.
 */
class AddressSearch extends Address
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'grp', 'mask', 'port'], 'integer'],
            [['ip', 'proto', 'pattern', 'context_info'], 'safe'],
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
        $query = Address::find();

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
            'grp' => $this->grp,
            'mask' => $this->mask,
            'port' => $this->port,
        ]);

        $query->andFilterWhere(['like', 'ip', $this->ip])
            ->andFilterWhere(['like', 'proto', $this->proto])
            ->andFilterWhere(['like', 'pattern', $this->pattern])
            ->andFilterWhere(['like', 'context_info', $this->context_info]);

        return $dataProvider;
    }
}
