<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Customers */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="customers-form">

    <?php $form = ActiveForm::begin([
        'layout' => 'horizontal',
        'fieldConfig' => [
            'template' => "{label}\n{beginWrapper}\n{input}\n{hint}\n{error}\n{endWrapper}",
            'horizontalCssClasses' => [
                'label' => 'col-sm-4',
                'offset' => 'col-sm-offset-4',
                'wrapper' => 'col-sm-8',
                'error' => '',
                'hint' => '',
            ],
        ]
    ]); ?>

    <div class="form-group">
        <?= Html::activeLabel($model, 'firstname', ['label'=>'First Name']); ?>
        <div class="col-sm-6">
            <?= $form->field($model, 'firstname', ['inline' => true, 'enableLabel' => false])->textInput(['maxlength' => true]); ?>
        </div>
        <?= Html::activeLabel($model, 'lastname', ['label'=>'Last Name']); ?>
        <div class="col-sm-6">
            <?= $form->field($model, 'lastname', ['inline' => true, 'enableLabel' => false])->textInput(['maxlength' => true]); ?>
        </div>
    </div>

    <div class="form-group">
        <?= Html::activeLabel($model, 'address1', ['label'=>'1st Address', 'class'=>'col-sm-2 control-label']); ?>
        <div class="col-sm-6">
            <?= $form->field($model, 'address1', ['inline' => true, 'enableLabel' => false])->textInput(['maxlength' => true]); ?>
        </div>
        <?= Html::activeLabel($model, 'address2', ['label'=>'2nd Address', 'class'=>'col-sm-2 control-label']); ?>
        <div class="col-sm-6">
            <?= $form->field($model, 'address2', ['inline' => true, 'enableLabel' => false])->textInput(['maxlength' => true]); ?>
        </div>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'city')->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'country')->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'province')->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'state')->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'zip')->textInput(['maxlength' => true]) ?>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'phone1')->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'ptype1')->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'phone2')->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'ptype2')->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'phone3')->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'ptype3')->textInput(['maxlength' => true]) ?>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'skypeid')->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'notes')->textarea(['rows' => 6]) ?>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'password')->passwordInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'status')->textInput() ?>
    </div>

    <div class="form-group">
        <?= $form->field($model, 'domain_id')->textInput() ?>
    </div>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
