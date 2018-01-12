<%--
  Created by IntelliJ IDEA.
  User: 170904
  Date: 2018/1/10
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录界面</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/iconfont/favicon.ico"/>
    <link rel="bookmark" href="${pageContext.request.contextPath}/iconfont/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link href="${pageContext.request.contextPath}/iconfont/style.css" type="text/css" rel="stylesheet">
    <style>
        body{color:#fff; font-family:"微软雅黑"; font-size:14px;}
        .wrap1{position:absolute; top:0; right:0; bottom:0; left:0; margin:auto }/*把整个屏幕真正撑开--而且能自己实现居中*/
        .main_content{background:url(${pageContext.request.contextPath}/images/main_bg.png) repeat; margin-left:auto; margin-right:auto; text-align:left; float:none; border-radius:8px;}
        .form-group{position:relative;}
        .login_btn{display:block; background:#FFF; color:#000; font-size:15px; width:100%; line-height:50px; border-radius:3px; border:none; }
        .login_input{width:100%; height: 40px; border:1px solid #FFF; border-radius:3px; line-height:40px; padding:2px 5px 2px 30px; background:none;}
        .checkcode_input{width:50%; height: 45px; border:1px solid #FFF; border-radius:3px; line-height:40px; padding:2px 5px 2px 30px; background:none;}
        .icon_font{position:absolute; bottom:15px; left:10px; font-size:18px; color:#FFF;}
        .font16{font-size:16px;}
        .mg-t20{margin-top:20px;}
        @media (min-width:200px){.pd-xs-20{padding:20px;}}
        @media (min-width:768px){.pd-sm-50{padding:50px;}}
        #grad {
            background: -webkit-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Safari 5.1 - 6.0 */
            background: -o-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Opera 11.1 - 12.0 */
            background: -moz-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Firefox 3.6 - 15 */
            background: linear-gradient(#4990c1, #52a3d2, #6186a3); /* 标准的语法 */
        }
    </style>

</head>

<body style="background:url(${pageContext.request.contextPath}/images/命运2雪景.jpg) no-repeat;background-size:cover" onLoad="init()">
<div class="container wrap1" style="height:450px;" id="div1">
    <h2 class="mg-b20 text-center">MO玩</h2>
    <div class="col-sm-8 col-md-5 center-auto pd-sm-50 pd-xs-20 main_content">
        <p class="text-center font16">用户登录</p>
        <form>
            <div class="form-group mg-t20">
                <%--<i class="icon-user icon_font"></i>--%>
                <input type="email" class="login_input" id="Email1" placeholder="请输入用户名" />
            </div>
            <div class="form-group mg-t20">
                <%--<i class="icon-lock icon_font"></i>--%>
                <input type="password" class="login_input" id="Password1" placeholder="请输入密码" />
            </div>
            <div class="form-group mg-t20">
                <%--<i class="icon-lock icon_font"></i>--%>
                <span>
                    <input type="text" class="checkcode_input" id="checkcode" placeholder="验证码" />
                </span>
                <span style="text-align: center;">
                    <img src="${pageContext.request.contextPath}/login/checkcode" onclick="myRefersh(this)">
                </span>
            </div>
            <div class="checkbox mg-b25">
                <label>
                    <input type="checkbox" />记住我的登录信息
                </label>
                <label style="margin-left:50%">
                    <a href="regist.html">注册</a>
                </label>
            </div>
            <button class="login_btn"><h4 class="mg-b20"><a>登 录</a></h4></button>
        </form>
    </div><!--row end-->
</div><!--container end-->


<script type="text/javascript" src="${pageContext.request.contextPath}/js/ThreeCanvas.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Snow.js"></script>
<script type="text/javascript">
    var SCREEN_WIDTH = window.innerWidth;
    var SCREEN_HEIGHT = window.innerHeight;

    var container;

    var particle;

    var camera;
    var scene;
    var renderer;

    var mouseX = 0;
    var mouseY = 0;

    var windowHalfX = window.innerWidth / 2;
    var windowHalfY = window.innerHeight / 2;

    var particles = [];
    var particleImage = new Image();//THREE.ImageUtils.loadTexture( "img/ParticleSmoke.png" );
    particleImage.src = '${pageContext.request.contextPath}/images/ParticleSmoke.png';



    function init() {

        container = document.createElement('div');
        document.body.appendChild(container);

        camera = new THREE.PerspectiveCamera( 75, SCREEN_WIDTH / SCREEN_HEIGHT, 1, 10000 );
        camera.position.z = 1000;

        scene = new THREE.Scene();
        scene.add(camera);

        renderer = new THREE.CanvasRenderer();
        renderer.setSize(SCREEN_WIDTH, SCREEN_HEIGHT);
        var material = new THREE.ParticleBasicMaterial( { map: new THREE.Texture(particleImage) } );

        for (var i = 0; i < 500; i++) {

            particle = new Particle3D( material);
            particle.position.x = Math.random() * 2000 - 1000;
            particle.position.y = Math.random() * 2000 - 1000;
            particle.position.z = Math.random() * 2000 - 1000;
            particle.scale.x = particle.scale.y =  1;
            scene.add( particle );

            particles.push(particle);
        }

        container.appendChild( renderer.domElement );


        document.addEventListener( 'mousemove', onDocumentMouseMove, false );
        document.addEventListener( 'touchstart', onDocumentTouchStart, false );
        document.addEventListener( 'touchmove', onDocumentTouchMove, false );

        setInterval( loop, 1000 / 60 );

    }

    function onDocumentMouseMove( event ) {

        mouseX = event.clientX - windowHalfX;
        mouseY = event.clientY - windowHalfY;
    }

    function onDocumentTouchStart( event ) {

        if ( event.touches.length == 1 ) {

            event.preventDefault();

            mouseX = event.touches[ 0 ].pageX - windowHalfX;
            mouseY = event.touches[ 0 ].pageY - windowHalfY;
        }
    }

    function onDocumentTouchMove( event ) {

        if ( event.touches.length == 1 ) {

            event.preventDefault();

            mouseX = event.touches[ 0 ].pageX - windowHalfX;
            mouseY = event.touches[ 0 ].pageY - windowHalfY;
        }
    }

    //

    function loop() {

        for(var i = 0; i<particles.length; i++)
        {

            var particle = particles[i];
            particle.updatePhysics();

            with(particle.position)
            {
                if(y<-1000) y+=2000;
                if(x>1000) x-=2000;
                else if(x<-1000) x+=2000;
                if(z>1000) z-=2000;
                else if(z<-1000) z+=2000;
            }
        }

        camera.position.x += ( mouseX - camera.position.x ) * 0.05;
        camera.position.y += ( - mouseY - camera.position.y ) * 0.05;
        camera.lookAt(scene.position);

        renderer.render( scene, camera );


    }
    function myRefersh( e ) {

        const source = e.src ; // 获得原来的 src 中的内容
        //console.log( "source : " + source  ) ;

        var index = source.indexOf( "?" ) ;  // 从 source 中寻找 ? 第一次出现的位置 (如果不存在则返回 -1 )
        //console.log( "index : " + index  ) ;

        if( index > -1 ) { // 如果找到了 ?  就进入内部
            var s = source.substring( 0 , index ) ; // 从 source 中截取 index 之前的内容 ( index 以及 index 之后的内容都被舍弃 )
            //console.log( "s : " + s  ) ;

            var date = new Date(); // 创建一个 Date 对象的 一个 实例
            var time = date.getTime() ; // 从 新创建的 Date 对象的实例中获得该时间对应毫秒值
            e.src = s + "?time=" + time ; // 将 加了 尾巴 的 地址 重新放入到 src 上

            //console.log( e.src ) ;
        } else {
            var date = new Date();
            e.src = source + "?time=" + date.getTime();
        }

    }
</script>
</body>
</html>
