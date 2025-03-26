<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="milestone_details.aspx.cs" Inherits="Coursework_Database.milestone_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ Register Src="~/navigation.ascx" TagPrefix="uc" TagName="navigation" %>
<head runat="server">
    <title>Milestone Details</title>
</head>
<body>
    <uc:navigation runat="server" />
    <form id="form1" runat="server">
        <div style="height: 302px">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MILESTONES&quot; WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID" InsertCommand="INSERT INTO &quot;MILESTONES&quot; (&quot;MILESTONE_ID&quot;, &quot;MILESTONENAME&quot;, &quot;MILESTONE_STARTDATE&quot;, &quot;MILESTONE_ENDDATE&quot;, &quot;PROJECT_ID&quot;, &quot;TASK_ID&quot;) VALUES (:MILESTONE_ID, :MILESTONENAME, :MILESTONE_STARTDATE, :MILESTONE_ENDDATE, :PROJECT_ID, :TASK_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;MILESTONES&quot;" UpdateCommand="UPDATE &quot;MILESTONES&quot; SET &quot;MILESTONENAME&quot; = :MILESTONENAME, &quot;MILESTONE_STARTDATE&quot; = :MILESTONE_STARTDATE, &quot;MILESTONE_ENDDATE&quot; = :MILESTONE_ENDDATE, &quot;PROJECT_ID&quot; = :PROJECT_ID, &quot;TASK_ID&quot; = :TASK_ID WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID">
                <DeleteParameters>
                    <asp:Parameter Name="MILESTONE_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MILESTONE_ID" Type="String" />
                    <asp:Parameter Name="MILESTONENAME" Type="String" />
                    <asp:Parameter Name="MILESTONE_STARTDATE" Type="DateTime" />
                    <asp:Parameter Name="MILESTONE_ENDDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECT_ID" Type="String" />
                    <asp:Parameter Name="TASK_ID" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MILESTONENAME" Type="String" />
                    <asp:Parameter Name="MILESTONE_STARTDATE" Type="DateTime" />
                    <asp:Parameter Name="MILESTONE_ENDDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECT_ID" Type="String" />
                    <asp:Parameter Name="TASK_ID" Type="String" />
                    <asp:Parameter Name="MILESTONE_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1" Style="margin-bottom: 26px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="MILESTONE_ID" HeaderText="MILESTONE_ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                    <asp:BoundField DataField="MILESTONENAME" HeaderText="MILESTONENAME" SortExpression="MILESTONENAME" />
                    <asp:TemplateField HeaderText="MILESTONE_STARTDATE" SortExpression="MILESTONE_STARTDATE">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" Text='<%# Bind("MILESTONE_STARTDATE", "{0:MM-dd-yyyy}") %>' TextMode="Date"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("MILESTONE_STARTDATE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="MILESTONE_ENDDATE" SortExpression="MILESTONE_ENDDATE">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("MILESTONE_ENDDATE", "{0:MM-dd-yyyy}") %>' TextMode="Date"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("MILESTONE_ENDDATE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" SortExpression="PROJECT_ID" />
                    <asp:BoundField DataField="TASK_ID" HeaderText="TASK_ID" SortExpression="TASK_ID" />
                    <asp:TemplateField HeaderText="Project_Name">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="PROJECTNAME" DataValueField="PROJECT_ID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECTNAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Task_Name">
                        <ItemTemplate>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASKNAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>
                            <asp:DropDownList Enabled="false" ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="TASKNAME" DataValueField="TASK_ID" SelectedValue='<%# Bind("TASK_ID") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    MILESTONE_ID:
                    <asp:Label ID="MILESTONE_IDLabel1" runat="server" Text='<%# Eval("MILESTONE_ID") %>' />
                    <br />
                    MILESTONENAME:
                    <asp:TextBox ID="MILESTONENAMETextBox" runat="server" Text='<%# Bind("MILESTONENAME") %>' />
                    <br />
                    MILESTONE_STARTDATE:
                    <asp:TextBox ID="MILESTONE_STARTDATETextBox" runat="server" Text='<%# Bind("MILESTONE_STARTDATE") %>' />
                    <br />
                    MILESTONE_ENDDATE:
                    <asp:TextBox ID="MILESTONE_ENDDATETextBox" runat="server" Text='<%# Bind("MILESTONE_ENDDATE") %>' />
                    <br />
                    PROJECT_ID:
                    <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' />
                    <br />
                    TASK_ID:
                    <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    MILESTONE_ID:
    <asp:TextBox ID="MILESTONE_IDTextBox" runat="server" Text='<%# Bind("MILESTONE_ID") %>' />
                    <br />
                    MILESTONENAME:
    <asp:TextBox ID="MILESTONENAMETextBox" runat="server" Text='<%# Bind("MILESTONENAME") %>' />
                    <br />
                    MILESTONE_STARTDATE:
    <asp:TextBox ID="MILESTONE_STARTDATETextBox" runat="server" Text='<%# Bind("MILESTONE_STARTDATE") %>' TextMode="Date" />
                    <br />
                    MILESTONE_ENDDATE:
    <asp:TextBox ID="MILESTONE_ENDDATETextBox" runat="server" Text='<%# Bind("MILESTONE_ENDDATE") %>' TextMode="Date" />
                    <br />
                    PROJECT_ID:
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="PROJECTNAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>'>
    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECTNAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
                    <br />
                    TASK_ID:
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASKNAME" DataValueField="TASK_ID" SelectedValue='<%# Bind("TASK_ID") %>'>
    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASKNAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>

                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
