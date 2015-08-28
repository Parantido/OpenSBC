<?php

use yii\helpers\Html;
use kartik\grid\GridView;
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

    <p>
        <?= Html::a(Yii::t('app', 'Create Customers'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php
        echo GridView::widget([
            'dataProvider'=> $dataProvider,
            'filterModel' => $searchModel,
            'columns' => $gridColumns,
            'responsive'=>true,
            'hover'=>true
        ]);
    ?>

    <?php
    /*
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
                    'valueColOptions' => ['style'=>'width:30%']
                ],
                [
                    'attribute' => 'lastname',
                    'format' => 'raw',
                    'value' => '<kbd>' .$model->lastname. '</kbd>',
                    'valueColOptions' => ['style'=>'width:30%']
                ],
            ],
        ],
        [
            'attribute' => 'status',
            'label' => 'Available?',
            'format' => 'raw',
            'value' => $model->status ?
                '<span class="label label-success">Yes</span>' :
                '<span class="label label-danger">No</span>',
            'type' => DetailView::INPUT_SWITCH,
            'widgetOptions' => [
                'pluginOptions' => [
                    'onText' => 'Yes',
                    'offText' => 'No',
                ]
            ]
        ],
    ];

    echo DetailView::widget([
        'model' => $model,
        'attributes' => $attributes,
        'deleteOptions' => [
            'params' => ['id' => $model->id, 'custom_param' => true],
        ],
    ]);
    */
    ?>

</div>
