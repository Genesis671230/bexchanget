<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  if (request.getAttribute("history") == null) {
    out.print("<div class=\"investments__table-values-empty\">\n" +
            "No active investments\n" +
            "</div>");
  } else {
    Map<Long, Map<String, String>> history = (Map<Long, Map<String, String>>) request.getAttribute("history");
    for (Map.Entry<Long, Map<String, String>> entry : history.entrySet()) {
      long id = entry.getKey();
      Map<String, String> staking = entry.getValue();
      String html = String.format("<div class=\"investments__table-value\">\n" +
              "<div class=\"investments__table-coin\">\n" +
              "<img src=\"%s\" style=\"border-radius: 500px; width=\" 34px\"=\"\" alt=\"\"><span>%s</span>\n" +
              "</div><div class=\"investments__table-plan\">\n" +
              "%s\n" +
              "</div>\n" +
              "<div class=\"investments__table-left\">\n" +
              "%s\n" +
              "</div><div class=\"investments__table-profit\">\n" +
              "%s\n" +
              "</div>\n" +
              "<div class=\"investments__table-invested\">\n" +
              "%s\n" +
              "</div>\n" +
              "<button class=\"investments__table-cansel\" onclick=\"unstake('%s')\">" + (staking.containsKey("unstaked") ? "Unstake" : "Cancel") + "</button>\n" +
              "</div>", staking.get("image"), staking.get("symbol"), staking.get("plan"), staking.get("expires"), staking.get("profit"), staking.get("invested"), id);
      out.println(html);
    }
  }
%>