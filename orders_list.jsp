<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<table style="width: 100%; margin-left: 31px; font-size: 11px; margin-top: 9px;">
  <tr>
    <th style="width: 20%;">Date</th>
    <th style="width: 20%;">Pairs</th>
    <th style="width: 20%;">Status</th>
    <th style="width: 20%;">Buy/Sell</th>
    <th style="width: 20%;">Amount</th>
  </tr>
  <%
    List<Map<String, String>> orders = (List<Map<String, String>>) request.getAttribute("orders");
    for (Map<String, String> order : orders) {
      String html = String.format("<tr>\n" +
              "    <td style=\"width: 20%%;\">%s</td>\n" +
              "    <td style=\"width: 20%%;\">%s</td>\n" +
              "    <td style=\"width: 20%%;\">%s</td>\n" +
              "    <td style=\"width: 20%%;\">%s</td>\n" +
              "    <td style=\"width: 20%%;\">%s</td>\n" +
              "  </tr>", order.get("date"), order.get("pair"), order.get("status"), order.get("type"), order.get("amount"));
      out.println(html);
    }
  %>
</table>