<#import "/layout/layout.ftl" as layout>
<@layout.layout>
    <article class="page-container">
        <form action="" method="post" class="form form-horizontal" id="form-index-set">
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>首页左上广告位：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <#if indexMap?exists>
                        <input type="text" class="input-text" value="${indexMap["topleft"]!''}" placeholder="" id="topleft" name="topleft">
                        <#else>
                            <input type="text" class="input-text" value="" placeholder="" id="topleft" name="topleft">
                    </#if>
                </div>
            </div>

            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>首页右上广告位：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <#if indexMap?exists>
                        <input type="text" class="input-text" value="${indexMap["topright"]!''}" placeholder="" id="topright" name="topright">
                    <#else>
                        <input type="text" class="input-text" value="" placeholder="" id="topright" name="topright">
                    </#if>
                </div>
            </div>

            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>竖排第一位广告位：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <#if indexMap?exists>
                        <input type="text" class="input-text" value="${indexMap["upfirst"]!''}" placeholder="" id="upfirst" name="upfirst">
                    <#else>
                        <input type="text" class="input-text" value="" placeholder="" id="upfirst" name="upfirst">
                    </#if>
                </div>
            </div>

            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>竖排第二位广告位：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <#if indexMap?exists>
                        <input type="text" class="input-text" value="${indexMap["upsecond"]!''}" placeholder="" id="upsecond" name="upsecond">
                    <#else>
                        <input type="text" class="input-text" value="" placeholder="" id="upsecond" name="upsecond">
                    </#if>
                </div>
            </div>

            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>竖排第三位广告位：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <#if indexMap?exists>
                        <input type="text" class="input-text" value="${indexMap["upthird"]!''}" placeholder="" id="upthird" name="upthird">
                    <#else>
                        <input type="text" class="input-text" value="" placeholder="" id="upthird" name="upthird">
                    </#if>
                </div>
            </div>

            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                    <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                </div>
            </div>
        </form>
    </article>
    <#include "/layout/footer.ftl">
    <script type="text/javascript" src="${request.getContextPath()}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
    <script type="text/javascript" src="${request.getContextPath()}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
    <script type="text/javascript" src="${request.getContextPath()}/lib/jquery.validation/1.14.0/messages_zh.js"></script>
    <script type="text/javascript" src="${request.getContextPath()}/js/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${request.getContextPath()}/js/jquery.iframe-transport.js"></script>
    <script type="text/javascript" src="${request.getContextPath()}/js/jquery.fileupload.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.skin-minimal input').iCheck({
                checkboxClass: 'icheckbox-blue',
                radioClass: 'iradio-blue',
                increaseArea: '20%'
            });

            $("#form-index-set").validate({
                rules: {
                    name: {
                        required: true,
                        minlength: 2,
                        maxlength: 16
                    },
                    // sex: {
                    //     required: true,
                    // },
                    // mobile: {
                    //     required: true,
                    //     isMobile: true,
                    // },
                    // email: {
                    //     required: true,
                    //     email: true,
                    // },
                    // uploadfile: {
                    //     required: true,
                    // },

                },
                onkeyup: false,
                focusCleanup: true,
                success: "valid",
                submitHandler: function (form) {
                    jQuery.ajax({
                        url: '/console/saveIndexSet',
                        data: jQuery('#form-index-set').serialize(),
                        type: "post",
                        success: function (data) {
                            if (data.success) {
                                window.parent.location.reload();
                            }
                            else {
                                layer.msg(data.errorDesc, { icon: 5, time: 2000 });
                            }
                        }
                    });
                }
            });
        });


    </script>
</@layout.layout>

