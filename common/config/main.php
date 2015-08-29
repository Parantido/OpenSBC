<?php
return [
    'name' => 'Open SBC',
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'modules' => [
        'user' => [
            'class' => 'amnah\yii2\user\Module',
        ],
        'dynagrid'=>[
            'class'=>'\kartik\dynagrid\Module',
        ],
        'gridview'=>[
            'class'=>'\kartik\grid\Module',
        ],
	'datecontrol' =>  [
            'class' => 'kartik\datecontrol\Module',
 
            // format settings for displaying each date attribute
            'displaySettings' => [
                'date' => 'd-m-Y',
                'time' => 'H:i:s A',
                'datetime' => 'd-m-Y H:i:s A',
            ],
 
            // format settings for saving each date attribute
            'saveSettings' => [
                'date' => 'Y-m-d', 
                'time' => 'H:i:s',
                'datetime' => 'Y-m-d H:i:s',
            ],
 
            // automatically use kartik\widgets for each of the above formats
            'autoWidget' => true,
 
        ],
        'debug' => [
            'class' => 'yii\debug\Module',
            'allowedIPs' => ['84.220.140.194', '87.21.144.199', '127.0.0.1', '::1']
        ]
    ],
    'components' => [
        'user' => [
            'class' => 'amnah\yii2\user\components\User',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'useFileTransport' => true,
            'messageConfig' => [
                'from' => ['admin@techfusion.it' => 'Open SBC'],
                'charset' => 'UTF-8',
            ]
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
    ],
];
