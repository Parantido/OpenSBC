<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\MetaLocation;

/**
 * MetaLocationSearch represents the model behind the search form about `app\models\MetaLocation`.
 */
class MetaLocationSearch extends MetaLocation
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'in_location'], 'integer'],
            [['iso', 'local_name', 'type', 'db_id'], 'safe'],
            [['geo_lat', 'geo_lng'], 'number'],
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
        $query = MetaLocation::find();

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
            'in_location' => $this->in_location,
            'geo_lat' => $this->geo_lat,
            'geo_lng' => $this->geo_lng,
        ]);

        $query->andFilterWhere(['like', 'iso', $this->iso])
            ->andFilterWhere(['like', 'local_name', $this->local_name])
            ->andFilterWhere(['like', 'type', $this->type])
            ->andFilterWhere(['like', 'db_id', $this->db_id]);

        return $dataProvider;
    }
}
