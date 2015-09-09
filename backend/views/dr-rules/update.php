<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var app\models\DrRules $model
 */

$this->title = 'Update Routing Rule: ' . ' ' . $model->prefix;
$this->params['breadcrumbs'][] = ['label' => 'Routing Rules', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->ruleid, 'url' => ['view', 'id' => $model->ruleid]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="dr-rules-update">

    <!--<h1><?= Html::encode($this->title) ?></h1>-->

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
