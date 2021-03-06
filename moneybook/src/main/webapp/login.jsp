<%@ page contentType="text/html; charset=UTF-8"%>

<html>
  
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>MoneyBook</title>
    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/css/stylish-portfolio.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
    rel="stylesheet" type="text/css">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements
    and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file://
    -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
   
    
    
    
  </head>
  
  <body>
    <!-- Navigation -->
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
    <nav id="sidebar-wrapper">
      <ul class="sidebar-nav">
        <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
        <li class="sidebar-brand">
          <a href="#top" onclick="$(&quot;#menu-close&quot;).click();">Start MoneyBook</a>
        </li>
        <li>
          <a href="#home" onclick="$(&quot;#menu-close&quot;).click();">Home</a>
        </li>
        <li>
          <a href="#about" onclick="$(&quot;#menu-close&quot;).click();">About</a>
        </li>
        <li>
          <a href="#services" onclick="$(&quot;#menu-close&quot;).click();">Services</a>
        </li>
        <li>
          <a href="#portfolio" onclick="$(&quot;#menu-close&quot;).click();">Portfolio</a>
        </li>
        <li>
          <a href="#contact" onclick="$(&quot;#menu-close&quot;).click();">Contact</a>
        </li>
      </ul>
    </nav>
    <!-- Header -->
    <header id="top" class="header">
      <div class="text-vertical-center">
        <div class="row">
          <div class="col-md-4"></div>
          <div class="col-md-4">
            <fieldset>
              <!-- Form Name -->
              <legend>
                <b>LOGIN</b>
              </legend>
              <form id="loginOk" class="form-horizontal" method="post" action="./loginOk.do" >
                <div class="form-group has-feedback">
                  <label class="col-lg-1 control-label" for="InputId">ID</label>
                  <input type="text" class="form-control" id="InputId" placeholder="ID"
                  name="mId">
                </div>
                <div class="form-group has-feedback">
                  <label class="col-md-1 control-label" for="InputPassword">Password</label>
                  <input type="password" class="form-control" id="InputPassword"
                  placeholder="Password" name="mPw">
                </div>
                <div class="form-group">
                  <button type="submit" class="btn btn-block btn-default" >Sign in</button>
                </div>
              </form>
              <div class="help-block text-right">
                <a href="./passwdMail.do">Forget the password ?</a>
              </div>
              <div class="bottom text-center">New here ?
                <a href="${pageContext.request.contextPath}/member/join.do"><b>Join
                  Us</b></a>
              </div>
            </fieldset>
          </div>
          <div class="col-md-4"></div>
        </div>
      </div>
    </header>
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.min.js"></script>
    <script>
      // Closes the sidebar menu
      $("#menu-close").click(function(e) {
          e.preventDefault();
          $("#sidebar-wrapper").toggleClass("active");
      });
      // Opens the sidebar menu
      $("#menu-toggle").click(function(e) {
          e.preventDefault();
          $("#sidebar-wrapper").toggleClass("active"); 
      });
      // Scrolls to the selected menu item on the page
      $(function() {
          $('a[href*=#]:not([href=#],[data-toggle],[data-target],[data-slide])').click(function() {
              if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {
                  var target = $(this.hash);
                  target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                  if (target.length) {
                      $('html,body').animate({
                          scrollTop: target.offset().top
                      }, 1000);
                      return false;
                  }
              }
          });
      });
      //#to-top button appears after scrolling
      var fixed = false;
      $(document).scroll(function() {
          if ($(this).scrollTop() > 250) {
              if (!fixed) {
                  fixed = true;
                  // $('#to-top').css({position:'fixed', display:'block'});
                  $('#to-top').show("slow", function() {
                      $('#to-top').css({
                          position: 'fixed',
                          display: 'block'
                      });
                  });
              }
          } else {
              if (fixed) {
                  fixed = false;
                  $('#to-top').hide("slow", function() {
                      $('#to-top').css({
                          display: 'none'
                      });
                  });
              }
          }
      });
      // Disable Google Maps scrolling
      // See http://stackoverflow.com/a/25904582/1607849
      // Disable scroll zooming and bind back the click event
      var onMapMouseleaveHandler = function(event) {
          var that = $(this);
          that.on('click', onMapClickHandler);
          that.off('mouseleave', onMapMouseleaveHandler);
          that.find('iframe').css("pointer-events", "none");
      }
      var onMapClickHandler = function(event) {
              var that = $(this);
              // Disable the click handler until the user leaves the map area
              that.off('click', onMapClickHandler);
              // Enable scrolling zoom
              that.find('iframe').css("pointer-events", "auto");
              // Handle the mouse leave event
              that.on('mouseleave', onMapMouseleaveHandler);
          }
          // Enable map zooming with mouse scroll when the user clicks the map

   $(document).ready(function() {
      $('#login').bootstrapValidator({
         fields : {
            mId : {
               validators : {
                  notEmpty : {
                     message : 'ID를 입력하세요.'
                  }
               }
            },
            mPw : {
               validators : {
                  notEmpty : {
                     message : '비밀번호를 입력하세요.'
                  }
               }  
            }

         }
      });
   })
    </script>
  </body>

</html>