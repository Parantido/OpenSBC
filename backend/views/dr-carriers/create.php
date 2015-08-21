<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\DrCarriers */

$this->title = Yii::t('app', 'Create Dr Carriers');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Dr Carriers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dr-carriers-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
