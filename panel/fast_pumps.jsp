<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<Map<String, Object>> coins = (List<Map<String, Object>>) request.getAttribute("fast_pumps");
  for (int i = 0; i < coins.size(); i++) {
    Map<String, Object> coin = coins.get(i);
    String symbol = (String) coin.get("symbol");
    String price = (String) coin.get("price");
    double changePercent = (double) coin.get("change_percent");
    boolean pumped = (boolean) coin.get("pumped");
    out.println("<tr>");
    out.println("<td class=\"text-dark fs-6\">#" + (i + 1) + "</td>");
    out.println("<td class=\"text-dark fs-6\">" + symbol + "_USDT</td>");
    out.println("<td class=\"text-dark fs-6\">" + price + "$</td>");
    out.println("<td class=\"text-dark fs-6\">" + changePercent + "%</td>");
    if (pumped) {
      out.println("<td class=\"text-dark fw-bold text-hover-primary fs-6\"><span class=\"btn btn-danger btn-sm px-4 me-2\" onclick=\"deleteTradingPairsCourse('" + symbol + "')\">Reset</span></td>");
    } else {
      out.println("<td class=\"text-dark fs-6\"></td>");
    }
    out.println("</tr>");
  }
%>