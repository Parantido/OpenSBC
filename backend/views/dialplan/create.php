<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Dialplan */

$this->title = Yii::t('app', 'Create Dialplan');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Dialplans'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dialplan-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
