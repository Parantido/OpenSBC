<?php

use yii\helpers\Html;
use kartik\detail\DetailView;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var app\models\Domain $model
 */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Domains', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="domain-view">
    <div class="page-header">
        <h1><?= Html::encode($this->title) ?></h1>
    </div>

    <?php
        $inputStyle = "padding-left: 10px; padding-right: 10px; padding-top: 2px; padding-bottom: 10px;";
    
        $detailViewColumns = [
            'domain'=>['attribute'=>'grp', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'last_modified'=>['attribute'=>'ip', 'type'=> DetailView::INPUT_DATETIME, 'inputContainer' => ['style' => $inputStyle]],
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
        ])
    ?>

</div>
