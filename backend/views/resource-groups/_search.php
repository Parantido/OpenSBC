<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var app\models\ResourceGroupsSearch $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="resource-groups-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'name') ?>

    <?= $form->field($model, 'ani_dp_id') ?>

    <?= $form->field($model, 'dnis_dp_id') ?>

    <?= $form->field($model, 'max_concurrent') ?>

    <?php // echo $form->field($model, 'max_cps') ?>

    <?php // echo $form->field($model, 'use_rtpproxy') ?>

    <?php // echo $form->field($model, 'rtp_proxy_set_id') ?>

    <?php // echo $form->field($model, 'description') ?>

    <?php // echo $form->field($model, 'do_lnp_dip') ?>

    <?php // echo $form->field($model, 'do_sip_trace') ?>

    <?php // echo $form->field($model, 'do_isup_oli') ?>

    <?php // echo $form->field($model, 'blocked_olis') ?>

    <?php // echo $form->field($model, 'fr_timer') ?>

    <?php // echo $form->field($model, 'fr_inv_timer') ?>

    <?php // echo $form->field($model, 'do_cname_dip') ?>

    <?php // echo $form->field($model, 'prefered_codec') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
