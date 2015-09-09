<?php

use yii\helpers\Html;
use app\models\Domain;
use yii\helpers\ArrayHelper;
use kartik\detail\DetailView;

/**
 * @var yii\web\View $this
 * @var app\models\Dialplan $model
 */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Dialplans', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dialplan-view">
    <!--<div class="page-header">
        <h1><?= Html::encode($this->title) ?></h1>
    </div>-->

    <?php
        $inputStyle = "padding-left: 10px; padding-right: 10px; padding-top: 2px; padding-bottom: 2px;";

        $domains_list = ArrayHelper::map(Domain::find()->all(), 'id', 'domain');

        $detailViewColumns = [
            'dpid' => ['attribute'=>'dpid', 'items' => $domains_list, 'type'=> DetailView::INPUT_DROPDOWN_LIST, 'inputContainer' => ['style' => $inputStyle]],
            'disabled' => ['attribute'=>'disabled', 'type'=> DetailView::INPUT_CHECKBOX, 'inputContainer' => ['style' => $inputStyle]],
            'pr' => ['attribute'=>'pr', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'match_op' => ['attribute'=>'match_op', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'match_exp' => ['attribute'=>'match_exp', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'match_flags' => ['attribute'=>'match_flags', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'subst_exp' => ['attribute'=>'subst_exp', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'repl_exp' => ['attribute'=>'repl_exp', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
            'attrs' => ['attribute'=>'attrs', 'type'=> DetailView::INPUT_TEXT, 'inputContainer' => ['style' => $inputStyle]],
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
