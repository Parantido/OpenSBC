<?php

use yii\helpers\Html;
use app\models\Domain;
use app\models\Customers;
use yii\helpers\ArrayHelper;
use kartik\detail\DetailView;
use kartik\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var app\models\DrGateways $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="dr-gateways-form">

    <?php
        $domains_list = ArrayHelper::map(Domain::find()->all(), 'id', 'domain');
        $customers_list = ArrayHelper::map(Customers::find()->all(), 'id', 'username');

        $formColumns = [
            'type' => ['attribute'=>'type', 'type'=> DetailView::INPUT_TEXT],
            'address' => ['attribute'=>'address', 'type'=> DetailView::INPUT_TEXT],
            'strip' => ['attribute'=>'strip', 'type'=> DetailView::INPUT_DROPDOWN_LIST],
            'cust_id' => ['attribute'=>'cust_id', 'items' => $customers_list, 'type'=> DetailView::INPUT_DROPDOWN_LIST],
            'pri_prefix' => ['attribute'=>'pri_prefix', 'type'=> DetailView::INPUT_TEXT],
            'attrs' => ['attribute'=>'attrs', 'type'=> DetailView::INPUT_TEXT],
            'probe_mode' => ['attribute'=>'probe_mode', 'type'=> DetailView::INPUT_TEXT],
            'state' => ['attribute'=>'state', 'type'=> DetailView::INPUT_TEXT],
            'socket' => ['attribute'=>'socket', 'type'=> DetailView::INPUT_TEXT],
            'description' => ['attribute'=>'description', 'type'=> DetailView::INPUT_TEXTAREA],
        ];


    $form = ActiveForm::begin([
        'type' => ActiveForm::TYPE_HORIZONTAL,
        'fullSpan' => 12,
    ]);

    echo DetailView::widget([
        'model' => $model,
        'condensed'=> true,
        'hover' => true,
        'mode' => DetailView::MODE_VIEW,
        'panel' => [
            'heading'=>'Customer # ' . $model->id,
            'type'=>DetailView::TYPE_INFO,
        ],
        'attributes' => $formColumns
    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']);
    ActiveForm::end(); ?>

</div>
