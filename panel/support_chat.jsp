<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String workerAvatar = (String) request.getAttribute("avatar");
  long userId = (long) request.getAttribute("user_id");
  List<Map<String, Object>> messages = (List<Map<String, Object>>) request.getAttribute("messages");
  for (Map<String, Object> message : messages) {
    long id = (long) message.get("id");
    int target = (int) message.get("target");
    int type = (int) message.get("type");
    String email = (String) message.get("email");
    String avatar = (String) message.get("avatar");
    String time = (String) message.get("time");
    String text = (String) message.get("text");
    boolean userViewed = (boolean) message.get("user_viewed");

    String pos = target == 0 ? "start" : "end";

    out.println("<div class=\"d-flex justify-content-" + pos + " mb-10\">\n" +
            "  <div class=\"d-flex flex-column align-items-" + pos + "\">\n" +
            "    <div class=\"d-flex align-items-center mb-2\">\n");
    String chatHtml;
    if (target == 0) {
      if (type == 0) {
        chatHtml = String.format("<div class=\"symbol symbol-35px symbol-circle\">\n" +
                "          <img alt=\"Pic\" src=\"%s\">\n" +
                "        </div>\n" +
                "        <div class=\"ms-3\">\n" +
                "          <a href=\"user-edit?id=%s\" target=\"_blank\" class=\"fs-5 fw-bold text-gray-900 text-hover-primary me-1\">%s</a>\n" +
                "          <span class=\"text-muted fs-7 mb-1\">%s</span>\n" +
                "          <span class=\"SupportDeleteMessage\" onclick=\"SupportDeleteMessageInId(%s, %s)\" style=\"cursor: pointer; color: red; font-size: 12px; margin-left: 10px; margin-right: 10px\">Delete</span>" +
                "          <span class=\"SupportDeleteMessageSp\" style=\"cursor: pointer; color: blue; font-size: 12px; margin-right: 5px;\" data-bs-toggle=\"modal\" data-bs-target=\"#kt_edit_support_message\" onclick=\"SupportEditMessageInId(%s, %s)\">Edit</span>\n" +
                "        </div>\n" +
                "      </div>\n" +
                "      <div id=\"msg_block_%s\" class=\"p-3 rounded bg-light-info text-dark fw-semibold text-start\" data-kt-element=\"message-text\">%s</div>\n" +
                "    </div>\n" +
                "  </div>" +
                "</div>", avatar, userId, email, time, id, userId, id, userId, id, text);
      } else {
        chatHtml = String.format("<div class=\"symbol symbol-35px symbol-circle\">\n" +
                "          <img alt=\"Pic\" src=\"%s\">\n" +
                "        </div>\n" +
                "        <div class=\"ms-3\">\n" +
                "          <a href=\"user-edit?id=%s\" target=\"_blank\" class=\"fs-5 fw-bold text-gray-900 text-hover-primary me-1\">%s</a>\n" +
                "          <span class=\"text-muted fs-7 mb-1\">%s</span>\n" +
                "          <span class=\"SupportDeleteMessage\" onclick=\"SupportDeleteMessageInId(%s, %s)\" style=\"cursor: pointer; color: red; font-size: 12px; margin-left: 10px; margin-right: 10px;\">Delete</span>\n" +
                "        </div>\n" +
                "      </div>\n" +
                "      <div id=\"msg_block_%s\" class=\"p-3 rounded bg-light-info text-dark fw-semibold  text-start\" data-kt-element=\"message-text\"><img style=\"max-width: 100%%; display: block;\" src=\"%s\"></div>\n" +
                "    </div>\n" +
                "  </div>" +
                "</div>", avatar, userId, email, time, id, userId, id, text);
      }
    } else {
      if (type == 0) {
        chatHtml = String.format("<div class=\"me-3\">\n" +
                "          <span class=\"SupportDeleteMessageSp\" style=\"cursor: pointer; color: blue; font-size: 12px; margin-left: 10px;\" data-bs-toggle=\"modal\" data-bs-target=\"#kt_edit_support_message\" onclick=\"SupportEditMessageInId(%s, %s)\">Edit</span>\n" +
                "          <span class=\"SupportDeleteMessageSp\" onclick=\"SupportDeleteMessageInId(%s, %s)\" style=\"cursor: pointer; color: red; font-size: 12px; margin-right: 5px;\">Delete</span>\n" +
                "          <span class=\"text-muted fs-7 mb-1\">%s | %s</span>\n" +
                "          <a href=\"#\" class=\"fs-5 fw-bold text-gray-900 text-hover-primary ms-1\">You</a>\n" +
                "        </div>\n" +
                "        <div class=\"symbol symbol-35px symbol-circle\">\n" +
                "          <img alt=\"Pic\" src=\"%s\">\n" +
                "        </div>\n" +
                "      </div>\n" +
                "      <div id=\"msg_block_%s\" class=\"p-3 rounded bg-light-primary text-gray-800 fw-semibold text-end\" data-kt-element=\"message-text\">%s</div>\n" +
                "    </div>\n" +
                "  </div>" +
                "</div>", id, userId, id, userId, time, userViewed ? "Прочитано" : "Не прочитано", workerAvatar, id, text);
      } else {
        chatHtml = String.format("<div class=\"me-3\">\n" +
                "          <span class=\"SupportDeleteMessageSp\" onclick=\"SupportDeleteMessageInId(%s, %s)\" style=\"cursor: pointer; color: red; font-size: 12px; margin-right: 5px;\">Delete</span>\n" +
                "          <span class=\"text-muted fs-7 mb-1\">%s | %s</span>\n" +
                "          <a href=\"#\" class=\"fs-5 fw-bold text-gray-900 text-hover-primary ms-1\">You</a>\n" +
                "        </div>\n" +
                "        <div class=\"symbol symbol-35px symbol-circle\">\n" +
                "          <img alt=\"Pic\" src=\"%s\">\n" +
                "        </div>\n" +
                "      </div>\n" +
                "      <div id=\"msg_block_%s\" class=\"p-3 rounded bg-light-primary text-dark fw-semibold  text-end\" data-kt-element=\"message-text\">\n" +
                "        <img style=\"max-width: 100%%; display: block;\" src=\"%s\">\n" +
                "      </div>\n" +
                "    </div>\n" +
                "  </div>" +
                "</div>", id, userId, time, userViewed ? "Прочитано" : "Не прочитано", workerAvatar, id, text);
      }
    }
    out.println(chatHtml);
  }
%>