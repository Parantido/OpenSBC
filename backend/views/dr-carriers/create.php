<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var app\models\DrCarriers $model
 */

$this->title = 'Create Dr Carriers';
$this->params['breadcrumbs'][] = ['label' => 'Dr Carriers', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dr-carriers-create">
    <div class="page-header">
        <h1><?= Html::encode($this->title) ?></h1>
    </div>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
