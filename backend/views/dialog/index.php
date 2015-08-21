<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\DialogSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Dialogs');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dialog-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Dialog'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'dlg_id',
            'callid',
            'from_uri',
            'from_tag',
            'to_uri',
            // 'to_tag',
            // 'mangled_from_uri',
            // 'mangled_to_uri',
            // 'caller_cseq',
            // 'callee_cseq',
            // 'caller_ping_cseq',
            // 'callee_ping_cseq',
            // 'caller_route_set:ntext',
            // 'callee_route_set:ntext',
            // 'caller_contact',
            // 'callee_contact',
            // 'caller_sock',
            // 'callee_sock',
            // 'state',
            // 'start_time:datetime',
            // 'timeout:datetime',
            // 'vars',
            // 'profiles:ntext',
            // 'script_flags',
            // 'flags',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
