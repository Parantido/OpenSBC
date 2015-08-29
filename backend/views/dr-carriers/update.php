<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var app\models\DrCarriers $model
 */

$this->title = 'Update Dr Carriers: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Dr Carriers', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="dr-carriers-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
