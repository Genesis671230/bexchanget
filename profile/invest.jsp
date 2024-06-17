﻿<%@ page import="java.util.Map" %>
<%@ page import="org.apache.commons.lang3.tuple.Pair" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%
        out.println("<title>Investment | " + request.getAttribute("domain_exchange_name") + "</title>");
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


    <link rel="stylesheet" href="../assets/css/staking_normalize.css">
    <link rel="stylesheet" href="../assets/css/staking_global.css">
    <link rel="stylesheet" href="../assets/css/staking__page__298475.css">
    <link rel="stylesheet" href="../assets/css/investments__page_198567.css">
    <style type="text/css">
        .menuProfile__container {
            max-width: 941px !important;
        }

        .menuProfile {
            margin-bottom: -28px !important;
        }
    </style>
      <div id="invest_return_modal" class="popap-container" style="display: none; position: fixed;">
        <div class="popap-container-item">
          <a href="/profile/invest">
            <div class="popap-container-item-close" id="close_modal">
                
            </div>
          </a>
            <div class="popap-container-item-text-box" style="width: 400px">
                <h3 class="popap-container-item-title">
                    Success
                </h3>
                <p id="withdraw_modal_text" class="popap-container-item-text">
                    Refund completed successfully. <br>Your <strong><span id="invest_modal_span_amount">5 BTC</span></strong> have been successfully transferred to your balance.
                    <br><br>
                    <i style="color: silver;">We would like to remind you that if you return the funds before your investment plan, then earnings will not be added.</i>
                </p>
                <div class="popap-container-item-btn" id="close_modal_btn">
                    <span class="popap-container-item-button" onclick="location.reload()">
                        Close
                    </span>
                </div>
            </div>
        </div>
      </div>
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
                <a class="menuProfile__menu-item mdi mdi-transfer-right " href="/profile/withdraw">Withdraw</a>
                <span class="menuProfile__menu-item menuProfile__menu-more mdi mdi-more">Menu</span>

                <div class="menuProfile__more">
                    <a class="menuProfile__menu-item menuProfile__item-mobile mdi mdi-history " href="/profile/transactions">Transactions</a>
                    <a class="menuProfile__menu-item menuProfile__item-mobile mdi mdi-reply " href="/profile/transfer">Transfer</a>
                    <a class="menuProfile__menu-item menuProfile__item-mobile mdi mdi-cash active" href="/profile/invest">Invest</a>
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
    <section class="staking__global-container">

        <div class="staking">
            
            <div class="staking__box">
                <div class="staking__info">
                    <div class="staking__info-container">
                        <div class="staking__title">
                            Staking
                        </div>
                        <div class="staking__description">
                            Low-risk | Stable earnings
                        </div>
                    </div>
                    <div class="staking__info-logos">
                        <div class="staking__logo staking__logo-bitcoin">
                            <img src="../assets/img/staking/Bitcoin.svg" alt="">
                        </div>
                        <div class="staking__logo staking__logo-ethereum">
                            <img src="../assets/img/staking/Ethereum.svg" alt="">
                        </div>
                        <div class="staking__logo staking__logo-tether">
                            <img src="../assets/img/staking/Tether.svg" alt="">
                        </div>
                        <div class="staking__logo staking__logo-usdc">
                            <img src="../assets/img/staking/USDC.svg" alt="">
                        </div>
                        <div class="staking__logo staking__logo-solana">
                            <img src="../assets/img/staking/Solana.svg" alt="">
                        </div>
                        <div class="staking__logo staking__logo-tron">
                            <img src="../assets/img/staking/TRON.svg" alt="">
                        </div>
                        <div class="staking__logo staking__logo-polygon">
                            <img src="../assets/img/staking/Polygon.svg" alt="">
                        </div>
                    </div>
                </div>

                <div class="staking__you">
                    <div class="staking__send">
                        <div class="staking__send-title">
                            Select coin
                        </div>
                        <div class="staking__send-select send-select">
                                <img class="send-img" src="../assets/img/coin/bitcoin.svg" alt="">
                                <span class="staking__select-name send-title">BTC</span>
                                <svg width="14" height="8" viewbox="0 0 14 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M7 8L0.937823 0.5L13.0622 0.499999L7 8Z" fill="#D9D9D9"></path>
                                </svg>
                            </div>
                            
                            
                            <div class="stakingForm__currency-list list-coin-one">
                            <div class="stakingForm__coin-items coin-items-one">
                                <%
                                    Map<String, Map<String, String>> coins = (Map<String, Map<String, String>>) request.getAttribute("invest_coins");
                                    for (Map.Entry<String, Map<String, String>> entry : coins.entrySet()) {
                                        Map<String, String> coin = entry.getValue();
                                        String stakingItem = String.format("<div class=\"staking__currency-item\">\n" +
                                                "                                    <img class=\"stakingForm__currency-img\" src=\"%s\" alt=\"\">\n" +
                                                "                                    <div class=\"stakingForm__currency-content\">\n" +
                                                "                                        <div class=\"stakingForm__currency-sub\">%s</div>\n" +
                                                "                                        <div class=\"stakingForm__currency-title\">%s</div>\n" +
                                                "                                    </div>\n" +
                                                "                                </div>", coin.get("image"), coin.get("symbol"), coin.get("name"));
                                        out.println(stakingItem);
                                    }
                                %>

                            </div>
                        </div>
                            
                            
                            
                            <div class="staking__send-title2">
                            Enter amount
                        </div>
                        <div class="staking__send-input">
                            <input type="number" placeholder="0" id="amount_input">
                            
                        </div>
                        

                        <div class="staking__send-available">
                            <%
                                out.println("Available: <span id=\"my_available_balance\" onclick=\"availableBalance()\">" + request.getAttribute("default_amount") + "</span> <span id=\"my_available_crypto\" onclick=\"availableBalance()\">" + request.getAttribute("default_symbol") + "</span>");
                            %>
                        </div>
                    </div>
                </div>

                <div class="staking__dots">
                    <div class="staking__dot"></div>
                    <div class="staking__dot"></div>
                    <div class="staking__dot"></div>
                </div>

                <div class="staking__select">
                    <div class="staking__select-title">
                        Select a staking plan
                    </div>
                    <div class="staking__select-buttons">
                        <%
                            List<Double> percents = (List<Double>) request.getAttribute("plans_percents");
                        %>
                        <div class="staking__select-button" onclick="selectPlan(1)">
                            <div class="staking__select-button-container">
                                <span class="staking__select-button-day">7 days</span>
                                <span class="staking__select-button-text">Duration</span>
                            </div>

                            <span class="staking__select-button-line"></span>

                            <div class="staking__select-button-container">
                                <%
                                    out.println("<span class=\"staking__select-button-percent\">" + percents.get(0) + "</span>");
                                %>
                                <span class="staking__select-button-text">Per day</span>
                            </div>
                        </div>

                        <div class="staking__select-button" onclick="selectPlan(2)">
                            <div class="staking__select-button-container">
                                <span class="staking__select-button-day">14 days</span>
                                <span class="staking__select-button-text">Duration</span>
                            </div>

                            <span class="staking__select-button-line"></span>

                            <div class="staking__select-button-container">
                                <%
                                    out.println("<span class=\"staking__select-button-percent\">" + percents.get(1) + "</span>");
                                %>
                                <span class="staking__select-button-text">Per day</span>
                            </div>
                        </div>

                        <div class="staking__select-button" onclick="selectPlan(3)">
                            <div class="staking__select-button-container">
                                <span class="staking__select-button-day">30 days</span>
                                <span class="staking__select-button-text">Duration</span>
                            </div>

                            <span class="staking__select-button-line"></span>

                            <div class="staking__select-button-container">
                                <%
                                    out.println("<span class=\"staking__select-button-percent\">" + percents.get(2) + "</span>");
                                %>
                                <span class="staking__select-button-text">Per day</span>
                            </div>
                        </div>

                        <div class="staking__select-button" onclick="selectPlan(4)">
                            <div class="staking__select-button-container">
                                <span class="staking__select-button-day">90 days</span>
                                <span class="staking__select-button-text">Duration</span>
                            </div>

                            <span class="staking__select-button-line"></span>

                            <div class="staking__select-button-container">
                                <%
                                    out.println("<span class=\"staking__select-button-percent\">" + percents.get(3) + "</span>");
                                %>
                                <span class="staking__select-button-text">Per day</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="staking__link-container">
                    <a class="staking__link" href="#" id="stake_btn" style="text-decoration: none; color: white;">Stake</a>
                </div>

                <div class="staking__sub-description">
                    Each plan may include additional bonus percentages for active
                    traders on our platform. You will find out the final amount of
                    bonuses received after the end of the staking plan.
                </div>
            </div>
        </div>

        <div class="staking__global-wrapper">
            <div class="profit">
                <div class="profit__info">
                    <div class="profit__title">
                        Estimated earnings
                    </div>
                    <div class="profit__description">
                        Calculate your profit
                    </div>
                </div>

                <div class="profit__main">
                    <div class="profit__value">
                        Expected profit

                        <div class="profit__numbers">
                            <b>+ <span style="color: white;" id="expected_profit_amount">0.00000</span> <span style="color: white;" id="expected_profit_crypto">BTC</span></b>
                            <span>≈ <span id="expected_profit_usd">0.00</span>$</span>
                        </div>
                    </div>
                    <div class="profit__total">
                        Total

                        <div class="profit__numbers">
                            <b><span style="color: white;" id="total_profit_amount">0.00000</span> <span style="color: white;" id="total_profit_crypto">BTC</span></b>
                            <span>≈ <span id="total_profit_usd">0.00</span>$</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="tips">
                <ul class="tips__list">
                    <li class="tips__list-item">
                        You can invest in any of the presented plans. After the expiration of
                        the staking plan, the profit will be automatically transferred to the
                        balance of your account.
                    </li>

                    <li class="tips__list-item">
                        Refresh the page to check your real-time profits.
                    </li>

                    <li class="tips__list-item">
                        If you cancel your active staking plan prematurely,
                        you will lose all of your accumulated profit.
                    </li>
                </ul>
            </div>
        </div>
    </section>

    <section class="investments__global-container">
        <div class="investments">
            <div class="investments__box">
                <div class="investments__info">
                    <div class="investments__title">
                        Active investments
                    </div>
                    <div class="investments__description">
                        Your active staking plans
                    </div>
                </div>
                <div class="investments__table">
                    <div class="investments__table-names">
                        <div class="investments__table-name investments__table-name-coin">
                            Coin
                        </div>
                        <div class="investments__table-name investments__table-name-plan">
                            Plan
                        </div>
                        <div class="investments__table-name investments__table-name-left">
                            Expires
                        </div>
                        <div class="investments__table-name investments__table-name-profit">
                            Realtime profit
                        </div>
                        <div class="investments__table-name investments__table-name-invested">
                            Invested
                        </div>
                        <div class="investments__table-name investments__table-name-cancel">

                        </div>
                    </div>

                    <div class="investments__table-values" id="staking_table">
                        
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="../assets/js/staking__page__298475.js"></script>

    <br><br>
    <%
        out.println("<input type=\"hidden\" value=\"" + (percents.get(0) * 7) + "\" id=\"plan_percent_1\">");
        out.println("<input type=\"hidden\" value=\"" + (percents.get(1) * 14) + "\" id=\"plan_percent_2\">");
        out.println("<input type=\"hidden\" value=\"" + (percents.get(2) * 30) + "\" id=\"plan_percent_3\">");
        out.println("<input type=\"hidden\" value=\"" + (percents.get(3) * 90) + "\" id=\"plan_percent_4\">");

        List<Pair<String, Double>> courses = (List<Pair<String, Double>>) request.getAttribute("courses");
        for (Pair<String, Double> course : courses) {
            String symbol = course.getKey();
            double price = course.getValue();
            out.println("<input type=\"hidden\" value=\"" + price + "\" id=\"" + symbol.toLowerCase() + "_course\">");
        }
    %>

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
<script type="text/javascript">
    $("#alert_close_modal_btn").on("click", function() {
        $("#alert_message_modal").css("display", "none");
    });

    $("#alert_close_modal").on("click", function() {
        $("#alert_message_modal").css("display", "none");
    });

    var active_coin = 'BTC';
    var active_plan = 0;

    function availableBalance() {
        var available = $("#my_available_balance").html();
        $("#amount_input").val(available);
        calculatePlan();
    }

    $(".stakingForm__coin-items .staking__currency-item").on("click", function() {
        active_coin = $(this).find('.stakingForm__currency-sub').text();

        $.ajax({
            url: '/profile',
            type: 'POST',
            data: {
                action: "GET_CURRENCY_BALANCE",
                crypto: active_coin
            },
            success: function(event) {

                $("#my_available_balance").empty().html(event);
                $("#my_available_crypto").empty().html(" " + active_coin.toUpperCase());
           
            }
        })

        $("#expected_profit_crypto").html(active_coin);
        $("#total_profit_crypto").html(active_coin);

        calculatePlan();
    })

    function selectPlan(num) {
        active_plan = num;
        calculatePlan();
    }

    $("#stake_btn").on("click", function(e) {
        e.preventDefault();

        var select_coin = active_coin.toLowerCase();
        var invest_amount = $("#amount_input").val();
        var my_balance = $("#my_available_balance").val();
        var plan_percent = parseFloat($("#plan_percent_" + active_plan).val());

        if(parseFloat(my_balance) < parseFloat(invest_amount)) {
          noti("You do not have enough funds for this amount", "error");
        } else if(invest_amount == '' || parseFloat(invest_amount) == 0) {
          noti("Please, enter invest amount", "info");
        } else if(active_plan == 0) {
            noti("Please, select invest plan", "error");
        } else {
          var profit_amount = parseFloat(invest_amount) / 100 * plan_percent;
              profit_amount = parseFloat(profit_amount).toFixed(6);
          var total_amount = parseFloat(invest_amount) + parseFloat(profit_amount);
              total_amount = parseFloat(total_amount).toFixed(6);

          $.ajax({
              url: "/profile/staking",
              type: "POST",
              data: {
                action: "STAKE",
                invest_plan: active_plan,
                invest_coin: select_coin,
                invest_amount: invest_amount
              },
              success: function(response) {
                if(response == '1') {
                    noti("Invest plan successfully created", "success");
                    $("#amount_input").val("");
                    $("#expected_profit_amount").html('0.00000');
                    $("#expected_profit_usd").html('0.00');
                    $("#total_profit_amount").html('0.00000');
                    $("#total_profit_usd").html('0.00');

                    $.ajax({
                        url: '/profile',
                        type: 'POST',
                        data: {
                            action: "GET_CURRENCY_BALANCE",
                            crypto: active_coin
                        },
                        success: function(event) {

                            $("#my_available_balance").empty().html(event); 
                            $("#my_available_crypto").empty().html(" " + active_coin.toUpperCase()); 
                       
                        }
                    })

                    $("#staking_table").load("/profile/staking?action=GET_STAKING_HISTORY");
                    
                } else if(response == '2') {
                    noti("Not enough balance.", "error");
                } else if(response == '4') {
                    noti("An unknown error has occurred, please try again later", "error");
                } else if(response == '6') {
                    noti("You cannot make an investment. Contact support for details", "error");
                } else {
                    noti("An unknown error has occurred, please try again later", "error");
                }
              }
            })
        }
      });

    $('#amount_input').keyup(function(e){

        calculatePlan();
    
      });

    function calculatePlan() {
        var my_balance = $("#my_available_balance").val();
        var input_amount = $("#amount_input").val();
        var plan_percent = $("#plan_percent_" + active_plan).val();
        var selected_coin = active_coin.toLowerCase();

        if(active_plan != 0 && input_amount != "") {
            if($("#amount_input").val() == '') {
              input_amount = 0;
            }


            var profit_amount = parseFloat(input_amount) / 100 * plan_percent;
                profit_amount = parseFloat(profit_amount).toFixed(6);
            var profit_amount_usd = parseFloat($("#" + selected_coin + "_course").val()) * profit_amount;
                profit_amount_usd = profit_amount_usd.toFixed(2);

            var total_amount = parseFloat(input_amount) + parseFloat(profit_amount);
                total_amount = parseFloat(total_amount).toFixed(6);
            var total_amount_usd = parseFloat($("#" + selected_coin + "_course").val()) * total_amount;
                total_amount_usd = total_amount_usd.toFixed(2);



            if(parseFloat(my_balance) < parseFloat(input_amount)) {
              noti("You do not have enough funds for this amount", "error");
              $("#expected_profit_amount").html('0.0000');
              $("#expected_profit_usd").html('0.00');
              $("#total_profit_amount").html('0.0000');
              $("#total_profit_usd").html('0.00');
            } else {
              $("#expected_profit_amount").html(profit_amount);
              $("#expected_profit_usd").html(profit_amount_usd);
              $("#total_profit_amount").html(total_amount);
              $("#total_profit_usd").html(total_amount_usd);
            }
        }
    }

    function unstake(id) {


        $.ajax({
          url: "/profile/staking",
          type: "POST",
          data: {
            action: "UNSTAKE",
            id: id
          },
          success: function(response) {
            if(response == "1") {
              $("#invest_return_modal").css("display", "flex");
              $("#invest_modal_span_amount").html($("#amount_block_" + id).text());
              noti("Unstaking completed successfully", "success");

              $("#plan_block_" + id).remove();
            } else if (response == "11") {
                $("#invest_return_modal").css("display", "flex");
                $("#invest_modal_span_amount").html($("#amount_block_" + id).text());
                noti("Refund completed successfully", "success");

                $("#plan_block_" + id).remove();
            } else if(response == "2") {
                noti("This staking has already been closed", "error");
            } else if (response == "3") {
                noti("The staking time has not expired yet, you cannot take it off early", "error")
            } else if (response == "4") {
                noti("Staking not found", "error");
            } else {
                    noti("An unknown error has occurred, please try again later", "error");
            }
          }
        });
    }
    $("#staking_table").load("/profile/staking?action=GET_STAKING_HISTORY");
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