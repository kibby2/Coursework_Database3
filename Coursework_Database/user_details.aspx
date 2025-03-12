<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_details.aspx.cs" Inherits="Coursework_Database.user_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ Register Src="~/navigation.ascx" TagPrefix="uc" TagName="navigation" %>
<head runat="server">
    <title>Subtask Details</title>
</head>
<body>
    <uc:navigation runat="server" />
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USER_ID&quot; = :USER_ID" InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USER_ID&quot;, &quot;USERNAME&quot;, &quot;USERROLE&quot;, &quot;USEREMAIL&quot;, &quot;PHONENUMBER&quot;) VALUES (:USER_ID, :USERNAME, :USERROLE, :USEREMAIL, :PHONENUMBER)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;USERS&quot;" UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;USERNAME&quot; = :USERNAME, &quot;USERROLE&quot; = :USERROLE, &quot;USEREMAIL&quot; = :USEREMAIL, &quot;PHONENUMBER&quot; = :PHONENUMBER WHERE &quot;USER_ID&quot; = :USER_ID">
                <DeleteParameters>
                    <asp:Parameter Name="USER_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="USER_ID" Type="String" />
                    <asp:Parameter Name="USERNAME" Type="String" />
                    <asp:Parameter Name="USERROLE" Type="String" />
                    <asp:Parameter Name="USEREMAIL" Type="String" />
                    <asp:Parameter Name="PHONENUMBER" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="USERNAME" Type="String" />
                    <asp:Parameter Name="USERROLE" Type="String" />
                    <asp:Parameter Name="USEREMAIL" Type="String" />
                    <asp:Parameter Name="PHONENUMBER" Type="String" />
                    <asp:Parameter Name="USER_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" ReadOnly="True" SortExpression="USER_ID" />
                <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                <asp:BoundField DataField="USERROLE" HeaderText="USERROLE" SortExpression="USERROLE" />
                <asp:BoundField DataField="USEREMAIL" HeaderText="USEREMAIL" SortExpression="USEREMAIL" />
                <asp:BoundField DataField="PHONENUMBER" HeaderText="PHONENUMBER" SortExpression="PHONENUMBER" />
            </Columns>
        </asp:GridView>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                USER_ID:
                <asp:Label ID="USER_IDLabel1" runat="server" Text='<%# Eval("USER_ID") %>' />
                <br />
                USERNAME:
                <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' />
                <br />
                USERROLE:
                <asp:TextBox ID="USERROLETextBox" runat="server" Text='<%# Bind("USERROLE") %>' />
                <br />
                USEREMAIL:
                <asp:TextBox ID="USEREMAILTextBox" runat="server" Text='<%# Bind("USEREMAIL") %>' />
                <br />
                PHONENUMBER:
                <asp:TextBox ID="PHONENUMBERTextBox" runat="server" Text='<%# Bind("PHONENUMBER") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                USER_ID:
                <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>' />
                <br />
                USERNAME:
                <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' />
                <br />
                USERROLE:
                <asp:TextBox ID="USERROLETextBox" runat="server" Text='<%# Bind("USERROLE") %>' />
                <br />
                USEREMAIL:
                <asp:TextBox ID="USEREMAILTextBox" runat="server" Text='<%# Bind("USEREMAIL") %>' />
                <br />
                PHONENUMBER:
                <asp:TextBox ID="PHONENUMBERTextBox" runat="server" Text='<%# Bind("PHONENUMBER") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>
