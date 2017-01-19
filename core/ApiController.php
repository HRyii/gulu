<?php

namespace core;

abstract class ApiController
{
    public function json($data)
    {
        return new JsonResponse($data);
    }
}
