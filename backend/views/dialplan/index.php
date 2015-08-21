<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\DialplanSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Dialplans');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dialplan-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Dialplan'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'dpid',
            'pr',
            'match_op',
            'match_exp',
            // 'match_flags',
            // 'subst_exp',
            // 'repl_exp',
            // 'disabled',
            // 'attrs',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
