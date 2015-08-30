<?php

use yii\helpers\Html;
use app\models\Domain;
use app\models\Countries;
use yii\helpers\ArrayHelper;
use kartik\detail\DetailView;
use kartik\widgets\ActiveForm;

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

        // Define Form Widget Columns
        $formColumns = [
            'firstname'=>['attribute'=>'firstname', 'type'=> DetailView::INPUT_TEXT],
            'lastname'=>['attribute'=>'lastname', 'type'=> DetailView::INPUT_TEXT],
            'status'=>['attribute'=>'status', 'type'=> DetailView::INPUT_DROPDOWN_LIST],
            'domain_id'=>['attribute'=>'domain_id', 'items' => $domains_list, 'type'=> DetailView::INPUT_DROPDOWN_LIST],
            'address1'=>['attribute'=>'address1', 'type'=> DetailView::INPUT_TEXT],
            'address2'=>['attribute'=>'address2', 'type'=> DetailView::INPUT_TEXT],
            'state'=>['attribute'=>'state', 'items' => $countries_list, 'type'=> DetailView::INPUT_DROPDOWN_LIST, 'options'=>['id' => 'state-id']],
            'city'=>['attribute'=>'city', 'type'=> DetailView::INPUT_DEPDROP, 'options' => ['id' => 'cities-id'], 'widgetOptions' => [
                'pluginOptions' => [
                    'maxlength' => 50,
                    'depends' => ['state-id'],
                    'placeholder' => 'Select City...',
                    'url' => \yii\helpers\Url::to(['/customers/getcities'])
                ],
            ]],
            'country'=>['attribute'=>'country', 'type'=> DetailView::INPUT_TEXT],
            'province'=>['attribute'=>'province', 'type'=> DetailView::INPUT_TEXT],
            'zip'=>['attribute'=>'zip', 'type'=> DetailView::INPUT_TEXT],
            'location'=>['attribute'=>'location', 'type'=> DetailView::INPUT_TEXT],
            'phone1'=>['attribute'=>'phone1', 'type'=> DetailView::INPUT_TEXT],
            'ptype1'=>['attribute'=>'ptype1', 'items' => $ptypes_list, 'type'=> DetailView::INPUT_DROPDOWN_LIST],
            'phone2'=>['attribute'=>'phone2', 'type'=> DetailView::INPUT_TEXT],
            'ptype2'=>['attribute'=>'ptype2', 'items' => $ptypes_list, 'type'=> DetailView::INPUT_DROPDOWN_LIST],
            'phone3'=>['attribute'=>'phone3', 'type'=> DetailView::INPUT_TEXT],
            'ptype3'=>['attribute'=>'ptype3', 'items' => $ptypes_list, 'type'=> DetailView::INPUT_DROPDOWN_LIST],
            'email'=>['attribute'=>'email', 'type'=> DetailView::INPUT_TEXT],
            'username'=>['attribute'=>'username', 'type'=> DetailView::INPUT_TEXT],
            'password'=>['attribute'=>'password', 'type'=> DetailView::INPUT_PASSWORD],
            'skypeid'=>['attribute'=>'skypeid', 'type'=> DetailView::INPUT_TEXT],
            'notes'=>['attribute'=>'notes', 'type'=> DetailView::INPUT_TEXTAREA],
        ];

        $form = ActiveForm::begin([
            'type' => ActiveForm::TYPE_HORIZONTAL,
            'fullSpan' => 12,
        ]);

        echo DetailView::widget([
            'model' => $model,
            'condensed'=> true,
            'hover' => true,
            'mode' => DetailView::MODE_VIEW,
            'panel' => [
                'heading'=>'Customer # ' . $model->id,
                'type'=>DetailView::TYPE_INFO,
            ],
            'attributes' => $formColumns
        ]);

        echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']);
        ActiveForm::end();
    ?>

</div>
