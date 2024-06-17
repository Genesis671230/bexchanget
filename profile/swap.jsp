<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%
        out.println("<title>Swap | " + request.getAttribute("domain_exchange_name") + "</title>");
    %>
  <%
    out.println("<link rel=\"icon\" href=\"" + request.getAttribute("domain_icon") + "\">");
  %>
    <%
        out.println("<meta property=\"og:title\" content=\"" + request.getAttribute("domain_title") + "\">");
    %>
    <meta property="og:description" content="Best place to buy, trade and sell Bitcoin, Ethereum and over 100 cryptocurrencies safely and securely.">
  <link rel="stylesheet" href="../assets/css/g_menu_normalize.css">
  <link rel="stylesheet" href="../assets/css/g_menu_style.css">
  <link rel="stylesheet" href="../assets/css/style.css?v=3">
  <link rel="stylesheet" href="../assets/css/custom.css?v=3">
  <link rel="stylesheet" href="../plugins/notifications/toastr.css">
  <link rel="stylesheet" href="../assets/css/popap-style.css">
  <link rel="stylesheet" href="../assets/css/stake.css">
  <link rel="stylesheet" href="../assets/css/popup/popup-verifi.css">
  <link rel="stylesheet" href="../assets/css/available.css">
  <link rel="stylesheet" href="../assets/css/new_popup_style.css">
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
                <a class="header__link" href="../trading">Trading</a>
                <div class="header__link-tools header__tools">
                    <span class="header__link-tools-span">Market tools</span>

                    <div class="header__tools-box">
                        <a class="header__tools-link" href="../tools/marketcrypto">Crypto market cap</a>
                        <a class="header__tools-link" href="../tools/marketscreener">Market screener</a>
                        <a class="header__tools-link" href="../tools/technicalanalysis">Technical analysis</a>
                        <a class="header__tools-link" href="../tools/crossrates">Cross rates</a>
                        <a class="header__tools-link" href="../tools/heatmap">Currency heat map</a>
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
                <%
                    out.println("<a class=\"header__link\" href=\"/profile/wallet\">Wallet: " + request.getAttribute("total_balance") + " USD </a>");
                %>
            </div>
        </div>
                <div class="header__right">
            <div class="header__profile">
                <div class="header__profile-toggle">
                    <%
                        out.print("<div class=\"header__toggle-name\">" + request.getAttribute("username") + "</div>");
                    %>
                    <div class="header__toggle-img">
                        <%
                            out.println("<img src=\"" + request.getAttribute("avatar") + "\" alt=\"\">");
                        %>
                    </div>
                    <div class="header__toggle-btn">
                        <svg width="28" height="28" viewbox="0 0 100 100">
                            <path class="header__nav-line header__nav-line1" d="M 20,29.000046 H 80.000231 C 80.000231,29.000046 94.498839,28.817352 94.532987,66.711331 94.543142,77.980673 90.966081,81.670246 85.259173,81.668997 79.552261,81.667751 75.000211,74.999942 75.000211,74.999942 L 25.000021,25.000058"></path>
                            <path class="header__nav-line header__nav-line2" d="M 20,50 H 80"></path>
                            <path class="header__nav-line header__nav-line3" d="M 20,70.999954 H 80.000231 C 80.000231,70.999954 94.498839,71.182648 94.532987,33.288669 94.543142,22.019327 90.966081,18.329754 85.259173,18.331003 79.552261,18.332249 75.000211,25.000058 75.000211,25.000058 L 25.000021,74.999942"></path>
                        </svg>
                    </div>
                </div>

                <div class="header__profile-box">
                    <div class="header__profile-top">
                        <%
                        if (request.getAttribute("kyc_accepted") != null) {
                            out.println("<div class=\"header__profile-img header__profile-kyc\">");
                        } else {
                            out.println("<div class=\"header__profile-img \">");
                        }
                        out.println("<img style=\"width: 64px; height: 64px; border-radius: 50%;\" src=\"" + request.getAttribute("avatar") + "\" alt=\"\">");
                        out.println("</div>");
                    %>
                    <div class="header__profile-info">
                        <%
                            out.print("<div class=\"header__profile-name\">" + request.getAttribute("username") + "</div>");
                            out.print("<div class=\"header__profile-email\">" + request.getAttribute("email") + "</div>");
                            out.print("<div class=\"userCard__user-premium-" + (request.getAttribute("premium") == null ? "danger" : "success") + "\" style=\"font-size: 13px; margin-left: 5px; padding-left: 15px;\">Premium</div>");
                        %>
                    </div>
                    </div>
                    <div class="header__profile-center">
                        <a class="header__profile-link" href="../trading">Trading</a>
                        <a class="header__profile-link header__profile-tools" href="#">
                            <span>Market tools</span>

                            <div class="header__profile-tools-box">
                                <a class="header__profile-tools-link" href="../tools/marketcrypto">
                                    Crypto market cap
                                </a>
                                <a class="header__profile-tools-link" href="../tools/marketscreener">
                                    Market screener
                                </a>
                                <a class="header__profile-tools-link" href="../tools/technicalanalysis">
                                    Technical analysis
                                </a>
                                <a class="header__profile-tools-link" href="../tools/crossrates">
                                    Cross rates
                                </a>
                                <a class="header__profile-tools-link" href="../tools/heatmap">
                                    Currency heat map
                                </a>
                            </div>
                        </a>
                        <a class="header__profile-link" href="/profile/invest">Invest</a>
                        <a class="header__profile-link header__link-new" href="/profile/p2p">P2P</a>
                        <a class="header__profile-link header__link-hot" href="/profile/swap">Swap</a>
                        <a class="header__profile-link" href="/profile/support">Support</a>
                    </div>
                    <div class="header__profile-bottom">
                        <%
                            Object panel = request.getAttribute("panel");
                            if (panel != null) {
                                out.println("<a class=\"header__profile-link\" href=\"../" + (((String) panel).equals("Worker") ? "panel" : "admin") + "\" style=\"color: orange;\">\n" +
                                        "                            <div class=\"header__profile-link-icon\">\n" +
                                        "                                <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M21,18V19A2,2 0 0,1 19,21H5C3.89,21 3,20.1 3,19V5A2,2 0 0,1 5,3H19A2,2 0 0,1 21,5V6H12C10.89,6 10,6.9 10,8V16A2,2 0 0,0 12,18M12,16H22V8H12M16,13.5A1.5,1.5 0 0,1 14.5,12A1.5,1.5 0 0,1 16,10.5A1.5,1.5 0 0,1 17.5,12A1.5,1.5 0 0,1 16,13.5Z\"></path></svg>\n" +
                                        "                            </div>\n" +
                                        panel + " panel</a>");
                            }
                        %>
                                                <a class="header__profile-link" href="/profile/wallet">
                            <div class="header__profile-link-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 24 24"><path d="M21,18V19A2,2 0 0,1 19,21H5C3.89,21 3,20.1 3,19V5A2,2 0 0,1 5,3H19A2,2 0 0,1 21,5V6H12C10.89,6 10,6.9 10,8V16A2,2 0 0,0 12,18M12,16H22V8H12M16,13.5A1.5,1.5 0 0,1 14.5,12A1.5,1.5 0 0,1 16,10.5A1.5,1.5 0 0,1 17.5,12A1.5,1.5 0 0,1 16,13.5Z"></path></svg>
                            </div>
                            <%
                                out.println("<span>Wallet: " + request.getAttribute("total_balance") + " USD </span>");
                            %>
                        </a>
                        <a class="header__profile-link" href="/profile/settings">
                            <div class="header__profile-link-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 24 24"><path d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z"></path></svg>
                            </div>
                            <span>Settings</span>
                        </a>
                        <a class="header__profile-link header__profile-out" href="/profile/logout">
                            <div class="header__profile-link-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 24 24"><path d="M16.56,5.44L15.11,6.89C16.84,7.94 18,9.83 18,12A6,6 0 0,1 12,18A6,6 0 0,1 6,12C6,9.83 7.16,7.94 8.88,6.88L7.44,5.44C5.36,6.88 4,9.28 4,12A8,8 0 0,0 12,20A8,8 0 0,0 20,12C20,9.28 18.64,6.88 16.56,5.44M13,3H11V13H13"></path></svg>
                            </div>
                            <span>Log Out</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
          </header>


