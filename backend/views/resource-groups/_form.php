<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var app\models\ResourceGroups $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="resource-groups-form">

    <?php $form = ActiveForm::begin(['type'=>ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([

    'model' => $model,
    'form' => $form,
    'columns' => 1,
    'attributes' => [

'name'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Name...', 'maxlength'=>128]], 

'ani_dp_id'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Ani Dp ID...']], 

'dnis_dp_id'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Dnis Dp ID...']], 

'max_concurrent'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Max Concurrent...']], 

'max_cps'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Max Cps...']], 

'use_rtpproxy'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Use Rtpproxy...']], 

'rtp_proxy_set_id'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Rtp Proxy Set ID...']], 

'do_lnp_dip'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Do Lnp Dip...']], 

'do_sip_trace'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Do Sip Trace...']], 

'do_isup_oli'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Do Isup Oli...']], 

'fr_timer'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Fr Timer...']], 

'fr_inv_timer'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Fr Inv Timer...']], 

'do_cname_dip'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Do Cname Dip...']], 

'description'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Description...', 'maxlength'=>128]], 

'blocked_olis'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Blocked Olis...', 'maxlength'=>300]], 

'prefered_codec'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Prefered Codec...', 'maxlength'=>32]], 

    ]


    ]);
    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']);
    ActiveForm::end(); ?>

</div>
