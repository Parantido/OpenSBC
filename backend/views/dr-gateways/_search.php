<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var app\models\DrGatewaysSearch $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="dr-gateways-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'gwid') ?>

    <?= $form->field($model, 'type') ?>

    <?= $form->field($model, 'address') ?>

    <?= $form->field($model, 'strip') ?>

    <?php // echo $form->field($model, 'pri_prefix') ?>

    <?php // echo $form->field($model, 'attrs') ?>

    <?php // echo $form->field($model, 'probe_mode') ?>

    <?php // echo $form->field($model, 'state') ?>

    <?php // echo $form->field($model, 'socket') ?>

    <?php // echo $form->field($model, 'description') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
