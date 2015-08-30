<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var app\models\DrGateways $model
 */

$this->title = Yii::t('app', 'Creating {modelClass}', [
    'modelClass' => 'Gateway',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Gateway'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dr-gateways-create">
    <!--<div class="page-header">
        <h1><?= Html::encode($this->title) ?></h1>
    </div>-->
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
