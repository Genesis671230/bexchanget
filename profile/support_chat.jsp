<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Map<String, List<Map<String, Object>>> messages = (Map<String, List<Map<String, Object>>>) request.getAttribute("messages");
  if (messages.isEmpty()) {
    out.println("<div class=\"no_messages_block\"><img style=\"max-width: 200px; height: auto;\" src=\"../assets/img/no_messages.svg\" alt=\"no_messages\"> <h4>No Messages</h4> <p>Chat messages will appear here</p><div></div></div>");
  } else {
    String avatar = (String) request.getAttribute("avatar");
    for (Map.Entry<String, List<Map<String, Object>>> entry : messages.entrySet()) {
      out.println("<div class=\"chat__time-chat\">" + entry.getKey() + "</div>");
      for (Map<String, Object> message : entry.getValue()) {
        int target = (int) message.get("target");
        int type = (int) message.get("type");
        String time = (String) message.get("time");
        String text = (String) message.get("text");
        String messageHtml = String.format("<div class=\"%s\">\n" +
                        "<div class=\"chat__message-text\">\n" +
                        "%s\n" +
                        "</div>\n" +
                        "<div class=\"chat__message-info\">\n" +
                        "   <span class=\"chat__info-name\">%s</span>\n" +
                        "   <span class=\"chat__info-time\">%s</span>\n" +
                        "</div>\n" +
                        "<a href=\"#\"><img class=\"chat__message-img\" src=\"%s\" alt=\"\"></a>\n" +
                        "</div>", target == 0 ? "chat__message-container chat__message-container-you" : "chat__message-container",
                type == 0 ? text : "<img src=\"" + text + "\" style=\"max-width: 330px;\">",
                target == 0 ? "You" : "Support", time, target == 0 ? avatar : "../assets/img/profile/avatar.svg");
        out.println(messageHtml);
      }
    }
  }
%>