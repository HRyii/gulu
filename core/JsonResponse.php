<?php

namespace core;

use think\Session;
use think\response\Json;
use core\traits\FlashWith;

class JsonResponse extends Json
{
    use FlashWith;
}
