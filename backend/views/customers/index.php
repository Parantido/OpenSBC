<?php

use yii\helpers\Html;
use yii\widgets\Pjax;
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
                'buttons' => [
                    'view' => function ($url, $model, $key) {
                        return Html::a('<span class="glyphicon glyphicon-eye-open"></span>','#', [
                            'id' => 'activity-view-link',
                            'title' => Yii::t('yii', 'View'),
                            'data-toggle' => 'modal',
                            'data-target' => '#activity-modal-view',
                            'data-id' => $key,
                            'data-pjax' => '0',

                        ]);
                    },
                    'update' => function ($url, $model, $key) {
                        return Html::a('<span class="glyphicon glyphicon-pencil"></span>','#', [
                            'id' => 'activity-update-link',
                            'title' => Yii::t('yii', 'Update'),
                            'data-toggle' => 'modal',
                            'data-target' => '#activity-modal-update',
                            'data-id' => $key,
                            'data-pjax' => '0',

                        ]);
                    },
                    'delete' => function ($url, $model, $key) {
                        return Html::a('<span class="glyphicon glyphicon-remove"></span>','#', [
                            'id' => 'activity-delete-link',
                            'title' => Yii::t('yii', 'Delete'),
                            'data-toggle' => 'modal',
                            'data-target' => '#activity-modal-delete',
                            'data-id' => $key,
                            'data-pjax' => '0',

                        ]);
                    },
                ],
                'headerOptions' => [ 'class' => 'kartik-sheet-style' ],
            ],
        ];

        // Register CRUD Java Script Handler
        $this->registerJs(
            "function init_click_handlers(){
                $('.activity-view-link').click(function() {
                    $.get(
                        'view', {
                            id: $(this).closest('tr').data('key')
                        },
                        function (data) {
                            var modelId = $(this).closest('tr').data('key');
                            alert('This: ' + modelId);
                            $('#activity-modal-view').find('.modal-body').html(data);
                            $('#activity-modal-view').modal();
                        }
                    );
                });
                $('.activity-update-link').click(function() {
                    $.get(
                        'update', {
                            id: $(this).closest('tr').data('key')
                        },
                        function (data) {
                            $('#activity-modal-update').find('.modal-body').html(data);
                            $('#activity-modal-update').modal();
                        }
                    );
                });
                $('.activity-delete-link').click(function() {
                    $.get(
                        'delete', {
                            id: $(this).closest('tr').data('key')
                        },
                        function (data) {
                            $('#activity-modal-delete').find('.modal-body').html(data);
                            $('#activity-modal-delete').modal();
                        }
                    );
                });
            }

            init_click_handlers(); // First Run
            $('#datagrid-pjax-id').on('pjax:success', function() {
                init_click_handlers(); // Reactivate DataGrid click action handlers every update (pagination)
            });"
        );

        // Datagrid Component
        Pjax::begin(['id' => 'datagrid-pjax-id']);
        echo DynaGrid::widget([
            'columns' => $columns,
            'storage' => DynaGrid::TYPE_COOKIE,
            'theme' => 'panel-danger',
            'gridOptions' => [
                'dataProvider' => $dataProvider,
                'filterModel'  => $searchModel,
                'panel' => ['heading'=>'<h3 class="panel-title">Customers List</h3>'],
            ],
            'options' => [ 'id' => 'opensbc-1211' ]
        ]);
        Pjax::end();

        // Datagrid View Action Modal Popup
        Modal::begin([
            'id' => 'activity-modal-view',
            'header' => '<h4 class="modal-title">View Customer</h4>',
            'footer' => '<a href="#" class="btn btn-primary" data-dismiss="modal">Close</a>',

        ]); ?>
        <div class="well"></div>
        <?php Modal::end();

        // Datagrid Update Action Modal Popup
        Modal::begin([
                'id' => 'activity-modal-update',
                'header' => '<h4 class="modal-title">Update Customer</h4>',
                'footer' => '<a href="#" class="btn btn-primary" data-dismiss="modal">Close</a>',

            ]); ?>
        <div class="well"></div>
        <?php Modal::end();

        // Datagrid Delete Action Modal Popup
        Modal::begin([
            'id' => 'activity-modal-delete',
            'header' => '<h4 class="modal-title">Delete Customer</h4>',
            'footer' => '<a href="#" class="btn btn-primary" data-dismiss="modal">Close</a>',

        ]); ?>
        <div class="well"></div>
        <?php Modal::end();
    ?>

</div>
