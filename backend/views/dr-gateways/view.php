<?php

use yii\helpers\Html;
use kartik\detail\DetailView;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var app\models\DrGateways $model
 */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Dr Gateways'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dr-gateways-view">
    <div class="page-header">
        <h1><?= Html::encode($this->title) ?></h1>
    </div>


    <?= DetailView::widget([
            'model' => $model,
            'condensed'=>false,
            'hover'=>true,
            'mode'=>Yii::$app->request->get('edit')=='t' ? DetailView::MODE_EDIT : DetailView::MODE_VIEW,
            'panel'=>[
            'heading'=>$this->title,
            'type'=>DetailView::TYPE_INFO,
        ],
        'attributes' => [
            'id',
            'gwid',
            'cust_id',
            'type',
            'address',
            'strip',
            'pri_prefix',
            'attrs',
            'probe_mode',
            'state',
            'socket',
            'description',
        ],
        'deleteOptions'=>[
        'url'=>['delete', 'id' => $model->id],
        'data'=>[
        'confirm'=>Yii::t('app', 'Are you sure you want to delete this item?'),
        'method'=>'post',
        ],
        ],
        'enableEditMode'=>true,
    ]) ?>

</div>
