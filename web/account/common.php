<?php

use think\Hook;
use web\account\behavior\LoginThrottle;

Hook::add('login_failed', LoginThrottle::class);
