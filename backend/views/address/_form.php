<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Address */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="address-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'grp')->textInput() ?>

    <?= $form->field($model, 'ip')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'mask')->textInput() ?>

    <?= $form->field($model, 'port')->textInput() ?>

    <?= $form->field($model, 'proto')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pattern')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'context_info')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
