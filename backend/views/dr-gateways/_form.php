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
        echo "Cazzo passo: " .Yii::$app->request->get('edit'). ".";

        $domains_list = ArrayHelper::map(Domain::find()->all(), 'id', 'domain');
        $customers_list = ArrayHelper::map(Customers::find()->all(), 'id', 'username');

        $formColumns = [
            'type' => ['attribute'=>'type', 'items' => [1, 3, 13], 'type'=> DetailView::INPUT_TEXT],
            'address' => ['attribute'=>'address', 'type'=> DetailView::INPUT_TEXT],
            'strip' => ['attribute'=>'strip', 'type'=> DetailView::INPUT_SLIDER, 'value'=>'0', 'widgetOptions' => [
                'pluginOptions' => [
                    'min' => 0,
                    'max' => 15,
                    'step' => 1
                ],
            ]],
            'cust_id' => ['attribute'=>'cust_id', 'items' => $customers_list, 'type'=> DetailView::INPUT_DROPDOWN_LIST],
            'pri_prefix' => ['attribute'=>'pri_prefix', 'type'=> DetailView::INPUT_TEXT],
            'attrs' => ['attribute'=>'attrs', 'type'=> DetailView::INPUT_TEXT],
            'probe_mode' => ['attribute'=>'probe_mode', 'items' => [0, 1, 2], 'type'=> DetailView::INPUT_DROPDOWN_LIST],
            'state' => ['attribute'=>'state', 'type'=> DetailView::INPUT_TEXT],
            'socket' => ['attribute'=>'socket', 'type'=> DetailView::INPUT_TEXT],
            'description' => ['attribute'=>'description', 'type'=> DetailView::INPUT_TEXTAREA],
        ];

        $form = ActiveForm::begin([
            'type' => ActiveForm::TYPE_HORIZONTAL,
        ]);

        echo DetailView::widget([
            'model' => $model,
            'bootstrap' => true,
            'condensed' => false,
            'hover' => true,
            'mode' => DetailView::MODE_EDIT,
            'panel' => [
                'heading'=>'Gateway # ' . $model->address,
                'type' => DetailView::TYPE_INFO,
            ],
            'attributes' => $formColumns,
            'enableEditMode' => true,
        ]);

        echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']);
        ActiveForm::end();
    ?>

</div>
