<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Coursework_Database.dashboard" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ Register Src="~/navigation.ascx" TagPrefix="uc" TagName="navigation" %>
<head runat="server">
    <title>Dashboard</title>
</head>
<body>
    <form id="form1" runat="server">
    <uc:navigation runat="server" />
        <div>
        </div>
        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" Width="571px">
            <Series>
                <asp:Series Name="Series1" XValueMember="XVALUE" YValueMembers="YVALUE">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT u.USERNAME AS XValue, YValue
FROM (
    SELECT utp.USER_ID, COUNT(utp.TASK_ID) AS YValue
    FROM USER_TASK_PROJECT utp
    JOIN TASKS t ON utp.TASK_ID = t.TASK_ID
    WHERE t.TASKSTATUS = 'Completed'
    GROUP BY utp.USER_ID
    ORDER BY YValue DESC
) top_users
JOIN USERS u ON top_users.USER_ID = u.USER_ID
WHERE ROWNUM &lt;= 5



"></asp:SqlDataSource>
        <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource3" Height="355px" OnLoad="Chart3_Load" Width="647px">
            <Series>
                <asp:Series ChartType="Pie" Name="Series1" XValueMember="XVALUE" YValueMembers="YVALUE">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT RESOURCETYPE AS XValue, COUNT(*) AS YValue
FROM RESOURCES
GROUP BY RESOURCETYPE
ORDER BY YValue DESC
"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT USERROLE AS XValue, COUNT(*) AS YValue
FROM USERS
GROUP BY USERROLE
ORDER BY YValue DESC


"></asp:SqlDataSource>
        <asp:Chart ID="Chart4" runat="server" DataSourceID="SqlDataSource4" Width="653px">
            <Series>
                <asp:Series ChartType="Doughnut" Name="Series1" XValueMember="XVALUE" YValueMembers="YVALUE">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT PROJECTNAME, USER_COUNT
FROM (
    SELECT p.PROJECTNAME, COUNT(up.USER_ID) AS USER_COUNT
    FROM USER_PROJECT up
    JOIN PROJECTS p ON up.PROJECT_ID = p.PROJECT_ID
    GROUP BY p.PROJECTNAME
    ORDER BY USER_COUNT DESC
)
WHERE ROWNUM &lt;= 5




"></asp:SqlDataSource>
        <br />
        <asp:Chart ID="Chart5" runat="server" DataSourceID="SqlDataSource5" Width="469px">
            <Series>
                <asp:Series ChartArea="ChartArea1" ChartType="Line" Name="Series1">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
    </form>
</body>
</html>
