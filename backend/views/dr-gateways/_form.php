<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var app\models\DrGateways $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="dr-gateways-form">

    <?php $form = ActiveForm::begin(['type'=>ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([

    'model' => $model,
    'form' => $form,
    'columns' => 1,
    'attributes' => [

'gwid'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Gwid...', 'maxlength'=>64]], 

'address'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Address...', 'maxlength'=>128]], 

'type'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Type...']], 

'strip'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Strip...']], 

'probe_mode'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Probe Mode...']], 

'state'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter State...']], 

'socket'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Socket...', 'maxlength'=>128]], 

'description'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Description...', 'maxlength'=>128]], 

'pri_prefix'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Pri Prefix...', 'maxlength'=>16]], 

'attrs'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Attrs...', 'maxlength'=>255]], 

    ]


    ]);
    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']);
    ActiveForm::end(); ?>

</div>
