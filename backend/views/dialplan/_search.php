<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\DialplanSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="dialplan-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'dpid') ?>

    <?= $form->field($model, 'pr') ?>

    <?= $form->field($model, 'match_op') ?>

    <?= $form->field($model, 'match_exp') ?>

    <?php // echo $form->field($model, 'match_flags') ?>

    <?php // echo $form->field($model, 'subst_exp') ?>

    <?php // echo $form->field($model, 'repl_exp') ?>

    <?php // echo $form->field($model, 'disabled') ?>

    <?php // echo $form->field($model, 'attrs') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
