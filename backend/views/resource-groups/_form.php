<?php

use yii\helpers\Html;
use kartik\builder\Form;
use kartik\detail\DetailView;
use kartik\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var app\models\ResourceGroups $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="resource-groups-form">

    <?php
        $formColumns = [
            'name' => ['attribute'=>'name', 'type'=> DetailView::INPUT_TEXT],
            'ani_dp_id' => ['attribute'=>'ani_dp_id', 'items' => [], 'type'=> DetailView::INPUT_DROPDOWN_LIST],
            'dnis_dp_id' => ['attribute'=>'dnis_dp_id', 'items' => [], 'type'=> DetailView::INPUT_DROPDOWN_LIST],
            'max_concurrent' => ['attribute'=>'max_concurrent', 'type'=> DetailView::INPUT_SLIDER, 'value'=>'0', 'widgetOptions' => [
                'pluginOptions' => [
                    'min' => 0,
                    'max' => 9999,
                    'step' => 1
                ],
            ]],
            'max_cps' => ['attribute'=>'max_cps', 'type'=> DetailView::INPUT_SLIDER, 'value'=>'0', 'widgetOptions' => [
                'pluginOptions' => [
                    'min' => 0,
                    'max' => 9999,
                    'step' => 1
                ],
            ]],
            'use_rtpproxy' => ['attribute'=>'use_rtpproxy', 'items' => $customers_list, 'type'=> DetailView::INPUT_CHECKBOX],
            'rtp_proxy_set_id' => ['attribute'=>'rtp_proxy_set_id', 'items' => [], 'type'=> DetailView::INPUT_CHECKBOX],
            'do_lnp_dip' => ['attribute'=>'do_lnp_dip', 'type'=> DetailView::INPUT_CHECKBOX],
            'do_sip_trace' => ['attribute'=>'do_sip_trace', 'type'=> DetailView::INPUT_CHECKBOX],
            'do_isup_oli' => ['attribute'=>'do_isup_oli', 'type'=> DetailView::INPUT_CHECKBOX],
            'do_cname_dip' => ['attribute'=>'do_cname_dip', 'type'=> DetailView::INPUT_CHECKBOX],
            'fr_timer' => ['attribute'=>'fr_timer', 'type'=> DetailView::INPUT_SLIDER, 'value'=>'0', 'widgetOptions' => [
                'pluginOptions' => [
                    'min' => 0,
                    'max' => 360,
                    'step' => 1
                ],
            ]],
            'fr_inv_timer' => ['attribute'=>'fr_inv_timer', 'type'=> DetailView::INPUT_SLIDER, 'value'=>'0', 'widgetOptions' => [
                'pluginOptions' => [
                    'min' => 0,
                    'max' => 120,
                    'step' => 1
                ],
            ]],
            'description' => ['attribute'=>'description', 'type'=> DetailView::INPUT_TEXTAREA],
        ];

        $form = ActiveForm::begin(['type'=>ActiveForm::TYPE_HORIZONTAL]);
        echo Form::widget([
            'model' => $model,
            'form' => $form,
            'columns' => 1,
            'attributes' => $formColumns,
        ]);

        echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']);
        ActiveForm::end();
    ?>

</div>
