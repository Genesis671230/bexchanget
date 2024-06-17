$.ajax({
    url: "../api/pumps",
    type: "POST",
    data: {
        action: "TIME_DIFFERENCE",
        time: Math.floor(Date.now() / 1000)
    },
    success: function (response) {
        load(Number(response));
    }
});

function random_number() {
    // Random Number Red
    var random_number_2 = Math.floor((Math.random() * 7) + 1);
    var random_true = '';
    if(random_number_2 == 1) {
        random_true = '5';
    } else if(random_number_2 == 2) {
        random_true = '8';
    } else if(random_number_2 == 3) {
        random_true = '10';
    } else if(random_number_2 == 4) {
        random_true = '20';
    } else if(random_number_2 == 5) {
        random_true = '40';
    } else if(random_number_2 == 6) {
        random_true = '60';
    } else if(random_number_2 == 7) {
        random_true = '80';
    } else {
        random_true = '';
    }

    return random_true;
}

$(document).ready(function(){
    $("#search_pairs").keyup(function(){
        _this = this;

        $.each($(".pair__item-BdfTH"), function() {
            if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1) {
                $(this).hide();
            } else {
                $(this).show();
            }
        });
    });
});

var pair_price = 0;

function buyPercent(percent) {
    var available_usd = $("#buy_available2").html();
    available_usd = parseFloat(available_usd);

    if(available_usd == 0) {
        noti("You don't have enough balance", "info");
    } else {
        var result_change = 0;

        if(percent == 25) {
            result_change = available_usd * 0.25;
        } else if(percent == 50) {
            result_change = available_usd  * 0.5;
        } else if(percent == 75) {
            result_change = available_usd * 0.75;
        } else if(percent == 100) {
            result_change = available_usd;
        }

        var result_price = result_change / pair_price;
        result_price = result_price.toFixed(6);

        $("#buy_total").val(result_change.toFixed(2));
        $("#buy_amount_input").val(result_price);
    }
}

function sellPercent(percent) {

    var available_usd = $("#sell_available2").html();
    available_usd = parseFloat(available_usd);

    if(available_usd == 0) {
        noti("You don't have enough balance", "info");
    } else {
        var result_change = 0;

        if(percent == 25) {
            result_change = available_usd * 0.25;
        } else if(percent == 50) {
            result_change = available_usd  * 0.5;
        } else if(percent == 75) {
            result_change = available_usd * 0.75;
        } else if(percent == 100) {
            result_change = available_usd;
        }

        var result_price = result_change * pair_price;
        result_price = result_price.toFixed(2);

        $("#sell_total").val(result_price);
        $("#sell_amount_input").val(result_change.toFixed(6));
    }
}

function load(timeDiff) {
    const log = console.log;
    var percent, type_action;
    var all_actions;

    var pairs_value = $("#pairs").val();
    var pairss_one = $("#one_pair").val();
    var pairss_two = $("#two_pair").val();
    var new_pairs = pairss_one + "_" + pairss_two;

    console.log("timediff: " + timeDiff);

    const stable_pump_percent = parseFloat($("#stable_pump_percent").val());
    let fast_pumps_json = document.getElementById('fast_pumps_json').textContent;
    fast_pumps_json = fast_pumps_json.length > 0 ? JSON.parse(fast_pumps_json) : "";
    let fast_pumps_active = document.getElementById('fast_pumps_active_json').textContent;
    fast_pumps_active = fast_pumps_active.length > 0 ? JSON.parse(fast_pumps_active) : 0;
    let fast_pumps_end_time = Number($("#fast_pumps_end_time").val());
    if (fast_pumps_end_time > 0) {
        fast_pumps_end_time = fast_pumps_end_time + timeDiff;
    }

    $("#ordersConOne").load("/trading_api?action=GET_OPEN_ORDERS");
    $("#ordersConTwo").load("/trading_api?action=GET_ORDERS_HISTORY");

    function addCommas(nStr) {
        nStr += '';
        x = nStr.split('.');
        x1 = x[0];
        x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        }
        return x1 + x2;
    }

    const chartPropeties = {
        // width: 850,
        height: 400,
        timeScale: {
            timeVisible: true,
            secondVisible: true
        },
        localization: {
            priceFormatter: price => {
                if (price > 100) {
                    return parseFloat(price).toFixed(2);
                }
                if (price > 1 && price < 100) {
                    return parseFloat(price).toFixed(4);
                }
                if (price <= 1 && price > 0.001) {
                    return parseFloat(price).toFixed(5);
                }
                if (price < 0.001) {
                    return parseFloat(price).toFixed(8);
                }

            }


        }
    }

    const domElement = document.querySelector('#tvchart');
    const chart = LightweightCharts.createChart(domElement, chartPropeties);
    const candleSeries = chart.addCandlestickSeries();
    var volumeSeries = chart.addHistogramSeries({
        priceFormat: {
            type: 'volume',
        },
        priceScaleId: '',
        scaleMargins: {
            top: 0.8,
            bottom: 0.01,
        },
    });

    var symbol = document.querySelector('#var_for_chart').getAttribute('symbol')
    var customSymbol = document.querySelector('#var_for_chart').getAttribute('customSymbol')

    if (customSymbol == '') {
        customSymbol = symbol
    } else {
        symbol = document.querySelector('#var_for_chart').getAttribute('customSymbol')
        customSymbol = document.querySelector('#var_for_chart').getAttribute('symbol')
    }

    var pairs_for_ajax = $("#get_pairs_for_js").val();

