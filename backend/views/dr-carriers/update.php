<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\DrCarriers */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Dr Carriers',
]) . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Dr Carriers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="dr-carriers-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
