<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[DrGateways]].
 *
 * @see DrGateways
 */
class DrGatewaysQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        $this->andWhere('[[status]]=1');
        return $this;
    }*/

    /**
     * @inheritdoc
     * @return DrGateways[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return DrGateways|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}