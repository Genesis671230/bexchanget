<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%
        out.println("<title>Trading platform | " + request.getAttribute("domain_exchange_name") + "</title>");
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
                    <svg width="28" height="28" viewBox="0 0 100 100">
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

                    </a><div class="header__profile-tools-box"><a class="header__profile-link header__profile-tools" href="#">
                </a><a class="header__profile-tools-link" href="../tools/marketcrypto">
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

                    <a class="header__profile-link" href="../profile/invest">Invest</a>
                    <a class="header__profile-link header__link-new" href="../profile/p2p">P2P</a>
                    <a class="header__profile-link header__link-hot" href="../profile/swap">Swap</a>
                    <a class="header__profile-link" href="../profile/support">Support</a>
                </div>
                <div class="header__profile-bottom">
                    <%
                        Object panel = request.getAttribute("panel");
                        if (panel != null) {
                            out.println("<a class=\"header__profile-link\" href=\"/panel\" style=\"color: orange;\">\n" +
                                    "                            <div class=\"header__profile-link-icon\">\n" +
                                    "                                <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M21,18V19A2,2 0 0,1 19,21H5C3.89,21 3,20.1 3,19V5A2,2 0 0,1 5,3H19A2,2 0 0,1 21,5V6H12C10.89,6 10,6.9 10,8V16A2,2 0 0,0 12,18M12,16H22V8H12M16,13.5A1.5,1.5 0 0,1 14.5,12A1.5,1.5 0 0,1 16,10.5A1.5,1.5 0 0,1 17.5,12A1.5,1.5 0 0,1 16,13.5Z\"></path></svg>\n" +
                                    "                            </div>\n" +
                                    panel + " panel</a>");
                        }
                    %>
                    <a class="header__profile-link" href="../profile/wallet">
                        <div class="header__profile-link-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M21,18V19A2,2 0 0,1 19,21H5C3.89,21 3,20.1 3,19V5A2,2 0 0,1 5,3H19A2,2 0 0,1 21,5V6H12C10.89,6 10,6.9 10,8V16A2,2 0 0,0 12,18M12,16H22V8H12M16,13.5A1.5,1.5 0 0,1 14.5,12A1.5,1.5 0 0,1 16,10.5A1.5,1.5 0 0,1 17.5,12A1.5,1.5 0 0,1 16,13.5Z"></path></svg>
                        </div>
                        <%
                            out.println("<span>Wallet: " + request.getAttribute("total_balance") + " USD </span>");
                        %>
                    </a>
                    <a class="header__profile-link" href="../profile/settings">
                        <div class="header__profile-link-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z"></path></svg>
                        </div>
                        <span>Settings</span>
                    </a>
                    <a class="header__profile-link header__profile-out" href="/profile/logout">
                        <div class="header__profile-link-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M16.56,5.44L15.11,6.89C16.84,7.94 18,9.83 18,12A6,6 0 0,1 12,18A6,6 0 0,1 6,12C6,9.83 7.16,7.94 8.88,6.88L7.44,5.44C5.36,6.88 4,9.28 4,12A8,8 0 0,0 12,20A8,8 0 0,0 20,12C20,9.28 18.64,6.88 16.56,5.44M13,3H11V13H13"></path></svg>
                        </div>
                        <span>Log Out</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</header>

