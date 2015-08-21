<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\DrRules */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Dr Rules',
]) . ' ' . $model->ruleid;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Dr Rules'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->ruleid, 'url' => ['view', 'id' => $model->ruleid]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="dr-rules-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
