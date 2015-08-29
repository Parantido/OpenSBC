<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var app\models\User $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="user-form">

    <?php $form = ActiveForm::begin(['type'=>ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([

    'model' => $model,
    'form' => $form,
    'columns' => 1,
    'attributes' => [

'role_id'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Role ID...']], 

'status'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Status...']], 

'login_time'=>['type'=> Form::INPUT_WIDGET, 'widgetClass'=>DateControl::classname(),'options'=>['type'=>DateControl::FORMAT_DATETIME]], 

'create_time'=>['type'=> Form::INPUT_WIDGET, 'widgetClass'=>DateControl::classname(),'options'=>['type'=>DateControl::FORMAT_DATETIME]], 

'update_time'=>['type'=> Form::INPUT_WIDGET, 'widgetClass'=>DateControl::classname(),'options'=>['type'=>DateControl::FORMAT_DATETIME]], 

'ban_time'=>['type'=> Form::INPUT_WIDGET, 'widgetClass'=>DateControl::classname(),'options'=>['type'=>DateControl::FORMAT_DATETIME]], 

'email'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Email...', 'maxlength'=>255]], 

'new_email'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter New Email...', 'maxlength'=>255]], 

'username'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Username...', 'maxlength'=>255]], 

'password'=>['type'=> Form::INPUT_PASSWORD, 'options'=>['placeholder'=>'Enter Password...', 'maxlength'=>255]], 

'auth_key'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Auth Key...', 'maxlength'=>255]], 

'api_key'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Api Key...', 'maxlength'=>255]], 

'login_ip'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Login Ip...', 'maxlength'=>255]], 

'create_ip'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Create Ip...', 'maxlength'=>255]], 

'ban_reason'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Ban Reason...', 'maxlength'=>255]], 

    ]


    ]);
    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']);
    ActiveForm::end(); ?>

</div>
