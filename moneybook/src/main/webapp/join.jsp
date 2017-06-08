<%@ page contentType="text/html; charset=UTF-8"%>
<html>
  
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>MoneyBook</title>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/css/stylish-portfolio.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
    rel="stylesheet" type="text/css">
 
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
          <div class="col-md-2"></div>
          <div class="col-md-8">
            <fieldset>
              <!-- Form Name -->
              <form id="joinOk" class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/member/joinOk.do">
                <fieldset>
                  <!-- Form Name -->
                  <legend>
                    <b>Sign In</b>
                  </legend>
                  <!-- mId input-->
                  <div class="form-group has-feedback">
                    <label class="col-md-4 control-label" for="idinput">아이디</label>
                    <div class="col-md-3 inputGroupContainer">
                      <div class="input-group">
                        <span class="input-group-addon">
                          <i class="glyphicon glyphicon-info-sign"></i>
                        </span>
                        <input id="idinput" name="mId" placeholder="아이디" class="form-control input-md"
                        type="text" pattern="^[_A-z0-9]{1,}$">
                        <input type="hidden" name="mIdcheck" value="">
                      </div>
                    </div>
                    <div class="col-md-1">
                      <input type="button" class="btn btn-default" value="중복확인" name="idcheckbtn">
                    </div>
                  </div>
                  <!-- 패스워드 확인폼 -->
                  <!-- mPw input-->
                  <div class="form-group has-feedback">
                    <label class="col-md-4 control-label" for="inputPw">비밀번호</label>
                    <div class="col-md-3 inputGroupContainer">
                      <div class="input-group">
                        <span class="input-group-addon">
                          <i class="glyphicon glyphicon-star-empty"></i>
                        </span>
                        <input type="password" class="form-control input-md" id="inputPw" placeholder="비밀번호"
                        name="mPw">
                      </div>
                    </div>
                  </div>
                  <!-- password check input-->
                  <div class="form-group has-feedback">
                    <label class="col-md-4 control-label" for="inputPwConfirm">비밀번호확인</label>
                    <div class="col-md-3 inputGroupContainer">
                      <div class="input-group">
                        <span class="input-group-addon">
                          <i class="glyphicon glyphicon-star"></i>
                        </span>
                        <input type="password" class="form-control input-md" id="inputPwConfirm"
                        placeholder="비밀번호확인" name="mPwcorrect">
                        <div class="help-block with-errors"></div>
                      </div>
                    </div>
                  </div>
                  <!-- m_nameinput-->
                  <div class="form-group has-feedback">
                    <label class="col-md-4 control-label" for="textinput">이름</label>
                    <div class="col-md-3 inputGroupContainer">
                      <div class="input-group">
                        <span class="input-group-addon">
                          <i class="glyphicon glyphicon-user"></i>
                        </span>
                        <input id="textinput" name="mName" placeholder="이름" class="form-control input-md"
                        type="text">
                      </div>
                    </div>
                  </div>
                  <!-- mAddressinput-->
                  <div class="form-group has-feedback">
                    <label class="col-md-4 control-label" for="textinput">주소</label>
                    <div class="col-md-3 inputGroupContainer">
                      <div class="input-group">
                        <span class="input-group-addon">
                          <i class="glyphicon glyphicon-home"></i>
                        </span>
                        <input type="text" class="form-control input-md" id="textinput" placeholder="주소"
                        name="mAddress">
                      </div>
                    </div>
                  </div>
                  <!-- mPhone input-->
                  <div class="form-group">
                    <label class="col-md-4 control-label" for="phoneinput">전화번호</label>
                    <div class="col-md-3 inputGroupContainer">
                      <div class="input-group">
                        <span class="input-group-addon">
                          <i class="glyphicon glyphicon-earphone"></i>
                        </span>
                        <input type="text" class="form-control input-md" id="phoneinput" placeholder="ex) 01012345678"
                        name="mPhone">
                        <input type="hidden" name="mPhone" value="">
                      </div>
                    </div>
                    <!-- <div class="col-md-1">
                      <input type="button" class="btn btn-default" value="중복확인" name="phonecheckbtn">
                    </div> -->
                  </div>
                  <div class="form-group col-md-8">
                    <div class="col-sm-offset-7 col-sm-4">
                      <br>
                      <button type="submit" class="btn btn-default">Sign in</button>
                      <button type="button" class="btn btn-default" onclick="location.href='../home.do'">Cancel</button>
                    </div>
                  </div>
                </fieldset>
              </form>
            </fieldset>
          </div>
          <div class="col-md-2"></div>
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
                  $('#joinOk').bootstrapValidator({ 
                                 fields : {
                                    mId : {
                                       validators : {
                                          notEmpty : {
                                             message : 'ID를 입력하세요.'
                                          },
                                          stringLength : {
                                             min : 6,
                                             max : 15,
                                             message : '6~15자 ID만 가입 가능합니다.'
                                          },
                                          regexp : {
                                             regexp : /^[a-zA-Z0-9_\.]+$/,
                                             message : '영문자, 숫자, ., _ 만 사용가능합니다.'
                                          },
                                           different : {
                                             field : 'mIdcheck', 
                                             message : '이미 사용중인 아이디입니다.'
                                          }  
                                       }
                                    }, 
                                    mPw : {
                                       validators : {
                                          notEmpty : {
                                             message : '비밀번호를 입력하세요.'
                                          },
                                          different : {
                                             field : 'mId',
                                             message : '비밀번호를 ID와 똑같이 할 수 없습니다!'
                                          },
                                          callback : {
                                             message : '제대로 입력하세요',
                                             callback : function(
                                                   value,
                                                   validator,
                                                   $field) {
                                                if (value === '') {
                                                   return true;
                                                }

                                                // Check the password strength
                                                if (value.length < 8) {
                                                   return {
                                                      valid : false,
                                                      message : '8글자 이상 사용가능합니다.'
                                                   };
                                                }

                                                // The password doesn't contain any uppercase character
                                                if (value === value
                                                      .toLowerCase()) {
                                                   return {
                                                      valid : false,
                                                      message : '대문자를 하나라도 포함하셔야 합니다.'
                                                   }
                                                }

                                                // The password doesn't contain any uppercase character
                                                if (value === value
                                                      .toUpperCase()) {
                                                   return {
                                                      valid : false,
                                                      message : '소문자를 하나라도 포함하셔야 합니다.'
                                                   }
                                                }

                                                // The password doesn't contain any digit
                                                if (value
                                                      .search(/[0-9]/) < 0) {
                                                   return {
                                                      valid : false,
                                                      message : '특수문자를 하나라도 포함하셔야 합니다.'
                                                   }
                                                }

                                                return true;
                                             }
                                          }
                                       }
                                    },
                                    mPwcorrect : {
                                       validators : {
                                          notEmpty : {
                                             message : '비밀번호 다시 입력하세요.'
                                          },  
                                          identical : {
                                             field : 'mPw',
                                             message : '비밀번호가 일치하지않습니다.'
                                          }
                                       }
                                    },
                                    mName : {
                                       validators : {
                                          notEmpty : {
                                             message : '이름을 입력하세요.'
                                          },
                                          stringLength : {
                                             min : 2,
                                             max : 10,
                                             message : '이름을 제대로입력하세요.'
                                          }
                                       }
                                    },
                                    mAddress : {
                                       validators : {
                                          notEmpty : {
                                             message : '주소을 입력하세요.'
                                          },
                                          stringLength : {
                                             min : 10,
                                             max : 25,
                                             message : '주소을 제대로입력하세요.'
                                          }
                                       }
                                    },
                                    mPhone : {
                                       validators : {
                                          notEmpty : {
                                             message : '전화번호를 입력하세요'
                                          },
                                           different : {
                                                field : 'mPhonecheck', 
                                                message : '이미 사용중인 전화번호입니다.'
                                             }  
                                       }
                                    },
                                    idcheckbtn : {
                                       validators : {
                                          notEmpty : {
                                             message : '아이디 중복확인하세요!'
                                          }
                                       }
                                    },
                                    
                                    phonecheckbtn : {
                                       validators : {
                                          notEmpty : {
                                             message : '전화번호 중복확인하세요!'
                                          }
                                       }
                                    }
                                    

                                 }
                              }); 
           
                      $('input[name="idcheckbtn"]').click(function(){  
                    	  	
                             var mId=$('#idinput').val(); 
                              // ajax 실행
                              $.ajax({     
                                   type: "POST",
                                   url: "./idCheck.do", //이페이지에서 중복체크를 한다
                                   data: "mId="+ mId ,//idCheck.do에 id 값을 보낸다`
                                   datatype : "JSON",
                                   success: function(result){
                                       if(result.count==1){  
                                          $('input[name="mIdcheck"]').attr("value",mId);
                                          alert("이미 사용중인 아이디입니다! 다른 아이디를 사용하세요");
                                          $('#idinput').focus();
                                          $('#idinput').val("");
                                         }//중복된 아이디 결과넣고 validator 수행 
                                         else{
                                            alert("사용가능한 아이디입니다.")
                                         }   
                                           
                                   }, 
                                   error : function(e) {
                                	 alert("에러내용: " + e);
                                     console.log("ERROR: ", e);
                                 },
                                 done : function(e) {
                                	alert(e);
                                    console.log("DONE");
                                 } 
                              }); //end ajax
                      }); // end keyup

                  /*  $('input[name="phonecheckbtn"]').click(function(){
                       var mPhone=$('#phoneinput').val(); 
                        // ajax 실행
                        $.ajax({     
                             type: "POST",
                             url: "./phoneCheck.do", //이페이지에서 중복체크를 한다
                             data: "mPhone="+ mPhone ,//phoneCheck.do에 mPhone 값을 보낸다`
                             datatype : "JSON",
                             success: function(checkInfo){
                                  if(checkInfo.count==1){  
                                       $('input[name="mPhonecheck"]').attr("value",mPhone);
                                       alert("이미 등록된 전화번호 입니다. 다른 전화번호를 사용하세요");
                                       $('#phoneinput').focus();
                                       $('#phoneinput').val("");
                                      }//중복된 아이디 결과넣고 validator 수행 
                                      else{
                                         alert("사용가능한 전화번호입니다.")
                                      }      
                             }, 
                             error : function(e) {
                               console.log("ERROR: ", e);
                              display(e);
                           },
                           done : function(e) {
                              console.log("DONE");
                           } 
                        }); //end ajax
                }); // end keyup  */
                                
               })
    </script>
   
    </body>
    </html>