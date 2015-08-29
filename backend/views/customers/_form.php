<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use app\models\Domain;
use app\models\Countries;
use yii\helpers\ArrayHelper;
use kartik\depdrop\DepDrop;

/**
 * @var yii\web\View $this
 * @var app\models\Customers $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="customers-form">

    <?php
    $domains_list = ArrayHelper::map(Domain::find()->all(), 'id', 'domain');
    $countries_list = ArrayHelper::map(Countries::find()->where(['countries_type' => '0'])->all(), 'countries_id', 'name');

    $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([
        'model' => $model,
        'form' => $form,
        'columns' => 1,
        'attributes' => [
            'firstname'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter First Name...', 'maxlength'=>50]],
            'lastname'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Last Name...', 'maxlength'=>50]],
            'status'=>['type'=> Form::INPUT_DROPDOWN_LIST, 'items' => ['Active', 'Disabled'],'options'=>['placeholder'=>'Enter Status...']],
            'domain_id'=>['type'=> Form::INPUT_DROPDOWN_LIST, 'items' => $domains_list, 'options'=>['placeholder'=>'Enter Domain ID...']],
            'address1'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter 1st Address...', 'maxlength'=>200]],
            'address2'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter 2nd Address...', 'maxlength'=>200]],
            'state'=>['type'=> Form::INPUT_DROPDOWN_LIST, 'items' => $countries_list, 'options'=>['id' => 'state-id', 'placeholder'=>'Enter State...', 'maxlength'=>50]],
            'city'=>['type'=> Form::INPUT_WIDGET, 'widgetClass' => DepDrop::classname(), 'options'=>['id' => 'cities-id', 'pluginOptions' => [
                'maxlength' => 50,
                'depends' => ['state-id'],
                'placeholder' => 'Select City...',
                'url' => \yii\helpers\Url::to(['/customers/getcities'])
            ]]],
            'country'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Country...', 'maxlength'=>255]],
            'province'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Province...', 'maxlength'=>255]],
            'zip'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Zip...', 'maxlength'=>12]],
            'location'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Location...']],
            'phone1'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter 1st Phone...', 'maxlength'=>50]],
            'ptype1'=>['type'=> Form::INPUT_DROPDOWN_LIST, 'items' => ['Mobile', 'Landline', 'Fax', 'Other'], 'options'=>['placeholder'=>'Enter 1st Phone Type...', 'maxlength'=>50]],
            'phone2'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter 2nd Phone...', 'maxlength'=>50]],
            'ptype2'=>['type'=> Form::INPUT_DROPDOWN_LIST, 'items' => ['Mobile', 'Landline', 'Fax', 'Other'], 'options'=>['placeholder'=>'Enter 2nd Phone Type...', 'maxlength'=>50]],
            'phone3'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter 3rd Phone...', 'maxlength'=>50]],
            'ptype3'=>['type'=> Form::INPUT_DROPDOWN_LIST, 'items' => ['Mobile', 'Landline', 'Fax', 'Other'], 'options'=>['placeholder'=>'Enter 3rd Phone Type...', 'maxlength'=>50]],
            'email'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Email...', 'maxlength'=>50]],
            'username'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Username...', 'maxlength'=>50]],
            //'password'=>['type'=> Form::INPUT_PASSWORD, 'options'=>['placeholder'=>'Enter Password...', 'maxlength'=>255]],
            'password'=>['type'=> Form::INPUT_WIDGET, 'widgetClass' => PasswordInput::classname(), 'options'=>[]],
            'skypeid'=>['type'=> Form::INPUT_TEXT, 'options'=>['placeholder'=>'Enter Skype Id...', 'maxlength'=>255]],
            'notes'=>['type'=> Form::INPUT_TEXTAREA, 'options'=>['placeholder'=>'Enter Notes...','rows'=> 6]],
        ]
    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']);
    ActiveForm::end(); ?>

</div>
