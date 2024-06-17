<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<Map<String, Object>> logsList = (List<Map<String, Object>>) request.getAttribute("user_logs");
  for (Map<String, Object> entry : logsList) {
    String action = (String) entry.get("action");
    String ip = (String) entry.get("ip");
    String date = (String) entry.get("date");
    out.println("<tr>\n<td class=\"text-left\">");
    out.println("<span class=\"badge badge-secondary addtobadgestat\" style=\"word-wrap: break-word; word-break: break-all; white-space: normal; text-align: left;\">" + action + "</span>");
    out.println("</td>");
    out.println("<td class=\"text-dark  fs-6\">" + ip + "</td>");
    out.println("<td class=\"text-dark fs-6 text-left\">" + date + "</td>");
    out.println("</tr>");
  }
%>