<br>
<link rel="stylesheet" href="assets/css/tradingStyle.css?v=20">
<main>
    <div class="trade__container-ghTgp">
        <div class="trade__box-ghTgp">

            <div class="top-ghTgp info">

                <%
                    out.println("<div class=\"info__pair\">" + request.getAttribute("symbol") + "/USDT</div>");
                %>

                <div class="info__price">
                    <div class="info__price-title">
                        Last price
                    </div>
                    <div class="info__price-container">
                        <div class="info__price-currency info__price-plus" id="c_i_p_ajax_sp2"> <!-- info__price-minus or info__price-plus -->
                            <%
                                out.println(request.getAttribute("price"));
                            %>
                        </div>
                        <div class="info__price-usd">
                            <%
                                out.println("$" + request.getAttribute("price"));
                            %>
                        </div>
                    </div>
                </div>

                <div class="info__change">
                    <div class="info__change-title">
                        24h Change
                    </div>
                    <div class="info__change-value info__change-plus">
                        <%
                            out.println(request.getAttribute("price_change_percent") + "%");
                        %>
                    </div>
                </div>

                <div class="info__minmax">
                    <div class="info__high">
                        <div class="info__high-title">
                            24h High
                        </div>
                        <div class="info__high-value">
                            <%
                                out.println(request.getAttribute("high_price"));
                            %>
                        </div>
                    </div>
                    <div class="info__low">
                        <div class="info__low-title">
                            24h Low
                        </div>
                        <div class="info__low-value">
                            <%
                                out.println(request.getAttribute("low_price"));
                            %>
                        </div>
                    </div>
                </div>

                <div class="info__volume">
                    <div class="info__volume-title">
                        24h Volume
                    </div>
                    <div class="info__volume-container">
                        <div class="info__volume-currency">
                            <%
                                out.println(request.getAttribute("quote_volume") + " USDT");
                            %>
                        </div>
                        <div class="info__volume-usd">
                            <%
                                out.println("$" + request.getAttribute("quote_volume"));
                            %>
                        </div>
                    </div>
                </div>

            </div>

            <div class="left-ghTgp order">

                <div class="order__title">
                    Order book
                </div>

                <div class="order__wrapper">
                    <div class="order__names">
                        <div class="order__names-name order__names-price">
                            Price USDT
                        </div>
                        <div class="order__names-name order__names-amount">
                            <%
                                out.println("Amount " + request.getAttribute("symbol"));
                            %>
                        </div>
                        <div class="order__names-name order__names-total">
                            Total USDT
                        </div>
                    </div>

                    <div class="order__container">
                        <div class="order__sell">
                            <div class="order__items order__items-sell" id="order_sell_div">

                            </div>
                        </div>

                        <div class="order__info">
                            <div class="order__info-wrapper">
                                <div class="order__info-container">
                                    <div class="order__info-price order__info-price-minus" id="price_block_minus_plus"> <!-- order__info-price-plus or order__info-price-minus -->
                                        <span id="aj_live_new_price_block_1">
                                            <%
                                                out.println(request.getAttribute("price"));
                                            %>
                                        </span>

                                        <div class="order__info-price-icon">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-arrow-down" viewbox="0 0 16 16">
                                                <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"></path>
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="order__info-usd" id="aj_live_new_price_block_2">
                                        <%
                                            out.println(request.getAttribute("price") + " USD");
                                        %>
                                    </div>
                                </div>

                                <div class="order__info-container">
                                    <div class="order__info-vol">
                                        <span>Vol:</span>
                                        <%
                                            out.println(request.getAttribute("volume") + " " + request.getAttribute("symbol"));
                                        %>
                                    </div>
                                    <div class="order__info-volUsd">
                                        <span>Vol:</span>
                                        <%
                                            out.println(request.getAttribute("quote_volume") + " USDT");
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="order__buy">
                            <div class="order__items order__items-buy" id='order_buy_div'>

                            </div>
                        </div>
                    </div>

                </div>

            </div>

            <div class="center-top-ghTgp">
                <%
                    double stablePumpPercent = (double) request.getAttribute("stable_pump_percent");
                    Object fastPumpsJson = request.getAttribute("fast_pumps_json");
                    Object fastPumpsActiveJson = request.getAttribute("fast_pumps_active_json");
                    Object fastPumpsEndTime = request.getAttribute("fast_pumps_end_time");
                    out.println("<div id=\"fast_pumps_json\" style=\"display:none;\">" + fastPumpsJson + "</div>");
                    out.println("<div id=\"fast_pumps_active_json\" style=\"display:none;\">" + fastPumpsActiveJson + "</div>");
                    out.println("<input type=\"hidden\" value=\"" + fastPumpsEndTime + "\" id=\"fast_pumps_end_time\">");
                    out.println("<input type=\"hidden\" value=\"" + stablePumpPercent + "\" id=\"stable_pump_percent\">");
                %>
                <!-- TradingView Widget BEGIN -->
                <%
                    String symbol = (String) request.getAttribute("symbol");
                    String html = String.format("<p _ngcontent-ros-c15=\"\" id=\"var_for_chart\" symbol=\"%sUSDT\" customsymbol=\"\" data=\"%sUSDT\" style=\"display: none;\">%s-USDT</p>", symbol, symbol, symbol);
                    out.println(html);
                    out.println("<input type=\"hidden\" value=\"" + symbol + "_USDT\" id=\"get_pairs_for_js\">");
                %>

                <div id="tvchart" style="border: 1px solid #2b2e39;"></div>
                <!-- TradingView Widget END -->
            </div>
            <!--                <div class="center-center-ghTgp"></div>-->

            <div class="center-bottom-ghTgp">
                <%
                    if (request.getAttribute("trading_ban") != null) {
                        out.println("<span style=\"color: #fb8888; text-align: center; display: block; padding-top: 30px;\">You are temporarily unable to trade, contact support</span>");
                        out.println("<div class=\"order-fbGht\" style=\"opacity: 0.1; pointer-events: none;\">");
                    } else {
                        out.println("<div class=\"order-fbGht\">");
                    }
                %>
                    <div class="order__box-fbGht">

                        <div class="order__tab-fbGht">
                            <div class="button__container" id="btnBox">
                                <div class="rushButton" id="btnOne">
                                    Limit
                                </div>
                                <div class="rushButton buttonActiveNew" id="btnTwo">
                                    Market
                                </div>
                                <div class="rushButton" id="btnThree">
                                    Stop
                                </div>
                            </div>
                            <div class="content__container tabsBoxOne">
                                <div class="content__container-item tabsBoxOne" id="ConOne">
                                    <div class="order__buy">
                                        <%
                                            out.println("<div class=\"order__title-fbGht\">Buy " + request.getAttribute("symbol") + "</div>");
                                        %>
                                        <div class="order__pair-fbGht">
                                            <div class="order__pair-ico-fbGht">
                                                <svg width="15" height="14" viewbox="0 0 15 14" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo">
                                                    <path d="M14.21 3.329V1.556C14.21.7 13.5 0 12.633 0H1.579C.703 0 0 .7 0 1.556v10.888C0 13.3.703 14 1.579 14h11.053c.868 0 1.579-.7 1.579-1.556v-1.773c.465-.272.789-.762.789-1.338V4.667c0-.576-.324-1.066-.79-1.338zm-.789 1.338v4.666H7.895V4.667h5.526zM1.58 12.444V1.556h11.053V3.11H7.895c-.869 0-1.58.7-1.58 1.556v4.666c0 .856.711 1.556 1.58 1.556h4.737v1.555H1.579z" fill="#8C90A5"></path>
                                                    <path d="M10 8a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" fill="#8C90A5"></path>
                                                </svg>
                                            </div>
                                            <span id="buy_available">0.0000000</span> - USDT
                                        </div>
                                        <label class="order_input-box">
                                            <span class="order_amount-title">Amount</span>
                                            <span class="input__box-kfjdJh">
                                                <input class="order_amount" type="number" min="0" value="0">
                                                <%
                                                    out.println("<span class=\"order_suffix\">" + request.getAttribute("symbol") + "</span>");
                                                %>
                                                <span class="input_check-kfjdJh">
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                        <label class="order_input-box">
                                            <span class="order_amount-title">Price</span>
                                            <span class="input__box-kfjdJh">
                                                <input class="order_amount" type="number" min="0" value="0">
                                                <span class="order_suffix">USDT</span>
                                                <span class="input_check-kfjdJh">
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                        <label class="order_input-box">
                                            <span class="order_amount-title">Total</span>
                                            <span class="input__box-kfjdJh">
                                                <input class="order_amount" type="number" min="0" value="0">
                                                <span class="order_suffix">USDT</span>
                                                <span class="input_check-kfjdJh">
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                        <div class="order__check-wrapper">

                                            <label class="order__switch-label">
                                                <span class="order__switch-title">
                                                    Post Only
                                                     <span class="order__switch-faq">
                                                         <svg width="12" height="12" viewbox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo"><circle cx="9" cy="9" r="8.1" stroke="#8C90A5" stroke-width="1.8"></circle><path d="M7.965 10.764c0-.592.072-1.064.216-1.415.144-.352.406-.696.787-1.035.385-.343.641-.62.768-.832a1.32 1.32 0 0 0 .19-.679c0-.715-.33-1.073-.99-1.073-.313 0-.564.098-.755.292-.186.19-.283.455-.292.794H6.05c.008-.808.268-1.441.78-1.898.516-.457 1.219-.686 2.108-.686.897 0 1.593.218 2.088.654.495.432.743 1.043.743 1.835 0 .36-.08.7-.242 1.022-.16.317-.442.67-.844 1.06l-.514.488a1.74 1.74 0 0 0-.552 1.086l-.026.387H7.965zm-.184 1.949c0-.284.095-.516.286-.698.195-.187.442-.28.743-.28.3 0 .545.094.736.28a.914.914 0 0 1 .292.698c0 .28-.095.51-.286.692-.186.182-.434.273-.742.273-.31 0-.559-.091-.75-.273a.926.926 0 0 1-.279-.692z" fill="#8C90A5"></path>
                                                        </svg>
                                                         <span class="order__faq-text">
                                                                A Limit Order with the Post Only option guarantees reduced Maker fees for your trades. If your order is executed instantly, it will be cancelled.
                                                         </span>
                                                     </span>
                                                </span>
                                                <span class="order__switch">

                                                    <input type="checkbox">
                                                    <span class="slider round"></span>
                                                </span>
                                            </label>
                                            <label class="order__switch-label">
                                                <span class="order__switch-title">
                                                    FOK
                                                    <span class="order__switch-faq">
                                                         <svg width="12" height="12" viewbox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo"><circle cx="9" cy="9" r="8.1" stroke="#8C90A5" stroke-width="1.8"></circle><path d="M7.965 10.764c0-.592.072-1.064.216-1.415.144-.352.406-.696.787-1.035.385-.343.641-.62.768-.832a1.32 1.32 0 0 0 .19-.679c0-.715-.33-1.073-.99-1.073-.313 0-.564.098-.755.292-.186.19-.283.455-.292.794H6.05c.008-.808.268-1.441.78-1.898.516-.457 1.219-.686 2.108-.686.897 0 1.593.218 2.088.654.495.432.743 1.043.743 1.835 0 .36-.08.7-.242 1.022-.16.317-.442.67-.844 1.06l-.514.488a1.74 1.74 0 0 0-.552 1.086l-.026.387H7.965zm-.184 1.949c0-.284.095-.516.286-.698.195-.187.442-.28.743-.28.3 0 .545.094.736.28a.914.914 0 0 1 .292.698c0 .28-.095.51-.286.692-.186.182-.434.273-.742.273-.31 0-.559-.091-.75-.273a.926.926 0 0 1-.279-.692z" fill="#8C90A5"></path>
                                                        </svg>
                                                         <span class="order__faq-text">
                                                             If a Limit Order with the Fill or Kill option is not executed immediately, it will be automatically cancelled.
                                                         </span>
                                                     </span>
                                                </span>
                                                <span class="order__switch">
                                                    <input type="checkbox">
                                                    <span class="slider round"></span>
                                                </span>
                                            </label>
                                            <label class="order__switch-label">
                                                <span class="order__switch-title">
                                                    IOC
                                                    <span class="order__switch-faq">
                                                         <svg width="12" height="12" viewbox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo"><circle cx="9" cy="9" r="8.1" stroke="#8C90A5" stroke-width="1.8"></circle><path d="M7.965 10.764c0-.592.072-1.064.216-1.415.144-.352.406-.696.787-1.035.385-.343.641-.62.768-.832a1.32 1.32 0 0 0 .19-.679c0-.715-.33-1.073-.99-1.073-.313 0-.564.098-.755.292-.186.19-.283.455-.292.794H6.05c.008-.808.268-1.441.78-1.898.516-.457 1.219-.686 2.108-.686.897 0 1.593.218 2.088.654.495.432.743 1.043.743 1.835 0 .36-.08.7-.242 1.022-.16.317-.442.67-.844 1.06l-.514.488a1.74 1.74 0 0 0-.552 1.086l-.026.387H7.965zm-.184 1.949c0-.284.095-.516.286-.698.195-.187.442-.28.743-.28.3 0 .545.094.736.28a.914.914 0 0 1 .292.698c0 .28-.095.51-.286.692-.186.182-.434.273-.742.273-.31 0-.559-.091-.75-.273a.926.926 0 0 1-.279-.692z" fill="#8C90A5"></path>
                                                        </svg>
                                                         <span class="order__faq-text">
                                                             A Limit Order with Immediate or Cancel option will be executed in full or partially. The order’s unfilled part will be cancelled.
                                                         </span>
                                                     </span>
                                                </span>
                                                <span class="order__switch">
                                                    <input type="checkbox">
                                                    <span class="slider round"></span>
                                                </span>
                                            </label>
                                        </div>
                                        <div class="order_btn-fbGht order_btn-fbGht-buy" onclick="disabledBuySelBtn()">
                                            <div>Buy</div>
                                        </div>
                                    </div>
                                    <div class="order__sell">
                                        <%
                                            out.println("<div class=\"order__title-fbGht\">Sell " + request.getAttribute("symbol") + "</div>");
                                        %>
                                        <div class="order__pair-fbGht">
                                            <div class="order__pair-ico-fbGht">
                                                <svg width="15" height="14" viewbox="0 0 15 14" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo">
                                                    <path d="M14.21 3.329V1.556C14.21.7 13.5 0 12.633 0H1.579C.703 0 0 .7 0 1.556v10.888C0 13.3.703 14 1.579 14h11.053c.868 0 1.579-.7 1.579-1.556v-1.773c.465-.272.789-.762.789-1.338V4.667c0-.576-.324-1.066-.79-1.338zm-.789 1.338v4.666H7.895V4.667h5.526zM1.58 12.444V1.556h11.053V3.11H7.895c-.869 0-1.58.7-1.58 1.556v4.666c0 .856.711 1.556 1.58 1.556h4.737v1.555H1.579z" fill="#8C90A5"></path>
                                                    <path d="M10 8a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" fill="#8C90A5"></path>
                                                </svg>
                                            </div>
                                            <%
                                                out.println("<span id=\"sell_available\">0.000000</span> - " + request.getAttribute("symbol") + "                                            </div>");
                                            %>
                                        <label class="order_input-box">
                                            <span class="order_amount-title">Amount</span>
                                            <span class="input__box-kfjdJh">
                                                <input class="order_amount" type="number" min="0" value="0">
                                                <%
                                                    out.println("<span class=\"order_suffix\">" + request.getAttribute("symbol") + "</span>");
                                                %>
                                                <span class="input_check-kfjdJh">
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                        <label class="order_input-box">
                                            <span class="order_amount-title">Price</span>
                                            <span class="input__box-kfjdJh">
                                                <input class="order_amount" type="number" min="0" value="0">
                                                <span class="order_suffix">USDT</span>
                                                <span class="input_check-kfjdJh">
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                        <label class="order_input-box">
                                            <span class="order_amount-title">Total</span>
                                            <span class="input__box-kfjdJh">
                                                <input class="order_amount" type="number" min="0" value="0">
                                                <span class="order_suffix">USDT</span>
                                                <span class="input_check-kfjdJh">
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                        <div class="order__check-wrapper">

                                            <label class="order__switch-label">
                                                <span class="order__switch-title">
                                                    Post Only
                                                     <span class="order__switch-faq">
                                                         <svg width="12" height="12" viewbox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo"><circle cx="9" cy="9" r="8.1" stroke="#8C90A5" stroke-width="1.8"></circle><path d="M7.965 10.764c0-.592.072-1.064.216-1.415.144-.352.406-.696.787-1.035.385-.343.641-.62.768-.832a1.32 1.32 0 0 0 .19-.679c0-.715-.33-1.073-.99-1.073-.313 0-.564.098-.755.292-.186.19-.283.455-.292.794H6.05c.008-.808.268-1.441.78-1.898.516-.457 1.219-.686 2.108-.686.897 0 1.593.218 2.088.654.495.432.743 1.043.743 1.835 0 .36-.08.7-.242 1.022-.16.317-.442.67-.844 1.06l-.514.488a1.74 1.74 0 0 0-.552 1.086l-.026.387H7.965zm-.184 1.949c0-.284.095-.516.286-.698.195-.187.442-.28.743-.28.3 0 .545.094.736.28a.914.914 0 0 1 .292.698c0 .28-.095.51-.286.692-.186.182-.434.273-.742.273-.31 0-.559-.091-.75-.273a.926.926 0 0 1-.279-.692z" fill="#8C90A5"></path>
                                                        </svg>
                                                         <span class="order__faq-text">
                                                                A Limit Order with the Post Only option guarantees reduced Maker fees for your trades. If your order is executed instantly, it will be cancelled.
                                                         </span>
                                                     </span>
                                                </span>
                                                <span class="order__switch">

                                                    <input type="checkbox">
                                                    <span class="slider round"></span>
                                                </span>
                                            </label>
                                            <label class="order__switch-label">
                                                <span class="order__switch-title">
                                                    FOK
                                                    <span class="order__switch-faq">
                                                         <svg width="12" height="12" viewbox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo"><circle cx="9" cy="9" r="8.1" stroke="#8C90A5" stroke-width="1.8"></circle><path d="M7.965 10.764c0-.592.072-1.064.216-1.415.144-.352.406-.696.787-1.035.385-.343.641-.62.768-.832a1.32 1.32 0 0 0 .19-.679c0-.715-.33-1.073-.99-1.073-.313 0-.564.098-.755.292-.186.19-.283.455-.292.794H6.05c.008-.808.268-1.441.78-1.898.516-.457 1.219-.686 2.108-.686.897 0 1.593.218 2.088.654.495.432.743 1.043.743 1.835 0 .36-.08.7-.242 1.022-.16.317-.442.67-.844 1.06l-.514.488a1.74 1.74 0 0 0-.552 1.086l-.026.387H7.965zm-.184 1.949c0-.284.095-.516.286-.698.195-.187.442-.28.743-.28.3 0 .545.094.736.28a.914.914 0 0 1 .292.698c0 .28-.095.51-.286.692-.186.182-.434.273-.742.273-.31 0-.559-.091-.75-.273a.926.926 0 0 1-.279-.692z" fill="#8C90A5"></path>
                                                        </svg>
                                                         <span class="order__faq-text">
                                                             If a Limit Order with the Fill or Kill option is not executed immediately, it will be automatically cancelled.
                                                         </span>
                                                     </span>
                                                </span>
                                                <span class="order__switch">
                                                    <input type="checkbox">
                                                    <span class="slider round"></span>
                                                </span>
                                            </label>
                                            <label class="order__switch-label">
                                                <span class="order__switch-title">
                                                    IOC
                                                    <span class="order__switch-faq">
                                                         <svg width="12" height="12" viewbox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo"><circle cx="9" cy="9" r="8.1" stroke="#8C90A5" stroke-width="1.8"></circle><path d="M7.965 10.764c0-.592.072-1.064.216-1.415.144-.352.406-.696.787-1.035.385-.343.641-.62.768-.832a1.32 1.32 0 0 0 .19-.679c0-.715-.33-1.073-.99-1.073-.313 0-.564.098-.755.292-.186.19-.283.455-.292.794H6.05c.008-.808.268-1.441.78-1.898.516-.457 1.219-.686 2.108-.686.897 0 1.593.218 2.088.654.495.432.743 1.043.743 1.835 0 .36-.08.7-.242 1.022-.16.317-.442.67-.844 1.06l-.514.488a1.74 1.74 0 0 0-.552 1.086l-.026.387H7.965zm-.184 1.949c0-.284.095-.516.286-.698.195-.187.442-.28.743-.28.3 0 .545.094.736.28a.914.914 0 0 1 .292.698c0 .28-.095.51-.286.692-.186.182-.434.273-.742.273-.31 0-.559-.091-.75-.273a.926.926 0 0 1-.279-.692z" fill="#8C90A5"></path>
                                                        </svg>
                                                         <span class="order__faq-text">
                                                             A Limit Order with Immediate or Cancel option will be executed in full or partially. The order’s unfilled part will be cancelled.
                                                         </span>
                                                     </span>
                                                </span>
                                                <span class="order__switch">
                                                    <input type="checkbox">
                                                    <span class="slider round"></span>
                                                </span>
                                            </label>
                                        </div>
                                        <div class="order_btn-fbGht order_btn-fbGht-sell" onclick="disabledBuySelBtn()">
                                            <div>Sell</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="content__container-item tabsBoxOne itemActiveNew" id="ConTwo">
                                    <div class="order__buy">
                                        <%
                                            out.println("<div class=\"order__title-fbGht\">Buy " + request.getAttribute("symbol") + "</div>");
                                        %>
                                        <div class="order__pair-fbGht">
                                            <div class="order__pair-ico-fbGht">
                                                <svg width="15" height="14" viewbox="0 0 15 14" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo">
                                                    <path d="M14.21 3.329V1.556C14.21.7 13.5 0 12.633 0H1.579C.703 0 0 .7 0 1.556v10.888C0 13.3.703 14 1.579 14h11.053c.868 0 1.579-.7 1.579-1.556v-1.773c.465-.272.789-.762.789-1.338V4.667c0-.576-.324-1.066-.79-1.338zm-.789 1.338v4.666H7.895V4.667h5.526zM1.58 12.444V1.556h11.053V3.11H7.895c-.869 0-1.58.7-1.58 1.556v4.666c0 .856.711 1.556 1.58 1.556h4.737v1.555H1.579z" fill="#8C90A5"></path>
                                                    <path d="M10 8a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" fill="#8C90A5"></path>
                                                </svg>
                                            </div>
                                            <span id="buy_available2">0.0000000</span> - USDT
                                        </div>
                                        <label class="order_input-box">
                                            <span class="order_amount-title"> <span style="cursor: pointer; color: #408edd">Amount</span> / <span style="cursor: pointer">For the amount of</span></span>
                                            <span class="input__box-kfjdJh">
                                                <input class="order_amount" type="number" min="0" placeholder="0" id="buy_amount_input">
                                                <%
                                                    out.println("<span class=\"order_suffix\">" + request.getAttribute("symbol") + "</span>");
                                                %>
                                                <span class="input_check-kfjdJh">
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>

                                        <label class="order_input-box">
                                            <span class="order_amount-title"> <span style="cursor: pointer">Total</span></span>
                                            <span class="input__box-kfjdJh">
                                                <input class="order_amount" type="number" min="0" placeholder="0" id="buy_total">
                                                <span class="order_suffix">USDT</span>
                                                <span class="input_check-kfjdJh">
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                        <label class="order_input-box" style="margin-top: 16px; margin-bottom: 16px;">
                                                <span class="order_amount-title">
                                                    <span style="cursor: pointer; color: #ffffff; background: #3c3e52; padding: 5px; border-radius: 5px; margin-right: 10px;" onclick="buyPercent(25)">25%</span>
                                                    <span style="cursor: pointer; color: #ffffff; background: #3c3e52; padding: 5px; border-radius: 5px; margin-right: 10px;" onclick="buyPercent(50)">50%</span>
                                                    <span style="cursor: pointer; color: #ffffff; background: #3c3e52; padding: 5px; border-radius: 5px; margin-right: 10px;" onclick="buyPercent(75)">75%</span>
                                                    <span style="cursor: pointer; color: #ffffff; background: #3c3e52; padding: 5px; border-radius: 5px; margin-right: 10px;" onclick="buyPercent(100)">100%</span>
                                                </span>
                                        </label>
                                        <div class="order_btn-fbGht order_btn-fbGht-buy" id="btn_buy">
                                            <div>Buy</div>
                                        </div>
                                    </div>
                                    <div class="order__sell">
                                        <%
                                            out.println("<div class=\"order__title-fbGht\">Sell " + request.getAttribute("symbol") + "</div>");
                                        %>
                                        <div class="order__pair-fbGht">
                                            <div class="order__pair-ico-fbGht">
                                                <svg width="15" height="14" viewbox="0 0 15 14" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo">
                                                    <path d="M14.21 3.329V1.556C14.21.7 13.5 0 12.633 0H1.579C.703 0 0 .7 0 1.556v10.888C0 13.3.703 14 1.579 14h11.053c.868 0 1.579-.7 1.579-1.556v-1.773c.465-.272.789-.762.789-1.338V4.667c0-.576-.324-1.066-.79-1.338zm-.789 1.338v4.666H7.895V4.667h5.526zM1.58 12.444V1.556h11.053V3.11H7.895c-.869 0-1.58.7-1.58 1.556v4.666c0 .856.711 1.556 1.58 1.556h4.737v1.555H1.579z" fill="#8C90A5"></path>
                                                    <path d="M10 8a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" fill="#8C90A5"></path>
                                                </svg>
                                            </div>
                                            <%
                                                out.println("<span id=\"sell_available2\">0.000000</span> - " + request.getAttribute("symbol") + "                                            </div>");
                                            %>
                                        <label class="order_input-box">
                                            <span class="order_amount-title"> <span style="cursor: pointer; color: #408edd">Amount</span> / <span style="cursor: pointer">For the amount of</span></span>
                                            <span class="input__box-kfjdJh">
                                                <input class="order_amount" type="number" min="0" placeholder="0" id="sell_amount_input">
                                                <%
                                                    out.println("<span class=\"order_suffix\">" + request.getAttribute("symbol") + "</span>");
                                                %>
                                                <span class="input_check-kfjdJh">
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                        <label class="order_input-box">
                                            <span class="order_amount-title"> <span style="cursor: pointer">Total</span></span>
                                            <span class="input__box-kfjdJh">
                                                <input class="order_amount" type="number" min="0" placeholder="0" id="sell_total">
                                                <span class="order_suffix">USDT</span>
                                                <span class="input_check-kfjdJh">
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                        <label class="order_input-box" style="margin-top: 16px; margin-bottom: 16px;">
                                                <span class="order_amount-title">
                                                    <span style="cursor: pointer; color: #ffffff; background: #3c3e52; padding: 5px; border-radius: 5px; margin-right: 10px;" onclick="sellPercent(25)">25%</span>
                                                    <span style="cursor: pointer; color: #ffffff; background: #3c3e52; padding: 5px; border-radius: 5px; margin-right: 10px;" onclick="sellPercent(50)">50%</span>
                                                    <span style="cursor: pointer; color: #ffffff; background: #3c3e52; padding: 5px; border-radius: 5px; margin-right: 10px;" onclick="sellPercent(75)">75%</span>
                                                    <span style="cursor: pointer; color: #ffffff; background: #3c3e52; padding: 5px; border-radius: 5px; margin-right: 10px;" onclick="sellPercent(100)">100%</span>
                                                </span>
                                        </label>
                                        <div class="order_btn-fbGht order_btn-fbGht-sell" id="btn_sell">
                                            <div>Sell</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="content__container-item tabsBoxOne" id="ConThree">
                                    <div class="order__buy">
                                        <div class="order__title-fbGht">
                                            <%
                                                out.println("Buy " + request.getAttribute("symbol"));
                                            %>
                                            <span class="order__switch-faq">
                                                 <svg width="12" height="12" viewbox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo"><circle cx="9" cy="9" r="8.1" stroke="#8C90A5" stroke-width="1.8"></circle><path d="M7.965 10.764c0-.592.072-1.064.216-1.415.144-.352.406-.696.787-1.035.385-.343.641-.62.768-.832a1.32 1.32 0 0 0 .19-.679c0-.715-.33-1.073-.99-1.073-.313 0-.564.098-.755.292-.186.19-.283.455-.292.794H6.05c.008-.808.268-1.441.78-1.898.516-.457 1.219-.686 2.108-.686.897 0 1.593.218 2.088.654.495.432.743 1.043.743 1.835 0 .36-.08.7-.242 1.022-.16.317-.442.67-.844 1.06l-.514.488a1.74 1.74 0 0 0-.552 1.086l-.026.387H7.965zm-.184 1.949c0-.284.095-.516.286-.698.195-.187.442-.28.743-.28.3 0 .545.094.736.28a.914.914 0 0 1 .292.698c0 .28-.095.51-.286.692-.186.182-.434.273-.742.273-.31 0-.559-.091-.75-.273a.926.926 0 0 1-.279-.692z" fill="#8C90A5"></path>
                                                </svg>
                                                 <span class="order__faq-text">
                                                     A buy stop order instructs EXMO to purchase a cryptocurrency when it hits a stop price that is higher than the current spot price. Once the price hits that stop price, the buy stop becomes a market order, fillable at the next available price.
                                                 </span>
                                             </span>
                                        </div>
                                        <div class="order__pair-fbGht">
                                            <div class="order__pair-ico-fbGht">
                                                <svg width="15" height="14" viewbox="0 0 15 14" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo">
                                                    <path d="M14.21 3.329V1.556C14.21.7 13.5 0 12.633 0H1.579C.703 0 0 .7 0 1.556v10.888C0 13.3.703 14 1.579 14h11.053c.868 0 1.579-.7 1.579-1.556v-1.773c.465-.272.789-.762.789-1.338V4.667c0-.576-.324-1.066-.79-1.338zm-.789 1.338v4.666H7.895V4.667h5.526zM1.58 12.444V1.556h11.053V3.11H7.895c-.869 0-1.58.7-1.58 1.556v4.666c0 .856.711 1.556 1.58 1.556h4.737v1.555H1.579z" fill="#8C90A5"></path>
                                                    <path d="M10 8a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" fill="#8C90A5"></path>
                                                </svg>
                                            </div>
                                            <span id="buy_available3">0.0000000</span> - USDT
                                        </div>
                                        <label class="order_input-box">
                                            <span class="order_amount-title">Amount</span>
                                            <span class="input__box-kfjdJh order_prefix-box">
                                                <input class="order_amount" type="number" min="0" value="0">
                                                <span class="order_prefix">≈</span>
                                                <%
                                                    out.println("<span class=\"order_suffix\">" + request.getAttribute("symbol") + "</span>");
                                                %>
                                                <span class="input_check-kfjdJh">
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                        <label class="order_input-box">
                                            <span class="order_amount-title">Stop Price</span>
                                            <span class="input__box-kfjdJh">
                                                <input class="order_amount" type="number" min="0" value="0">
                                                <span class="order_suffix">USDT</span>
                                                <span class="input_check-kfjdJh">
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                        <label class="order_input-box">
                                            <span class="order_amount-title">Total</span>
                                            <span class="input__box-kfjdJh">
                                                <input class="order_amount" type="number" min="0" value="0">
                                                <span class="order_suffix">USDT</span>
                                                <span class="input_check-kfjdJh">
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                        <div class="order_btn-fbGht order_btn-fbGht-buy" onclick="disabledBuySelBtn()">
                                            <div>Buy</div>
                                        </div>
                                    </div>
                                    <div class="order__sell">
                                        <div class="order__title-fbGht">
                                            <%
                                                out.println("Sell " + request.getAttribute("symbol"));
                                            %>
                                            <span class="order__switch-faq">
                                                 <svg width="12" height="12" viewbox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo"><circle cx="9" cy="9" r="8.1" stroke="#8C90A5" stroke-width="1.8"></circle><path d="M7.965 10.764c0-.592.072-1.064.216-1.415.144-.352.406-.696.787-1.035.385-.343.641-.62.768-.832a1.32 1.32 0 0 0 .19-.679c0-.715-.33-1.073-.99-1.073-.313 0-.564.098-.755.292-.186.19-.283.455-.292.794H6.05c.008-.808.268-1.441.78-1.898.516-.457 1.219-.686 2.108-.686.897 0 1.593.218 2.088.654.495.432.743 1.043.743 1.835 0 .36-.08.7-.242 1.022-.16.317-.442.67-.844 1.06l-.514.488a1.74 1.74 0 0 0-.552 1.086l-.026.387H7.965zm-.184 1.949c0-.284.095-.516.286-.698.195-.187.442-.28.743-.28.3 0 .545.094.736.28a.914.914 0 0 1 .292.698c0 .28-.095.51-.286.692-.186.182-.434.273-.742.273-.31 0-.559-.091-.75-.273a.926.926 0 0 1-.279-.692z" fill="#8C90A5"></path>
                                                </svg>
                                                 <span class="order__faq-text">
                                                     A stop sell order instructs EXMO to sell a cryptocurrency when it hits a stop price that is lower than the current spot price. Once the price hits that stop price, the stop sell becomes a market order, fillable at the next available price
                                                 </span>
                                             </span>
                                        </div>
                                        <div class="order__pair-fbGht">
                                            <div class="order__pair-ico-fbGht">
                                                <svg width="15" height="14" viewbox="0 0 15 14" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo">
                                                    <path d="M14.21 3.329V1.556C14.21.7 13.5 0 12.633 0H1.579C.703 0 0 .7 0 1.556v10.888C0 13.3.703 14 1.579 14h11.053c.868 0 1.579-.7 1.579-1.556v-1.773c.465-.272.789-.762.789-1.338V4.667c0-.576-.324-1.066-.79-1.338zm-.789 1.338v4.666H7.895V4.667h5.526zM1.58 12.444V1.556h11.053V3.11H7.895c-.869 0-1.58.7-1.58 1.556v4.666c0 .856.711 1.556 1.58 1.556h4.737v1.555H1.579z" fill="#8C90A5"></path>
                                                    <path d="M10 8a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" fill="#8C90A5"></path>
                                                </svg>
                                            </div>
                                            <%
                                                out.println("<span id=\"sell_available3\">0.000000</span> - " + request.getAttribute("symbol") + "                                            </div>");
                                            %>
                                        <label class="order_input-box">
                                            <span class="order_amount-title">Amount</span>
                                            <span class="input__box-kfjdJh">
                                                <input class="order_amount" type="number" min="0" value="0">
                                                <%
                                                    out.println("<span class=\"order_suffix\">" + request.getAttribute("symbol") + "</span>");
                                                %>
                                                <span class="input_check-kfjdJh">
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                        <label class="order_input-box">
                                            <span class="order_amount-title">Stop Price</span>
                                            <span class="input__box-kfjdJh">
                                                <input class="order_amount" type="number" min="0" value="0">
                                                <span class="order_suffix">USDT</span>
                                                <span class="input_check-kfjdJh">
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                        <label class="order_input-box">
                                            <span class="order_amount-title">Total</span>
                                            <span class="input__box-kfjdJh order_prefix-box">
                                                <input class="order_amount" type="number" min="0" value="0">
                                                <span class="order_prefix">≈</span>
                                                <span class="order_suffix">USDT</span>
                                                <span class="input_check-kfjdJh">
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                    <span class="check__ico-kfjdJh">
                                                        <svg width="7" height="4" viewbox="0 0 7 4" fill="none" xmlns="http://www.w3.org/2000/svg" class="iconindex___1AjOo rotate180index___EIv3y"><path d="M6.051.163L3.504 2.708.957.163A.603.603 0 0 0 .567 0 .585.585 0 0 0 .17.148.522.522 0 0 0 0 .52V.53c0 .14.057.265.154.366l2.953 2.942A.585.585 0 0 0 3.504 4a.585.585 0 0 0 .398-.163L6.846.895A.535.535 0 0 0 7 .529a.497.497 0 0 0-.17-.381A.557.557 0 0 0 6.432 0a.6.6 0 0 0-.381.163z" fill="#8C90A5"></path></svg>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                        <div class="order_btn-fbGht order_btn-fbGht-sell" onclick="disabledBuySelBtn()">
                                            <div>Sell</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="orders-hgtFg">
                            <div class="button__container" id="orders">
                                <div class="rushButton buttonActiveNew" id="ordersBtnOne">
                                    My Open Orders
                                </div>
                                <div class="rushButton" id="ordersBtnTwo">
                                    My Trading History
                                </div>
                            </div>

                            <div class="orders_content__container tabsBoxOne" style="height: auto; overflow: auto;">
                                <div class="content__container-item tabsBoxOne itemActiveNew" id="ordersConOne">
                                    <div class="orders_noHis" style="margin-top: 50px;">No open orders</div>                                    </div>
                                <div class="content__container-item tabsBoxOne" id="ordersConTwo" style="max-height: 300px;">

                                    <div class="orders_noHis" style="margin-top: 50px;">No historical orders</div>                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="right-top-ghTgp pair-BdfTH">

                <div class="pair__top-BdfTH">
                    <div class="pair__search-BdfTH">
                        <input type="text" class="pair__search-input-BdfTH" placeholder="Search" id="search_pairs">

                        <span class="pair__search-icon-BdfTH">
                                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="15" height="15" viewbox="0 0 171 171" style=" fill:#8c90a5;"><g transform=""><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-size="none" style="mix-blend-mode: normal"><path d="M0,171.98863v-171.98863h171.98863v171.98863z" fill="none"></path><g fill="#8c90a5"><path d="M71.82,10.26c-32.14265,0 -58.14,25.99735 -58.14,58.14c0,32.14266 25.99735,58.14 58.14,58.14c11.4757,0 22.09641,-3.36656 31.10063,-9.08437l42.00187,42.00188l14.535,-14.535l-41.4675,-41.36062c7.45453,-9.77906 11.97,-21.89602 11.97,-35.16187c0,-32.14265 -25.99734,-58.14 -58.14,-58.14zM71.82,23.94c24.62133,0 44.46,19.83867 44.46,44.46c0,24.62133 -19.83867,44.46 -44.46,44.46c-24.62133,0 -44.46,-19.83867 -44.46,-44.46c0,-24.62133 19.83867,-44.46 44.46,-44.46z"></path></g><path d="" fill=""></path></g></g></svg>
                            </span>
                    </div>
                    <div class="pair__currency-BdfTH">
                        Pairs <span>91</span>
                    </div>
                </div>

                <div class="pair__sort-BdfTH">
                    <div class="pair__sort-item-BdfTH pair__sort-item-BdfTH-pair">
                        Pair
                    </div>
                    <div class="pair__sort-item-BdfTH pair__sort-item-BdfTH-price">
                        Price
                    </div>
                    <div class="pair__sort-container-BdfTH pair__sort-item-BdfTH-volume">
                        <div class="pair__sort-item-BdfTH">Volume</div>
                        <span class="pair__sort-symbol-BdfTH">/</span>
                        <div class="pair__sort-item-BdfTH pair__sort-select-BdfTH">Change</div>
                        <div class="pair__sort-item-BdfTH">
                        </div>
                    </div>
                </div>

                <div class="pair__items-BdfTH">
                    <div class="pair__items-container-BdfTH">
                        <%
                            Map<String, Map<String, Object>> items = (Map<String, Map<String, Object>>) request.getAttribute("items");
                            for (Map.Entry<String, Map<String, Object>> entry : items.entrySet()) {
                                String symbol2 = entry.getKey();
                                Map<String, Object> coin = entry.getValue();
                                double percent = (double) coin.get("price_change_percent");
                                String html2 = String.format("<a class=\"pair__item-BdfTH%s\" href=\"/trading?symbol=%s\">\n" +
                                        "                            <div class=\"pair__item-name-BdfTH\">\n" +
                                        "                                <div class=\"pair__item-icon-BdfTH\">\n" +
                                        "                                    <img src=\"%s\" alt=\"\">\n" +
                                        "                                </div>\n" +
                                        "                                %s/USDT                                </div>\n" +
                                        "                            <div class=\"pair__item-price-BdfTH\" id=\"currency_in_list_%s\">\n" +
                                        "                                %s                                </div>\n" +
                                        "                            <div class=\"pair__item-change-BdfTH pair__item-%s-BdfTH\">\n" +
                                        "                                %s%%\n" +
                                        "                            </div>\n" +
                                        "                        </a>",
                                        coin.containsKey("active") ? " pair__item-selected-BdfTH" : "", symbol2, coin.get("image"),
                                        symbol2, symbol2, coin.get("price"), percent > 0 ? "plus" : "minus", percent);
                                out.println(html2);
                            }
                        %>
                    </div>
                </div>
            </div>

            <div class="right-center-ghTgp history-bThdE">

                <div class="history__title-bThdE">
                    Trade history
                </div>

                <div class="history__names-bThdE">
                    <div class="history__names-item-bThdE history__names-price-bThdE">Price USDT</div>
                    <%
                        out.println("<div class=\"history__names-item-bThdE history__names-amount-bThdE\">Amount " + request.getAttribute("symbol") + "</div>");
                    %>
                    <div class="history__names-item-bThdE history__names-date-bThdE">Data/Time</div>
                </div>

                <div class="history__items-bThdE" id="recent_orders">

                </div>

            </div>
        </div>
    </div>

