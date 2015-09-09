<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var app\models\DrRules $model
 */

$this->title = 'Create Routing Rule';
$this->params['breadcrumbs'][] = ['label' => 'Routing Rules', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dr-rules-create">
    <!--<div class="page-header">
        <h1><?= Html::encode($this->title) ?></h1>
    </div>-->
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
