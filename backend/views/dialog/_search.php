<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\DialogSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="dialog-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'dlg_id') ?>

    <?= $form->field($model, 'callid') ?>

    <?= $form->field($model, 'from_uri') ?>

    <?= $form->field($model, 'from_tag') ?>

    <?= $form->field($model, 'to_uri') ?>

    <?php // echo $form->field($model, 'to_tag') ?>

    <?php // echo $form->field($model, 'mangled_from_uri') ?>

    <?php // echo $form->field($model, 'mangled_to_uri') ?>

    <?php // echo $form->field($model, 'caller_cseq') ?>

    <?php // echo $form->field($model, 'callee_cseq') ?>

    <?php // echo $form->field($model, 'caller_ping_cseq') ?>

    <?php // echo $form->field($model, 'callee_ping_cseq') ?>

    <?php // echo $form->field($model, 'caller_route_set') ?>

    <?php // echo $form->field($model, 'callee_route_set') ?>

    <?php // echo $form->field($model, 'caller_contact') ?>

    <?php // echo $form->field($model, 'callee_contact') ?>

    <?php // echo $form->field($model, 'caller_sock') ?>

    <?php // echo $form->field($model, 'callee_sock') ?>

    <?php // echo $form->field($model, 'state') ?>

    <?php // echo $form->field($model, 'start_time') ?>

    <?php // echo $form->field($model, 'timeout') ?>

    <?php // echo $form->field($model, 'vars') ?>

    <?php // echo $form->field($model, 'profiles') ?>

    <?php // echo $form->field($model, 'script_flags') ?>

    <?php // echo $form->field($model, 'flags') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
