<?php

use yii\helpers\Html;
use yii\bootstrap\Modal;
use kartik\dynagrid\DynaGrid;

/* @var $this yii\web\View */
/* @var $searchModel app\models\CustomersSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Customers');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="customers-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?php
        // http://demos.krajee.com/detail-view
        /*Modal::begin([
            'header' => '<h4 class="modal-title">Detail View Demo</h4>',
            'toggleButton' => ['label' => '<i class="glyphicon glyphicon-th-list"></i> Detail View in Modal', 'class' => 'btn btn-primary']
        ]);
        echo DetailView::widget($settings); // refer the demo page for widget settings
        Modal::end();*/

        // Define Columns to show
        $columns = [
            ['class' => 'yii\grid\SerialColumn'],
            'firstname',
            'lastname',
            'address1',
            'phone1',
            'email:email',
            'username',
            'password',
            // 'domain_id',
            [
                'class' => 'kartik\grid\ActionColumn',
                'urlCreator'    => function($action, $model, $key, $index) {

                    /*switch($action) {
                        case 'view':
                            break;

                        case 'update':
                            break;

                        case 'delete':
                            break;
                    }*/

                    return Html::a('<span class="glyphicon glyphicon-eye-open"></span>','#', [
                        'id' => 'activity-view-link',
                        'title' => Yii::t('yii', 'View'),
                        'data-toggle' => 'modal',
                        'data-target' => '#activity-modal',
                        'data-id' => $key,
                        'data-pjax' => '0',

                    ]);

                },
                'viewOptions'   => [ 'title' => 'View Details',    'data-toggle'=>'tooltip' ],
                'updateOptions' => [ 'title' => 'Update Customer', 'data-toggle'=>'tooltip' ],
                'deleteOptions' => [ 'title' => 'Delete Customer', 'data-toggle'=>'tooltip' ],
                'headerOptions' => [ 'class' => 'kartik-sheet-style' ],
            ],
        ];

        echo DynaGrid::widget([
            'columns' => $columns,
            'storage' => DynaGrid::TYPE_COOKIE,
            'theme' => 'panel-danger',
            'gridOptions' => [
                'dataProvider' => $dataProvider,
                'filterModel'  => $searchModel,
                'panel' => ['heading'=>'<h3 class="panel-title">Customers List</h3>'],
            ],
            'options' => [ 'id' => 'opensbc-1211' ] // a unique identifier is important
        ]);

    ?>

</div>
