{extend name="../core/view/common/page.tpl" /} {block name="title"}申请公司 {/block} {block name="content"}
<div class="wrapper wrapper-content animated fadeInRight">
    {present name='error'}
    <div class="alert alert-error alert-dismissable">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button> {$error['text']}
    </div>
    {/present}
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox">
                <div class="ibox-title">
                    <h5>申请公司</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="form_wizard.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="form_wizard.html#">选项1</a>
                            </li>
                            <li><a href="form_wizard.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <form id="commentForm" action="" method="post" class="wizard-big apply" enctype="multipart/form-data">
                        <h1>注册账户</h1>
                        <fieldset>
                            <h2>账户信息</h2>
                            <div class="row">
                                <div class="col-sm-8">
                                    <div class="form-group">
                                        <label><span class="required" style="color:red;margin-right:5px;">*</span>用户名</label>
                                        <input id="userName" name="userName" type="text" class="form-control required">
                                    </div>
                                    <div class="form-group">
                                        <label><span class="required" style="color:red;margin-right:5px;">*</span>密码</label>
                                        <input id="password" name="password" type="password" class="form-control required">
                                    </div>
                                    <div class="form-group">
                                        <label><span class="required" style="color:red;margin-right:5px;">*</span>确认密码</label>
                                        <input id="confirm" name="confirm" type="password" class="form-control required">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="text-center">
                                        <div style="margin-top: 20px">
                                            <i class="fa fa-sign-in" style="font-size: 180px;color: #e5e5e5 "></i>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </fieldset>
                        <h1>填写公司资料</h1>
                        <fieldset>
                            <div class="row">
                                <h1 style="margin-left:2%;">公司信息</h1>
                                <fieldset>
                                    <div class="col-sm-12" style="margin-top: 1%;">
                                        <div class="form-group company">
                                            <label><span class="required" style="color:red;margin-right:5px;">*</span>公司全称</label>
                                            <input type="text" class="form-control" name="company" required="" aria-required="true">
                                        </div>
                                        <div class="form-group company">
                                            <label>公司地址 *</label>
                                            <div id="cs" data-names="province-city-district"></div>
                                            <input type="text" placeholder="填写具体地址" class="form-control" name="address" required="" aria-required="true" style="float:left;width:40%;">
                                        </div>
                                        <div style="clear:both;"></div>
                                        <div class="form-group company">
                                            <label><span class="required" style="color:red;margin-right:5px;">*</span>公司人数</label>
                                            <div class="input-group m-b" style="margin-bottom:0;">
                                                <input type="number" class="form-control" name="people" value="0" required="" aria-required="true"> <span class="input-group-addon">人</span>
                                            </div>
                                        </div>
                                        <div class="form-group company">
                                            <label><span class="required" style="color:red;margin-right:5px;">*</span>公司负责人</label>
                                            <input type="text" class="form-control" name="charger" required="" aria-required="true">
                                        </div>
                                        <div class="form-group company">
                                            <label><span class="required" style="color:red;margin-right:5px;">*</span>公司负责人手机号码</label>
                                            <input type="number" class="form-control" id="charger_phone" name="charger_phone" size="11" maxlength="11" required="" aria-required="true">
                                        </div>
                                        <div class="form-group company">
                                            <label><span class="required" style="color:red;margin-right:5px;">*</span>公司营业执照号码</label>
                                            <input type="number" class="form-control" name="business_number" size="50" maxlength="50" required="" aria-required="true">
                                        </div>
                                        <div class="form-group company">
                                            <label><span class="required" style="color:red;margin-right:5px;">*</span>公司营业执照证件</label>
                                            <input type="file" name="business_pic" required="" aria-required="true">
                                        </div>
                                        <div class="form-group company">
                                            <label><span class="required" style="color:red;margin-right:5px;">*</span>公司LOGO</label>
                                            <input type="file" name="logo" required="" aria-required="true">
                                        </div>
                                        <div class="form-group company">
                                            <label><span class="required" style="color:red;margin-right:5px;">*</span>送餐时间</label>
                                            <div class="input-group clockpicker">
                                                <input type="text" class="form-control" value="09:30" name="delivery_time" required="" aria-required="true">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
                                            <script type="text/javascript">
                                                $('.clockpicker').clockpicker({
                                                    placement: 'top',
                                                    align: 'left',
                                                    donetext: '完成'
                                                });
                                            </script>
                                        </div>
                                    </div>
                            </div>
                            </fieldset>
                            <h1>完成</h1>
                            <fieldset>
                                <h2>条款</h2>
                                <div style="overflow: auto;overflow-y: scroll;height: 376px;background: #fff;padding: 20px;border-radius: 5px;">
                                    <div class="news-content">
                                        <h2>尊敬的用户：</h2>
                                        <p>在此列明以下服务条款，详述了您使用本网站的服务所须遵守的条款和条件，请您在使用“饭时咕噜”或加入会员之前仔细阅读。</p>
                                        <h2>服务条款：</h2>
                                        <p>尊重及保护会员隐私是“我的顺丰”的一项基本政策，会员同意“我的顺丰”按以下条款所列明的用途，使用会员的资料。</p>
                                        <ul>
                                            <li>
                                                <p>1、“我的顺丰”保证一定不会在未经会员同意授权的情况下公开、编辑及透漏会员的个人信息，但下列情况除外：</p>
                                                <ul>
                                                    <li>
                                                        <p>（1）获得会员的明确授权；</p>
                                                    </li>
                                                    <li>
                                                        <p>（2）根据有关的法律法规要求；</p>
                                                    </li>
                                                    <li>
                                                        <p>（3）按照相关政府主管部门的要求；</p>
                                                    </li>
                                                    <li>
                                                        <p>（4）为维护社会公众的利益；</p>
                                                    </li>
                                                    <li>
                                                        <p>（5）为维护顺丰速运的合法权益。</p>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <p>2、用户名和密码</p>
                                                <p>当用户注册成为“我的顺丰”的会员并设置密码后，用户能通过密码来使用会员账号，如果泄漏了密码，则可能会丢失用户的个人识别信息，并且有可能导致对用户不利的司法行为。因此不管任何原因使密码安全受到危及，用户应该立即与“我的顺丰”取得联系。</p>
                                            </li>
                                            <li>
                                                <p>3、修改会员资料</p>
                                                <p>在成功注册为会员，并设置相应密码后，用户可以登录“我的顺丰”网站更新个人信息。</p>
                                            </li>
                                            <li>
                                                <p>4、下单资料</p>
                                                <p>当会员在“我的顺丰”下单时，需要会员提供真实、准确、完整的资料如寄送地址、托寄物资料、联系人、联系电话、付款方式等信息，可以让本网站能处理运单以及运单状态。</p>
                                            </li>
                                            <li>
                                                <p>5、会员电子邮件/短信</p>
                                                <ul>
                                                    <li>
                                                        <p>（1）“我的顺丰”保留通过电子邮件、手机短信、邮寄宣传册等形式，对本网站注册会员发送信息、活动等告知服务的权利。如果用户在“我的顺丰”注册，表明用户已默示同意接受此项服务。</p>
                                                    </li>
                                                    <li>
                                                        <p>（2）如果会员不想收到相关的通讯，可以向“我的顺丰”提出退阅申请，并注明E-mail地址、手机号或相关地址信息，“我的顺丰”会在收到申请后为会员办理退阅。</p>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <p>6、下单行为</p>
                                                <p>“我的顺丰”跟踪IP地址仅仅只是为了安全的必要。如果没有发现任何安全问题，将及时删除本网站收集到的IP地址。网站会跟踪全天的页面访问数据。全天页面访问数据被用来反映网站的流量，“我的顺丰”可以为未来的发展制定计划（例如，增加服务器）。</p>
                                            </li>
                                            <li>
                                                <p>7、第三方</p>
                                                <p>“我的顺丰”不会向任何第三方提供、出售、出租、分享和交易会员的个人信息，除非第三方和“我的顺丰”一起为网站和用户提供服务并且在该服务结束后会将被禁止访问包括其以前能够访问的所有这些资料。当“我的顺丰”被法律强制或依照政府要求提供会员的信息时本网站将善意地披露会员的资料。</p>
                                            </li>
                                            <li>
                                                <p>8、信息的存储和交换</p>
                                                <p>会员信息和资料被收集和存储在放置于中国的服务器上。只有为了做备份的需要时，“我的顺丰”才可能需要将会员的资料传送到别国的服务器上。</p>
                                            </li>
                                            <li>
                                                <p>9、外部链接</p>
                                                <p>当会员点选其他网站链接或广告时，会进入第三者的网站，“我的顺丰”对那些网站的隐私保护措施不负任何责任。</p>
                                            </li>
                                            <li>
                                                <p>10、安全</p>
                                                <p>“我的顺丰”有相应的安全措施来确保本网站掌握的信息不丢失、不被滥用和编造。这些安全措施包括向其它服务器备份数据和对会员密码加密。尽管本网站有这些安全措施，但请注意在因特网上不存在"完善的安全措施"。“我的顺丰”保留在任何时间拒绝履行任何有疑问或被怀疑有信用欺诈嫌疑的下单。</p>
                                            </li>
                                        </ul>
                                        <h3>六、知识产权声明</h3>
                                        <ul>
                                            <li>
                                                <p>1、“我的顺丰”网站内所有内容，包括所有文字、图片、图形、音频、视频等都是本网站财产，均受版权、商标和其它财产所有权法律的保护。未经本网站同意，任何企业或个人均无权复制、下载、传输、再造本网站任何内容，也不得提供给第三者使用，否则应负所有法律责任。违反上述声明而给本公司造成损失的，本公司将依法追究其法律责任。</p>
                                            </li>
                                            <li>
                                                <p>2、“我的顺丰”为提供下单及查询服务而使用的任何软件（包括但不限于软件中所含的任何图像、照片、动画、录像、录音、音乐、文字和附加程序、随附的帮助材料）的一切权利均属于该软件的著作权人，未经该软件的著作权人许可，用户不得对该软件进行反向工程（reverse engineer）、反向编译（decompile）或反汇编（disassemble）。</p>
                                            </li>
                                        </ul>
                                        <h3>七、免责声明</h3>
                                        <ul>
                                            <li>
                                                <p>1、用户明确同意使用“我的顺丰”下单及查询服务所存在的风险及产生的一切后果将完全由用户自己承担。</p>
                                            </li>
                                            <li>
                                                <p>2、“我的顺丰”不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性、安全性、出错发生均不作担保。</p>
                                            </li>
                                            <li>
                                                <p>3、“我的顺丰”有义务在技术上保证本网站的正常运行，而对于因不可抗力或本网站不能控制的原因造成的下单及查询服务中断或其它缺陷，“我的顺丰”不承担任何责任，但本网站会尽力协助处理以减少因此给用户造成的损失和影响。</p>
                                            </li>
                                            <li>
                                                <p>4、由于用户自己将会员密码告知他人、与他人共享注册账户、转借或出让账户给他人使用，由此导致任何个人信息的泄露、快件损失等损失由会员自行承担，“我的顺丰”及顺丰速运无需承担任何责任。</p>
                                            </li>
                                            <li>
                                                <p>5、由于用户向“我的顺丰”提供错误、不完整、不实信息等造成不能正常使用本网站服务或遭受任何其他损失，“我的顺丰”无需承担任何责任。</p>
                                            </li>
                                            <li>
                                                <p>6、“我的顺丰”不担保所有由顺丰速运发出的短信不会发生遗失或未送达。由于短信运营商网络运转不正常，天灾人祸、战争等原因造成网络瘫痪或者接收短信的用户手机网络通道不畅通等不可抗力因素，而导致短信无法即时、准确地送达用户，顺丰速运无须承担相应责任。</p>
                                            </li>
                                            <li>
                                                <p>7、“我的顺丰”网站及其内容是在现有资料的基础上提供，“我的顺丰”只提供下单及查询服务，因此本网站并不会因网站内容所引起的任何损失而作直接、间接、意外、衍生性的及惩罚性的损害赔偿 （包括金钱利益及无形的损失）及负上法律责任（除了法律上已隐含的条例）。</p>
                                            </li>
                                            <li>
                                                <p>8、“我的顺丰”会提供其他网站的链接，这些链接的网站并非由“我的顺丰”控制，故不对该网站的内容、其链接网站的内容及其内容的更新及转变承担任何责任，这些网站的使用及内容也不代表“我的顺丰”的立场。</p>
                                            </li>
                                            <li>
                                                <p>9、您注册时的手机号码是会员身份的唯一标识，如手机号码有变动，请及时修改。如因用户自身原因未及时修改手机号而造成的账号被盗、个人信息泄露等损失，“我的顺丰”将不承担相关责任，但本网站会尽力协助用户处理以减少因此给用户造成的影响。</p>
                                            </li>
                                        </ul>
                                        <h3>八、通告</h3>
                                        <p>“我的顺丰”会通过网页公告或电子邮件或手机短信传送等方式，把通告传送给用户，该等通告于发送之日即视为已送达收件人。</p>
                                        <h3>九、违约赔偿及责任限制</h3>
                                        <ul>
                                            <li>
                                                <p>1、因用户违反有关法律、法规或本网站的服务条款而令“我的顺丰”招致损失，用户同意承担由此造成的损害赔偿责任。</p>
                                            </li>
                                            <li>
                                                <p>2、用户同意“我的顺丰”不会为用户因使用本网站而招致的损失负上任何法律责任，也同意放弃追究“我的顺丰”任何赔偿。如果此项声明不适用于个别的例子，“我的顺丰”的责任不会超过用户在本网站下单所付出的金额。</p>
                                            </li>
                                        </ul>
                                        <h3>十、法律监管</h3>
                                        <ul>
                                            <li>
                                                <p>1、本协议的订立、执行和解释及争议的解决均应适用中国法律并受中国法院管辖。</p>
                                            </li>
                                            <li>
                                                <p>2、如发生“我的顺丰”服务条款与中国法律相抵触时，则这些条款将完全按法律规定重新解释，而其它合法条款则依旧保持对用户产生法律效力和影响。</p>
                                            </li>
                                            <li>
                                                <p>3、如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向深圳市福田区人民法院提起诉讼。</p>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <input id="acceptTerms" name="acceptTerms" type="checkbox" class="required" checked="">
                                <label for="acceptTerms">我同意注册条款</label>
                            </fieldset>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
{/block} {block name="js"}
{js href="/js/plugins/iCheck/icheck.min.js"}
{js href="/js/plugins/chosen/chosen.jquery.js"}
<script src="/js/jquery.min.js?v=2.1.4"></script>
<script src="/js/plugins/city/data.js"></script>
<script src="/js/plugins/city/cs.js"></script>

