<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\MetaLocation */

$this->title = Yii::t('app', 'Create Meta Location');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Meta Locations'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="meta-location-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
