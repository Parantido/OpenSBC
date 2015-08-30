<?php

use yii\helpers\Html;
use app\models\Domain;
use app\models\Countries;
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
        $domains_list = ArrayHelper::map(Domain::find()->all(), 'id', 'domain');
        $countries_list = ArrayHelper::map(Countries::find()->where(['countries_type' => '0'])->all(), 'countries_id', 'name');

        $detailViewColumns = [
            'firstname'=>['attribute'=>'firstname', 'type'=> DetailView::INPUT_TEXT],
            'lastname'=>['attribute'=>'lastname', 'type'=> DetailView::INPUT_TEXT],
            'status'=>['attribute'=>'status', 'type'=> DetailView::INPUT_DROPDOWN_LIST],
            'domain_id'=>['attribute'=>'domain_id', 'items' => $domains_list, 'type'=> DetailView::INPUT_DROPDOWN_LIST],
            'address1'=>['attribute'=>'address1', 'type'=> DetailView::INPUT_TEXT],
            'address2'=>['attribute'=>'address2', 'type'=> DetailView::INPUT_TEXT],
            'state'=>['attribute'=>'state', 'type'=> DetailView::INPUT_DROPDOWN_LIST],
            'city'=>['attribute'=>'city', 'type'=> DetailView::INPUT_DROPDOWN_LIST],
            'country'=>['attribute'=>'country', 'type'=> DetailView::INPUT_TEXT],
            'province'=>['attribute'=>'province', 'type'=> DetailView::INPUT_TEXT],
            'zip'=>['attribute'=>'zip', 'type'=> DetailView::INPUT_TEXT],
            'location'=>['attribute'=>'location', 'type'=> DetailView::INPUT_TEXT],
            'phone1'=>['attribute'=>'phone1', 'type'=> DetailView::INPUT_TEXT],
            'ptype1'=>['attribute'=>'ptype1', 'type'=> DetailView::INPUT_DROPDOWN_LIST],
            'phone2'=>['attribute'=>'phone2', 'type'=> DetailView::INPUT_TEXT],
            'ptype2'=>['attribute'=>'ptype2', 'type'=> DetailView::INPUT_DROPDOWN_LIST],
            'phone3'=>['attribute'=>'phone3', 'type'=> DetailView::INPUT_TEXT],
            'ptype3'=>['attribute'=>'ptype3', 'type'=> DetailView::INPUT_DROPDOWN_LIST],
            'email'=>['attribute'=>'email', 'type'=> DetailView::INPUT_TEXT],
            'username'=>['attribute'=>'username', 'type'=> DetailView::INPUT_TEXT],
            'password'=>['attribute'=>'password', 'type'=> DetailView::INPUT_PASSWORD],
            'skypeid'=>['attribute'=>'skypeid', 'type'=> DetailView::INPUT_TEXT],
            'notes'=>['attribute'=>'notes', 'type'=> DetailView::INPUT_TEXTAREA],
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
            /*[
            'id',
            'firstname',
            'lastname',
            'address1',
            'address2',
            'city',
            'country',
            'province',
            'state',
            'zip',
            'phone1',
            'phone2',
            'phone3',
            'ptype1',
            'ptype2',
            'ptype3',
            'email:email',
            'skypeid',
            'location',
            'notes:ntext',
            'username',
            'password',
            'status',
            'domain_id',
        ],*/
        'deleteOptions'=>[
        'url'=>['delete', 'id' => $model->id],
        'data'=>[
        'confirm'=>Yii::t('app', 'Are you sure you want to delete this item?'),
        'method'=>'post',
        ],
        ],
        'enableEditMode'=>true,
    ]) ?>

</div>
