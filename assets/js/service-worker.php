<?php
header('Service-Worker-Allowed:/');
header('Content-type: application/javascript');
readfile('service-worker.js');