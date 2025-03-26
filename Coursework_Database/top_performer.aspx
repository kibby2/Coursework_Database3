<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="top_performer.aspx.cs" Inherits="Coursework_Database.top_performer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ Register Src="~/navigation.ascx" TagPrefix="uc" TagName="navigation" %>
<head runat="server">
    <title>Top Performer</title>
</head>
<body>
    <uc:navigation runat="server" />
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECTNAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
    user_id, 
    USERNAME, 
    project_id, 
    PROJECTNAME, 
    total_completed_tasks
FROM (
    SELECT 
        utp.project_id, 
        utp.user_id, 
        u.username, 
        p.projectname,
        COUNT(t.task_id) AS total_completed_tasks,
        RANK() OVER (PARTITION BY utp.project_id ORDER BY COUNT(t.task_id) DESC) AS user_rank
    FROM user_task_project utp
    JOIN tasks t ON utp.task_id = t.task_id
    JOIN users u ON utp.user_id = u.user_id
    JOIN projects p ON utp.project_id = p.project_id
    WHERE t.taskstatus = 'Completed'
    GROUP BY utp.project_id, utp.user_id, u.username, p.projectname
) ranked_users
WHERE user_rank &lt;= 3 AND ranked_users.project_id = :projects
ORDER BY ranked_users.total_completed_tasks DESC, ranked_users.user_id



" OnSelecting="SqlDataSource1_Selecting">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="projects" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="PROJECTNAME" DataValueField="PROJECT_ID">
            </asp:DropDownList>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
            </asp:GridView>
        &nbsp;</div>
    </form>
</body>
</html>
