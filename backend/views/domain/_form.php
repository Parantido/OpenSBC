<?php

use yii\helpers\Html;
use kartik\form\ActiveForm;
use kartik\detail\DetailView;

/**
 * @var yii\web\View $this
 * @var app\models\Domain $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="domain-form">

    <?php
        $inputStyle = "padding-left: 10px; padding-right: 10px; padding-top: 2px; padding-bottom: 10px;";

        // Define Form Widget Columns
        $formColumns = [
            'domain'=>['attribute'=>'grp', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'last_modified'=>['attribute'=>'ip', 'type'=> DetailView::INPUT_DATETIME, 'inputContainer' => ['style' => $inputStyle]],
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
                'heading'=>'Domain # ' .$model->domain,
                'type'=>DetailView::TYPE_INFO,
            ],
            'attributes' => $formColumns
        ]);

        //echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']);

        ActiveForm::end();
    ?>

</div>