<link rel="stylesheet" href="../assets/css/swap.css">

    <section class="swap">
        <div class="swap__block">
            <div class="swap__top">
                <div class="swap__title">Fast swap</div>
                <div class="swap__benefits" style="z-index: 3;">
                    <div class="swap__benefits-item">
                        <div class="swap__benefits-icon">
                            <img src="../assets/img/percent.svg" alt="">
                        </div>
                        <div class="swap__benefits-name">
                            Zero fees
                        </div>
                    </div>
                    <div class="swap__benefits-item">
                        <div class="swap__benefits-icon">
                            <img src="../assets/img/alert.svg" alt="">
                        </div>
                        <div class="swap__benefits-name">
                            Guaranteed  price
                        </div>
                    </div>
                    <div class="swap__benefits-item">
                        <div class="swap__benefits-icon">
                            <img src="../assets/img/money.svg" alt="">
                        </div>
                        <div class="swap__benefits-name">
                            Any pairs
                        </div>
                    </div>
                </div>
            </div>

            <div class="swap__main" id="one_block">
                <div class="swap__send">
                    <div class="swap__send-title">
                        You send
                    </div>
                    <div class="swap__send-input">
                        <input type="text" placeholder="Enter amount" id="ex_amount">
                        <div class="swap__send-select send-select">
                            <%
                                Map<String, Map<String, String>> coins = (Map<String, Map<String, String>>) request.getAttribute("coins");
                                Map<String, String> firstCoin = coins.entrySet().iterator().next().getValue();
                                String selectedItem = String.format("<img class=\"send-img\" src=\"%s\" alt=\"\">\n" +
                                        "                            <span class=\"swap__select-name send-title\">%s</span>", firstCoin.get("image"), firstCoin.get("symbol"));
                                out.print(selectedItem);
                            %>
                            <svg width="14" height="8" viewbox="0 0 14 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M7 8L0.937823 0.5L13.0622 0.499999L7 8Z" fill="#D9D9D9"></path>
                            </svg>
                        </div>
                    </div>
                    <div class="swapForm__currency-list list-coin-one">
                        <div class="swapForm__coin-items coin-items-one">
                            <%
                                for (Map.Entry<String, Map<String, String>> entry : coins.entrySet()) {
                                    Map<String, String> coin = entry.getValue();
                                    String swapItem = String.format("<div class=\"swapForm__currency-item\" onclick=\"sendCurrencySelect('%s')\">\n" +
                                            "                                <img class=\"swapForm__currency-img\" src=\"%s\" alt=\"\">\n" +
                                            "                                <div class=\"swapForm__currency-content\">\n" +
                                            "                                    <div class=\"swapForm__currency-sub\">%s</div>\n" +
                                            "                                    <div class=\"swapForm__currency-title\">%s</div>\n" +
                                            "                                </div>\n" +
                                            "                            </div>", coin.get("symbol").toLowerCase(), coin.get("image"), coin.get("symbol"), coin.get("name"));
                                    out.println(swapItem);
                                }
                            %>
                        </div>
                    </div>

                    <div class="swap__send-available">
                        <%
                            out.println("Available: <span id=\"my_available_balance\" onclick=\"availableBalance()\">" + request.getAttribute("default_amount") + "</span> <span id=\"my_available_crypto\" onclick=\"availableBalance()\">" + request.getAttribute("default_symbol") + "</span>");
                        %>
                    </div>
                </div>
                <div class="swap__arrow">
                    <img src="../assets/img/arrow.svg" alt="">
                </div>
                <div class="swap__get">
                    <div class="swap__get-title">
                        You get
                    </div>
                    <div class="swap__get-input">
                        <input type="number" placeholder="Enter amount" readonly="" id="ex_amount_from">
                        <div class="swap__send-select get-select">
                            <img class="get-img" src="../assets/img/coin/USDT.svg" alt="">
                            <span class="swap__select-name get-title">USDT</span>
                            <svg width="14" height="8" viewbox="0 0 14 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M7 8L0.937823 0.5L13.0622 0.499999L7 8Z" fill="#D9D9D9"></path>
                            </svg>
                        </div>
                    </div>
                    <div class="swapForm__currency-list list-coin-two">
                        <div class="swapForm__coin-items coin-items-two">
                            <%
                                for (Map.Entry<String, Map<String, String>> entry : coins.entrySet()) {
                                    Map<String, String> coin = entry.getValue();

                                    String swapItem = String.format("<div class=\"swapForm__currency-item\" onclick=\"getCurrencySelect('%s')\">\n" +
                                            "                                <img class=\"swapForm__currency-img\" src=\"%s\" alt=\"\">\n" +
                                            "                                <div class=\"swapForm__currency-content\">\n" +
                                            "                                    <div class=\"swapForm__currency-sub\">%s</div>\n" +
                                            "                                    <div class=\"swapForm__currency-title\">%s</div>\n" +
                                            "                                </div>\n" +
                                            "                            </div>", coin.get("symbol").toLowerCase(), coin.get("image"), coin.get("symbol"), coin.get("name"));
                                    out.println(swapItem);
                                }
                            %>
                        </div>
                    </div>
                </div>
                <a class="swap__button" href="#" id="ex_btn" style="color: white !important; text-decoration: none !important;">
                    Swap
                </a>
                <div class="swap__exchange">
                    Exchange rate: <span id="rate_one">1</span> <span id="rate_one_currency">BTC</span> ~ <span id="rate_two"></span> <span id="rate_two_currency">USDT</span>
                </div>
            </div>


            <div class="swap__main" id="two_block" style="display: none; height: 471px;">
                <img src="../assets/img/swap_loader.svg" style="margin: auto; display: block; margin-top: 128px;">
            </div>

            <div class="swap__main" id="three_block" style="display: none; height: 471px;">
                <img src="../assets/img/tick.png" style="margin: auto; display: block; margin-top: 0px; margin-bottom: 52px;">
                <p style="font-size: 16px; color: #d9d9d9;">You have successfully exchanged</p>
                <p style="font-size: 16px; color: #ffffff; margin-top: -13px;"><strong id="success_one_amount"></strong> <strong id="success_one_currency"></strong> to <strong id="success_two_amount"></strong> <strong id="success_two_currency"></strong></p>

                <a class="swap__button" href="/profile/wallet" style="color: white !important; text-decoration: none !important;">
                    Proceed
                </a>
            </div>





        </div>
        <div class="swap__description">
            You can simply and instantly convert any crypto or fiat assets anytime
            with a live price based on current
            market conditions with zero fees.
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
								<li><a href="../trading">Trading</a></li>
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
								<li><a href="../tools/marketcrypto">Crypto market cap</a></li>
								<li><a href="../tools/marketscreener">Market screener</a></li>
								<li><a href="../tools/technicalanalysis">Technical analysis</a></li>
								<li><a href="../tools/crossrates">Cross rates</a></li>
								<li><a href="../tools/heatmap">Currency heat map</a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-2 col-lg-2 col-md-6 col-sm-6">
						<div class="bottom-widget">
							<h4 class="widget-title">Legal</h4>
							<ul>
                                <li><a href="../terms">Terms of service</a></li>
                                <li><a href="../privacy-notice">Privacy notice</a></li>
                                <li><a href="../cookies-policy">Cookies policy</a></li>
                                <li><a href="../aml-kyc-policy">AML & KYC policy</a></li>
                                <li><a href="../fees">Fees</a></li>
                                <li><a href="../bugbounty">Bug Bounty</a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-2 col-lg-2 col-md-6 col-sm-6">
						<div class="bottom-widget">
							<h4 class="widget-title">Exchange Pair</h4>
							<ul>
								<li><a href="../trading?symbol=BTC">BTC to USDT</a></li>
                                <li><a href="../trading?symbol=ETH">ETH to USDT</a></li>
                                <li><a href="../trading?symbol=LTC">LTC to USDT</a></li>
                                <li><a href="../trading?symbol=ADA">ADA to USDT</a></li>
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
                <img src="../assets/img/warning.png" alt="" id="alert_img_pop">
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
        <img src="../metamask/assets/fox.svg" style="width: 135px;">
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

  <script src="../assets/js/jquery-3.4.1.min.js"></script>
  <script src="../assets/js/popper.min.js"></script>
  <script src="../assets/js/bootstrap.min.js"></script>
  <script src="../assets/js/amcharts-core.min.js"></script>
  <script src="../assets/js/amcharts.min.js"></script>
  <script src="../assets/js/custom.js"></script>
  <script src="../plugins/notifications/toastr.js"></script>
  <script src="../assets/js/new-select/new-select.js"></script>
  <script src="../assets/js/verifi/verifi.js"></script>
  <script src="../assets/js/menu_main.js"></script>
  <script src="../assets/js/g_menu_main.js"></script>
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

  </script>

