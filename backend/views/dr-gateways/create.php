<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\DrGateways */

$this->title = Yii::t('app', 'Create Dr Gateways');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Dr Gateways'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dr-gateways-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
