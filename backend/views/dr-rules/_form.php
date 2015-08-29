<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var app\models\DrRules $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="dr-rules-form">

    <?php $form = ActiveForm::begin(['type'=>ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([

    'model' => $model,
    'form' => $form,
    'columns' => 1,
    'attributes' => [

'groupid'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Groupid...', 'maxlength'=>255]], 

'prefix'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Prefix...', 'maxlength'=>64]], 

'timerec'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Timerec...', 'maxlength'=>255]], 

'gwlist'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Gwlist...', 'maxlength'=>255]], 

'priority'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Priority...']], 

'routeid'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Routeid...', 'maxlength'=>255]], 

'attrs'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Attrs...', 'maxlength'=>255]], 

'description'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Description...', 'maxlength'=>128]], 

    ]


    ]);
    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']);
    ActiveForm::end(); ?>

</div>
