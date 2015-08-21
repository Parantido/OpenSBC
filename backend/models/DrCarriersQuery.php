<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[DrCarriers]].
 *
 * @see DrCarriers
 */
class DrCarriersQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        $this->andWhere('[[status]]=1');
        return $this;
    }*/

    /**
     * @inheritdoc
     * @return DrCarriers[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return DrCarriers|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}