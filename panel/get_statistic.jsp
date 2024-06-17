<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: cosmo
  Date: 15.04.2023
  Time: 23:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<Map<String, String>> statLines = (List<Map<String, String>>) request.getAttribute("stat_lines");
  for (Map<String, String> statLine : statLines) {
    out.println("<tr class=\"even\">\n" +
            "<td class=\"sorting_1\">\n" +
            "<strong>" + statLine.get("username") + "</strong>\n" +
            "</td>\n" +
            "<td class=\"\">\n" +
            "<div class=\"badge badge-light-success\">" + statLine.get("total_price") + "$</div>\n" +
            "</td>\n" +
            "<td class=\"pe-0\">" + statLine.get("total_users") + " users</td>\n" +
            "<td class=\"pe-0\">" + statLine.get("first_deposit_date") + "</td>\n" +
            "</tr>");
  }
%>