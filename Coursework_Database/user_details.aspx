<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_details.aspx.cs" Inherits="Coursework_Database.user_details" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ Register Src="~/navigation.ascx" TagPrefix="uc" TagName="navigation" %>

<head runat="server">
    <title>Subtask Details</title>
    <!-- Include Bootstrap CSS for easier styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Custom styles */
        body {
            background-color: #F4F6F7; /* Light gray background */
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 20px;
        }
        .table {
            border-radius: 10px;
            border: 1px solid #ddd;
            background-color: #fff;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        .table th {
            background-color: #62466B; /* Purple for column headers */
            color: #fff;
        }
        .table td {
            text-align: center;
        }
        .form-container {
            margin-top: 40px;
            padding: 20px;
            border: 2px solid #8C93A8;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            width: 60%;
            margin-left: auto;
            margin-right: auto;
            text-align: left; /* Left align the form content */
        }
        .form-container input[type="text"], .form-container textarea {
            margin-bottom: 15px;
            width: 100%;
        }
        .btn-rounded {
            border-radius: 30px;
        }
        .btn-edit-delete {
            background-color: #62466B; /* Purple for Edit/Delete */
            color: #fff;
        }
        .btn-edit-delete:hover {
            background-color: #45364B;
        }
        .btn-pagination {
            background-color: #8C93A8; /* Gray for pagination */
            color: #fff;
        }
        .btn-pagination:hover {
            background-color: #B5C2B7;
        }
        .btn-new {
            background-color: #B5C2B7; /* Light green for New */
            color: #fff;
        }
        .btn-new:hover {
            background-color: #8C93A8;
        }
        .table-wrapper {
            margin-bottom: 40px;
        }
        .form-view {
            text-align: left; /* Left align the contents of the form */
        }
        .form-view input[type="text"] {
            width: 80%; /* Ensure textboxes have consistent width */
            margin: 10px 0; /* Spacing between input fields */
            display: inline-block; /* Align textboxes within the container */
        }
        .form-view label {
            font-weight: bold;
        }
    </style>
</head>

<body>
    <uc:navigation runat="server" />

    <div class="container">
        <form id="form1" runat="server">
            <!-- Isolated Data Source Division -->
            <div id="dataSourceSection" style="display:none;">
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

            <!-- Grid View with Table -->
            <div class="table-wrapper">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1" AllowPaging="True" CssClass="table table-bordered">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="USER_ID" HeaderText="User ID" ReadOnly="True" SortExpression="USER_ID" />
                        <asp:BoundField DataField="USERNAME" HeaderText="Username" SortExpression="USERNAME" />
                        <asp:BoundField DataField="USERROLE" HeaderText="User Role" SortExpression="USERROLE" />
                        <asp:BoundField DataField="USEREMAIL" HeaderText="User Email" SortExpression="USEREMAIL" />
                        <asp:BoundField DataField="PHONENUMBER" HeaderText="Phone Number" SortExpression="PHONENUMBER" />
                    </Columns>
                </asp:GridView>
            </div>

            <!-- FormView for Edit and Insert -->
            <div class="form-container">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1">
                    <EditItemTemplate>
                        <div class="form-view">
                            <label>User ID:</label>
                            <asp:Label ID="USER_IDLabel1" runat="server" Text='<%# Eval("USER_ID") %>' />
                            <br />
                            <label>Username:</label>
                            <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' />
                            <br />
                            <label>User Role:</label>
                            <asp:TextBox ID="USERROLETextBox" runat="server" Text='<%# Bind("USERROLE") %>' />
                            <br />
                            <label>User Email:</label>
                            <asp:TextBox ID="USEREMAILTextBox" runat="server" Text='<%# Bind("USEREMAIL") %>' />
                            <br />
                            <label>Phone Number:</label>
                            <asp:TextBox ID="PHONENUMBERTextBox" runat="server" Text='<%# Bind("PHONENUMBER") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-edit-delete btn-rounded" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary btn-rounded" />
                        </div>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <div class="form-view">
                            <label>User ID:</label>
                            <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>' />
                            <br />
                            <label>Username:</label>
                            <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' />
                            <br />
                            <label>User Role:</label>
                            <asp:TextBox ID="USERROLETextBox" runat="server" Text='<%# Bind("USERROLE") %>' />
                            <br />
                            <label>User Email:</label>
                            <asp:TextBox ID="USEREMAILTextBox" runat="server" Text='<%# Bind("USEREMAIL") %>' />
                            <br />
                            <label>Phone Number:</label>
                            <asp:TextBox ID="PHONENUMBERTextBox" runat="server" Text='<%# Bind("PHONENUMBER") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-new btn-rounded" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary btn-rounded" />
                        </div>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <div class="form-view">
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-new btn-rounded" />
                        </div>
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </form>
    </div>

    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>
