<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\DrGatewaysSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Dr Gateways');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dr-gateways-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Dr Gateways'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'gwid',
            'type',
            'address',
            'strip',
            // 'pri_prefix',
            // 'attrs',
            // 'probe_mode',
            // 'state',
            // 'socket',
            // 'description',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
