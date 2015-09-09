<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var app\models\Dialplan $model
 */

$this->title = 'Create Dialplan';
$this->params['breadcrumbs'][] = ['label' => 'Dialplans', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dialplan-create">
    <!--<div class="page-header">
        <h1><?= Html::encode($this->title) ?></h1>
    </div>-->
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
