<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Dialog */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="dialog-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'dlg_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'callid')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'from_uri')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'from_tag')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'to_uri')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'to_tag')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'mangled_from_uri')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'mangled_to_uri')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'caller_cseq')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'callee_cseq')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'caller_ping_cseq')->textInput() ?>

    <?= $form->field($model, 'callee_ping_cseq')->textInput() ?>

    <?= $form->field($model, 'caller_route_set')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'callee_route_set')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'caller_contact')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'callee_contact')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'caller_sock')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'callee_sock')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'state')->textInput() ?>

    <?= $form->field($model, 'start_time')->textInput() ?>

    <?= $form->field($model, 'timeout')->textInput() ?>

    <?= $form->field($model, 'vars')->textInput() ?>

    <?= $form->field($model, 'profiles')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'script_flags')->textInput() ?>

    <?= $form->field($model, 'flags')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
