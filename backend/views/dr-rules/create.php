<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\DrRules */

$this->title = Yii::t('app', 'Create Dr Rules');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Dr Rules'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dr-rules-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
