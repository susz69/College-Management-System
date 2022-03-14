<%@ Page Title="" Language="C#" MasterPageFile="~/app.Master" AutoEventWireup="true" CodeBehind="module.aspx.cs" Inherits="abccollege.module" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" runat="server">
    <h3 style="margin-top:10px;"><b>MODULE DETAILS</b></h3>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" DeleteCommand="DELETE FROM &quot;MODULE&quot; WHERE &quot;MODULE_CODE&quot; = :MODULE_CODE" InsertCommand="INSERT INTO &quot;MODULE&quot; (&quot;MODULE_CODE&quot;, &quot;MODULE_NAME&quot;, &quot;CREDIT_HOURS&quot;) VALUES (:MODULE_CODE, :MODULE_NAME, :CREDIT_HOURS)" ProviderName="System.Data.OracleClient" SelectCommand="SELECT * FROM &quot;MODULE&quot;" UpdateCommand="UPDATE &quot;MODULE&quot; SET &quot;MODULE_NAME&quot; = :MODULE_NAME, &quot;CREDIT_HOURS&quot; = :CREDIT_HOURS WHERE &quot;MODULE_CODE&quot; = :MODULE_CODE">
        <DeleteParameters>
            <asp:Parameter Name="MODULE_CODE" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MODULE_CODE" Type="String" />
            <asp:Parameter Name="MODULE_NAME" Type="String" />
            <asp:Parameter Name="CREDIT_HOURS" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MODULE_NAME" Type="String" />
            <asp:Parameter Name="CREDIT_HOURS" Type="Decimal" />
            <asp:Parameter Name="MODULE_CODE" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="row-view" style="margin-top:-300px">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="MODULE_CODE" DataSourceID="SqlDataSource1" Height="298px" Width="974px" CellPadding="5" GridLines="Vertical">
        <Columns>
            <asp:BoundField DataField="MODULE_CODE" HeaderText="MODULE_CODE" ReadOnly="True" SortExpression="MODULE_CODE" />
            <asp:BoundField DataField="MODULE_NAME" HeaderText="MODULE_NAME" SortExpression="MODULE_NAME" />
            <asp:BoundField DataField="CREDIT_HOURS" HeaderText="CREDIT_HOURS" SortExpression="CREDIT_HOURS" />
            <asp:CommandField ShowEditButton="True" >
            <ControlStyle CssClass="btn btn-primary" ForeColor="White" Width="72px" />
            <ItemStyle Wrap="False" />
            </asp:CommandField>
            <asp:ButtonField CommandName="Delete" Text="Delete">
            <ControlStyle CssClass="btn btn-danger" ForeColor="White" />
            </asp:ButtonField>
        </Columns>
        <HeaderStyle BackColor="#3A3636" ForeColor="White" />
        <PagerStyle BackColor="#3A3636" ForeColor="White" HorizontalAlign="Center" />
    </asp:GridView>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="MODULE_CODE" DataSourceID="SqlDataSource1" HeaderText="ADD  NEW MODULE" Height="97px" Width="347px">
        <EditItemTemplate>
            MODULE_CODE:
            <asp:Label ID="MODULE_CODELabel1" runat="server" Text='<%# Eval("MODULE_CODE") %>' />
            <br />
            MODULE_NAME:
            <asp:TextBox ID="MODULE_NAMETextBox" runat="server" Text='<%# Bind("MODULE_NAME") %>' />
            <br />
            CREDIT_HOURS:
            <asp:TextBox ID="CREDIT_HOURSTextBox" runat="server" Text='<%# Bind("CREDIT_HOURS") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <HeaderStyle Font-Bold="True" Font-Size="Large" />
        <InsertItemTemplate>
            &nbsp;
            <br />
            MODULE CODE*&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="MODULE_CODETextBox" runat="server" Text='<%# Bind("MODULE_CODE") %>' />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:CustomValidator ID="pkVal" runat="server" ControlToValidate="MODULE_CODETextBox" ErrorMessage="Module Code already exists!" ForeColor="#CC3300" OnServerValidate="pkVal_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
            <br />
            MODULE NAME*&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="MODULE_NAMETextBox" runat="server" Text='<%# Bind("MODULE_NAME") %>' />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="MODULE_NAMETextBox" ErrorMessage="Please enter module name*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
            <br />
            &nbsp;CREDIT_HOURS&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="CREDIT_HOURSTextBox" runat="server" Text='<%# Bind("CREDIT_HOURS") %>' TextMode="Number" />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" style="margin-left: 0px" Width="74px" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" style="margin-left: 18px" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Module" CssClass="btn btn-primary" style="margin-left: 0px" Width="130px" />
        </ItemTemplate>
</asp:FormView>
    </div>
    </asp:Content>
