<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var app\models\Dialplan $model
 */

$this->title = 'Update Dialplan: ' . ' ' . $model->dpid;
$this->params['breadcrumbs'][] = ['label' => 'Dialplan', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="dialplan-update">

    <!--<h1><?= Html::encode($this->title) ?></h1>-->

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
