<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var app\models\Customers $model
 */

$this->title = 'Updating Customer: ' .$model->firstname. ' ' .$model->lastname. ' (' .$model->username. ')';
$this->params['breadcrumbs'][] = ['label' => 'Customers', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="customers-update">

    <!--<h1><?= Html::encode($this->title) ?></h1>-->

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
