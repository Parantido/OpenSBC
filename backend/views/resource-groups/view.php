<?php

use yii\helpers\Html;
use kartik\detail\DetailView;

/**
 * @var yii\web\View $this
 * @var app\models\ResourceGroups $model
 */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Resource Groups'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="resource-groups-view">
    <!--<div class="page-header">
        <h1><?= Html::encode($this->title) ?></h1>
    </div>-->

    <?php
        $detailViewColumns = [
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

        echo DetailView::widget([
            'model' => $model,
            'bootstrap' => true,
            'condensed' => false,
            'hover' => true,
            'mode' => Yii::$app->request->get('edit')=='t' ? DetailView::MODE_EDIT : DetailView::MODE_VIEW,
            'panel' => [
                'heading' => $this->title,
                'type' => DetailView::TYPE_INFO,
            ],
            'attributes' => $detailViewColumns,
            'deleteOptions' => [
                'url' => ['delete', 'id' => $model->id],
                'data' => [
                    'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                    'method' => 'post',
                ],
            ],
            'enableEditMode' => true,
        ])
    ?>

</div>
