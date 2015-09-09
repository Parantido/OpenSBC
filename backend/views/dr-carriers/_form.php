<?php

use yii\helpers\Html;
use kartik\form\ActiveForm;
use kartik\detail\DetailView;

/**
 * @var yii\web\View $this
 * @var app\models\DrCarriers $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="dr-carriers-form">

    <?php
        $inputStyle = "padding-left: 20px; padding-right: 20px; padding-top: 2px; padding-bottom: 10px;";

        // Define Form Widget Columns
        $formColumns = [
            'carrierid'=>['attribute'=>'carrierid', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'gwlist'=>['attribute'=>'gwlist', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'flags'=>['attribute'=>'flags', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'state'=>['attribute'=>'state', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'attrs'=>['attribute'=>'attrs', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'description'=>['attribute'=>'description', 'type'=> DetailView::INPUT_TEXTAREA, 'inputContainer' => ['style' => $inputStyle]],
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
                'heading'=>'Domain # ' .$model->carrierid,
                'type'=>DetailView::TYPE_INFO,
            ],
            'attributes' => $formColumns
        ]);

        //echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']);

        ActiveForm::end();
    ?>

</div>
