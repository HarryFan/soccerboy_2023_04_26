<%@ page language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.User" %>
<%@ page import="com.example.Role" %>

<%
// 初始化用户和角色數據
// 初始化用户和角色數據
List<User> userList = new ArrayList<>(); // 用户列表
userList.add(new User("John", "Doe", "john@example.com", Role.ADMIN)); // 添加管理員
userList.add(new User("Jane", "Doe", "jane@example.com", Role.USER)); // 添加普通用户
userList.add(new User("Bob", "Smith", "bob@example.com", Role.USER)); // 添加普通用户

Map<String, Role> roleMap = new HashMap<>(); // 角色映射
roleMap.put("admin", Role.ADMIN); // 添加管理員
roleMap.put("user", Role.USER); // 添加普通用户

// 處理表單提交
// 處理表單提交
String action = request.getParameter("action"); // 獲取表單操作
if (action != null) {
    if (action.equals("create")) { // 如果是創建用户
        String firstName = request.getParameter("first_name"); // 獲取名字
        String lastName = request.getParameter("last_name"); // 獲取姓氏
        String email = request.getParameter("email"); // 獲取郵箱
        String roleStr = request.getParameter("role"); // 獲取角色
        Role role = roleMap.get(roleStr); // 獲取角色
        User user = new User(firstName, lastName, email, role); // 創建用户
        userList.add(user); // 添加用户
    } else if (action.equals("delete")) { // 如果是刪除用户
        int userId = Integer.parseInt(request.getParameter("user_id")); // 獲取用户ID
        userList.remove(userId); // 刪除用户
    } else if (action.equals("edit")) { // 如果是編輯用户
        int userId = Integer.parseInt(request.getParameter("user_id")); // 獲取用户ID
        User user = userList.get(userId); // 獲取用户
        user.setFirstName(request.getParameter("first_name")); // 設置名字
        user.setLastName(request.getParameter("last_name")); // 設置姓氏
        user.setEmail(request.getParameter("email")); // 設置郵箱
        user.setRole(roleMap.get(request.getParameter("role"))); // 設置角色
    }
}

%>
<!DOCTYPE html>
<html>

<head>
    <title>帳户管理</title> <!-- 賬户管理 -->
</head>

<body>
    <h1>帳户管理</h1> <!-- 賬户管理 -->
    <h2>現有用户</h2> <!-- 現有用户 -->
    <table>
        <thead>
            <tr>
                <th>ID</th> <!-- ID -->
                <th>名字</th> <!-- 名字 -->
                <th>姓氏</th> <!-- 姓氏 -->
                <th>電子郵件</th> <!-- 電子郵件 -->
                <th>角色</th> <!-- 角色 -->
                <th>操作</th> <!-- 操作 -->
            </tr>
        </thead>
        <tbody>
            <% for (int i = 0; i < userList.size(); i++) { %>
            <tr>
                <td><%= i %></td> <!-- ID -->
                <td><%= userList.get(i).getFirstName() %></td> <!-- 名字 -->
                <td><%= userList.get(i).getLastName() %></td> <!-- 姓氏 -->
                <td><%= userList.get(i).getEmail() %></td> <!-- 電子郵件 -->
                <td><%= userList.get(i).getRole() %></td> <!-- 角色 -->
                <td>
                    <form method="post">
                        <input type="hidden" name="user_id" value="<%= i %>">
                        <input type="hidden" name="action" value="delete">
                        <button type="submit">刪除</button> <!-- 刪除 -->
                    </form>
                    <form method="get" action="edit_user.jsp">
                        <input type="hidden" name="user_id" value="<%= i %>">
                        <button type="submit">編輯</button> <!-- 編輯 -->
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <h2>創建用户</h2> <!-- 創建用户 -->
    <form method="post">
        <label>名字：</label>
        <input type="text" name="first_name"><br>
        <label>姓氏：</label>
        <input type="text" name="last_name"><br>
        <label>電子郵件：</label>
        <input type="email" name="email"><br>
        <label>角色：</label>
        <select name="role">
            <option value="admin">管理員</option>
            <option value="user">普通用户</option>
        </select><br>
        <input type="hidden" name="action" value="create">
        <button type="submit">創建用户</button>
    </form>
</body>

</html>