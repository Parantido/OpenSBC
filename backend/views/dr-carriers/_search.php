<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var app\models\DrCarriersSearch $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="dr-carriers-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'carrierid') ?>

    <?= $form->field($model, 'gwlist') ?>

    <?= $form->field($model, 'flags') ?>

    <?= $form->field($model, 'state') ?>

    <?php // echo $form->field($model, 'attrs') ?>

    <?php // echo $form->field($model, 'description') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
