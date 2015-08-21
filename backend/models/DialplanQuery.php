<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[Dialplan]].
 *
 * @see Dialplan
 */
class DialplanQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        $this->andWhere('[[status]]=1');
        return $this;
    }*/

    /**
     * @inheritdoc
     * @return Dialplan[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return Dialplan|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}