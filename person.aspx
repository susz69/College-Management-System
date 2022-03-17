<%@ Page Title="" Language="C#" MasterPageFile="~/app.Master" AutoEventWireup="true" CodeBehind="person.aspx.cs" Inherits="abccollege.person" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <h3 style="margin-top: 10px;"><b>COLLEGE PERSON DETAILS</b></h3>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" DeleteCommand="DELETE FROM &quot;PERSON&quot; WHERE &quot;PERSON_ID&quot; = :PERSON_ID" InsertCommand="INSERT INTO &quot;PERSON&quot; (&quot;PERSON_ID&quot;, &quot;NAME&quot;, &quot;DEPT_ID&quot;) VALUES (:PERSON_ID, :NAME, :DEPT_ID)" ProviderName="System.Data.OracleClient" SelectCommand="SELECT &quot;PERSON_ID&quot;, &quot;NAME&quot;, &quot;DEPT_ID&quot; FROM &quot;PERSON&quot;" UpdateCommand="UPDATE &quot;PERSON&quot; SET &quot;NAME&quot; = :NAME, &quot;DEPT_ID&quot; = :DEPT_ID WHERE &quot;PERSON_ID&quot; = :PERSON_ID">
        <DeleteParameters>
            <asp:Parameter Name="PERSON_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PERSON_ID" Type="String" />
            <asp:Parameter Name="NAME" Type="String" />
            <asp:Parameter Name="DEPT_ID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NAME" Type="String" />
            <asp:Parameter Name="DEPT_ID" Type="String" />
            <asp:Parameter Name="PERSON_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div class="row-view" style="margin-top:0px;">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PERSON_ID" DataSourceID="SqlDataSource1" Width="854px" BorderStyle="Inset" AllowPaging="True" CellPadding="5" GridLines="None">
        <Columns>
            <asp:BoundField DataField="PERSON_ID" HeaderText="PERSON_ID" ReadOnly="True" SortExpression="PERSON_ID" />
            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
            <asp:BoundField DataField="DEPT_ID" HeaderText="DEPT_ID" SortExpression="DEPT_ID" />
            <asp:CommandField ButtonType="Button" ShowEditButton="True">
            <ControlStyle CssClass="btn btn-primary" ForeColor="White" Width="72px" />
            </asp:CommandField>
            <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Delete">
            <ControlStyle CssClass="btn btn-danger" />
            </asp:ButtonField>
        </Columns>
        <FooterStyle BackColor="#2B2626" BorderStyle="None" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Bottom" />
        <HeaderStyle BackColor="#434245" BorderStyle="Solid" ForeColor="White" />
        <PagerStyle BackColor="#2B2626" ForeColor="White" HorizontalAlign="Center" Width="100px" />
    </asp:GridView>

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="PERSON_ID" DataSourceID="SqlDataSource1" BorderStyle="None" CellSpacing="-1" Height="16px" OnPageIndexChanging="FormView1_PageIndexChanging" Width="678px" HeaderText="ADD NEW PERSON IN COLLEGE RECORD">
        <EditItemTemplate>
            PERSON_ID:
            <asp:Label ID="PERSON_IDLabel1" runat="server" Text='<%# Eval("PERSON_ID") %>' />
            <br />
            NAME:
            <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
            <br />
            DEPT_ID:
            <asp:TextBox ID="DEPT_IDTextBox" runat="server" Text='<%# Bind("DEPT_ID") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <HeaderStyle Font-Bold="True" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Top" Font-Italic="False" Font-Overline="False" Font-Size="Large" />
        <InsertItemTemplate>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PERSON ID*&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="PERSON_IDTextBox" runat="server" Text='<%# Bind("PERSON_ID") %>' CssClass="my-2" Width="201px" />
            &nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:CustomValidator ID="pkVal" runat="server" ControlToValidate="PERSON_IDTextBox" ErrorMessage="Person ID already exists!" ForeColor="#CC3300" OnServerValidate="pkVal_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
            <br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NAME*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' CssClass="my-2" Width="201px" />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NAMETextBox" ErrorMessage="Person name is required*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
            <br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEPT ID*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="DEPT_IDTextBox" runat="server" Text='<%# Bind("DEPT_ID") %>' CssClass="my-2" Width="201px" />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary mx-4" Width="85px" />
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger mx-2" Width="85px" />
            <br />&nbsp;
        </InsertItemTemplate>
        <InsertRowStyle HorizontalAlign="Left" VerticalAlign="Top" />
        <ItemTemplate>
            <br />
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Person" CssClass="btn btn-primary mx" Font-Size="Large" OnClick="NewButton_Click1" Width="272px" style="margin-left: 0px" />
            <br />
        </ItemTemplate>
        <PagerSettings Position="Top" />
        <PagerStyle HorizontalAlign="Left" VerticalAlign="Top" />
    </asp:FormView>
    </div>
    
</asp:Content>
