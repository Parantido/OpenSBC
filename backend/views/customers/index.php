<?php

use yii\helpers\Html;
use kartik\detail\DetailView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\CustomersSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Customers');
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="customers-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?php
        $attributes = [
            [
                'group' => true,
                'label' => 'Customer Name',
                'rowOptions' => ['class' => 'info']
            ],
            [
                'columns' => [
                    [
                        'attribute' => 'firstname',
                        'format' => 'raw',
                        'value' => '<kbd>' .$model->firstname. '</kbd>',
                        'valueColOptions' => ['style'=>'width:30%'],
                        'displayOnly' => true
                    ],
                    [
                        'attribute' => 'lastname',
                        'format' => 'raw',
                        'value' => '<kbd>' .$model->lastname. '</kbd>',
                        'valueColOptions' => ['style'=>'width:30%'],
                        'displayOnly' => true
                    ],
                ],
            ],
        ];

        echo DetailView::widget([
            'model' => $model,
            'attributes' => $attributes,
            'deleteOptions' => [
                'params' => ['id' => $model->id, 'custom_param' => true],
            ],
        ]);
    ?>

</div>
