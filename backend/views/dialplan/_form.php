<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var app\models\Dialplan $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="dialplan-form">

    <?php $form = ActiveForm::begin(['type'=>ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([

    'model' => $model,
    'form' => $form,
    'columns' => 1,
    'attributes' => [

'dpid'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Dpid...']], 

'pr'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Pr...']], 

'match_op'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Match Op...']], 

'match_exp'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Match Exp...', 'maxlength'=>64]], 

'match_flags'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Match Flags...']], 

'subst_exp'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Subst Exp...', 'maxlength'=>64]], 

'repl_exp'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Repl Exp...', 'maxlength'=>32]], 

'attrs'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Attrs...', 'maxlength'=>32]], 

'disabled'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Disabled...']], 

    ]


    ]);
    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']);
    ActiveForm::end(); ?>

</div>
