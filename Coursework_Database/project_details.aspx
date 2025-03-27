<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="project_details.aspx.cs" Inherits="Coursework_Database.project_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ Register Src="~/navigation.ascx" TagPrefix="uc" TagName="navigation" %>
<head runat="server">
    <title>Project Details</title>
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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" AllowPaging="True">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" ReadOnly="True" SortExpression="PROJECT_ID" />

                    <asp:TemplateField HeaderText="PROJECTNAME" SortExpression="PROJECTNAME">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PROJECTNAME") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="PROJECT NAME is required." ForeColor="Red" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("PROJECTNAME") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="PROJECTSTARTDATE" SortExpression="PROJECTSTARTDATE">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PROJECTSTARTDATE", "{0:MM-dd-yyyy}") %>' TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="PROJECT START DATE is required." ForeColor="Red" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("PROJECTSTARTDATE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="PROJECTENDDATE" SortExpression="PROJECTENDDATE">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PROJECTENDDATE", "{0:MM-dd-yyyy}") %>' TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="PROJECT END DATE is required." ForeColor="Red" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("PROJECTENDDATE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="PROJECTDESCRIPTION" SortExpression="PROJECTDESCRIPTION">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("PROJECTDESCRIPTION") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="PROJECT DESCRIPTION is required." ForeColor="Red" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("PROJECTDESCRIPTION") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="PROJECTSTATUS" SortExpression="PROJECTSTATUS">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("PROJECTSTATUS") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="PROJECT STATUS is required." ForeColor="Red" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("PROJECTSTATUS") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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
                    <asp:TextBox ID="PROJECTSTARTDATETextBox" runat="server" Text='<%# Bind("PROJECTSTARTDATE", "{0:MM-dd-yyyy}") %>' />
                    <br />
                    PROJECTENDDATE:
                    <asp:TextBox ID="PROJECTENDDATETextBox" runat="server" Text='<%# Bind("PROJECTENDDATE", "{0:MM-dd-yyyy}") %>' />
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
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PROJECT_IDTextBox" ErrorMessage="PROJECT ID is required." ForeColor="Red" />
    <br />

    PROJECTNAME:
    <asp:TextBox ID="PROJECTNAMETextBox" runat="server" Text='<%# Bind("PROJECTNAME") %>' />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PROJECTNAMETextBox" ErrorMessage="PROJECT NAME is required." ForeColor="Red" />
    <br />

    PROJECTSTARTDATE:
    <asp:TextBox ID="PROJECTSTARTDATETextBox" runat="server" Text='<%# Bind("PROJECTSTARTDATE","{0:MM-dd-yyyy}") %>' TextMode="Date" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PROJECTSTARTDATETextBox" ErrorMessage="PROJECT START DATE is required." ForeColor="Red" />
    <br />

    PROJECTENDDATE:
    <asp:TextBox ID="PROJECTENDDATETextBox" runat="server" Text='<%# Bind("PROJECTENDDATE","{0:MM-dd-yyyy}") %>' TextMode="Date" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="PROJECTENDDATETextBox" ErrorMessage="PROJECT END DATE is required." ForeColor="Red" />
    <br />

    PROJECTDESCRIPTION:
    <asp:TextBox ID="PROJECTDESCRIPTIONTextBox" runat="server" Text='<%# Bind("PROJECTDESCRIPTION") %>' />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="PROJECTDESCRIPTIONTextBox" ErrorMessage="PROJECT DESCRIPTION is required." ForeColor="Red" />
    <br />

    PROJECTSTATUS:
    <asp:TextBox ID="PROJECTSTATUSTextBox" runat="server" Text='<%# Bind("PROJECTSTATUS") %>' />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="PROJECTSTATUSTextBox" ErrorMessage="PROJECT STATUS is required." ForeColor="Red" />
    <br />
    
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
