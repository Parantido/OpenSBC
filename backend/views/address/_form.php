<?php

use yii\helpers\Html;
use kartik\form\ActiveForm;
use kartik\detail\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Address */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="address-form">
    <?php
        $inputStyle = "padding-left: 10px; padding-right: 10px; padding-top: 2px; padding-bottom: 10px;";

        $netmasks = array();
        for($i = 8; $i <= 32; $i++) array_push($netmasks, $i);

        // Define Form Widget Columns
        $formColumns = [
            'grp'=>['attribute'=>'grp', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'ip'=>['attribute'=>'ip', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'mask'=>['attribute'=>'mask', 'items' => $netmasks, 'type'=> DetailView::INPUT_DROPDOWN_LIST, 'inputContainer' => ['style' => $inputStyle]],
            'port'=>['attribute'=>'port', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'proto'=>['attribute'=>'proto', 'items' => ['udp', 'tcp'], 'type'=> DetailView::INPUT_DROPDOWN_LIST, 'inputContainer' => ['style' => $inputStyle]],
            'pattern'=>['attribute'=>'pattern', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle], 'value' => '^sip:.*$'],
            'context_info'=>['attribute'=>'context_info', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]]
        ];

        $form = ActiveForm::begin([
            'type' => ActiveForm::TYPE_HORIZONTAL,
            'fullSpan' => 12,
        ]);

        echo DetailView::widget([
            'model' => $model,
            'condensed'=> true,
            'hover' => true,
            'mode' => DetailView::MODE_EDIT,
            'panel' => [
                'heading'=>'Trusted Host # ' .$model->ip. ":" .$model->port,
                'type'=>DetailView::TYPE_INFO,
            ],
            'attributes' => $formColumns
        ]);

        echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']);
        ActiveForm::end();
    ?>

</div>
