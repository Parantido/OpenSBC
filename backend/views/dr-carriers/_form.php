<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var app\models\DrCarriers $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="dr-carriers-form">

    <?php $form = ActiveForm::begin(['type'=>ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([

    'model' => $model,
    'form' => $form,
    'columns' => 1,
    'attributes' => [

'carrierid'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Carrierid...', 'maxlength'=>64]], 

'gwlist'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Gwlist...', 'maxlength'=>255]], 

'flags'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Flags...']], 

'state'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter State...']], 

'attrs'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Attrs...', 'maxlength'=>255]], 

'description'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Description...', 'maxlength'=>128]], 

    ]


    ]);
    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']);
    ActiveForm::end(); ?>

</div>
