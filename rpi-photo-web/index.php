<html>

	<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href='http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
	<link rel="shortcut icon" href="favicon.ico" />
	<style type="text/css">
	body { background-image:url('background.png'); font: 13px/175% 'Noto Sans', sans-serif; }
	h1 { color: #999999; font: 39px 'Noto Sans', sans-serif; font-weight: 700; }
        h2 { color: #999999; font: 19px 'Noto Sans', sans-serif; font-weight: 700; }
        </style>

	<title>RPi Photo Web</title>
	
	</head>

	<body>
	
	<h1>RPi Photo Web</h1>
	
	<?php
	
	echo "<form action='index.php' method='post'>
			<select name='option'>
			<option value='--version'>Version</option>
			<option value='--help'>Help</option>
			<option value='--abilities'>Show camera's abilities</option>
			<option value='--list-config'>List configurable parameters</option>
			<option value='--capture-image-and-download --filename \"%Y%m%d-%H%M%S-%03n.%C\"'>Capture-Download-Rename</option>
			</select>
			<input type='submit' value='Run'/>
		</form>";
	
	$command='gphoto2 '.$_POST['option'];
	echo shell_exec("$command");
	echo "<br /><h2>Camera Summary</h2>";
	echo shell_exec("gphoto2 --summary");
	echo shell_exec("gphoto2 --reset");
	
	?>

	</body>
</html>

