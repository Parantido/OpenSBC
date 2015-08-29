<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var app\models\CustomersSearch $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="customers-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'firstname') ?>

    <?= $form->field($model, 'lastname') ?>

    <?= $form->field($model, 'address1') ?>

    <?= $form->field($model, 'address2') ?>

    <?php // echo $form->field($model, 'city') ?>

    <?php // echo $form->field($model, 'country') ?>

    <?php // echo $form->field($model, 'province') ?>

    <?php // echo $form->field($model, 'state') ?>

    <?php // echo $form->field($model, 'zip') ?>

    <?php // echo $form->field($model, 'phone1') ?>

    <?php // echo $form->field($model, 'phone2') ?>

    <?php // echo $form->field($model, 'phone3') ?>

    <?php // echo $form->field($model, 'ptype1') ?>

    <?php // echo $form->field($model, 'ptype2') ?>

    <?php // echo $form->field($model, 'ptype3') ?>

    <?php // echo $form->field($model, 'email') ?>

    <?php // echo $form->field($model, 'skypeid') ?>

    <?php // echo $form->field($model, 'location') ?>

    <?php // echo $form->field($model, 'notes') ?>

    <?php // echo $form->field($model, 'username') ?>

    <?php // echo $form->field($model, 'password') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'domain_id') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
