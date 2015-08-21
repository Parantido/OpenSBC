<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Dialog */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Dialog',
]) . ' ' . $model->dlg_id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Dialogs'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->dlg_id, 'url' => ['view', 'id' => $model->dlg_id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="dialog-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
