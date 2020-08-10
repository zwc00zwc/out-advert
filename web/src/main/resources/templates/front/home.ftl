<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advertising</title>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vant@2.9/lib/vant.min.js"></script>
    <link rel="icon" href="${request.getContextPath()}/image/logo.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/vant@2.9/lib/index.css" />
    <style>
        html, body, #app{
            width:100%;
            height: 100%;
        }
       
        .van-swipe__indicator{
            width: 19px;
            border-radius: 0;
            height: 3px;
        }
        .footer{
            width:100vw;
            background:linear-gradient(135deg,rgba(40,158,251,1) 0%,rgba(16,41,122,1) 100%);
            padding-top: 35px;
            padding-bottom:12px;
        }
        .cooperation{
            display:flex;
            justify-content:space-around;
         }
         .cooperation-item{
             display:flex;
             align-items:center;
             flex-direction: column;
         }
         .cooperation-label{
            font-size:14px;
            font-family:PingFangSC-Regular,PingFang SC;
            font-weight:400;
            color:rgba(255,255,255,1);
            margin-top:11px;
         }
         .footer-cooperation-phone{
            margin-top: 31px;
            text-align: center;
            font-size:16px;
            font-family:PingFangSC-Semibold,PingFang SC; 
            font-weight:600;
            color: #fff;
            letter-spacing:2px;
         }
         .line{
            height:1px;
            background:rgba(216,216,216,1);
            opacity:0.35;
         }
         .item{
            z-index: 10;
             text-align: center;
             position: relative;
         }
         .title{
            font-size:22px;
            font-family:PingFangSC-Semibold,PingFang SC;
            font-weight:600;
            color:rgba(11,28,56,1);
            display:inline-block;
            position: relative;
         }
         .title:before{
             content:'';
             position: absolute;
             bottom:-7px;
             left: 50%;
             margin-left:-10px;
             text-align:center;
             width:20px;
             height: 3px;
             background:rgba(30,177,237,1);
         }
         .service-item{
             display:flex;
             flex-wrap: wrap; 
             justify-content: space-around;
             padding:0 16px;
             margin-top: 24px;
         }
         .service-item-image{
             width:30%;
         }
         .service-item-image-cooperation{
             width:23%
         }
         .case-first{
             display:flex;
             align-items:center;
             justify-content:space-between;
             margin-top:24px;
             padding:0 16px;
         }
         .column{
             position: relative;
             width:164px;
             height: 164px;
         }
         .column-image{
             width:100%;
             position:absolute;
             bottom:0;
             left: 0;
             right: 0;
         }
         .row{
             margin:0 16px;
             height: 172px;
             position: relative;
             margin-top: 16px;
         }
         .row-image{
             height: 100%;
             position: absolute;
             right: 0;
             bottom: 0;
             top: 0;
         }
         .column-case-img{
             width: 100%;
             height: 100%;
         }
         .bg{
            padding:60px 0;
            position: relative;
         }
         .bg1{
           
             position: absolute;
             top: -30px;
             width: 100%;
             height: 250px;
         }
         .bg2{
            position: absolute;
            top: 185px;
            width: 55%;
            height: 400px;
            left: 0;
            z-index: 1;
         }
         .bg3{
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            width: 100%;
         }
    </style>
