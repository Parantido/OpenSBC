<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Dialplan;

/**
 * DialplanSearch represents the model behind the search form about `app\models\Dialplan`.
 */
class DialplanSearch extends Dialplan
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'dpid', 'pr', 'match_op', 'match_flags', 'disabled'], 'integer'],
            [['match_exp', 'subst_exp', 'repl_exp', 'attrs'], 'safe'],
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
        $query = Dialplan::find();

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
            'dpid' => $this->dpid,
            'pr' => $this->pr,
            'match_op' => $this->match_op,
            'match_flags' => $this->match_flags,
            'disabled' => $this->disabled,
        ]);

        $query->andFilterWhere(['like', 'match_exp', $this->match_exp])
            ->andFilterWhere(['like', 'subst_exp', $this->subst_exp])
            ->andFilterWhere(['like', 'repl_exp', $this->repl_exp])
            ->andFilterWhere(['like', 'attrs', $this->attrs]);

        return $dataProvider;
    }
}
