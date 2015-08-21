<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\User;

/**
 * UserSearch represents the model behind the search form about `app\models\User`.
 */
class UserSearch extends User
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'role_id', 'status'], 'integer'],
            [['email', 'new_email', 'username', 'password', 'auth_key', 'api_key', 'login_ip', 'login_time', 'create_ip', 'create_time', 'update_time', 'ban_time', 'ban_reason'], 'safe'],
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
        $query = User::find();

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
            'role_id' => $this->role_id,
            'status' => $this->status,
            'login_time' => $this->login_time,
            'create_time' => $this->create_time,
            'update_time' => $this->update_time,
            'ban_time' => $this->ban_time,
        ]);

        $query->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'new_email', $this->new_email])
            ->andFilterWhere(['like', 'username', $this->username])
            ->andFilterWhere(['like', 'password', $this->password])
            ->andFilterWhere(['like', 'auth_key', $this->auth_key])
            ->andFilterWhere(['like', 'api_key', $this->api_key])
            ->andFilterWhere(['like', 'login_ip', $this->login_ip])
            ->andFilterWhere(['like', 'create_ip', $this->create_ip])
            ->andFilterWhere(['like', 'ban_reason', $this->ban_reason]);

        return $dataProvider;
    }
}
