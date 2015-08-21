<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "user".
 *
 * @property integer $id
 * @property integer $role_id
 * @property integer $status
 * @property string $email
 * @property string $new_email
 * @property string $username
 * @property string $password
 * @property string $auth_key
 * @property string $api_key
 * @property string $login_ip
 * @property string $login_time
 * @property string $create_ip
 * @property string $create_time
 * @property string $update_time
 * @property string $ban_time
 * @property string $ban_reason
 *
 * @property Profile[] $profiles
 * @property Role $role
 * @property UserAuth[] $userAuths
 * @property UserKey[] $userKeys
 */
class User extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'user';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['role_id', 'status'], 'required'],
            [['role_id', 'status'], 'integer'],
            [['login_time', 'create_time', 'update_time', 'ban_time'], 'safe'],
            [['email', 'new_email', 'username', 'password', 'auth_key', 'api_key', 'login_ip', 'create_ip', 'ban_reason'], 'string', 'max' => 255],
            [['email'], 'unique'],
            [['username'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'role_id' => Yii::t('app', 'Role ID'),
            'status' => Yii::t('app', 'Status'),
            'email' => Yii::t('app', 'Email'),
            'new_email' => Yii::t('app', 'New Email'),
            'username' => Yii::t('app', 'Username'),
            'password' => Yii::t('app', 'Password'),
            'display_name' => Yii::t('app', 'Display Name'),
            'auth_key' => Yii::t('app', 'Auth Key'),
            'api_key' => Yii::t('app', 'Api Key'),
            'login_ip' => Yii::t('app', 'Login Ip'),
            'login_time' => Yii::t('app', 'Login Time'),
            'create_ip' => Yii::t('app', 'Create Ip'),
            'create_time' => Yii::t('app', 'Create Time'),
            'update_time' => Yii::t('app', 'Update Time'),
            'ban_time' => Yii::t('app', 'Ban Time'),
            'ban_reason' => Yii::t('app', 'Ban Reason'),
            'img_url' => Yii::t('app', 'Profile Avatar'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProfiles()
    {
        return $this->hasMany(Profile::className(), ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRole()
    {
        return $this->hasOne(Role::className(), ['id' => 'role_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserAuths()
    {
        return $this->hasMany(UserAuth::className(), ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserKeys()
    {
        return $this->hasMany(UserKey::className(), ['user_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return UserQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new UserQuery(get_called_class());
    }
}
