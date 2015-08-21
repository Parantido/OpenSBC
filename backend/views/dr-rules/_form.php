<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\DrRules */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="dr-rules-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'groupid')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'prefix')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'timerec')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'priority')->textInput() ?>

    <?= $form->field($model, 'routeid')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'gwlist')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'attrs')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'description')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
