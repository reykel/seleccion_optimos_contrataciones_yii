<?php 
	class EmailCommand extends CConsoleCommand{ 
		public function run($args){ 
			echo "OK for ".$args[0]." and also for ".$args[1];
		}
	}
?> 