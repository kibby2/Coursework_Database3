<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Coursework_Database.dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ Register Src="~/navigation.ascx" TagPrefix="uc" TagName="navigation" %>
<head runat="server">
    <title>Dashboard</title>
    <style>
        body {
            background-color: #B5C2B7; /* Overall background color */
            margin: 0;
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
            padding-top: 10px;
            padding-right: 20px;
            padding-bottom: 15px;
            padding-left: 20px;
        }

        p {
            text-align: center;
        }

        div {
            text-align: center;
        }

        /* Chart border and background color */
        .chart-container {
            border: 5px solid #45364B; /* Border around the chart */
            background-color: #B5C2B7; /* Chart background color */
            padding: 10px;
            margin-bottom: 20px;
            transition: transform 0.3s ease-in-out; /* Smooth transition for hover effect */
        }

            /* Hover effect: enlarge chart on hover */
            .chart-container:hover {
                transform: scale(1.05); /* Slightly enlarge chart on hover */
            }

        /* Flex container to arrange charts in a 2x2 grid */
        .charts-wrapper {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px; /* Space between charts */
            margin: 0 50px; /* Add margin to the sides of the charts */
        }

        .chart-item {
            flex: 1 1 calc(50% - 20px); /* Ensure each chart takes up 50% of the row */
            max-width: 650px; /* Limit the max width of each chart */
            min-width: 300px; /* Ensure a minimum width for responsiveness */
        }

        /* Prevent chart overflow by ensuring a maximum width */
        .chart-container {
            width: 100%; /* Allow chart to adjust its width within its container */
            max-width: 650px; /* Max width for the chart */
            height: auto; /* Let the height adjust accordingly */
        }

        /* Optional: Set max height for each chart to ensure they are proportional */
        .chart-item > .chart-container {
            max-height: 450px; /* Set max height if necessary */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:navigation runat="server" />

        <h1>Dashboard</h1>

        <!-- Wrapper for charts arranged in 2x2 grid -->
        <div class="charts-wrapper">

            <!-- Chart 2 -->
            <div class="chart-item">
                <div class="chart-container">
                    <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" Width="550px" Height="400px">
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
                </div>
            </div>

            <!-- Chart 3 -->
            <div class="chart-item">
                <div class="chart-container">
                    <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource3" Width="550px" Height="400px" OnLoad="Chart3_Load">
                        <Titles>
                            <asp:Title Name="ChartTitle" Text="Proportion of Resource Types" Font="Arial, 14pt, style=Bold" />
                        </Titles>
                        <Series>
                            <asp:Series ChartType="Pie" Name="Series1" XValueMember="XVALUE" YValueMembers="YVALUE" CustomProperties="PieLabelStyle=Disabled">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                        <Legends>
                            <asp:Legend Name="Default" Docking="Right" Alignment="Center" Font="Arial, 10pt" />
                        </Legends>
                    </asp:Chart>
                </div>
            </div>

            <!-- Chart 4 -->
            <div class="chart-item">
                <div class="chart-container">
                    <asp:Chart ID="Chart4" runat="server" DataSourceID="SqlDataSource4" Width="550px" Height="400px" OnLoad="Chart4_Load">
                        <Titles>
                            <asp:Title Name="ChartTitle" Text="Proportion of Different User Roles" Font="Arial, 14pt, style=Bold" />
                        </Titles>
                        <Series>
                            <asp:Series ChartType="Doughnut" Name="Series1" XValueMember="XVALUE" YValueMembers="YVALUE" CustomProperties="PieLabelStyle=Disabled">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                        <Legends>
                            <asp:Legend Name="Default" Docking="Right" Alignment="Center" Font="Arial, 10pt" />
                        </Legends>
                    </asp:Chart>
                </div>
            </div>
        </div>

        <!-- DataSources inside a div (hidden from view) -->
        <div style="display: none;">
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

        </div>
    </form>
</body>
</html>