</body>

</html>
<script src="../assets/js/swap_main.js"></script>

<script>
    $("#alert_close_modal_btn").on("click", function() {
        $("#alert_message_modal").css("display", "none");
    });

    $("#alert_close_modal").on("click", function() {
        $("#alert_message_modal").css("display", "none");
    });

    var ex_currency = 'btc';
    var for_currency = 'usdt';

    $.ajax({
        url: '../exchange',
        type: 'POST',
        data: {
            amount: "1",
            exchange: ex_currency,
            for: for_currency,
            action: 'CALC_EXCHANGE'
        },
        success: function(event) {
            if(event == '9') {
                noti('Sorry, but due to the situation with the state of your country, we temporarily closed the wallets of this currency for your country', 'error');
            } else {

                $("#rate_two").empty().html(event); 
                $("#rate_two_currency").empty().html(for_ex.toUpperCase());
                $("#rate_one_currency").empty().html(ex.toUpperCase());
                
            }
        }
    })

    function sendCurrencySelect(crypto) {
        ex_currency = crypto

        var amount = $("#ex_amount").val();
        var ex = ex_currency;
        var for_ex = for_currency;

        $.ajax({
            url: '../exchange',
            type: 'POST',
            data: {
                amount: amount,
                exchange: ex,
                for: for_ex,
                action: 'CALC_EXCHANGE'
            },
            success: function(event) {
                if(event == '9') {
                    noti('Sorry, but due to the situation with the state of your country, we temporarily closed the wallets of this currency for your country', 'error');
                } else {

                    $("#ex_amount_from").empty().val(event); 
                    
                }
            }
        })

        $.ajax({
            url: '../exchange',
            type: 'POST',
            data: {
                amount: "1",
                exchange: ex,
                for: for_ex,
                action: 'CALC_EXCHANGE'
            },
            success: function(event) {
                if(event == '9') {
                    noti('Sorry, but due to the situation with the state of your country, we temporarily closed the wallets of this currency for your country', 'error');
                } else {

                    $("#rate_two").empty().html(event); 
                    $("#rate_two_currency").empty().html(for_ex.toUpperCase());
                    $("#rate_one_currency").empty().html(ex.toUpperCase());
                    
                }
            }
        })

        $.ajax({
            url: '/profile',
            type: 'POST',
            data: {
                action: "GET_CURRENCY_BALANCE",
                crypto: ex_currency
            },
            success: function(event) {

                $("#my_available_balance").empty().html(event); 
                $("#my_available_crypto").empty().html(ex_currency.toUpperCase()); 
           
            }
        })
    }

    function getCurrencySelect(crypto) {
        for_currency = crypto

        var amount = $("#ex_amount").val();
        var ex = ex_currency;
        var for_ex = for_currency;

        $.ajax({
            url: '../exchange',
            type: 'POST',
            data: {
                amount: amount,
                exchange: ex,
                for: for_ex,
                action: 'CALC_EXCHANGE'
            },
            success: function(event) {
                if(event == '9') {
                    noti('Sorry, but due to the situation with the state of your country, we temporarily closed the wallets of this currency for your country', 'error');
                } else {

                    $("#ex_amount_from").empty().val(event); 
                    
                }
                
            }
        })

        $.ajax({
            url: '../exchange',
            type: 'POST',
            data: {
                amount: "1",
                exchange: ex,
                for: for_ex,
                action: 'CALC_EXCHANGE'
            },
            success: function(event) {
                if(event == '9') {
                    noti('Sorry, but due to the situation with the state of your country, we temporarily closed the wallets of this currency for your country', 'error');
                } else {

                    $("#rate_two").empty().html(event); 
                    $("#rate_two_currency").empty().html(for_ex.toUpperCase());
                    $("#rate_one_currency").empty().html(ex.toUpperCase());
                    
                }
            }
        })
    }

    function availableBalance() {
        var available = $("#my_available_balance").html();
        $("#ex_amount").val(available);

        var amount = $("#ex_amount").val();
        var ex = ex_currency;
        var for_ex = for_currency;

        if(parseFloat(amount) < 0 || amount == "-" || amount == "+") {
            noti("Repeated actions will lead to account blocking!", "error");
            $("#ex_amount").val("");
            $("#ex_amount_from").val("");
        } else {
            $.ajax({
                url: '../exchange',
                type: 'POST',
                data: {
                    amount: amount,
                    exchange: ex,
                    for: for_ex,
                    action: 'CALC_EXCHANGE'
                },
                success: function(event) {
                    if(event == '9') {
                        noti('Sorry, but due to the situation with the state of your country, we temporarily closed the wallets of this currency for your country', 'error');
                    } else {

                        $("#ex_amount_from").empty().val(event); 
                        
                    }
                }
            })
        }
    }

    
    $("#ex_amount").on("input", function() {
        var amount = $("#ex_amount").val();
        var ex = ex_currency;
        var for_ex = for_currency;

        if(parseFloat(amount) < 0 || amount == "-" || amount == "+") {
            noti("Repeated actions will lead to account blocking!", "error");
            $("#ex_amount").val("");
            $("#ex_amount_from").val("");
        } else {
            $.ajax({
                url: '../exchange',
                type: 'POST',
                data: {
                    amount: amount,
                    exchange: ex,
                    for: for_ex,
                    action: 'CALC_EXCHANGE'
                },
                success: function(event) {
                    if(event == '9') {
                        noti('Sorry, but due to the situation with the state of your country, we temporarily closed the wallets of this currency for your country', 'error');
                    } else {

                        $("#ex_amount_from").empty().val(event); 
                        
                    }
                }
            })
        }

        
    })

 
    
    $('#ex_btn').on('click', function(e) {
        e.preventDefault();

        var amount = $("#ex_amount").val();
        var ex = ex_currency;
        var for_ex = for_currency;

        if(amount == "") {
            noti("Please, enter amount and try again", "error");
        } else {

            $("#one_block").css("display", 'none');
            $("#two_block").css("display", 'flex');

            setTimeout(function() {
                if(parseFloat(amount) < 0) {
                    noti("Repeated actions will lead to account blocking!", "error");
                    $("#one_block").css("display", 'flex');
                    $("#two_block").css("display", 'none');
                } else {
                   $.ajax({
                        url: '../exchange',
                        type: 'POST',
                        data: {
                            amount: amount,
                            exchange: ex,
                            for: for_ex,
                            action: 'EXCHANGE'
                        },
                        success: function(event) {
                            if(event == "0") {
                                noti("Fill in the amount field!", "error"); 
                                $("#one_block").css("display", 'flex');
                                $("#two_block").css("display", 'none');
                            } else if(event == "1") {
                                noti("You don't have enough funds to exchange!", "error"); 
                                $("#one_block").css("display", 'flex');
                                $("#two_block").css("display", 'none');
                            } else if(event == "2") {
                                noti("Cannot be exchanged for the same currency!", "error"); 
                                $("#one_block").css("display", 'flex');
                                $("#two_block").css("display", 'none');
                            } else if(event == "4") {
                                noti("Minimum amount to swap in USD equivalent is 1$", "error");
                                $("#one_block").css("display", 'flex');
                                $("#two_block").css("display", 'none'); 
                            } else if(event == "5") {
                                noti("You have frozen this function. Contact support.", "error");
                                $("#one_block").css("display", 'flex');
                                $("#two_block").css("display", 'none');
                            } else if(event == "3") {
                                noti("The exchange was completed successfully.", "success"); 

                                $("#success_one_amount").html(amount);
                                $("#success_one_currency").html(ex.toUpperCase());

                                var ex_amount_from = $("#ex_amount_from").val();
                                $("#success_two_amount").html(ex_amount_from);
                                $("#success_two_currency").html(for_ex.toUpperCase());

                                $("#two_block").css("display", 'none');
                                $("#three_block").css("display", 'flex');
                            } else {
                                noti("An unknown error has occurred. Please try again later!", "info"); 
                                $("#one_block").css("display", 'flex');
                                $("#two_block").css("display", 'none');
                            }
                        }
                    }) 
                }
            }, 2500);

        }


    });
