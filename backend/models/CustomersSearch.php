<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Customers;

/**
 * CustomersSearch represents the model behind the search form about `app\models\Customers`.
 */
class CustomersSearch extends Customers
{
    public function rules()
    {
        return [
            [['id', 'location', 'status', 'domain_id'], 'integer'],
            [['firstname', 'lastname', 'address1', 'address2', 'city', 'country', 'province', 'state', 'zip', 'phone1', 'phone2', 'phone3', 'ptype1', 'ptype2', 'ptype3', 'email', 'skypeid', 'notes', 'username', 'password'], 'safe'],
        ];
    }

    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = Customers::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'location' => $this->location,
            'status' => $this->status,
            'domain_id' => $this->domain_id,
        ]);

        $query->andFilterWhere(['like', 'firstname', $this->firstname])
            ->andFilterWhere(['like', 'lastname', $this->lastname])
            ->andFilterWhere(['like', 'address1', $this->address1])
            ->andFilterWhere(['like', 'address2', $this->address2])
            ->andFilterWhere(['like', 'city', $this->city])
            ->andFilterWhere(['like', 'country', $this->country])
            ->andFilterWhere(['like', 'province', $this->province])
            ->andFilterWhere(['like', 'state', $this->state])
            ->andFilterWhere(['like', 'zip', $this->zip])
            ->andFilterWhere(['like', 'phone1', $this->phone1])
            ->andFilterWhere(['like', 'phone2', $this->phone2])
            ->andFilterWhere(['like', 'phone3', $this->phone3])
            ->andFilterWhere(['like', 'ptype1', $this->ptype1])
            ->andFilterWhere(['like', 'ptype2', $this->ptype2])
            ->andFilterWhere(['like', 'ptype3', $this->ptype3])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'skypeid', $this->skypeid])
            ->andFilterWhere(['like', 'notes', $this->notes])
            ->andFilterWhere(['like', 'username', $this->username])
            ->andFilterWhere(['like', 'password', $this->password]);

        return $dataProvider;
    }
}
