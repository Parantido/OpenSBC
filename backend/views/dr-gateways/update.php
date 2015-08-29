<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var app\models\DrGateways $model
 */

$this->title = 'Update Dr Gateways: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Dr Gateways', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="dr-gateways-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
