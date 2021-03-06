<?php

use yii\helpers\Html;
use app\models\DrGateways;
use yii\helpers\ArrayHelper;
use kartik\detail\DetailView;

/**
 * @var yii\web\View $this
 * @var app\models\DrCarriers $model
 */

$this->title = $model->carrierid;
$this->params['breadcrumbs'][] = ['label' => 'Carriers', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dr-carriers-view">
    <!--<div class="page-header">
        <h1><?= Html::encode($this->title) ?></h1>
    </div>-->

    <?php
        $inputStyle = "padding-left: 10px; padding-right: 10px; padding-top: 2px; padding-bottom: 2px;";

        $gateways_list = ArrayHelper::map(DrGateways::find()->all(), 'id', 'address');

        $detailViewColumns = [
            'carrierid'=>['attribute'=>'carrierid', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'gwlist'=>['attribute'=>'gwlist', 'items' => $gateways_list, 'type'=> DetailView::INPUT_DROPDOWN_LIST, 'inputContainer' => ['style' => $inputStyle]],
            'flags'=>['attribute'=>'flags', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'state'=>['attribute'=>'state', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'attrs'=>['attribute'=>'attrs', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'description'=>['attribute'=>'description', 'type'=> DetailView::INPUT_TEXTAREA, 'inputContainer' => ['style' => $inputStyle]],
        ];

        echo DetailView::widget([
            'model' => $model,
            'condensed'=>false,
            'hover'=>true,
            'mode'=>Yii::$app->request->get('edit')=='t' ? DetailView::MODE_EDIT : DetailView::MODE_VIEW,
            'panel'=>[
                'heading'=>$this->title,
                'type'=>DetailView::TYPE_INFO,
            ],
            'attributes' => $detailViewColumns,
            'deleteOptions'=>[
                'url'=>['delete', 'id' => $model->id],
                'data'=>[
                    'confirm'=>Yii::t('app', 'Are you sure you want to delete this item?'),
                    'method'=>'post',
                ],
            ],
            'enableEditMode'=>true,
        ]);
    ?>

</div>
