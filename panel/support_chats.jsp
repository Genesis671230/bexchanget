<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: cosmo
  Date: 29.03.2023
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<Map<String, Object>> chats = (List<Map<String, Object>>) request.getAttribute("chats");
  for (Map<String, Object> chat : chats) {
    boolean online = (boolean) chat.get("online");
    long unviewed = (long) chat.get("unviewed");
    long id = (long) chat.get("id");
    String username = (String) chat.get("username");
    String email = (String) chat.get("email");
    String avatar = (String) chat.get("avatar");
    String chatHtml1 = String.format("<div class=\"rounded bg-hover-light d-flex flex-stack py-4 border-bottom border-active active\" onclick=\"SupportOpenDialog(%s, `%s`, `%s`, `%s`, `%s`)\">\n" +
            "   <div class=\"ms-5 d-flex align-items-center\">\n" +
            "      <div class=\"symbol symbol-45px symbol-circle\" style=\"cursor:pointer;\">\n", id, username, email, avatar, online ? "online" : "offline");
    out.println(chatHtml1);
    out.println("<img alt=\"Pic\" src=\"" + avatar + "\">");
    out.println("<div class=\"symbol-badge bg-" + (online ? "success" : "danger") + " start-100 top-100 border-4 h-10px w-10px ms-n2 mt-n2\"></div>");
    String chatHtml2 = String.format("</div>\n" +
            "      <div class=\"ms-5\">\n" +
            "         <span style=\"cursor: pointer;\" class=\"fs-5 fw-bold text-gray-900 text-hover-primary mb-2\">%s</span>\n" +
            "         <div class=\"fw-semibold text-muted\">%s</div>\n" +
            "      </div>\n" +
            "   </div>\n", username, email);
    out.println(chatHtml2);
    if (unviewed > 0) {
      out.println("<div class=\"d-flex flex-column align-items-end ms-2\">\n" +
              "<span class=\"badge badge-sm badge-circle badge-danger\">" + unviewed + "</span>\n" +
              "</div>");
    }
    out.println("</div>\n" +
            "<div class=\"separator separator-dashed d-none\" wfd-invisible=\"true\"></div>");
  }
%>
