<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\AddressSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="address-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'grp') ?>

    <?= $form->field($model, 'ip') ?>

    <?= $form->field($model, 'mask') ?>

    <?= $form->field($model, 'port') ?>

    <?php // echo $form->field($model, 'proto') ?>

    <?php // echo $form->field($model, 'pattern') ?>

    <?php // echo $form->field($model, 'context_info') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
