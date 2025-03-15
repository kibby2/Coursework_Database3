<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Coursework_Database.dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ Register Src="~/navigation.ascx" TagPrefix="uc" TagName="navigation" %>
<head runat="server">
    <title>Dashboard</title>
    <style>
        h1 {
            text-align: center;
        }

        p {
            text-align: center;
        }

        div {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:navigation runat="server" />
        <div>
        </div>
        <h1>Dashboard</h1>

        <!-- Container div to center-align charts -->
        <div style="text-align: center;">

            <!-- Chart 2 -->
            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" Width="650px" Height="400px">
                <Titles>
                    <asp:Title Name="ChartTitle" Text="Top 5 Users by Completed Tasks" Font="Arial, 14pt, style=Bold" />
                </Titles>
                <Series>
                    <asp:Series Name="Series1" XValueMember="XVALUE" YValueMembers="YVALUE">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

            <!-- Chart 3 -->
            <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource3" Width="650px" Height="400px" OnLoad="Chart3_Load">
                <Titles>
                    <asp:Title Name="ChartTitle" Text="Proportion of Resource Types" Font="Arial, 14pt, style=Bold" />
                </Titles>
                <Series>
                    <asp:Series ChartType="Pie" Name="Series1" XValueMember="XVALUE" YValueMembers="YVALUE">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

            <!-- Chart 4 -->
            <asp:Chart ID="Chart4" runat="server" DataSourceID="SqlDataSource4" Width="650px" Height="400px">
                <Titles>
                    <asp:Title Name="ChartTitle" Text="Proportion of Different User Roles" Font="Arial, 14pt, style=Bold" />
                </Titles>
                <Series>
                    <asp:Series ChartType="Doughnut" Name="Series1" XValueMember="XVALUE" YValueMembers="YVALUE">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

            <!-- Chart 5 -->
            <asp:Chart ID="Chart5" runat="server" DataSourceID="SqlDataSource5" Width="650px" Height="400px">
                <Titles>
                    <asp:Title Name="ChartTitle" Text="Projects with Top Number of Tasks" Font="Arial, 14pt, style=Bold" />
                </Titles>
                <Series>
                    <asp:Series ChartArea="ChartArea1" ChartType="Line" Name="Series1">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

        </div>

        <!-- DataSources inside a div -->
        <div style="display:none;">
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
            WHERE ROWNUM &lt;= 5"></asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT RESOURCETYPE AS XValue, COUNT(*) AS YValue
            FROM RESOURCES
            GROUP BY RESOURCETYPE
            ORDER BY YValue DESC"></asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT USERROLE AS XValue, COUNT(*) AS YValue
            FROM USERS
            GROUP BY USERROLE
            ORDER BY YValue DESC"></asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT PROJECTNAME, USER_COUNT
            FROM (
                SELECT p.PROJECTNAME, COUNT(up.USER_ID) AS USER_COUNT
                FROM USER_PROJECT up
                JOIN PROJECTS p ON up.PROJECT_ID = p.PROJECT_ID
                GROUP BY p.PROJECTNAME
                ORDER BY USER_COUNT DESC
            )
            WHERE ROWNUM &lt;= 5"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
