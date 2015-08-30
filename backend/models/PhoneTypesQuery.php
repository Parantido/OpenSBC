<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[PhoneTypes]].
 *
 * @see PhoneTypes
 */
class PhoneTypesQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        $this->andWhere('[[status]]=1');
        return $this;
    }*/

    /**
     * @inheritdoc
     * @return PhoneTypes[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return PhoneTypes|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}