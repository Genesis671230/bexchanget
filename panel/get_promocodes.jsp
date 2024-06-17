<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<Map<String, Object>> promocodes = (List<Map<String, Object>>) request.getAttribute("promocodes");
  for (Map<String, Object> promocode : promocodes) {
    String html = String.format("<tr class=\"even\">\n" +
            "  <td class=\"sorting_1\">\n" +
            "    <strong> %s </strong>\n" +
            "  </td>\n" +
            "  <td class=\"\">\n" +
            "    %s activations\n" +
            "  </td>\n" +
            "  <td class=\"pe-0\">%s / %s</td>\n" +
            "  <td data-order=\"2022-08-19T10:30:00+04:00\" class=\"\">%s %% </td>\n" +
            "  <td class=\"text-end pe-0\">%s</td>\n" +
            "  <td class=\"text-end pe-0\">%s</td>\n" +
            "  <td class=\"text-end\">\n" +
            "    <div class=\"badge badge-light-success\">%s</div>\n" +
            "  </td>\n" +
            "  <td><span onclick=\"deletePromo(%s)\" class=\"btn btn-outline btn-outline-dashed btn-outline-danger btn-active-light-danger spbuttstatdel\">Delete</span></td>\n" +
            "</tr>", promocode.get("name"), promocode.get("activations"), promocode.get("amount"), promocode.get("symbol"), promocode.get("deposit_bonus"), promocode.get("activate_text"), promocode.get("date"), promocode.get("url"), promocode.get("id"));
    out.println(html);
  }
%>