<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\DrCarriers */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="dr-carriers-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'carrierid')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'gwlist')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'flags')->textInput() ?>

    <?= $form->field($model, 'state')->textInput() ?>

    <?= $form->field($model, 'attrs')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'description')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
