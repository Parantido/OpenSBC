<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Dialog */

$this->title = $model->dlg_id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Dialogs'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dialog-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->dlg_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->dlg_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'dlg_id',
            'callid',
            'from_uri',
            'from_tag',
            'to_uri',
            'to_tag',
            'mangled_from_uri',
            'mangled_to_uri',
            'caller_cseq',
            'callee_cseq',
            'caller_ping_cseq',
            'callee_ping_cseq',
            'caller_route_set:ntext',
            'callee_route_set:ntext',
            'caller_contact',
            'callee_contact',
            'caller_sock',
            'callee_sock',
            'state',
            'start_time:datetime',
            'timeout:datetime',
            'vars',
            'profiles:ntext',
            'script_flags',
            'flags',
        ],
    ]) ?>

</div>
