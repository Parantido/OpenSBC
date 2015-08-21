<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Dialplan */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="dialplan-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'dpid')->textInput() ?>

    <?= $form->field($model, 'pr')->textInput() ?>

    <?= $form->field($model, 'match_op')->textInput() ?>

    <?= $form->field($model, 'match_exp')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'match_flags')->textInput() ?>

    <?= $form->field($model, 'subst_exp')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'repl_exp')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'disabled')->textInput() ?>

    <?= $form->field($model, 'attrs')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
