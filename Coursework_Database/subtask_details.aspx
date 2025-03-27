<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="subtask_details.aspx.cs" Inherits="Coursework_Database.subtask_details" %>

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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;SUBTASKS&quot; WHERE &quot;SUBTASK_ID&quot; = :SUBTASK_ID" InsertCommand="INSERT INTO &quot;SUBTASKS&quot; (&quot;SUBTASK_ID&quot;, &quot;SUBTASKNAME&quot;, &quot;SUBTASK_STARTDATE&quot;, &quot;SUBTASK_ENDDATE&quot;, &quot;SUBTASKSTATUS&quot;, &quot;TASK_ID&quot;) VALUES (:SUBTASK_ID, :SUBTASKNAME, :SUBTASK_STARTDATE, :SUBTASK_ENDDATE, :SUBTASKSTATUS, :TASK_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;SUBTASKS&quot;" UpdateCommand="UPDATE &quot;SUBTASKS&quot; SET &quot;SUBTASKNAME&quot; = :SUBTASKNAME, &quot;SUBTASK_STARTDATE&quot; = :SUBTASK_STARTDATE, &quot;SUBTASK_ENDDATE&quot; = :SUBTASK_ENDDATE, &quot;SUBTASKSTATUS&quot; = :SUBTASKSTATUS, &quot;TASK_ID&quot; = :TASK_ID WHERE &quot;SUBTASK_ID&quot; = :SUBTASK_ID">
                <DeleteParameters>
                    <asp:Parameter Name="SUBTASK_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SUBTASK_ID" Type="String" />
                    <asp:Parameter Name="SUBTASKNAME" Type="String" />
                    <asp:Parameter Name="SUBTASK_STARTDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASK_ENDDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                    <asp:Parameter Name="TASK_ID" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SUBTASKNAME" Type="String" />
                    <asp:Parameter Name="SUBTASK_STARTDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASK_ENDDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                    <asp:Parameter Name="TASK_ID" Type="String" />
                    <asp:Parameter Name="SUBTASK_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SUBTASK_ID" DataSourceID="SqlDataSource1" AllowPaging="True">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="SUBTASK_ID" HeaderText="SUBTASK_ID" ReadOnly="True" SortExpression="SUBTASK_ID" />

                    <asp:TemplateField HeaderText="SUBTASKNAME" SortExpression="SUBTASKNAME">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("SUBTASKNAME") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="SUBTASK NAME is required" ForeColor="Red" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("SUBTASKNAME") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="SUBTASK_STARTDATE" SortExpression="SUBTASK_STARTDATE">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SUBTASK_STARTDATE", "{0:MM-dd-yyyy}") %>' TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="SUBTASK START DATE is required" ForeColor="Red" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("SUBTASK_STARTDATE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="SUBTASK_ENDDATE" SortExpression="SUBTASK_ENDDATE">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SUBTASK_ENDDATE", "{0:MM-dd-yyyy}") %>' TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="SUBTASK END DATE is required" ForeColor="Red" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("SUBTASK_ENDDATE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="SUBTASKSTATUS" SortExpression="SUBTASKSTATUS">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="SUBTASK STATUS is required" ForeColor="Red" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="TASK_ID" HeaderText="TASK_ID" SortExpression="TASK_ID" />

                    <asp:TemplateField HeaderText="Task_Name">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASKNAME" DataValueField="TASK_ID" SelectedValue='<%# Bind("TASK_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASKNAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="SUBTASK_ID" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    SUBTASK_ID:
                    <asp:Label ID="SUBTASK_IDLabel1" runat="server" Text='<%# Eval("SUBTASK_ID") %>' />
                    <br />
                    SUBTASKNAME:
                    <asp:TextBox ID="SUBTASKNAMETextBox" runat="server" Text='<%# Bind("SUBTASKNAME") %>' />
                    <br />
                    SUBTASK_STARTDATE:
                    <asp:TextBox ID="SUBTASK_STARTDATETextBox" runat="server" Text='<%# Bind("SUBTASK_STARTDATE") %>' />
                    <br />
                    SUBTASK_ENDDATE:
                    <asp:TextBox ID="SUBTASK_ENDDATETextBox" runat="server" Text='<%# Bind("SUBTASK_ENDDATE") %>' />
                    <br />
                    SUBTASKSTATUS:
                    <asp:TextBox ID="SUBTASKSTATUSTextBox" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>' />
                    <br />
                    TASK_ID:
                    <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    SUBTASK_ID:
    <asp:TextBox ID="SUBTASK_IDTextBox" runat="server" Text='<%# Bind("SUBTASK_ID") %>' />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1"
                        runat="server"
                        ControlToValidate="SUBTASK_IDTextBox"
                        ErrorMessage="SUBTASK ID is required"
                        ForeColor="Red" />
                    <br />

                    SUBTASKNAME:
    <asp:TextBox ID="SUBTASKNAMETextBox" runat="server" Text='<%# Bind("SUBTASKNAME") %>' />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2"
                        runat="server"
                        ControlToValidate="SUBTASKNAMETextBox"
                        ErrorMessage="SUBTASK NAME is required"
                        ForeColor="Red" />
                    <br />

                    SUBTASK_STARTDATE:
    <asp:TextBox ID="SUBTASK_STARTDATETextBox" runat="server" Text='<%# Bind("SUBTASK_STARTDATE") %>' TextMode="Date" />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator3"
                        runat="server"
                        ControlToValidate="SUBTASK_STARTDATETextBox"
                        ErrorMessage="SUBTASK START DATE is required"
                        ForeColor="Red" />
                    <br />

                    SUBTASK_ENDDATE:
    <asp:TextBox ID="SUBTASK_ENDDATETextBox" runat="server" Text='<%# Bind("SUBTASK_ENDDATE") %>' TextMode="Date" />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator4"
                        runat="server"
                        ControlToValidate="SUBTASK_ENDDATETextBox"
                        ErrorMessage="SUBTASK END DATE is required"
                        ForeColor="Red" />
                    <br />

                    SUBTASKSTATUS:
    <asp:TextBox ID="SUBTASKSTATUSTextBox" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>' />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator5"
                        runat="server"
                        ControlToValidate="SUBTASKSTATUSTextBox"
                        ErrorMessage="SUBTASK STATUS is required"
                        ForeColor="Red" />
                    <br />

                    TASK_ID:
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="TASKNAME" DataValueField="TASK_ID" SelectedValue='<%# Bind("TASK_ID") %>'>
    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASKNAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>
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
