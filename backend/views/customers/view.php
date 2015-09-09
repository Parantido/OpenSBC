<?php

use yii\helpers\Html;
use app\models\Domain;
use app\models\Countries;
use app\models\PhoneTypes;
use yii\helpers\ArrayHelper;
use kartik\detail\DetailView;

/**
 * @var yii\web\View $this
 * @var app\models\Customers $model
 */

$this->title = 'Customer: ' .$model->firstname. ' ' .$model->lastname. '(' .$model->username. ')';
$this->params['breadcrumbs'][] = ['label' => 'Customers', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="customers-view">
    <!--<div class="page-header">
        <h1><?= Html::encode($this->title) ?></h1>
    </div>-->

    <?php
        $ptypes_list = ArrayHelper::map(PhoneTypes::find()->all(), 'id', 'type');
        $domains_list = ArrayHelper::map(Domain::find()->all(), 'id', 'domain');
        $countries_list = ArrayHelper::map(Countries::find()->where(['countries_type' => '0'])->all(), 'countries_id', 'name');

        $inputStyle = "padding-left: 10px; padding-right: 10px; padding-top: 2px; padding-bottom: 2px;";

        $detailViewColumns = [
            'firstname'=>['attribute'=>'firstname', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'lastname'=>['attribute'=>'lastname', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'status'=>['attribute'=>'status', 'type'=> DetailView::INPUT_DROPDOWN_LIST, 'inputContainer' => ['style' => $inputStyle]],
            'domain_id'=>['attribute'=>'domain_id', 'items' => $domains_list, 'type'=> DetailView::INPUT_DROPDOWN_LIST, 'inputContainer' => ['style' => $inputStyle]],
            'address1'=>['attribute'=>'address1', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'address2'=>['attribute'=>'address2', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'state'=>['attribute'=>'state', 'items' => $countries_list, 'type'=> DetailView::INPUT_DROPDOWN_LIST, 'options'=>['id' => 'state-id'], 'inputContainer' => ['style' => $inputStyle]],
            'city'=>['attribute'=>'city', 'type'=> DetailView::INPUT_DEPDROP, 'options' => ['id' => 'cities-id'], 'widgetOptions' => [
                'pluginOptions' => [
                    'maxlength' => 50,
                    'depends' => ['state-id'],
                    'placeholder' => 'Select City...',
                    'url' => \yii\helpers\Url::to(['/customers/getcities'])
                ],
            ], 'inputContainer' => ['style' => $inputStyle]],
            'country'=>['attribute'=>'country', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'province'=>['attribute'=>'province', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'zip'=>['attribute'=>'zip', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'location'=>['attribute'=>'location', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'phone1'=>['attribute'=>'phone1', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'ptype1'=>['attribute'=>'ptype1', 'items' => $ptypes_list, 'type'=> DetailView::INPUT_DROPDOWN_LIST, 'inputContainer' => ['style' => $inputStyle]],
            'phone2'=>['attribute'=>'phone2', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'ptype2'=>['attribute'=>'ptype2', 'items' => $ptypes_list, 'type'=> DetailView::INPUT_DROPDOWN_LIST, 'inputContainer' => ['style' => $inputStyle]],
            'phone3'=>['attribute'=>'phone3', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'ptype3'=>['attribute'=>'ptype3', 'items' => $ptypes_list, 'type'=> DetailView::INPUT_DROPDOWN_LIST, 'inputContainer' => ['style' => $inputStyle]],
            'email'=>['attribute'=>'email', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'username'=>['attribute'=>'username', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'password'=>['attribute'=>'password', 'type'=> DetailView::INPUT_PASSWORD, 'inputContainer' => ['style' => $inputStyle]],
            'skypeid'=>['attribute'=>'skypeid', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'notes'=>['attribute'=>'notes', 'type'=> DetailView::INPUT_TEXTAREA, 'inputContainer' => ['style' => $inputStyle]],
        ];

        echo DetailView::widget([
            'model' => $model,
            'condensed'=>false,
            'hover'=>true,
            'mode'=>Yii::$app->request->get('edit')=='t' ? DetailView::MODE_EDIT : DetailView::MODE_VIEW,
            'panel'=>[
                'heading'=>$this->title,
                'type'=>DetailView::TYPE_INFO,
            ],
            'attributes' => $detailViewColumns,
            'deleteOptions'=>[
                'url'=>['delete', 'id' => $model->id],
                'data'=>[
                    'confirm'=>Yii::t('app', 'Are you sure you want to delete this item?'),
                    'method'=>'post',
                ],
            ],
            'enableEditMode'=>true,
        ])
    ?>

</div>
