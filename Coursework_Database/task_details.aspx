<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="task_details.aspx.cs" Inherits="Coursework_Database.Task_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ Register Src="~/navigation.ascx" TagPrefix="uc" TagName="navigation" %>
<head runat="server">
    <title>Task Details</title>
</head>
<body>
    <uc:navigation runat="server" />
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TASKS&quot; WHERE &quot;TASK_ID&quot; = :TASK_ID" InsertCommand="INSERT INTO &quot;TASKS&quot; (&quot;TASK_ID&quot;, &quot;TASKNAME&quot;, &quot;TASKSTARTDATE&quot;, &quot;TASKENDDATE&quot;, &quot;TASKSTATUS&quot;, &quot;PROJECT_ID&quot;) VALUES (:TASK_ID, :TASKNAME, :TASKSTARTDATE, :TASKENDDATE, :TASKSTATUS, :PROJECT_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TASKS&quot;" UpdateCommand="UPDATE &quot;TASKS&quot; SET &quot;TASKNAME&quot; = :TASKNAME, &quot;TASKSTARTDATE&quot; = :TASKSTARTDATE, &quot;TASKENDDATE&quot; = :TASKENDDATE, &quot;TASKSTATUS&quot; = :TASKSTATUS, &quot;PROJECT_ID&quot; = :PROJECT_ID WHERE &quot;TASK_ID&quot; = :TASK_ID">
                <DeleteParameters>
                    <asp:Parameter Name="TASK_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TASK_ID" Type="String" />
                    <asp:Parameter Name="TASKNAME" Type="String" />
                    <asp:Parameter Name="TASKSTARTDATE" Type="DateTime" />
                    <asp:Parameter Name="TASKENDDATE" Type="DateTime" />
                    <asp:Parameter Name="TASKSTATUS" Type="String" />
                    <asp:Parameter Name="PROJECT_ID" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TASKNAME" Type="String" />
                    <asp:Parameter Name="TASKSTARTDATE" Type="DateTime" />
                    <asp:Parameter Name="TASKENDDATE" Type="DateTime" />
                    <asp:Parameter Name="TASKSTATUS" Type="String" />
                    <asp:Parameter Name="PROJECT_ID" Type="String" />
                    <asp:Parameter Name="TASK_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TASK_ID" DataSourceID="SqlDataSource1" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="TASK_ID" HeaderText="TASK_ID" ReadOnly="True" SortExpression="TASK_ID" />

                    <asp:TemplateField HeaderText="TASKNAME" SortExpression="TASKNAME">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TASKNAME") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator1"
                                runat="server"
                                ControlToValidate="TextBox3"
                                ErrorMessage="TASK NAME is required"
                                ForeColor="Red" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("TASKNAME") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="TASKSTARTDATE" SortExpression="TASKSTARTDATE">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TASKSTARTDATE", "{0:MM-dd-yyyy}") %>' TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator2"
                                runat="server"
                                ControlToValidate="TextBox1"
                                ErrorMessage="TASK START DATE is required"
                                ForeColor="Red" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("TASKSTARTDATE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="TASKENDDATE" SortExpression="TASKENDDATE">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TASKENDDATE", "{0:MM-dd-yyyy}") %>' TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator3"
                                runat="server"
                                ControlToValidate="TextBox2"
                                ErrorMessage="TASK END DATE is required"
                                ForeColor="Red" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("TASKENDDATE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="TASKSTATUS" SortExpression="TASKSTATUS">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("TASKSTATUS") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator4"
                                runat="server"
                                ControlToValidate="TextBox4"
                                ErrorMessage="TASK STATUS is required"
                                ForeColor="Red" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("TASKSTATUS") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" SortExpression="PROJECT_ID" />

                    <asp:TemplateField HeaderText="Project_Title">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="PROJECTNAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECTNAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="TASK_ID" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    TASK_ID:
                    <asp:Label ID="TASK_IDLabel1" runat="server" Text='<%# Eval("TASK_ID") %>' />
                    <br />
                    TASKNAME:
                    <asp:TextBox ID="TASKNAMETextBox" runat="server" Text='<%# Bind("TASKNAME") %>' />
                    <br />
                    TASKSTARTDATE:
                    <asp:TextBox ID="TASKSTARTDATETextBox" runat="server" Text='<%# Bind("TASKSTARTDATE") %>' />
                    <br />
                    TASKENDDATE:
                    <asp:TextBox ID="TASKENDDATETextBox" runat="server" Text='<%# Bind("TASKENDDATE") %>' />
                    <br />
                    TASKSTATUS:
                    <asp:TextBox ID="TASKSTATUSTextBox" runat="server" Text='<%# Bind("TASKSTATUS") %>' />
                    <br />
                    PROJECT_ID:
                    <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    TASK_ID:
    <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator5"
                        runat="server"
                        ControlToValidate="TASK_IDTextBox"
                        ErrorMessage="TASK ID is required"
                        ForeColor="Red" />
                    <br />
                    TASKNAME:
    <asp:TextBox ID="TASKNAMETextBox" runat="server" Text='<%# Bind("TASKNAME") %>' />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1"
                        runat="server"
                        ControlToValidate="TASKNAMETextBox"
                        ErrorMessage="TASK NAME is required"
                        ForeColor="Red" />
                    <br />
                    TASKSTARTDATE:
    <asp:TextBox ID="TASKSTARTDATETextBox" runat="server" Text='<%# Bind("TASKSTARTDATE") %>' TextMode="Date" />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2"
                        runat="server"
                        ControlToValidate="TASKSTARTDATETextBox"
                        ErrorMessage="TASK START DATE is required"
                        ForeColor="Red" />
                    <br />
                    TASKENDDATE:
    <asp:TextBox ID="TASKENDDATETextBox" runat="server" Text='<%# Bind("TASKENDDATE") %>' TextMode="Date" />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator3"
                        runat="server"
                        ControlToValidate="TASKENDDATETextBox"
                        ErrorMessage="TASK END DATE is required"
                        ForeColor="Red" />
                    <br />
                    TASKSTATUS:
    <asp:TextBox ID="TASKSTATUSTextBox" runat="server" Text='<%# Bind("TASKSTATUS") %>' />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator4"
                        runat="server"
                        ControlToValidate="TASKSTATUSTextBox"
                        ErrorMessage="TASK STATUS is required"
                        ForeColor="Red" />
                    <br />
                    PROJECT_ID:
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="PROJECTNAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>'>
    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECTNAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
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
