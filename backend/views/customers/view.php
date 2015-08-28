<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Customers */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Customers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="customers-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            //'id',
            'firstname',
            'lastname',
            'address1',
            'address2',
            'city',
            'country',
            'province',
            'state',
            'zip',
            'phone1',
            'phone2',
            'phone3',
            'ptype1',
            'ptype2',
            'ptype3',
            'email:email',
            'skypeid',
            'location',
            'notes:ntext',
            'username',
            'password',
            'status',
            'domain_id',
        ],
    ]) ?>

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
