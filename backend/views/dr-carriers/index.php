<?php

use yii\helpers\Html;
use yii\widgets\Pjax;
use kartik\grid\GridView;

/**
 * @var yii\web\View $this
 * @var yii\data\ActiveDataProvider $dataProvider
 * @var app\models\DrCarriersSearch $searchModel
 */

$this->title = 'Carriers';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dr-carriers-index">
    <!--<div class="page-header">
            <h1><?= Html::encode($this->title) ?></h1>
    </div>-->

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?php
        Pjax::begin();
        echo GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'columns' => [
                ['class' => 'yii\grid\SerialColumn'],
                'carrierid',
                'gwlist',
                'flags',
                'state',
                [
                    'class' => 'yii\grid\ActionColumn',
                    'template' => '{update}',
                    'buttons' => [
                    'update' => function ($url, $model) {
                            return Html::a('<span class="glyphicon glyphicon-pencil"></span>', Yii::$app->urlManager->createUrl(['dr-carriers/view','id' => $model->id,'edit'=>'t']), [
                                'title' => Yii::t('yii', 'Edit'),
                            ]);
                        }
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
                'before'=>Html::a('<i class="glyphicon glyphicon-plus"></i> Add', ['create'], ['class' => 'btn btn-success']),
                'after'=>Html::a('<i class="glyphicon glyphicon-repeat"></i> Reset List', ['index'], ['class' => 'btn btn-info']),
                'showFooter'=>false
            ],
        ]);
        Pjax::end();
    ?>

</div>
