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
                            'data-target' => '#activity-modal',
                            'data-id' => $key,
                            'data-pjax' => '0',

                        ]);
                    },
                ],
                'headerOptions' => [ 'class' => 'kartik-sheet-style' ],
            ],
        ];

        Pjax::begin();
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

        // Register Java Script Handler
        $this->registerJs(
            "$('.activity-view-link').click(function() {
                $.get(
                    'imgview', {
                        id: $(this).closest('tr').data('key')
                    },
                    function (data) {
                        $('.modal-body').html(data);
                        $('#activity-modal').modal();
                    }
                );
            });"
        );

        // Datagrid View Action Modal Popup
        Modal::begin([
            'id' => 'activity-modal',
            'header' => '<h4 class="modal-title">View Image</h4>',
            'footer' => '<a href="#" class="btn btn-primary" data-dismiss="modal">Close</a>',

        ]); ?>
        <div class="well"></div>
        <?php Modal::end();
    ?>

</div>
