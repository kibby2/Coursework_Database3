<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="project_details.aspx.cs" Inherits="Coursework_Database.project_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ Register Src="~/navigation.ascx" TagPrefix="uc" TagName="navigation" %>
<head runat="server">
    <title></title>
</head>
<body>
    <uc:navigation runat="server" />
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECTS&quot; WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID" InsertCommand="INSERT INTO &quot;PROJECTS&quot; (&quot;PROJECT_ID&quot;, &quot;PROJECTNAME&quot;, &quot;PROJECTSTARTDATE&quot;, &quot;PROJECTENDDATE&quot;, &quot;PROJECTDESCRIPTION&quot;, &quot;PROJECTSTATUS&quot;) VALUES (:PROJECT_ID, :PROJECTNAME, :PROJECTSTARTDATE, :PROJECTENDDATE, :PROJECTDESCRIPTION, :PROJECTSTATUS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;PROJECTS&quot;" UpdateCommand="UPDATE &quot;PROJECTS&quot; SET &quot;PROJECTNAME&quot; = :PROJECTNAME, &quot;PROJECTSTARTDATE&quot; = :PROJECTSTARTDATE, &quot;PROJECTENDDATE&quot; = :PROJECTENDDATE, &quot;PROJECTDESCRIPTION&quot; = :PROJECTDESCRIPTION, &quot;PROJECTSTATUS&quot; = :PROJECTSTATUS WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID">
                <DeleteParameters>
                    <asp:Parameter Name="PROJECT_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PROJECT_ID" Type="String" />
                    <asp:Parameter Name="PROJECTNAME" Type="String" />
                    <asp:Parameter Name="PROJECTSTARTDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECTENDDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECTDESCRIPTION" Type="String" />
                    <asp:Parameter Name="PROJECTSTATUS" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PROJECTNAME" Type="String" />
                    <asp:Parameter Name="PROJECTSTARTDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECTENDDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECTDESCRIPTION" Type="String" />
                    <asp:Parameter Name="PROJECTSTATUS" Type="String" />
                    <asp:Parameter Name="PROJECT_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                    <asp:BoundField DataField="PROJECTNAME" HeaderText="PROJECTNAME" SortExpression="PROJECTNAME" />
                    <asp:BoundField DataField="PROJECTSTARTDATE" HeaderText="PROJECTSTARTDATE" SortExpression="PROJECTSTARTDATE" />
                    <asp:BoundField DataField="PROJECTENDDATE" HeaderText="PROJECTENDDATE" SortExpression="PROJECTENDDATE" />
                    <asp:BoundField DataField="PROJECTDESCRIPTION" HeaderText="PROJECTDESCRIPTION" SortExpression="PROJECTDESCRIPTION" />
                    <asp:BoundField DataField="PROJECTSTATUS" HeaderText="PROJECTSTATUS" SortExpression="PROJECTSTATUS" />
                </Columns>
            </asp:GridView>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    PROJECT_ID:
                    <asp:Label ID="PROJECT_IDLabel1" runat="server" Text='<%# Eval("PROJECT_ID") %>' />
                    <br />
                    PROJECTNAME:
                    <asp:TextBox ID="PROJECTNAMETextBox" runat="server" Text='<%# Bind("PROJECTNAME") %>' />
                    <br />
                    PROJECTSTARTDATE:
                    <asp:TextBox ID="PROJECTSTARTDATETextBox" runat="server" Text='<%# Bind("PROJECTSTARTDATE") %>' />
                    <br />
                    PROJECTENDDATE:
                    <asp:TextBox ID="PROJECTENDDATETextBox" runat="server" Text='<%# Bind("PROJECTENDDATE") %>' />
                    <br />
                    PROJECTDESCRIPTION:
                    <asp:TextBox ID="PROJECTDESCRIPTIONTextBox" runat="server" Text='<%# Bind("PROJECTDESCRIPTION") %>' />
                    <br />
                    PROJECTSTATUS:
                    <asp:TextBox ID="PROJECTSTATUSTextBox" runat="server" Text='<%# Bind("PROJECTSTATUS") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    PROJECT_ID:
                    <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' />
                    <br />
                    PROJECTNAME:
                    <asp:TextBox ID="PROJECTNAMETextBox" runat="server" Text='<%# Bind("PROJECTNAME") %>' />
                    <br />
                    PROJECTSTARTDATE:
                    <asp:TextBox ID="PROJECTSTARTDATETextBox" runat="server" Text='<%# Bind("PROJECTSTARTDATE") %>' />
                    <br />
                    PROJECTENDDATE:
                    <asp:TextBox ID="PROJECTENDDATETextBox" runat="server" Text='<%# Bind("PROJECTENDDATE") %>' />
                    <br />
                    PROJECTDESCRIPTION:
                    <asp:TextBox ID="PROJECTDESCRIPTIONTextBox" runat="server" Text='<%# Bind("PROJECTDESCRIPTION") %>' />
                    <br />
                    PROJECTSTATUS:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="PROJECTSTATUS" DataValueField="PROJECTSTATUS" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" SelectedValue='<%# Bind("PROJECTSTATUS") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECTSTATUS&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
                    &nbsp;<br />
                    &nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
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
