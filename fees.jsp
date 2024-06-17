<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<%
		out.println("<title>Fees | " + request.getAttribute("domain_exchange_name") + "</title>");
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
					<a class="header__tools-link" href="../tools/marketcrypto">Crypto market cap</a>
					<a class="header__tools-link" href="../tools/marketscreener">Market screener</a>
					<a class="header__tools-link" href="../tools/technicalanalysis">Technical analysis</a>
					<a class="header__tools-link" href="../tools/crossrates">Cross rates</a>
					<a class="header__tools-link" href="../tools/heatmap">Currency heat map</a>
				</div>
			</div>
			<a class="header__link" href="../profile/invest">Invest</a>
			<a class="header__link header__link-new" href="../profile/p2p">P2P</a>
			<a class="header__link header__link-hot" href="../profile/swap">Swap</a>
			<%
                if (request.getAttribute("support_unviewed") != null && ((int) request.getAttribute("support_unviewed")) > 0) {
                    out.println("<a id=\"support_count\" class=\"header__link\" href=\"../profile/support\">Support <span id=\"count_support_message\" class=\"support_messages\">" + request.getAttribute("support_unviewed") + "</span></a>");
                } else {
                    out.println("<a id=\"support_count\" class=\"header__link\" href=\"../profile/support\">Support </a>");
                }
            %>
			<%
				if (request.getAttribute("authorized") != null) {
					out.println("<a class=\"header__link\" href=\"../profile/wallet\">Wallet: " + request.getAttribute("total_balance") + " USD </a>");
				}
			%>
		</div>
	</div>
	<%
		if (request.getAttribute("authorized") != null) {
			String html = String.format("<div class=\"header__right\">\n" +
					"            <div class=\"header__profile\">\n" +
					"                <div class=\"header__profile-toggle\">\n" +
					"                    <div class=\"header__toggle-name\">%s</div>\n" +
					"                    <div class=\"header__toggle-img\">\n" +
					"                        <img src=\"%s\" alt=\"\">\n" +
					"                    </div>\n" +
					"                    <div class=\"header__toggle-btn\">\n" +
					"                        <svg width=\"28\" height=\"28\" viewBox=\"0 0 100 100\">\n" +
					"                            <path class=\"header__nav-line header__nav-line1\" d=\"M 20,29.000046 H 80.000231 C 80.000231,29.000046 94.498839,28.817352 94.532987,66.711331 94.543142,77.980673 90.966081,81.670246 85.259173,81.668997 79.552261,81.667751 75.000211,74.999942 75.000211,74.999942 L 25.000021,25.000058\"></path>\n" +
					"                            <path class=\"header__nav-line header__nav-line2\" d=\"M 20,50 H 80\"></path>\n" +
					"                            <path class=\"header__nav-line header__nav-line3\" d=\"M 20,70.999954 H 80.000231 C 80.000231,70.999954 94.498839,71.182648 94.532987,33.288669 94.543142,22.019327 90.966081,18.329754 85.259173,18.331003 79.552261,18.332249 75.000211,25.000058 75.000211,25.000058 L 25.000021,74.999942\"></path>\n" +
					"                        </svg>\n" +
					"                    </div>\n" +
					"                </div>\n" +
					"\n" +
					"                <div class=\"header__profile-box\">\n" +
					"                    <div class=\"header__profile-top\">\n" +
					"                        <div class=\"header__profile-img %s\">\n" +
					"                            <img style=\"width: 64px; height: 64px; border-radius: 50%%;\" src=\"%s\" alt=\"\">\n" +
					"                        </div>\n" +
					"                        <div class=\"header__profile-info\">\n" +
					"                            <div class=\"header__profile-name\">%s</div>\n" +
					"                            <div class=\"header__profile-email\">%s</div>\n" +
					"                            <div class=\"userCard__user-premium-%s\" style=\"font-size: 13px; margin-left: 5px; padding-left: 15px;\">Premium</div>" +
					"                        </div>\n" +
					"                    </div>\n" +
					"                    <div class=\"header__profile-center\">\n" +
					"                        <a class=\"header__profile-link\" href=\"../trading\">Trading</a>\n" +
					"                        <a class=\"header__profile-link header__profile-tools\" href=\"#\">\n" +
					"                            <span>Market tools</span>\n" +
					"\n" +
					"                            </a><div class=\"header__profile-tools-box\"><a class=\"header__profile-link header__profile-tools\" href=\"#\">\n" +
					"                                </a><a class=\"header__profile-tools-link\" href=\"/marketcrypto\">\n" +
					"                                    Crypto market cap\n" +
					"                                </a>\n" +
					"                                <a class=\"header__profile-tools-link\" href=\"/tools/marketscreener\">\n" +
					"                                    Market screener\n" +
					"                                </a>\n" +
					"                                <a class=\"header__profile-tools-link\" href=\"/tools/technicalanalysis\">\n" +
					"                                    Technical analysis\n" +
					"                                </a>\n" +
					"                                <a class=\"header__profile-tools-link\" href=\"/crossrates\">\n" +
					"                                    Cross rates\n" +
					"                                </a>\n" +
					"                                <a class=\"header__profile-tools-link\" href=\"/heatmap\">\n" +
					"                                    Currency heat map\n" +
					"                                </a>\n" +
					"                            </div>\n" +
					"                        \n" +
					"                        <a class=\"header__profile-link\" href=\"../profile/invest\">Invest</a>\n" +
					"                        <a class=\"header__profile-link header__link-new\" href=\"../profile/p2p\">P2P</a>\n" +
					"                        <a class=\"header__profile-link header__link-hot\" href=\"../profile/swap\">Swap</a>\n" +
					"                        <a class=\"header__profile-link\" href=\"../profile/support\">Support</a>\n" +
					"                    </div>\n", request.getAttribute("username"), request.getAttribute("avatar"), request.getAttribute("kyc_accepted") != null ? "header__profile-kyc" : "", request.getAttribute("avatar"), request.getAttribute("username"), request.getAttribute("email"), request.getAttribute("premium") == null ? "danger" : "success");
			out.println(html);
			out.println("<div class=\"header__profile-bottom\">");
			Object panel = request.getAttribute("panel");
			if (panel != null) {
				out.println("<a class=\"header__profile-link\" href=\"../panel\" style=\"color: orange;\">\n" +
						"                            <div class=\"header__profile-link-icon\">\n" +
						"                                <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M21,18V19A2,2 0 0,1 19,21H5C3.89,21 3,20.1 3,19V5A2,2 0 0,1 5,3H19A2,2 0 0,1 21,5V6H12C10.89,6 10,6.9 10,8V16A2,2 0 0,0 12,18M12,16H22V8H12M16,13.5A1.5,1.5 0 0,1 14.5,12A1.5,1.5 0 0,1 16,10.5A1.5,1.5 0 0,1 17.5,12A1.5,1.5 0 0,1 16,13.5Z\"></path></svg>\n" +
						"                            </div>\n" +
						panel + " panel</a>");
			}
			String html2 = String.format(
					"                        <a class=\"header__profile-link\" href=\"../profile/wallet\">\n" +
							"                            <div class=\"header__profile-link-icon\">\n" +
							"                                <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M21,18V19A2,2 0 0,1 19,21H5C3.89,21 3,20.1 3,19V5A2,2 0 0,1 5,3H19A2,2 0 0,1 21,5V6H12C10.89,6 10,6.9 10,8V16A2,2 0 0,0 12,18M12,16H22V8H12M16,13.5A1.5,1.5 0 0,1 14.5,12A1.5,1.5 0 0,1 16,10.5A1.5,1.5 0 0,1 17.5,12A1.5,1.5 0 0,1 16,13.5Z\"></path></svg>\n" +
							"                            </div>\n" +
							"                            <span>Wallet: %s USD </span>\n" +
							"                        </a>\n" +
							"                        <a class=\"header__profile-link\" href=\"../profile/settings\">\n" +
							"                            <div class=\"header__profile-link-icon\">\n" +
							"                                <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z\"></path></svg>\n" +
							"                            </div>\n" +
							"                            <span>Settings</span>\n" +
							"                        </a>\n" +
							"                        <a class=\"header__profile-link header__profile-out\" href=\"../profile/logout\">\n" +
							"                            <div class=\"header__profile-link-icon\">\n" +
							"                                <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M16.56,5.44L15.11,6.89C16.84,7.94 18,9.83 18,12A6,6 0 0,1 12,18A6,6 0 0,1 6,12C6,9.83 7.16,7.94 8.88,6.88L7.44,5.44C5.36,6.88 4,9.28 4,12A8,8 0 0,0 12,20A8,8 0 0,0 20,12C20,9.28 18.64,6.88 16.56,5.44M13,3H11V13H13\"></path></svg>\n" +
							"                            </div>\n" +
							"                            <span>Log Out</span>\n" +
							"                        </a>\n" +
							"                    </div>\n" +
							"                </div>\n" +
							"            </div>\n" +
							"        </div>", request.getAttribute("total_balance"));
			out.println(html2);
		}
	%>
