<%@ Page Title="" Language="C#" MasterPageFile="~/app.Master" AutoEventWireup="true" CodeBehind="department.aspx.cs" Inherits="abccollege.department" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <h3 style="margin-top: 10px;"><b>DEPARTMENT DETAILS</b></h3>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" DeleteCommand="DELETE FROM &quot;DEPARTMENT&quot; WHERE &quot;DEPT_ID&quot; = :DEPT_ID" InsertCommand="INSERT INTO &quot;DEPARTMENT&quot; (&quot;DEPT_ID&quot;, &quot;DEPT_NAME&quot;) VALUES (:DEPT_ID, :DEPT_NAME)" ProviderName="System.Data.OracleClient" SelectCommand="SELECT * FROM &quot;DEPARTMENT&quot;" UpdateCommand="UPDATE &quot;DEPARTMENT&quot; SET &quot;DEPT_NAME&quot; = :DEPT_NAME WHERE &quot;DEPT_ID&quot; = :DEPT_ID">
        <DeleteParameters>
            <asp:Parameter Name="DEPT_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DEPT_ID" Type="String" />
            <asp:Parameter Name="DEPT_NAME" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DEPT_NAME" Type="String" />
            <asp:Parameter Name="DEPT_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="row-view" style="margin-top:-350px;">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DEPT_ID" DataSourceID="SqlDataSource1" Width="757px" AllowPaging="True" Height="417px" CellPadding="5" BorderStyle="Inset">
            <Columns>
                <asp:BoundField DataField="DEPT_ID" HeaderText="DEPT_ID" ReadOnly="True" SortExpression="DEPT_ID" />
                <asp:BoundField DataField="DEPT_NAME" HeaderText="DEPT_NAME" SortExpression="DEPT_NAME" />
                <asp:CommandField ButtonType="Button" ShowEditButton="True">
                    <ControlStyle CssClass="btn btn-primary" ForeColor="White" Width="72px" />
                </asp:CommandField>
                <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Delete">
                    <ControlStyle CssClass="btn btn-danger" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:ButtonField>
            </Columns>
            <FooterStyle BorderStyle="None" HorizontalAlign="Center" VerticalAlign="Bottom" />
            <HeaderStyle BorderStyle="None" BackColor="#2B2626" ForeColor="White" />
            <PagerStyle Width="100px" BackColor="#2B2626" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>

        <asp:FormView ID="FormView1" runat="server" DataKeyNames="DEPT_ID" DataSourceID="SqlDataSource1" BorderStyle="None" CellSpacing="-1" Height="16px" HorizontalAlign="Justify" OnPageIndexChanging="FormView1_PageIndexChanging" Width="661px" HeaderText="ADD NEW DEPARTMENT DETAILS">
            <EditItemTemplate>
                DEPT_ID:
            <asp:Label ID="DEPT_IDLabel1" runat="server" Text='<%# Eval("DEPT_ID") %>' />
                <br />
                DEPT_NAME:
            <asp:TextBox ID="DEPT_NAMETextBox" runat="server" Text='<%# Bind("DEPT_NAME") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <HeaderStyle Font-Size="Large" Font-Bold="True" />
            <InsertItemTemplate>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; DEPT ID:*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="DEPT_IDTextBox" runat="server" Text='<%# Bind("DEPT_ID") %>' />
                &nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:CustomValidator ID="pkVal" runat="server" ControlToValidate="DEPT_IDTextBox" ErrorMessage="Department ID ready exists!" ForeColor="#CC3300" OnServerValidate="validationPK" ValidateEmptyText="True"></asp:CustomValidator>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEPT NAME*&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="DEPT_NAMETextBox" runat="server" Text='<%# Bind("DEPT_NAME") %>' />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DEPT_NAMETextBox" ErrorMessage="Department name is required*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary ml-3" OnClick="InsertButton_Click1" Width="86px" />
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
                <br />
                &nbsp;
            </InsertItemTemplate>
            <InsertRowStyle HorizontalAlign="Left" VerticalAlign="Top" />
            <ItemTemplate>
                <br />
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Department" CssClass="btn btn-primary" Font-Size="Large" Height="42px" Width="272px" style="margin-left: 0px" />
            </ItemTemplate>
            <PagerSettings Position="Top" />
            <PagerStyle HorizontalAlign="Left" VerticalAlign="Top" />
        </asp:FormView>
    </div>

</asp:Content>
