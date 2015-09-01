<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[ResourceGroups]].
 *
 * @see ResourceGroups
 */
class ResourceGroupsQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        $this->andWhere('[[status]]=1');
        return $this;
    }*/

    /**
     * @inheritdoc
     * @return ResourceGroups[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return ResourceGroups|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}