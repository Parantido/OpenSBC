<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[MetaLocation]].
 *
 * @see MetaLocation
 */
class MetaLocationQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        $this->andWhere('[[status]]=1');
        return $this;
    }*/

    /**
     * @inheritdoc
     * @return MetaLocation[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return MetaLocation|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}