<!-- 全局js -->
<script src="/js/bootstrap.min.js?v=3.3.6"></script>
<!-- 自定义js -->
<script src="/js/content.js?v=1.0.0"></script>
<!-- Steps -->
<script src="/js/plugins/staps/jquery.steps.min.js"></script>
<!-- Jquery Validate -->
<script src="/js/plugins/validate/jquery.validate.min.js"></script>
<script src="/js/plugins/validate/messages_zh.min.js"></script>
<script src="/js/plugins/colorpicker/bootstrap-clockpicker.min.js"></script>
<script>
    $(document).ready(function() {
        $('.clockpicker').clockpicker();
        $("#wizard").steps();
        $("#commentForm").steps({
            bodyTag: "fieldset",
            onStepChanging: function(event, currentIndex, newIndex) {
                // Always allow going backward even if the current step contains invalid fields!
                if (currentIndex > newIndex) {
                    return true;
                }

                // Forbid suppressing "Warning" step if the user is to young
                if (newIndex === 3 && Number($("#age").val()) < 18) {
                    return false;
                }

                var form = $(this);
                // Clean up if user went backward before
                if (currentIndex < newIndex) {
                    // To remove error styles
                    $(".body:eq(" + newIndex + ") label.error", form).remove();
                    $(".body:eq(" + newIndex + ") .error", form).removeClass("error");
                }

                // Disable validation on fields that are disabled or hidden.
                form.validate().settings.ignore = ":disabled,:hidden";

                // Start validation; Prevent going forward if false
                return form.valid();
            },
            onStepChanged: function(event, currentIndex, priorIndex) {
                // Suppress (skip) "Warning" step if the user is old enough.
                if (currentIndex === 2 && Number($("#age").val()) >= 18) {
                    $(this).steps("next");
                }

                // Suppress (skip) "Warning" step if the user is old enough and wants to the previous step.
                if (currentIndex === 2 && priorIndex === 3) {
                    $(this).steps("previous");
                }
            },
            onFinishing: function(event, currentIndex) {
                var form = $(this);

                // Disable validation on fields that are disabled.
                // At this point it's recommended to do an overall check (mean ignoring only disabled fields)
                form.validate().settings.ignore = ":disabled";

                // Start validation; Prevent form submission if false
                return form.valid();
            },
            onFinished: function(event, currentIndex) {
                var form = $(this);
                // Submit form input
                var tel = document.getElementById('charger_phone').value;
                if(tel =="" || tel==null || form ==null){

                }else{
                    var reg = /^0?1[3|4|5|8][0-9]\d{8}$/;
                    if (reg.test(tel)) {
                        form.submit();
                    }else{
                          alert("手机号码不正确，请重新输入正确的手机号码！");
                          $('#form-t-1').click();
                    };
                }

            }
        }).validate({
            errorPlacement: function(error, element) {
                element.before(error);
            },
            rules: {
                confirm: {
                    equalTo: "#password"
                }
            }
        });
    });
