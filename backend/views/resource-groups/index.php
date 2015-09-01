<?php

use yii\helpers\Html;
use kartik\grid\GridView;
use yii\widgets\Pjax;

/**
 * @var yii\web\View $this
 * @var yii\data\ActiveDataProvider $dataProvider
 * @var app\models\ResourceGroupsSearch $searchModel
 */

$this->title = Yii::t('app', 'Resource Groups');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="resource-groups-index">
    <!--<div class="page-header">
            <h1><?= Html::encode($this->title) ?></h1>
    </div>-->
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?php /* echo Html::a(Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Resource Groups',
]), ['create'], ['class' => 'btn btn-success'])*/  ?>
    </p>

    <?php
        Pjax::begin();
        echo GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'columns' => [
                ['class' => 'yii\grid\SerialColumn'],
    //            'id',
                'name',
                'ani_dp_id',
                'dnis_dp_id',
                'max_concurrent',
                'max_cps',
    //            'use_rtpproxy',
    //            'rtp_proxy_set_id',
    //            'description',
    //            'do_lnp_dip',
    //            'do_sip_trace',
    //            'do_isup_oli',
    //            'blocked_olis',
    //            'fr_timer:datetime',
    //            'fr_inv_timer:datetime',
    //            'do_cname_dip',
    //            'prefered_codec',

                [
                    'class' => 'yii\grid\ActionColumn',
                    'buttons' => [
                    'update' => function ($url, $model) {
                        return Html::a('<span class="glyphicon glyphicon-pencil"></span>', Yii::$app->urlManager->createUrl(['resource-groups/view','id' => $model->id,'edit'=>'t']), [
                            'title' => Yii::t('yii', 'Edit'),
                        ]);}
                    ],
                ],
            ],
            'responsive'=>true,
            'hover'=>true,
            'condensed'=>true,
            'floatHeader'=>true,
            'panel' => [
                'heading'=>'<h3 class="panel-title"><i class="glyphicon glyphicon-th-list"></i> '.Html::encode($this->title).' </h3>',
                'type'=>'info',
                'before'=>Html::a('<i class="glyphicon glyphicon-plus"></i> Add', ['create'], ['class' => 'btn btn-success']),                                                                                                                                                          'after'=>Html::a('<i class="glyphicon glyphicon-repeat"></i> Reset List', ['index'], ['class' => 'btn btn-info']),
                'showFooter'=>false
            ],
        ]);
        Pjax::end();
    ?>

</div>