</head>
<body>
    <div id="app">
        <van-swipe class="my-swipe" :autoplay="3000" indicator-color="white" >
            <van-swipe-item style="height:38.11vh;" v-for="image in swipeList">
                <van-image style='height:100%;'  :src="image.src" />
            </van-swipe-item>
        </van-swipe>
        <div class="bg">
            <img src='${request.getContextPath()}/image/右1.png' class="bg1"/>
            <div class="item">
                <div class="title">服务项目</div>
                <div class="service-item">
                    <img src="${request.getContextPath()}/image/服务项目1.png" href="${request.getContextPath()}/list"  class='service-item-image'/>
                    <img src="${request.getContextPath()}/image/服务项目2.png" href="${request.getContextPath()}/list" class='service-item-image' style='margin: 0 8px'/>
                    <img src="${request.getContextPath()}/image/服务项目3.png" href="${request.getContextPath()}/list" class='service-item-image'/>
                    <img src="${request.getContextPath()}/image/服务项目4.png" href="${request.getContextPath()}/list" class='service-item-image'  style='margin-top:8px'/>
                    <img src="${request.getContextPath()}/image/服务项目5.png" href="${request.getContextPath()}/list" class='service-item-image' style='margin: 0 8px;margin-top:8px' />
                    <img src="${request.getContextPath()}/image/服务项目6.png" href="${request.getContextPath()}/list" class='service-item-image' style='margin-top:8px'/>
                </div>

            </div>
            <img src='./image/左.png' class="bg2"/>
            <div class="item" style='margin-top:60px;'>
                <div class="title">案例展示</div>
                <div class="case-first">
                    <div class="column">
                        <#if topleftProduct??>
                            <img class="column-case-img" src="${topleftProduct.thumbnail!''}" />
                        <#else>
                            <img class="column-case-img" src="" />
                        </#if>
                        <img src="./image/案例展示1.png" class='column-image'/>
                    </div>
                    <div class="column">
                        <#if toprightProduct??>
                            <img src="${toprightProduct.thumbnail!''}"  class="column-case-img"/>
                            <#else>
                                <img src=""  class="column-case-img"/>
                        </#if>
                        <img src="./image/案例展示2.png" class='column-image'/>
                    </div>
                </div>
                <div class='row'>
                    <#if upfirstProduct??>
                        <img src="${upfirstProduct.thumbnail!''}" class="column-case-img"/>
                        <#else>
                            <img src="" class="column-case-img"/>
                    </#if>
                    <img src="./image/案例展示3.png" class='row-image'/>
                </div>
                <div class='row'>
                    <#if upsecondProduct??>
                        <img src="${upsecondProduct.thumbnail!''}" class="column-case-img"/>
                    <#else>
                        <img src="" class="column-case-img"/>
                    </#if>
                    <img src="./image/案例展示4.png" class='row-image'/>
                </div>
                <div class='row'>
                    <#if upthirdProduct??>
                        <img src="${upthirdProduct.thumbnail!''}" class="column-case-img"/>
                    <#else>
                        <img src="" class="column-case-img"/>
                    </#if>
                    <img src="./image/案例展示5.png" class='row-image'/>
                </div>

            </div>
            <div class="item" style="padding-top: 60px;">
                <div class="title">合作客户</div>
                <div class="service-item" >
                    <img src="${request.getContextPath()}/image/合作客户1.png" class='service-item-image service-item-image-cooperation'/>
                    <img src="${request.getContextPath()}/image/合作客户2.png" class='service-item-image service-item-image-cooperation' />
                    <img src="${request.getContextPath()}/image/合作客户3.png" class='service-item-image service-item-image-cooperation'/>
                    <img src="${request.getContextPath()}/image/合作客户4.png" class='service-item-image service-item-image-cooperation' />
                    <img src="${request.getContextPath()}/image/合作客户5.png" class='service-item-image service-item-image-cooperation' style='margin-top:16px' />
                    <img src="${request.getContextPath()}/image/合作客户6.png" class='service-item-image service-item-image-cooperation' style='margin-top:16px'/>
                    <img src="${request.getContextPath()}/image/合作客户7.png" class='service-item-image service-item-image-cooperation' style='margin-top:16px'/>
                    <img src="${request.getContextPath()}/image/合作客户8.png" class='service-item-image service-item-image-cooperation' style='margin-top:16px'/>
                </div>
            </div>
            <img src='${request.getContextPath()}/image/右2.png' class="bg3"/>

        </div>
        <div class="footer">
            <div class="cooperation">
                <div class="cooperation-item">
                    <img src="${request.getContextPath()}/image/商务合作1.png" style='width: 8.53vw;'/>
                    <div class="cooperation-label">预约演示</div>
                </div>
                <div class="cooperation-item">
                    <img src="${request.getContextPath()}/image/商务合作2.png" style='width: 8.53vw;'/>
                    <div class="cooperation-label">价格咨询</div>

                </div>
                <div class="cooperation-item">
                    <img src="${request.getContextPath()}/image/商务合作3.png" style='width: 8.53vw;'/>
                    <div class="cooperation-label">资源合作</div>
                </div>
            </div>
            <div class='footer-cooperation-phone'>商务合作请致电</div>
            <div class='footer-cooperation-phone' style='margin-top:10px;margin-bottom: 31px;font-size: 24px;'>400-999-999</div>
            <div class='line'></div>
            <div class='footer-cooperation-phone' style='font-weight:300;font-size:12px;margin-top: 12px;'>COPYRIGHT@2013-2020 版权所属</div>
            <div class='footer-cooperation-phone' style='font-weight:300;font-size:12px;margin-top: 8px;'>浙江投户外联盟浙江ICP204716号-2</div>
        </div>
    </div>
    <script>
        var vm = new Vue({
            el: '#app',
            data:{
                swipeList:[
                    {
                        src: './image/banner.png'
                    },
                   
                ],
                cases:[
                    {

                    },
                    {

                    },
                    {

                    },
                    {

                    },
                    {

                    },
                   
                ]
            }
        })
    </script>
</body>
</html>