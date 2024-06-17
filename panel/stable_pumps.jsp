<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Map<String, Object>> pumpedCoins = (List<Map<String, Object>>) request.getAttribute("stable_pumps");
    for (int i = 0; i < pumpedCoins.size(); i++) {
        Map<String, Object> coin = pumpedCoins.get(i);
        String symbol = (String) coin.get("symbol");
        double percent = (double) coin.get("change_percent");
        out.println("<tr>");
        out.println("<td class=\"text-dark fs-6\">#" + (i + 1) + "</td>");
        out.println("<td class=\"text-dark fs-6\">" + symbol + "_USDT</td>");
        out.println("<td class=\"text-dark fs-6\">" + percent + "%</td>");
        out.println("<td class=\"text-dark fs-6\"><span onclick=\"deleteTradingStablePairsCourse('" + symbol + "')\" class=\"btn btn-danger btn-sm px-4 me-2\">Delete</span></td>");
        out.println("</tr>");
    }
%>