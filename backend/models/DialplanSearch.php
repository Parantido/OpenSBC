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
    public function rules()
    {
        return [
            [['id', 'dpid', 'pr', 'match_op', 'match_flags', 'disabled'], 'integer'],
            [['match_exp', 'subst_exp', 'repl_exp', 'attrs'], 'safe'],
        ];
    }

    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = Dialplan::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
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