//todo: time
    function get_percent(data) {
        let price = data + (data * stable_pump_percent);
        if (fast_pumps_active !== 0 && fast_pumps_active.length > 0) {
            for (let fastPumpsActiveElement of fast_pumps_active) {
                price = price + (price * fastPumpsActiveElement);
            }
        }
        return price;
    }

    function get_stable_percent(data) {
        return data + (data * stable_pump_percent);
    }

    let cdata = [];
    function fetchData(callback) {
        fetch("https://api.binance.com/api/v3/klines?symbol=" + pairs_value + "&interval=1m&limit=1000" + (fast_pumps_end_time > 0 ? "&endTime=" + fast_pumps_end_time : ""))
            .then(response => response.json())
            .then(json => {
                let oldKline = -77777;
                for (let i = 0; i < json.length; i++) {
                    let kline = json[i];
                    let openTime = Math.floor(new Number(kline[0]) / 1000);
                    let closeTime = Math.floor(new Number(kline[6]) / 1000);
                    let open = get_stable_percent(parseFloat(kline[1]));
                    let close = get_stable_percent(parseFloat(kline[4]));
                    let high = get_stable_percent(parseFloat(kline[2]));
                    let low = get_stable_percent(parseFloat(kline[3]));
                    let volume = get_stable_percent(parseFloat(kline[5]));
                    //open = i > 0 ? cdata[i - 1].close : open;
                    //low = open;
                    let currentKline = findKlinePumpPercent(openTime, closeTime);
                    if (currentKline !== 0) {
                        if (oldKline === -77777) {
                            close = close + (close * currentKline);
                        } else {
                            let nextKline = -77777;
                            if (i < json.length) {
                                nextKline = findKlinePumpPercent(Math.floor(new Number(json[i][0]) / 1000), Math.floor(new Number(json[i][6]) / 1000));
                            }
                            if (nextKline === 0) {
                                open = cdata[i - 1].close;
                                low = low + (low * currentKline);
                            } else {
                                open = i > 0 ? cdata[i - 1].close : open;
                                low = open;
                                if (i === 0) {
                                    close = close + (close * currentKline);
                                } else {
                                    close = cdata[i - 1].close;
                                    close = close + (close * currentKline);
                                }
                                high = close;
                            }
                        }
                        oldKline = currentKline;
                    }
                    //todo: проверить openTime или closeTime
                    cdata.push({
                        "time": closeTime,
                        "open": open,
                        "high": high,
                        "low": low,
                        "close": close,
                        "volume": volume
                    });
                }
                callback(cdata);
            }).catch(error => console.error(error));
    }

    function findKlinePumpPercent(openTime, closeTime) {
        if (fast_pumps_json !== null && typeof fast_pumps_json !== "undefined") {
            for (let pump of fast_pumps_json) {
                let pumpTime = pump["time"] + timeDiff;
                if (pumpTime >= openTime && pumpTime <= closeTime) {
                    return parseFloat(pump["percent"]);
                }
            }
        }
        return 0;
    }

    fetchData(cdata => {
        candleSeries.setData(cdata);

        const volume_data = cdata.map(d => {
            if (parseFloat(d['open']) < parseFloat(d['close'])) {
                clr = '#0f3a36'; //green
            } else {
                clr = '#501f1e'; // red
            }
            time = d['time'];
            return { time, value: parseFloat(d['volume']), color: clr }

        })

        volumeSeries.setData(volume_data);

        if (cdata[cdata.length - 1]['close'] > 100) {
            priceUpdate = parseFloat(cdata[cdata.length - 1]['close']).toFixed(2);
        }
        if (cdata[cdata.length - 1]['close'] >= 1 && cdata[cdata.length - 1]['close'] < 100) {
            priceUpdate = parseFloat(cdata[cdata.length - 1]['close']).toFixed(4);
        }
        if (cdata[cdata.length - 1]['close'] < 1 && cdata[cdata.length - 1]['close'] > 0.001) {
            priceUpdate = parseFloat(cdata[cdata.length - 1]['close']).toFixed(5);
        }
        if (cdata[cdata.length - 1]['close'] < 0.001) {
            priceUpdate = parseFloat(cdata[cdata.length - 1]['close']).toFixed(8);
        }

        chart.applyOptions({

            watermark: {
                color: '#1f2226',
                visible: true,
                text: "     ",
                fontSize: 50,
                fontWeight: 'bold',
                horzAlign: 'center',
                vertAlign: 'center',
            },
            layout: {
                backgroundColor: '#131722',
                textColor: '#515964',
                fontSize: 12,
                fontFamily: 'Calibri',
            },
            grid: {
                vertLines: {
                    color: '#1d2127',
                    style: 1,
                    visible: true,
                },
                horzLines: {
                    color: '#1d2127',
                    style: 1,
                    visible: true,
                },
            },
            localization: {
                locale: 'en-US',


            },
            crosshair: {
                vertLine: {
                    color: '#767f8b',
                    width: 0.5,
                    style: 1,
                    visible: true,
                    labelVisible: true,
                },
                horzLine: {
                    color: '#767f8b',
                    width: 0.5,
                    style: 0,
                    visible: true,
                    labelVisible: true,
                },
                mode: 3,
            },


        });

        var his_close = '';
        var his_edited = 'false';

        var soc_his_time = 0;
        var new_fix_time = 0;
        var last_currency_price = 0;

        var currency_now_price = 0;

        wsLiveChart = new WebSocket('wss://stream.binance.com:9443/ws/' + symbol.toLowerCase() + '@kline_1m');
        wsLiveChart.onopen = function () {
        };

        let oldClosePrice = cdata[cdata.length - 1].close;

        //todo: time + difference
        wsLiveChart.onmessage = function (onmessage) {
            let resp_socket = JSON.parse(onmessage.data);

            let time = Math.floor(resp_socket.k.t / 1000);
            let closeTime = Math.floor(resp_socket.k.T / 1000);

            $.ajax({
                url: "../api/pumps",
                type: "POST",
                data: {
                    action: "GET_PAIR_STATUS",
                    pairs: pairs_for_ajax,
                    open_time: time + timeDiff,
                    close_time: closeTime + timeDiff,
                    close_price: oldClosePrice
                },
                success: function(response) {
                    let close;
                    if (response === "blocked") {
                    } else if(response == 'false') {
                        //todo: closeTime?

                        high = get_stable_percent(parseFloat(resp_socket.k.h));
                        low = get_stable_percent(parseFloat(resp_socket.k.l));
                        close = get_stable_percent(parseFloat(resp_socket.k.o));
                        open = get_stable_percent(parseFloat(resp_socket.k.c));

                        rez = {
                            time: closeTime,
                            open: open,
                            high: high,
                            low: low,
                            close: close
                        };

                        candleSeries.update(rez)

                        var fixed_price = close;
                        if(parseFloat(close) > 1) {
                            fixed_price = fixed_price.toFixed(2);
                        } else {
                            fixed_price = fixed_price.toFixed(6);
                        }

                        $("#c_i_p_ajax_sp2").html(fixed_price);
                        $("#aj_live_price_3").html(fixed_price);
                        var new_symbol = symbol.split('USDT').join('');
                        $('html head').find('title').text("$" + addCommas(fixed_price) + " " + new_symbol + "/USDT - Buy and sell Bitcoin and Ethereum");
                        pair_price = close;

                        $("#aj_live_new_price_block_2").html(fixed_price + " USD");
                        $("#aj_live_new_price_block_1").html(fixed_price);
                        $("#currency_in_list_" + new_symbol).html(fixed_price);

                        if(last_currency_price < pair_price || last_currency_price == 0) {
                            $("#price_block_minus_plus").removeClass("order__info-price-minus");
                            $("#price_block_minus_plus").removeClass("order__info-price-plus");

                            $("#price_block_minus_plus").addClass("order__info-price-plus");
                        } else {
                            $("#price_block_minus_plus").removeClass("order__info-price-minus");
                            $("#price_block_minus_plus").removeClass("order__info-price-plus");

                            $("#price_block_minus_plus").addClass("order__info-price-minus");
                        }

                        last_currency_price = pair_price;
                    } else {
                        open = oldClosePrice;
                        low = open;
                        close = parseFloat(response);
                        high = close;

                        rez = {
                            time: closeTime,
                            open: open,
                            high: high,
                            low: low,
                            close: close
                        };

                        candleSeries.update(rez);

                        var fixed_price = close;
                        if(close > 1) {
                            fixed_price = fixed_price.toFixed(2);
                        } else {
                            fixed_price = fixed_price.toFixed(6);
                        }

                        $("#c_i_p_ajax_sp2").html(fixed_price);
                        $("#aj_live_price_3").html(fixed_price);
                        var new_symbol = symbol.split('USDT').join('');
                        $('html head').find('title').text("$" + addCommas(fixed_price) + " " + new_symbol + "/USDT - Buy and sell Bitcoin and Ethereum");
                        pair_price = close;

                        last_currency_price = pair_price;
                    }
                    oldClosePrice = close;
                }
            });
        }

        leftpairList = document.querySelectorAll('.link'); //document.querySelectorAll('.link')[27].childNodes[3].innerText = 11

        btc_pairs_label = document.querySelectorAll('#btc_pairs_label');
        eth_pairs_label = document.querySelectorAll('#eth_pairs_label');
        usdt_pairs_label = document.querySelectorAll('#usdt_pairs_label');

        btcPairs = document.querySelectorAll('.BTC');
        ethPairs = document.querySelectorAll('.ETH');
        usdtPairs = document.querySelectorAll('.USDT');

        btc_pairs_label.forEach(element => {
            element.onclick = function () {
                for (i = 0; i < ethPairs.length; i++) {
                    ethPairs[i].style.display = 'none';
                }
                for (i = 0; i < usdtPairs.length; i++) {
                    usdtPairs[i].style.display = 'none';
                }
                for (i = 0; i < btcPairs.length; i++) {
                    btcPairs[i].style.display = 'table-row';
                }
                document.querySelector('#underline_bar').style.left = "90px";

            }
        });

        eth_pairs_label.forEach(element => {
            element.onclick = function () {
                for (i = 0; i < btcPairs.length; i++) {
                    btcPairs[i].style.display = 'none';
                }
                for (i = 0; i < usdtPairs.length; i++) {
                    usdtPairs[i].style.display = 'none';
                }
                for (i = 0; i < ethPairs.length; i++) {
                    ethPairs[i].style.display = 'table-row';
                }
                document.querySelector('#underline_bar').style.left = "158px";
            }

        });

        usdt_pairs_label.forEach(element => {
            element.onclick = function () {
                for (i = 0; i < ethPairs.length; i++) {
                    ethPairs[i].style.display = 'none';
                }
                for (i = 0; i < btcPairs.length; i++) {
                    btcPairs[i].style.display = 'none';
                }
                for (i = 0; i < usdtPairs.length; i++) {
                    usdtPairs[i].style.display = 'table-row';
                }
                document.querySelector('#underline_bar').style.left = "12px";

            }
        });


        for (i = 0; i < btcPairs.length; i++) {
            btcPairs[i].style.display = 'none';
        }
        for (i = 0; i < ethPairs.length; i++) {
            ethPairs[i].style.display = 'none';
        }


        link = document.querySelectorAll('.link');
        link.forEach(element => {
            element.onclick = function () {
                document.location.href = 'trading?pair=' + element.id;
            }
        });

        // Auto calculate prices from buy and sell inputs
        var pair_one = $("#one_pair").val().toLowerCase();
        var pair_two = $("#two_pair").val().toLowerCase();

        var sign_in = $("#sign_in").val();

        var user_balance = $("#"+pair_two+"_balance").val();
        var user_available = 0;


        $(document).ready(function() {
            setInterval(function() {
                user_balance = $("#"+pair_two+"_balance").val();

                user_available = parseFloat(user_balance).toFixed(2);

                $("#buy_available").html(user_available);
                $("#buy_available2").html(user_available);
                $("#buy_available3").html(user_available);

            }, 1500);
        });

        $('#buy_amount_input').keyup(function(e){
            var buy_amount = $("#buy_amount_input").val();
            var result_price = parseFloat(buy_amount);
            result_price = result_price.toFixed(8);

            var total_usdt = pair_price * result_price;

            $("#buy_total").val(total_usdt.toFixed(2));
        });

        $('#buy_total').keyup(function(e){
            var buy_amount = $("#buy_total").val();
            var result_price = parseFloat(buy_amount);

            var total_usdt = result_price / pair_price;

            $("#buy_amount_input").val(total_usdt.toFixed(8));
        });
        /////



        //sell


        $('#sell_amount_input').keyup(function(e){
            var sell_amount = $("#sell_amount_input").val();
            var result_price = sell_amount * pair_price;
            result_price = result_price.toFixed(2);

            $("#sell_total").val(result_price);
        });

        $('#sell_total').keyup(function(e){
            var sell_amount = $("#sell_total").val();
            var result_price = sell_amount / pair_price;

            $("#sell_amount_input").val(result_price.toFixed(8));
        });

        // ---------------- Sell and Buy buttons -----------------------//
        $("#btn_buy").on("click", function() {

            var buy_amount = $("#buy_amount_input").val();
            var buy_available = $("#buy_available").html();
            buy_available = parseFloat(buy_available) / pair_price;

            if(buy_amount == "") {
                noti("Please, enter buy amount", "info");
            } else if(parseFloat(buy_amount) > parseFloat(buy_available)) {
                noti("Not enough balance. Available for you: "+buy_available.toFixed(8)+" "+pair_one.toUpperCase(), "error");
            } else {
                noti("Processing..", 'info');
                $.ajax({
                    url: "/trading_api",
                    type: "POST",
                    data: {
                        action: "CREATE_ORDER",
                        pair_price: pair_price,
                        crypto: pair_one,
                        amount: buy_amount,
                        type: "0"
                    },
                    success: function(response) {

                        if(response == '1') {
                            $("#ordersConOne").load("/trading_api?action=GET_OPEN_ORDERS");
                            noti("Order successfully created to buy currency", "success");
                        } else if(response == '2') {
                            noti("Not enough balance.", "error");
                        } else if(response == '3') {
                            noti("Error", "error");
                        } else if(response == '4') {
                            noti("An unknown error has occurred, please try again later", "error");
                        } else if(response == '5') {
                            noti("Wait a moment.. you already have an open order", "error");
                        } else {
                            noti("An unknown error has occurred, please try again later", "error");
                        }
                    }
                })
            }
        });

        $("#btn_sell").on("click", function() {

            var sell_amount = $("#sell_amount_input").val();
            var sell_available = $("#sell_available").html();
            var sell_fee = $("#sell_fee").html();
            sell_available_fee = sell_available - sell_fee;

            if(pair_price == 0) {
                alert('error pair price');
            } else {
                if(sell_amount == "") {
                    noti("Please, enter sell amount", "info");
                } else if(parseFloat(sell_amount) > parseFloat(sell_available)) {
                    noti("Not enough balance. Available for you: "+sell_available+" "+pair_one.toUpperCase(), "error");
                } else {
                    noti("Processing..", 'info');
                    $.ajax({
                        url: "/trading_api",
                        type: "POST",
                        data: {
                            action: "CREATE_ORDER",
                            pair_price: pair_price,
                            crypto: pair_one,
                            amount: sell_amount,
                            type: "1"
                        },
                        success: function(response) {

                            if(response == '1') {
                                $("#ordersConOne").load("/trading_api?action=GET_OPEN_ORDERS");
                                noti("Order successfully created to sell currency", "success");
                            } else if(response == '2') {
                                noti("Not enough balance.", "error");
                            } else if(response == '3') {
                                noti("Error", "error");
                            } else if(response == '4') {
                                noti("An unknown error has occurred, please try again later", "error");
                            } else if(response == '5') {
                                noti("Wait a moment.. you already have an open order", "error");
                            } else {
                                noti("An unknown error has occurred, please try again later", "error");
                            }
                        }
                    })
                }
            }
        });

        fetch("https://api.binance.com/api/v3/trades?symbol=" + pairs_value + "&limit=1000").then(response => {
            response.json().then(js => {
                const json = {};
                let j = 1;
                js.forEach(map => {
                    json[j.toString()] = [get_percent(parseFloat(map.price)), map.qty];
                    j++;
                });
                var random_number = Math.floor((Math.random() * 10) + 4);
                pair_price = get_percent(parseFloat(json[1][0]));

                var tr_block_id = 19; //start 6
                var new_tr_block_id = 20; // start 7

                var json_red_count = 1; //limit 1000
                var json_green_count = 10 //limit 1000

                var red_block = '';
                var green_block = '';

                for(var i=0; i < 19; i++) {
                    function random_number() {
                        // Random Number Red
                        var random_number_2 = Math.floor((Math.random() * 7) + 1);
                        var random_true = '';
                        if(random_number_2 == 1) {
                            random_true = '5';
                        } else if(random_number_2 == 2) {
                            random_true = '8';
                        } else if(random_number_2 == 3) {
                            random_true = '10';
                        } else if(random_number_2 == 4) {
                            random_true = '20';
                        } else if(random_number_2 == 5) {
                            random_true = '40';
                        } else if(random_number_2 == 6) {
                            random_true = '60';
                        } else if(random_number_2 == 7) {
                            random_true = '80';
                        } else {
                            random_true = '';
                        }

                        return random_true;
                    }

                    var two_price_red = parseFloat(json[json_red_count][0]) * parseFloat(json[json_red_count][1]);
                    var two_price_green = parseFloat(json[json_green_count][0]) * parseFloat(json[json_green_count][1]);

                    var two_amount_red = parseFloat(json[json_red_count][1]);
                    if(two_amount_red > 1) {
                        two_amount_red = two_amount_red.toFixed(2);
                    } else {
                        two_amount_red = two_amount_red.toFixed(6);
                    }

                    var two_amount_green = parseFloat(json[json_green_count][1]);
                    if(two_amount_green > 1) {
                        two_amount_green = two_amount_green.toFixed(2);
                    } else {
                        two_amount_green = two_amount_green.toFixed(6);
                    }

                    // red order book

                    red_block = red_block + '<div class="order__item" id="red_tr_'+new_tr_block_id+'"> <div class="order__item-fill" style="width: '+random_number()+'%"></div> <div class="order__item-price">'+addCommas(parseFloat(json[json_red_count][0]).toFixed(2))+'</div> <div class="order__item-amount">'+two_amount_red+'</div> <div class="order__item-total">'+addCommas(two_price_red.toFixed(2))+'</div> </div>';
                    green_block = green_block + '<div class="order__item" id="green_tr_'+new_tr_block_id+'"><div class="order__item-fill" style="width: '+random_number()+'%"></div> <div class="order__item-price">'+addCommas(parseFloat(json[json_green_count][0]).toFixed(2))+'</div> <div class="order__item-amount">'+two_amount_green+'</div> <div class="order__item-total">'+addCommas(two_price_green.toFixed(2))+'</div> </div>';

                    json_red_count = json_red_count + 1;
                    json_green_count = json_green_count + 1;

                    if(json_red_count > 50) {
                        json_red_count = 1;
                    }

                    if(json_green_count > 70) {
                        json_green_count = 10;
                    }

                    var remove_tr_id = new_tr_block_id - tr_block_id;
                    $("#red_tr_" + remove_tr_id).remove();
                    $("#green_tr_" + remove_tr_id).remove();
                    new_tr_block_id = new_tr_block_id + 1;

                    if(i == 18) {
                        $("#order_sell_div").prepend(red_block);
                        $("#order_buy_div").prepend(green_block);
                    }
                }

                var repeat_block = 'red';

                setInterval(function() {

                    if(repeat_block == 'red') {
                        repeat_block = 'green';
                    } else {
                        repeat_block = 'red';
                    }

                    var timer_red_block = '';
                    var timer_green_block = '';

                    function random_for() {
                        var rand_for = Math.floor((Math.random() * 4) + 1);

                        return rand_for;
                    }

                    for(var ii = 0; ii < parseFloat(random_for()); ii++) {



                        function random_number() {
                            // Random Number Red
                            var random_number_2 = Math.floor((Math.random() * 7) + 1);
                            var random_true = '';
                            if(random_number_2 == 1) {
                                random_true = '5';
                            } else if(random_number_2 == 2) {
                                random_true = '8';
                            } else if(random_number_2 == 3) {
                                random_true = '10';
                            } else if(random_number_2 == 4) {
                                random_true = '20';
                            } else if(random_number_2 == 5) {
                                random_true = '40';
                            } else if(random_number_2 == 6) {
                                random_true = '60';
                            } else if(random_number_2 == 7) {
                                random_true = '80';
                            } else {
                                random_true = '';
                            }

                            return random_true;
                        }

                        var two_price_red = parseFloat(json[json_red_count][0]) * parseFloat(json[json_red_count][1]);
                        var two_price_green = parseFloat(json[json_green_count][0]) * parseFloat(json[json_green_count][1]);

                        var old_height = $(document).height();  //store document height before modifications
                        var old_scroll = $(window).scrollTop(); //remember the scroll position

                        var two_amount_red = parseFloat(json[json_red_count][1]);
                        if(two_amount_red > 1) {
                            two_amount_red = two_amount_red.toFixed(2);
                        } else {
                            two_amount_red = two_amount_red.toFixed(6);
                        }

                        var two_amount_green = parseFloat(json[json_green_count][1]);
                        if(two_amount_green > 1) {
                            two_amount_green = two_amount_green.toFixed(2);
                        } else {
                            two_amount_green = two_amount_green.toFixed(6);
                        }



                        // red order book


                        timer_red_block = timer_red_block + '<div class="order__item" id="red_tr_'+new_tr_block_id+'"> <div class="order__item-fill" style="width: '+random_number()+'%"></div> <div class="order__item-price">'+addCommas(parseFloat(json[json_red_count][0]).toFixed(2))+'</div> <div class="order__item-amount">'+two_amount_red+'</div> <div class="order__item-total">'+addCommas(two_price_red.toFixed(2))+'</div> </div>';

                        // green order book


                        timer_green_block = timer_green_block + '<div class="order__item" id="green_tr_'+new_tr_block_id+'"><div class="order__item-fill" style="width: '+random_number()+'%"></div> <div class="order__item-price">'+addCommas(parseFloat(json[json_green_count][0]).toFixed(2))+'</div> <div class="order__item-amount">'+two_amount_green+'</div> <div class="order__item-total">'+addCommas(two_price_green.toFixed(2))+'</div> </div>';


                        if(repeat_block == 'red') {
                            json_red_count = json_red_count + 1;
                        } else {
                            json_green_count = json_green_count + 1;
                        }

                        if(json_red_count > 50) {
                            json_red_count = 1;
                        }

                        if(json_green_count > 70) {
                            json_green_count = 10;
                        }

                        var remove_tr_id = new_tr_block_id - tr_block_id;

                        if(repeat_block == 'red') {
                            $("#red_tr_" + remove_tr_id).remove();
                        } else {
                            $("#green_tr_" + remove_tr_id).remove();
                        }


                        new_tr_block_id = new_tr_block_id + 1;

                    }

                    if(repeat_block == 'red') {
                        $("#order_sell_div").prepend(timer_red_block);
                    } else {
                        $("#order_buy_div").prepend(timer_green_block);
                    }

                    $(document).scrollTop(old_scroll + $(document).height() - old_height); //restore "scroll position"

                }, 500);
            });
        });

        fetch("https://api.binance.com/api/v3/depth?symbol=" + pairs_value + "&limit=100").then(response => {
            response.json().then(json => {
                let orderArray = [];
                let bids = json.bids;
                let asks = json.asks;
                for (let i = 0; i < Math.min(50, bids.length); i++) {
                    orderArray.push([
                        get_percent(parseFloat(bids[i][0])),
                        bids[i][1],
                        "false"
                    ]);
                }
                for (let i = 0; i < Math.min(50, asks.length); i++) {
                    orderArray.push([
                        get_percent(parseFloat(asks[i][0])),
                        asks[i][1],
                        "true"
                    ]);
                }
                orderArray.sort(() => Math.random() - 0.5);
                let orderBook = new Map();
                for (let i = 1; i <= 100; i++) {
                    orderBook.set(String(i), orderArray[i - 1]);
                }
                var json_price = JSON.parse(JSON.stringify(Object.fromEntries(orderBook), null, 2));
                var json_count = 1;
                var recent_tr_block_id = 11; //start 6
                var recent_new_tr_block_id = 47; // start 7

                var recent_all_block = '';

                for(var iii=0; iii < 25; iii++) {

                    var json_live_price = parseFloat(json_price[json_count][0]);
                    var json_live_amount = parseFloat(json_price[json_count][1]);
                    var json_live_amount_fix = json_live_amount.toFixed(4);
                    if(json_live_amount > 1) {
                        json_live_amount_fix = json_live_amount.toFixed(2);
                    } else {
                        json_live_amount_fix = json_live_amount.toFixed(6);
                    }

                    var json_live_m = json_price[json_count][2];
                    json_count = json_count + 1;

                    if(json_count > 99) {
                        json_count = 1;
                    }

                    //now time
                    var dt = new Date();
                    var this_month = dt.getMonth() + 1;
                    var time = dt.getDate() + "." + this_month + " " + dt.getHours() + ":" + dt.getMinutes();

                    var recent_number = Math.floor((Math.random() * 2) + 1);

                    if(json_live_m == 'true') {
                        recent_status = 'buy';
                    } else {
                        recent_status = 'sell';
                    }



                    recent_all_block = recent_all_block + '<div class="history__item-bThdE" id="recent_tr_'+recent_new_tr_block_id+'"> <div class="history__item-price-bThdE history__item-'+recent_status+'-bThdE">'+addCommas(json_live_price.toFixed(2))+'</div> <div class="history__item-amount-bThdE">'+json_live_amount_fix+'</div> <div class="history__item-date-bThdE">'+time+'</div> </div>';

                    var remove_recent_id = recent_new_tr_block_id - recent_tr_block_id;
                    $("#recent_tr_" + remove_recent_id).remove();
                    recent_new_tr_block_id = recent_new_tr_block_id + 1;

                    if(iii == 24) {
                        $("#recent_orders").prepend(recent_all_block);
                    }
                }

                function doSomething(){
                    var json_live_price = parseFloat(json_price[json_count][0]);
                    var json_live_amount = parseFloat(json_price[json_count][1]);
                    var json_live_amount_fix = json_live_amount.toFixed(4);
                    if(json_live_amount > 1) {
                        json_live_amount_fix = json_live_amount.toFixed(2);
                    } else {
                        json_live_amount_fix = json_live_amount.toFixed(6);
                    }
                    var json_live_m = json_price[json_count][2];
                    json_count = json_count + 1;

                    if(json_count > 99) {
                        json_count = 1;
                    }

                    //now time
                    var dt = new Date();
                    var this_month = dt.getMonth() + 1;
                    var time = dt.getDate() + "." + this_month + " " + dt.getHours() + ":" + dt.getMinutes();

                    var recent_number = Math.floor((Math.random() * 2) + 1);

                    if(json_live_m == 'true') {
                        recent_status = 'buy';
                    } else {
                        recent_status = 'sell';
                    }


                    // recent trade

                    $("#recent_orders").prepend('<div class="history__item-bThdE" id="recent_tr_'+recent_new_tr_block_id+'"> <div class="history__item-price-bThdE history__item-'+recent_status+'-bThdE">'+addCommas(json_live_price.toFixed(2))+'</div> <div class="history__item-amount-bThdE">'+json_live_amount_fix+'</div> <div class="history__item-date-bThdE">'+time+'</div> </div>');

                    var remove_recent_id = recent_new_tr_block_id - recent_tr_block_id;
                    $("#recent_tr_" + remove_recent_id).remove();
                    recent_new_tr_block_id = recent_new_tr_block_id + 1;
                }

                var i1;
                var rand = 300;

                function randomize() {
                    doSomething();
                    rand = Math.round(Math.random()*(3000-500))+500;
                    clearInterval(i1);
                    i1 = setInterval(randomize, rand);
                }

                i1 = setInterval(randomize, rand);
            });
        });

        function preloaderFadeOutInit(){
            $('.preloader').fadeOut('slow');
            $('body').attr('class','');
        }
        // Window load function
        jQuery(window).on('load', function () {
            (function ($) {
                preloaderFadeOutInit();
            })(jQuery);
        });

        var terminal_crypto = pair_one.toUpperCase();
        if(sign_in == 'true') {
            setInterval(function() {
                $.ajax({
                    url: "/trading_api",
                    type: "POST",
                    data: {
                        action: "GET_TRADING_BALANCE_PANEL",
                        terminal_crypto: terminal_crypto
                    },
                    success: function(response) {
                        var json = JSON.parse(response);

                        $("#sell_available").html(json['crypto_balance']);
                        $("#sell_available2").html(json['crypto_balance']);
                        $("#sell_available3").html(json['crypto_balance']);
                        $("#buy_available").html(parseFloat(json['my_balance']).toFixed(2));
                        $("#buy_available2").html(parseFloat(json['my_balance']).toFixed(2));
                        $("#buy_available3").html(parseFloat(json['my_balance']).toFixed(2));
                        $("#usdt_balance").val(json['my_balance']);
                    }
                })
            }, 500);
        }
    });
}