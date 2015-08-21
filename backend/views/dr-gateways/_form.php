<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\DrGateways */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="dr-gateways-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'gwid')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'type')->textInput() ?>

    <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'strip')->textInput() ?>

    <?= $form->field($model, 'pri_prefix')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'attrs')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'probe_mode')->textInput() ?>

    <?= $form->field($model, 'state')->textInput() ?>

    <?= $form->field($model, 'socket')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'description')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
