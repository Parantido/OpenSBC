<?php

use yii\helpers\Html;
use app\models\Domain;
use app\models\Customers;
use yii\helpers\ArrayHelper;
use kartik\detail\DetailView;

/**
 * @var yii\web\View $this
 * @var app\models\DrGateways $model
 */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Gateways', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dr-gateways-view">
    <!--<div class="page-header">
        <h1><?= Html::encode($this->title) ?></h1>
    </div>-->

    <?php
        $domains_list = ArrayHelper::map(Domain::find()->all(), 'id', 'domain');
        $customers_list = ArrayHelper::map(Customers::find()->all(), 'id', 'username');

        $detailViewColumns = [
            'type' => ['attribute'=>'type', 'type'=> DetailView::INPUT_TEXT],
            'address' => ['attribute'=>'address', 'type'=> DetailView::INPUT_TEXT],
            'strip' => ['attribute'=>'strip', 'type'=> DetailView::INPUT_SLIDER, 'widgetOptions' => [
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