</header>

<div class="b1">
	<div class="page-title dashboard">
            <div class="container">
                <div class="row">
                    <div class="col-6"> </div>
                    
                </div>
            </div>
        </div>

        <div class="content-body">
            <div class="container">
                <div class="row">
                    
                    <div class="col-xl-12">
                        <div class="card">
                            <div class="card-header-info">
                              <h4 class="card-title-info">Fees</h4>
                            </div>
                            
                            
                           <div class="terms__box">
								<div class="terms__title">Cryptocurrency</div>
								<div class="terms__content-currency">
									<div class="terms__content-currency">
										<div class="terms__content-currency-category">
											<div class="terms__content-currency-category-item payment-method">
												Payment Method
											</div>
											<div class="terms__content-currency-category-item min-deposit">
												Min deposit
											</div>
											<div class="terms__content-currency-category-item deposit-fee">
												Deposit Fee
											</div>
											<div class="terms__content-currency-category-item withdrawal-fee">
												Withdrawal Fee
											</div>
											<div class="terms__content-currency-category-item item__content-currency-empty"></div>
										</div>
										<div class="terms__content-currency-items">

										
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/btc.svg">
													</div>
													<div class="terms__content-currency-item-name">
														BTC														<div class="terms__content-currency-item-full-name">
															BITCOIN														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													0.000894 BTC												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													0.000045 BTC												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/eth.svg">
													</div>
													<div class="terms__content-currency-item-name">
														ETH														<div class="terms__content-currency-item-full-name">
															ETHEREUM														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													0.012759 ETH												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													0.000638 ETH												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/ltc.svg">
													</div>
													<div class="terms__content-currency-item-name">
														LTC														<div class="terms__content-currency-item-full-name">
															LITECOIN														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													0.220848 LTC												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													0.011042 LTC												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/usdt.svg">
													</div>
													<div class="terms__content-currency-item-name">
														USDTTRC														<div class="terms__content-currency-item-full-name">
															USDT TRC-20														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													20.000000 USDTTRC												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													1.000000 USDTTRC												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/usdt.svg">
													</div>
													<div class="terms__content-currency-item-name">
														USDT														<div class="terms__content-currency-item-full-name">
															USDT ERC-20														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													20.000000 USDT												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													1.000000 USDT												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/usdt.svg">
													</div>
													<div class="terms__content-currency-item-name">
														USDTBEP														<div class="terms__content-currency-item-full-name">
															USDT BEP-20														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													20.000000 USDTBEP												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													1.000000 USDTBEP												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/trx.svg">
													</div>
													<div class="terms__content-currency-item-name">
														TRX														<div class="terms__content-currency-item-full-name">
															TRON														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													297.796307 TRX												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													14.889815 TRX												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/usdc.svg">
													</div>
													<div class="terms__content-currency-item-name">
														USDC														<div class="terms__content-currency-item-full-name">
															USD COIN ERC-20														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													20.000000 USDC												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													1.000000 USDC												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/bnb.svg">
													</div>
													<div class="terms__content-currency-item-name">
														BNB20														<div class="terms__content-currency-item-full-name">
															BNB BEP-20														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													0.068847 BNB20												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													0.003442 BNB20												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/bnb.svg">
													</div>
													<div class="terms__content-currency-item-name">
														BNB														<div class="terms__content-currency-item-full-name">
															BNB BEP-2														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													0.068847 BNB												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													0.003442 BNB												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/bch.svg">
													</div>
													<div class="terms__content-currency-item-name">
														BCH														<div class="terms__content-currency-item-full-name">
															BITCOIN CASH														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													0.160128 BCH												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													0.008006 BCH												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/doge.svg">
													</div>
													<div class="terms__content-currency-item-name">
														DOGE														<div class="terms__content-currency-item-full-name">
															DOGECOIN														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													264.970853 DOGE												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													13.248543 DOGE												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/xmr.svg">
													</div>
													<div class="terms__content-currency-item-name">
														XMR														<div class="terms__content-currency-item-full-name">
															MONERO														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													0.135227 XMR												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													0.006761 XMR												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/xlm.svg">
													</div>
													<div class="terms__content-currency-item-name">
														XLM														<div class="terms__content-currency-item-full-name">
															STELLAR														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													240.096038 XLM												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													12.004802 XLM												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/eos.svg">
													</div>
													<div class="terms__content-currency-item-name">
														EOS														<div class="terms__content-currency-item-full-name">
															EOS														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													16.528926 EOS												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													0.826446 EOS												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/link.svg">
													</div>
													<div class="terms__content-currency-item-name">
														LINK														<div class="terms__content-currency-item-full-name">
															CHAINLINK ERC-20														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													2.881844 LINK												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													0.144092 LINK												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>

																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/etc.svg">
													</div>
													<div class="terms__content-currency-item-name">
														ETC														<div class="terms__content-currency-item-full-name">
															ETHEREUM CLASSIC														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													0.998502 ETC												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													0.049925 ETC												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/ada.svg">
													</div>
													<div class="terms__content-currency-item-name">
														ADA														<div class="terms__content-currency-item-full-name">
															CARDANO														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													59.206631 ADA												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													2.960332 ADA												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/dash.svg">
													</div>
													<div class="terms__content-currency-item-name">
														DASH														<div class="terms__content-currency-item-full-name">
															DASH														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													0.301023 DASH												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													0.015051 DASH												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																						<div class="terms__content-currency-item">
												<div class="terms__content-container-info">
													<div class="terms__content-currency-item-logo">
														<img style="width: 34px;" src="/assets/img/cryptoicons/busd.svg">
													</div>
													<div class="terms__content-currency-item-name">
														BUSD														<div class="terms__content-currency-item-full-name">
															BUSD														</div>
													</div>
												</div>

												<div class="terms__content-currency-item-min-deposit">
													20.000000 BUSD												</div>

												<div class="terms__content-currency-item-persent">
													1%
												</div>
												<div class="terms__content-currency-item-number">
													1.000000 BUSD												</div>
		
												<div class="terms__content-currency-item-button">
													<a class="terms__content-currency-item-button-deposit" href="/profile/deposit">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Deposit
													</a>
													<a class="terms__content-currency-item-button-withdraw" href="/profile/withdraw">
														<svg width="12" height="12" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y">
															<path d="M8 12.598V3.402m0 0l3.338 3.32M8 3.401L4.661 6.71" stroke="#8C90A5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
														Withdraw
													</a>
												</div>
											</div>
																					
										
										</div>
									</div>
								</div>
							</div>
							
							
							

							<div class="terms__box">
								<div class="terms__title">Trading Fees</div>
								<div class="terms__content-wrapper">
									<div class="terms__content-trading">
										<div class="terms__trading-title-table-box">
											<div class="terms__trading-title-table">
												30-day Trade Volume, $
											</div>
											<div class="terms__trading-title-table trading-center">
												Effective Trading Comissions
											</div>
											<div class="terms__trading-title-table trading-right">
												Your Cashback
											</div>
										</div>
									</div>
									<div class="terms__content-trading table-bg">
										<div class="terms__trading-col-table-box ">
											<div class="terms__trading-col-wrapper">
												<div class="terms__trading-title-col">
													Maker
												</div>
												<div class="terms__trading-title-col">
													Taker
												</div>
											</div>

											<div class="terms__trading-col-wrapper">
												<div class="terms__trading-title-col table-end">
													Maker
												</div>
												<div class="terms__trading-title-col table-end">
													Taker
												</div>
											</div>


										</div>
									</div>
									<div class="terms__content-trading table-border">
										<div class="terms__trading-col-table-wrapper">
											<div class="terms__trading-title-table">
												2 000 000 +
											</div>
											<div class="terms__trading-col-table-box">
												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col">
														-0.05%
													</div>
													<div class="terms__trading-title-col">
														0.05%
													</div>
												</div>

												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col table-end">
														116%
													</div>
													<div class="terms__trading-title-col table-end">
														83%
													</div>
												</div>


											</div>

										</div>
									</div>
									<div class="terms__content-trading table-border">
										<div class="terms__trading-col-table-wrapper">
											<div class="terms__trading-title-table">
												5 000 000 - 20 000 000
											</div>
											<div class="terms__trading-col-table-box">
												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col">
														0.02%
													</div>
													<div class="terms__trading-title-col">
														0.1%
													</div>
												</div>

												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col table-end">

														93%
													</div>
													<div class="terms__trading-title-col table-end">
														66%
													</div>
												</div>


											</div>

										</div>
									</div>
									<div class="terms__content-trading table-border">
										<div class="terms__trading-col-table-wrapper">
											<div class="terms__trading-title-table">
												2 500 000 - 5 000 000
											</div>
											<div class="terms__trading-col-table-box">
												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col">

														0.02%
													</div>
													<div class="terms__trading-title-col">

														0.12%
													</div>
												</div>

												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col table-end">
														93%
													</div>
													<div class="terms__trading-title-col table-end">
														83%
													</div>
												</div>


											</div>

										</div>
									</div>
									<div class="terms__content-trading table-border">
										<div class="terms__trading-col-table-wrapper">
											<div class="terms__trading-title-table">
												1 000 000 - 2 500 000
											</div>
											<div class="terms__trading-col-table-box">
												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col">

														0.04%
													</div>
													<div class="terms__trading-title-col">

														0.14%
													</div>
												</div>

												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col table-end">

														86%
													</div>
													<div class="terms__trading-title-col table-end">

														53%
													</div>
												</div>


											</div>

										</div>
									</div>
									<div class="terms__content-trading table-border">
										<div class="terms__trading-col-table-wrapper">
											<div class="terms__trading-title-table">
												500 000 - 1 000 000
											</div>
											<div class="terms__trading-col-table-box">
												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col">
														0.06%
													</div>
													<div class="terms__trading-title-col">

														0.16%
													</div>
												</div>

												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col table-end">

														80%
													</div>
													<div class="terms__trading-title-col table-end">

														46%
													</div>
												</div>


											</div>

										</div>
									</div>
									<div class="terms__content-trading table-border">
										<div class="terms__trading-col-table-wrapper">
											<div class="terms__trading-title-table">
												250 000 - 500 000
											</div>
											<div class="terms__trading-col-table-box">
												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col">
														0.08%
													</div>
													<div class="terms__trading-title-col">

														0.18%
													</div>
												</div>

												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col table-end">
														73%
													</div>
													<div class="terms__trading-title-col table-end">
														40%
													</div>
												</div>


											</div>

										</div>
									</div>
									<div class="terms__content-trading table-border">
										<div class="terms__trading-col-table-wrapper">
											<div class="terms__trading-title-table">
												100 000 - 250 000
											</div>
											<div class="terms__trading-col-table-box">
												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col">
														0.1%
													</div>
													<div class="terms__trading-title-col">
														0.2%
													</div>
												</div>

												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col table-end">

														66%
													</div>
													<div class="terms__trading-title-col table-end">

														33%
													</div>
												</div>


											</div>

										</div>
									</div>
									<div class="terms__content-trading table-border">
										<div class="terms__trading-col-table-wrapper">
											<div class="terms__trading-title-table">
												50 000 - 100 000
											</div>
											<div class="terms__trading-col-table-box">
												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col">

														0.14%
													</div>
													<div class="terms__trading-title-col">

														0.22%
													</div>
												</div>

												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col table-end">
														53%
													</div>
													<div class="terms__trading-title-col table-end">

														26%
													</div>
												</div>


											</div>

										</div>
									</div>
									<div class="terms__content-trading table-border">
										<div class="terms__trading-col-table-wrapper">
											<div class="terms__trading-title-table">
												25 000 - 50 000
											</div>
											<div class="terms__trading-col-table-box">
												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col">

														0.16%
													</div>
													<div class="terms__trading-title-col">

														0.26%
													</div>
												</div>

												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col table-end">

														46%
													</div>
													<div class="terms__trading-title-col table-end">
														13%
													</div>
												</div>


											</div>

										</div>
									</div>
									<div class="terms__content-trading table-border">
										<div class="terms__trading-col-table-wrapper">
											<div class="terms__trading-title-table">
												10 000 - 25 000
											</div>
											<div class="terms__trading-col-table-box">
												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col">

														0.2%
													</div>
													<div class="terms__trading-title-col">
														0.28%
													</div>
												</div>

												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col table-end">

														33%
													</div>
													<div class="terms__trading-title-col table-end">
														6%
													</div>
												</div>


											</div>

										</div>
									</div>
									<div class="terms__content-trading table-border">
										<div class="terms__trading-col-table-wrapper">
											<div class="terms__trading-title-table">
												5 000 - 10 000
											</div>
											<div class="terms__trading-col-table-box">
												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col">
														0.22%
													</div>
													<div class="terms__trading-title-col">

														0.3%
													</div>
												</div>

												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col table-end">

														26%
													</div>
													<div class="terms__trading-title-col table-end">

														0%
													</div>
												</div>


											</div>

										</div>
									</div>
									<div class="terms__content-trading table-border">
										<div class="terms__trading-col-table-wrapper">
											<div class="terms__trading-title-table">
												0 - 5 000
											</div>
											<div class="terms__trading-col-table-box">
												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col">

														0.3%
													</div>
													<div class="terms__trading-title-col">

														0.3%
													</div>
												</div>

												<div class="terms__trading-col-wrapper">
													<div class="terms__trading-title-col table-end">

														0%
													</div>
													<div class="terms__trading-title-col table-end">

														0%
													</div>
												</div>


											</div>

										</div>
									</div>
								</div>
							</div>
                            
                            
                            
                        </div>
                    </div>
                    <div class="col-xl-12">
                        <div class="car"> </div>
                    </div>
                </div>
            </div>
        </div>
</div>

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

  </script>

</body>

</html>