<?php

use yii\helpers\Html;
use app\models\Domain;
use yii\helpers\ArrayHelper;
use kartik\detail\DetailView;
use kartik\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var app\models\Dialplan $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="dialplan-form">

    <?php

        $domains_list = ArrayHelper::map(Domain::find()->all(), 'id', 'domain');

        $inputStyle = "padding-left: 20px; padding-right: 20px; padding-top: 2px; padding-bottom: 10px;";

        $formColumns = [
            'dpid' => ['attribute'=>'dpid', 'items' => $domains_list, 'type'=> DetailView::INPUT_DROPDOWN_LIST, 'inputContainer' => ['style' => $inputStyle]],
            'disabled' => ['attribute'=>'disabled', 'type'=> DetailView::INPUT_CHECKBOX, 'inputContainer' => ['style' => $inputStyle]],
            'pr' => ['attribute'=>'pr', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'match_op' => ['attribute'=>'match_op', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'match_exp' => ['attribute'=>'match_exp', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'match_flags' => ['attribute'=>'match_flags', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'subst_exp' => ['attribute'=>'subst_exp', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'repl_exp' => ['attribute'=>'repl_exp', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'attrs' => ['attribute'=>'attrs', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
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
                'heading'=>'Routing Rule # ' . $model->ruleid,
                'type' => DetailView::TYPE_INFO,
            ],
            'attributes' => $formColumns,
            'enableEditMode' => true,
        ]);

        echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']);
        ActiveForm::end();

    ?>

</div>