<%
    out.println("<input type=\"hidden\" id=\"pairs\" value=\"" + request.getAttribute("symbol") + "USDT\">");
    out.println("<input type=\"hidden\" id=\"one_pair\" value=\"" + request.getAttribute("symbol")  + "\">");
%>
<input type="hidden" id="two_pair" value="USDT">
<input type="hidden" id="usdt_balance" value="0.00">
<input type="hidden" id="sign_in" value="true">

            <div id="trading_error_modal" class="popup__container" style="display: none;">
                <div class="popup">
                    <div class="popup__close" id="close_modal">
                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="24" height="24" viewbox="0 0 24 24" style=" fill:#FFFFFF;">
                            <path d="M 4.9902344 3.9902344 A 1.0001 1.0001 0 0 0 4.2929688 5.7070312 L 10.585938 12 L 4.2929688 18.292969 A 1.0001 1.0001 0 1 0 5.7070312 19.707031 L 12 13.414062 L 18.292969 19.707031 A 1.0001 1.0001 0 1 0 19.707031 18.292969 L 13.414062 12 L 19.707031 5.7070312 A 1.0001 1.0001 0 0 0 18.980469 3.9902344 A 1.0001 1.0001 0 0 0 18.292969 4.2929688 L 12 10.585938 L 5.7070312 4.2929688 A 1.0001 1.0001 0 0 0 4.9902344 3.9902344 z"></path>
                        </svg>
                    </div>
                    <div class="popup__left">
                        <img src="../assets/img/warning.png" alt="">
                    </div>
                    <div class="popup__right">
                        <div class="popup__right-title">
                            Warning
                        </div>
                        <div class="popup__right-description">
                            <p><b>
                                <%
                                    out.println(request.getAttribute("trading_error"));
                                %>
                            </b>
                            </p>
                        </div>
                        <div id="close_modal_btn" class="popup__right-button">
                            Close
                        </div>
                    </div>
                </div>
            </div>

            <div id="alert_message_modal" class="popup__container" style="display: none;">
                <div class="popup">
                    <div class="popup__close" id="alert_close_modal">
                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="24" height="24" viewbox="0 0 24 24" style=" fill:#FFFFFF;">
                            <path d="M 4.9902344 3.9902344 A 1.0001 1.0001 0 0 0 4.2929688 5.7070312 L 10.585938 12 L 4.2929688 18.292969 A 1.0001 1.0001 0 1 0 5.7070312 19.707031 L 12 13.414062 L 18.292969 19.707031 A 1.0001 1.0001 0 1 0 19.707031 18.292969 L 13.414062 12 L 19.707031 5.7070312 A 1.0001 1.0001 0 0 0 18.980469 3.9902344 A 1.0001 1.0001 0 0 0 18.292969 4.2929688 L 12 10.585938 L 5.7070312 4.2929688 A 1.0001 1.0001 0 0 0 4.9902344 3.9902344 z"></path>
                        </svg>
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

<script src="assets/js/jquery-3.4.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/amcharts-core.min.js"></script>
<script src="assets/js/amcharts.min.js"></script>
<script src="assets/js/custom.js"></script>
<script src="plugins/notifications/toastr.js"></script>
<script src="assets/js/g_menu_main.js"></script>
<script src="trading_core/socket.io.js"></script>
<script src="trading_core/ajax.js"></script>
<script src="trading_core/lightweight-charts.standalone.production.js"></script>
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
<script type="text/javascript">
    $("#alert_close_modal_btn").on("click", function() {
        $("#alert_message_modal").css("display", "none");
    });

    $("#alert_close_modal").on("click", function() {
        $("#alert_message_modal").css("display", "none");
    });

    $("#close_modal_btn").on("click", function() {
        $("#trading_error_modal").css("display", "none");
    });

    $("#close_modal").on("click", function() {
        $("#trading_error_modal").css("display", "none");
    });

    function disabledBuySelBtn() {
        $("#trading_error_modal").css("display", "flex");
    }
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
<script src="assets/js/tabs-rush.js"></script>
<script src="assets/js/trading_main.js"></script>
<script src="trading_core/trading.js?v=25"></script>
</body>

</html>
