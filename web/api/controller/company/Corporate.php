<?php

namespace web\api\controller\company;

use think\Request;
use core\ApiController;
use core\model\Company as CompanyModel;

class Corporate extends ApiController
{
    /**
     * @only = company_corporate_check
     */
     public function check(Request $request)
     {
         if ($request->isPost()) {
             $id = $request->post('id');
             $where['id'] = $id ;
             var_dump($request->get());die;
             $changeGoods = CompanyModel::get($id)->getData();
         }
     }
}
