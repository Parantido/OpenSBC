<?php

use yii\helpers\Html;
use yii\grid\GridView;

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

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            //'id',
            'firstname',
            'lastname',
            'address1',
            // 'address2',
            // 'city',
            // 'country',
            // 'province',
            // 'state',
            // 'zip',
            'phone1',
            // 'phone2',
            // 'phone3',
            // 'ptype1',
            // 'ptype2',
            // 'ptype3',
            'email:email',
            // 'skypeid',
            // 'location',
            // 'notes:ntext',
            'username',
            'password',
            // 'status',
            // 'domain_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

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

    echo \kartik\detail\DetailView::widget([
        'model' => $model,
        'attributes' => $attributes,
        'deleteOptions' => [
            'params' => ['id' => $model->id, 'custom_param' => true],
        ],
    ]);
    ?>

</div>
