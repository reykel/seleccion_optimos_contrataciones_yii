<?php require('header.php'); ?>
<?php if(!Yii::app()->user->isGuest)
echo "<div align = 'right'>
    <ul class='breadcrumb'>";?>
    <?php
    if(!Yii::app()->user->isGuest)
       $this->widget('ext.bootstrap.widgets.TbBreadcrumbs', array('links'=>$this->breadcrumbs,)); 
    ?>
<?php if(!Yii::app()->user->isGuest)
echo "</ul>
</div>

<div class='row'>
    <div class='box col-md-12 col-md-12'>
        <div class='box-inner'>
            <div class='box-header well'>
                <h2><i class='glyphicon glyphicon-th-large'></i>"; ?>

            <?php echo $this->headers ?></h2>

            <?php if(!Yii::app()->user->isGuest)
                echo "<div class='box-icon'></div></div><div class='box-content row'><div class='col-lg-12 col-md-12'>"; ?>

			<?php echo $content; ?>

            <?php if(!Yii::app()->user->isGuest)
                echo "</div></div></div></div></div>"; ?>

<?php require('footer.php'); ?>

