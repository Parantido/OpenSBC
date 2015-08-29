<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var app\models\DrRulesSearch $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="dr-rules-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'ruleid') ?>

    <?= $form->field($model, 'groupid') ?>

    <?= $form->field($model, 'prefix') ?>

    <?= $form->field($model, 'timerec') ?>

    <?= $form->field($model, 'priority') ?>

    <?php // echo $form->field($model, 'routeid') ?>

    <?php // echo $form->field($model, 'gwlist') ?>

    <?php // echo $form->field($model, 'attrs') ?>

    <?php // echo $form->field($model, 'description') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
