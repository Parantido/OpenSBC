<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Domain */

$this->title = Yii::t('app', 'Create Domain');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Domains'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="domain-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
