這是一份針對上述程式碼的技術文件，該程式碼使用 JSP（Java Server Pages）技術編寫一個帳戶管理系統。

1.  引入所需的 Java 包和類別：
    

```
<%@ page language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.User" %>
<%@ page import="com.example.Role" %>
```

2.  初始化用戶和角色數據：
    

```
List<User> userList = new ArrayList<>();
Map<String, Role> roleMap = new HashMap<>();
```

3.  處理表單提交，根據不同的操作（創建、刪除、編輯）對用戶數據進行處理。
    
4.  使用 HTML 和 JSP 標籤編寫用戶界面，包括現有用戶列表、用戶創建表單和用戶操作（刪除、編輯）。
    

主要功能如下：

*   現有用戶列表：顯示用戶ID、名字、姓氏、電子郵件和角色等信息。
    
*   創建用戶：通過填寫表單並提交，將新用戶添加到用戶列表中。
    
*   刪除用戶：點擊刪除按鈕，將指定用戶從用戶列表中移除。
    
*   編輯用戶：點擊編輯按鈕，跳轉到編輯用戶頁面，修改用戶信息後提交。
    

帳戶管理系統使用 JSP 技術，可以快速開發網頁應用程式，實現對用戶數據的操作。JSP 能夠將 Java 語言與 HTML 標籤混合使用，使開發人員能夠在網頁中輕鬆地編寫 Java 程式碼。這種開發方式能夠提高開發效率，並使得代碼更容易維護。