</script>
<script src="/js/plugins/city/app.js"></script>
<script src="/js/plugins/clockpicker/clockpicker.js"></script>
{js href="/js/demo/form-validate-demo.js"}
{/block}
{/* TODO: 合并CSS */}
{block name="css"}
{css href="/js/plugins/clockpicker/clockpicker.css"}
{css href="/js/plugins/colorpicker/css/bootstrap-clockpicker.min.css"}
{css href="/css/plugins/toastr/toastr.min.css"}
{css href="/css/bootstrap.min.css"}
{css href="/css/font-awesome.css"}
{css href="/css/animate.css"}
{css href="/css/style.css"}
{css href="/css/plugins/steps/jquery.steps.css"}
{css href="/css/plugins/iCheck/custom.css"}
{css href="/css/plugins/chosen/chosen.css"}
{css href="/css/plugins/toastr/toastr.min.css"}
{css href="/js/plugins/layer/skin/layer.css"}
<style>
.help-block{
         margin-top: 0px !important;
}
li{
    list-style: none;
}
    .wizard>.content>.body {
        float: left;
        position: absolute;
        width: 95%;
        height: 95%;
        padding: 1%;
        font-size: 13px;
    }

    .alert-error {
        color: #f9f9f9;
        background-color: #ed5565;
        border-color: #ed5565;
    }

    .city {
        width: 20%;
    }

    .company {
        margin-bottom: 15px;
        float: left;
        width: 45%;
        margin-left: 2%;
    }

    .wizard>.steps>ul>li {
        width: 33%;
    }

    .wizard-big.wizard>.content {
        min-height: 550px;
        padding: 1%;
    }
</style>
{/block}
