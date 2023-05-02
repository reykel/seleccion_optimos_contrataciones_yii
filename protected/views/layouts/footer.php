<?php if (!isset($no_visible_elements) || !$no_visible_elements) { ?>
    <!-- content ends -->
    </div><!--/#content.col-md-0-->
<?php } ?>
</div><!--/fluid-row-->
<?php if (!isset($no_visible_elements) || !$no_visible_elements) { ?>

    <!-- Ad, you can remove it -->
    <!-- Ad ends -->

    <hr>

    <footer class="row">
        <p class="col-md-12 col-sm-12 col-xs-12 copyright"><a href="" target="_blank">All rights reserved</a> 2018-<?php echo date('Y') ?></p>
    </footer>

    <div class="clearfix"></div><br>    
        <div class="clearfix"></div><br>
<?php } ?>

</div><!--/.fluid-container-->

<!-- external javascript -->

<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- library for cookie management -->
<script src="js/jquery.cookie.js"></script>
<!-- calender plugin -->
<script src='bower_components/moment/min/moment.min.js'></script>
<script src='bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
<!-- data table plugin -->
<script src='js/jquery.dataTables.min.js'></script>

<!-- select or dropdown enhancer -->
<script src="bower_components/chosen/chosen.jquery.min.js"></script>
<!-- plugin for gallery image view -->
<script src="bower_components/colorbox/jquery.colorbox-min.js"></script>
<!-- notification plugin -->
<script src="js/jquery.noty.js"></script>
<!-- library for making tables responsive -->
<script src="bower_components/responsive-tables/responsive-tables.js"></script>
<!-- tour plugin -->
<script src="bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
<!-- star rating plugin -->
<script src="js/jquery.raty.min.js"></script>
<!-- for iOS style toggle switch -->
<script src="js/jquery.iphone.toggle.js"></script>
<!-- autogrowing textarea plugin -->
<script src="js/jquery.autogrow-textarea.js"></script>
<!-- multiple file upload plugin -->
<script src="js/jquery.uploadify-3.1.min.js"></script>
<!-- history.js for cross-browser state change on ajax -->
<script src="js/jquery.history.js"></script>
<!-- application script for Charisma demo -->
<script src="js/charisma.js"></script>

<?php //Google Analytics code for tracking my demo site, you can remove this.
if ($_SERVER['HTTP_HOST'] == 'usman.it') {
    ?>
    <script>
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-26532312-1']);
        _gaq.push(['_trackPageview']);
        (function () {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ga);
        })();
    </script>
<?php } ?>

</body>
</html>
