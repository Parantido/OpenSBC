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
