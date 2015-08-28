<?php

use yii\helpers\Html;
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

    <p>
        <?= Html::a(Yii::t('app', 'Create Customers'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php
        // Define Columns to show
        $columns = [
            ['class' => 'yii\grid\SerialColumn'],
            //'id',
            'firstname',
            'lastname',
            'address1',
            // 'address2',
            // 'city',
            // 'country',
            // 'province',
            // 'state',
            // 'zip',
            'phone1',
            // 'phone2',
            // 'phone3',
            // 'ptype1',
            // 'ptype2',
            // 'ptype3',
            'email:email',
            // 'skypeid',
            // 'location',
            // 'notes:ntext',
            'username',
            'password',
            // 'status',
            // 'domain_id',
            [
                'class' => 'kartik\grid\ActionColumn',
                //'dropdown' => $this->dropdown,
                //'dropdownOptions' => [ 'class' => 'pull-right' ],
                'urlCreator' => function($action, $model, $key, $index) { return '#'; },
                'viewOptions' => [ 'title' => 'This will launch the book details page. Disabled for this demo!', 'data-toggle'=>'tooltip'],
                'updateOptions' => [ 'title' => 'This will launch the book update page. Disabled for this demo!', 'data-toggle'=>'tooltip'],
                'deleteOptions' => [ 'title' => 'This will launch the book delete action. Disabled for this demo!', 'data-toggle'=>'tooltip'],
                'headerOptions' => [ 'class' => 'kartik-sheet-style'],
            ],
        ];

        echo DynaGrid::widget([
            'columns' => $columns,
            'storage' => DynaGrid::TYPE_COOKIE,
            'theme' => 'panel-danger',
            'gridOptions' => [
                'dataProvider' => $dataProvider,
                'filterModel'  => $searchModel,
                'panel' => ['heading'=>'<h3 class="panel-title">Library</h3>'],
            ],
            'options' => [ 'id' => 'opensbc-1211' ] // a unique identifier is important
        ]);

    ?>

</div>
