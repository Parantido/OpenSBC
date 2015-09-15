<?php

use app\models\Domain;
use app\models\Customers;
use yii\widgets\MaskedInput;
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

        $inputStyle = "padding-left: 10px; padding-right: 10px; padding-top: 2px; padding-bottom: 10px;";

        $formColumns = [
            'type' => ['attribute'=>'type', 'items' => [1, 3, 13], 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'address' => ['attribute'=>'address', 'type'=> DetailView::INPUT_WIDGET, 'widgetOptions'=> [
                'class' => MaskedInput::classname(),
                'options' => [ 'mask' => '([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3}):([0-9]{1,5})' ],
            ], 'inputContainer' => ['style' => $inputStyle]],
            'strip' => ['attribute'=>'strip', 'type'=> DetailView::INPUT_SLIDER, 'widgetOptions' => [
                'pluginOptions' => [
                    'min' => 0,
                    'max' => 15,
                    'step' => 1
                ],
            ], 'inputContainer' => ['style' => $inputStyle]],
            'cust_id' => ['attribute'=>'cust_id', 'items' => $customers_list, 'type'=> DetailView::INPUT_DROPDOWN_LIST, 'inputContainer' => ['style' => $inputStyle]],
            'pri_prefix' => ['attribute'=>'pri_prefix', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'attrs' => ['attribute'=>'attrs', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'probe_mode' => ['attribute'=>'probe_mode', 'items' => [0, 1, 2], 'type'=> DetailView::INPUT_DROPDOWN_LIST, 'inputContainer' => ['style' => $inputStyle]],
            'state' => ['attribute'=>'state', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'socket' => ['attribute'=>'socket', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'description' => ['attribute'=>'description', 'type'=> DetailView::INPUT_TEXTAREA, 'inputContainer' => ['style' => $inputStyle]],
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

        //echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']);
        ActiveForm::end();
    ?>

</div>
