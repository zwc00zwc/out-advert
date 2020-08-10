<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0">
    <title>Advertising</title>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vant@2.9/lib/vant.min.js"></script>
    <link rel="icon" href="./image/logo.png">
    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/vant@2.9/lib/index.css" />
    <style>
        .my-swipe{
            position: relative;
        }
        .my-swipe .van-swipe-item {
          color: #fff;
          font-size: 20px;
          line-height: 150px;
          text-align: center;
          background-color: #39a9ed;
        }
        .custom-indicator{
            position: absolute;
            bottom:4.4vw;
            right: 4vw;
            width:44px;
            height:16px;
            background:rgba(0,0,0,0.4);
            border-radius:3px;
            text-align: center;
            font-size:12px;
            font-family:PingFangSC-Regular,PingFang SC;
            font-weight:400;
            color:rgba(255,255,255,1);
            line-height:14px;
        }
        .content{
            background:rgba(245,247,250,1);
        }
        .top{
            padding:20px 16px;
            background:#fff;
        }
        .title{
            font-size:20px;
            font-family:PingFangSC-Medium,PingFang SC;
            font-weight:600;
            color:rgba(11,28,56,1);
            line-height:28px;
        }
        .price{
            color: #FF6305;
            font-size: 24px;
            font-weight:500;
            margin-top:16px;
        }
        .unit{
            font-size: 16px;
        }
        .center, .frequency, .footer{
            margin-top:7px;
            background:#fff;
            padding:20px 16px;

        }
        .form-item{
            margin-bottom:12px;
            display: flex;
        }
        label{
            font-size:13px;
            font-weight:400;
            color:rgba(141,153,166,1);
            width:13.87vw;
        }
        .form-item-content{
            margin-left: 6.4% ;
            color: #0B1C38;
            font-size: 13px;
            font-family:PingFangSC-Regular,PingFang SC;
        }
        .frequency{
            display:flex;
            align-items:center;
            justify-content:space-around;
        }
        .active{
            background:linear-gradient(135deg,rgba(0,164,232,1) 0%,rgba(0,116,185,1) 100%) !important;
            color: #FFFFFF !important;
        }
        .footer{
            background:#F5F7FA;
            color: #8D99A6;

        }
        .footer-title{
            font-size:14px;
            font-family:PingFangSC-Medium,PingFang SC;
            font-weight:500;
        }
        .footer-content{
            font-size:12px;
            font-family:PingFangSC-Regular,PingFang SC;
            font-weight:400;
            line-height:16px;
            margin-top:12px;
        }
      </style>
</head>
<body>
    <div id='app' class='scroll-hide'>
        <van-swipe class="my-swipe" :autoplay="3000" indicator-color="white" @change="onChange">
            <van-swipe-item style="height:100vw;" v-for="image in swipeList">
                <#if product.showPicList?exists>
                    <#list product.showPicList?keys as k>
                        <van-image style='height:100%;'  :src="image.src || '${product.showPicList[k]!''}'" />
                    </#list>
                </#if>
            </van-swipe-item>
            <template #indicator>
                <div class="custom-indicator">
                  {{ current + 1 }}/ {{swipeList.length}}
                </div>
              </template>
        </van-swipe>
        <div class="content">
            <div class="top">
                <div class="title">${product.name!''}</div>
                <div class='price'><span class='unit'>¥</span> 4000/月</div>
            </div>
            <div class='center'>
                <div class="form-item" v-for='item in formItem' :key='item.label' :style='item.style'>
                    <label>{{item.label}}</label>
                    <div class='form-item-content' >{{item.value}}</div>
                </div>
            </div>
            <div class="frequency">
                <van-button  style="min-width: 27.73vw;border-radius:6px;background:#F5F7FA;border: none;color: #8D99A6;font-size: 16px;" :class="{'active':frequencySelect == 1}" @click="handleFrequency('1')">10s/次</van-button>
                <van-button  style="min-width: 27.73vw;border-radius:6px;background:#F5F7FA;border: none;color: #8D99A6;font-size: 16px;" :class="{'active':frequencySelect == 2}" @click="handleFrequency('2')">15s/次</van-button>
                <van-button  style="min-width: 27.73vw;border-radius:6px;background:#F5F7FA;border: none;color: #8D99A6;font-size: 16px;" :class="{'active':frequencySelect == 3}" @click="handleFrequency('3')">30s/次</van-button>
            </div>
            <div class="footer">
                <div class="footer-title">
                    媒体介绍
                </div>
                <div class="footer-content">
                    占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字占位文字
                </div>
            </div>
        </div>
    </div>
    <script>
        var vm = new Vue({
            el: '#app',
            data: {
                name: '王深渊',
                current:0,
                frequencySelect:1,
                swipeList:[
                    {
                        src:''
                    },
                ],
            },
            computed:{
                formItem(){
                    let formItem = [
                        {
                            label: '参数',
                            value: '2.2*3.2'
                        },
                        {
                            label: '编号',
                            value: '6000001452'
                        },
                        {
                            label: '媒体位置',
                            value: '位置位置位置'
                        },
                        {
                            label: '时间',
                            value: '8:00-22:00 商业氛围 农村'
                        },
                        {
                            label: '人流量',
                            value: '3万人/天 车位置',
                            style: 'margin-bottom:0px;'
                        }
                    ]
                    return formItem
                }
            },
            methods: {
                onChange(current){
                    this.current = current 
                },
                handleFrequency(frequency){
                    this.frequencySelect = frequency
                }
            }
        })
    </script>
</body>
</html>