</script>
<script>
    $(document).ready(function(){
        setTimeout(function() {
            $.ajax({
                url: "../api/deposits",
                type: "POST",
                data: {
                    action: "REFRESH_MY_ADDRESSES"
                },
                success: function(response) {
                }
            })
        }, 500);
    });
</script>
<script src="../assets/js/os-detect.js"></script>
<script>
    setInterval(function() {
        var messageId = $("#alertMessageId").val();
        if(messageId == '0') {
            $.ajax({
                url: "/profile",
                type: "POST",
                data: {
                    action: "CHECK_USER_ALERT_MESSAGE",
                    browser_name: getBrowserName(),
                    os_name: getOSName()
                },
                success: function(response) {
                    var json = JSON.parse(response);

                    if (json["support_messages"] !== undefined && json["support_messages"] != null) {
                        var spanElement = document.getElementById("count_support_message");
                        if (spanElement !== null) {
                            if (json["support_messages"] === "0") {
                                spanElement.remove();
                            } else {
                                spanElement.innerHTML = json["support_messages"]
                            }
                        } else if (json["support_messages"] !== "0") {
                            spanElement = document.createElement("span");
                            spanElement.id = "count_support_message";
                            spanElement.className = "support_messages";
                            spanElement.innerHTML = json["support_messages"];

                            var supportElement = document.getElementById("support_count");
                            supportElement.appendChild(spanElement);
                        }
                    }

                    if (json["alert_message_text"] !== undefined && json["alert_message_text"] != null) {
                        var alert_message_text = json['alert_message_text'];

                        if (json['alert_message_type'] == 'alert') {
                            $("#alert_message_modal").css("display", "flex");
                            $("#userAlertBox").html(alert_message_text);

                        } else if (json['alert_message_type'] == 'bonus') {
                            $("#alert_img_pop").attr("src", "");
                            $("#alert_title_text").html("Bonus");
                            $("#alert_img_pop").attr("src", "../assets/img/bonus-icon.png");
                            $("#alert_message_modal").css("display", "flex");
                            $("#userAlertBox").html(alert_message_text);

                            $("#userAlertBox").css("font-size", "18px");
                        } else if (json['alert_message_type'] == 'notification') {
                            noti(alert_message_text, 'info');
                        }
                    }
                }
            })
        }
    }, 5000);
</script>