<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var app\models\ResourceGroups $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Resource Groups',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Resource Groups'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="resource-groups-create">
    <!--<div class="page-header">
        <h1><?= Html::encode($this->title) ?></h1>
    </div>-->
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
