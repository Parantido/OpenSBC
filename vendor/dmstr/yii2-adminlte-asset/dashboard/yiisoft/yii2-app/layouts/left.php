<?php
use yii\bootstrap\Nav;

?>
<aside class="main-sidebar">

    <section class="sidebar">

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="
                <?
                    // Check for User Preloaded Image
                    if(Yii::$app->user->getProfileAvatar() != null) {
                        $img = "data:image/png;base64,'" .Yii::$app->user->getProfileAvatar(). "'";
                    } else {
                        $img = $directoryAsset . "/img/user2-160x160.jpg";
                    }
                    // Print Image to IMG Src tag
                    echo $img;
                ?>
                " class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
                <p><?php echo Yii::$app->user->getDisplayName(); ?></p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            </div>
        </form>
        <!-- /.search form -->

        <?=
        Nav::widget(
            [
                'encodeLabels' => false,
                'options' => ['class' => 'sidebar-menu'],
                'items' => [
                    '<li class="header">Menu</li>',
                    ['label' => '<i class="fa fa-file-code-o"></i><span>Gii</span>', 'url' => ['/gii']],
                    ['label' => '<i class="fa fa-dashboard"></i><span>Debug</span>', 'url' => ['/debug']],
                    [
                        'label' => '<i class="glyphicon glyphicon-lock"></i><span>Sing in</span>', //for basic
                        'url' => ['/site/login'],
                        'visible' =>Yii::$app->user->isGuest
                    ],
                ],
            ]
        );
        ?>

        <ul class="sidebar-menu">
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-dashboard"></i> <span>Monitoring</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="<?= \yii\helpers\Url::to(['/status']) ?>"><span class="fa fa-angle-right"></span> Status</a></li>
                    <li><a href="<?= \yii\helpers\Url::to(['/cdrs']) ?>"><span class="fa fa-angle-right"></span> Call Details</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-users"></i> <span>Customers</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="<?= \yii\helpers\Url::to(['/customers']) ?>"><span class="fa fa-angle-right"></span> Customers</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-credit-card"></i> <span>Rate Decks</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="<?= \yii\helpers\Url::to(['/customers']) ?>"><span class="fa fa-angle-right"></span> Customers</a></li>
                    <li><a href="<?= \yii\helpers\Url::to(['/customers']) ?>"><span class="fa fa-angle-right"></span> Carriers</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-random"></i> <span>Routing</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="<?= \yii\helpers\Url::to(['/dr-gateways']) ?>"><span class="fa fa-angle-right"></span> Gateways</a></li>
                    <li><a href="<?= \yii\helpers\Url::to(['/dr-carriers']) ?>"><span class="fa fa-angle-right"></span> Carriers</a></li>
                    <li><a href="<?= \yii\helpers\Url::to(['/dr-rules']) ?>"><span class="fa fa-angle-right"></span> Routing Rules</a></li>
                    <li><a href="<?= \yii\helpers\Url::to(['/dialplan']) ?>"><span class="fa fa-angle-right"></span> Dialplan</a></li>
                    <!--<li>
                        <a href="#"><i class="fa fa-circle-o"></i> Level One <i class="fa fa-angle-left pull-right"></i></a>
                        <ul class="treeview-menu">
                            <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-circle-o"></i> Level Two <i class="fa fa-angle-left pull-right"></i>
                                </a>
                                <ul class="treeview-menu">
                                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>-->
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-trello"></i> <span>Resources</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="<?= \yii\helpers\Url::to(['/rg-groups']) ?>"><span class="fa fa-angle-right"></span> Resource Groups</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-cogs"></i> <span>System</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="<?= \yii\helpers\Url::to(['/user/admin']) ?>"><span class="fa fa-angle-right"></span> Users</a></li>
                </ul>
            </li>
        </ul>

    </section>

</aside>
