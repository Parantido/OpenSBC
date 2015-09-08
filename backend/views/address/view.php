<?php

use yii\helpers\Html;
use kartik\detail\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Address */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Trusted Hosts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="address-view">

    <!--<h1><?= Html::encode($this->title) ?></h1>-->

    <?php
        $inputStyle = "padding-left: 10px; padding-right: 10px; padding-top: 2px; padding-bottom: 10px;";

        $netmasks = array();
        for($i = 8; $i <= 32; $i++) array_push($netmasks, $i);

        $detailViewColumns = [
            'grp'=>['attribute'=>'grp', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'ip'=>['attribute'=>'ip', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'mask'=>['attribute'=>'mask', 'items' => $netmasks, 'type'=> DetailView::INPUT_DROPDOWN_LIST, 'inputContainer' => ['style' => $inputStyle]],
            'port'=>['attribute'=>'port', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'proto'=>['attribute'=>'proto', 'items' => ['udp', 'tcp'], 'type'=> DetailView::INPUT_DROPDOWN_LIST, 'inputContainer' => ['style' => $inputStyle]],
            'pattern'=>['attribute'=>'pattern', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle], 'value' => '^sip:.*$'],
            'context_info'=>['attribute'=>'context_info', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]]
        ];

        echo DetailView::widget([
            'model' => $model,
            'bootstrap' => true,
            'condensed' => false,
            'hover' => true,
            'mode' => Yii::$app->request->get('edit')=='t' ? DetailView::MODE_EDIT : DetailView::MODE_VIEW,
            'panel' => [
                'heading' => $this->title,
                'type' => DetailView::TYPE_INFO,
            ],
            'attributes' => $detailViewColumns,
            'deleteOptions' => [
                'url' => ['delete', 'id' => $model->id],
                'data' => [
                    'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                    'method' => 'post',
                ],
            ],
            'enableEditMode' => true,
        ])
    ?>

</div>
