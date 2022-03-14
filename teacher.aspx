<%@ Page Title="" Language="C#" MasterPageFile="~/app.Master" AutoEventWireup="true" CodeBehind="teacher.aspx.cs" Inherits="abccollege.teacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" runat="server">
    <h3 style="margin-top: 10px;"><b>TEACHER DETAILS</b></h3>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" DeleteCommand="DELETE FROM &quot;TEACHER&quot; WHERE &quot;TEACHER_ID&quot; = :TEACHER_ID" InsertCommand="INSERT INTO &quot;TEACHER&quot; (&quot;TEACHER_ID&quot;, &quot;EMAIL&quot;) VALUES (:TEACHER_ID, :EMAIL)" ProviderName="System.Data.OracleClient" SelectCommand="SELECT * FROM &quot;TEACHER&quot;" UpdateCommand="UPDATE &quot;TEACHER&quot; SET &quot;EMAIL&quot; = :EMAIL WHERE &quot;TEACHER_ID&quot; = :TEACHER_ID">
        <DeleteParameters>
            <asp:Parameter Name="TEACHER_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TEACHER_ID" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="TEACHER_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
<div style="margin-top: -20px;">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="1220px" CellPadding="7">
    <Columns>
        <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
        <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
        <asp:BoundField DataField="DEPT_ID" HeaderText="DEPT_ID" SortExpression="DEPT_ID" />
        <asp:BoundField DataField="PERSON_ID" HeaderText="PERSON_ID" SortExpression="PERSON_ID" />
        <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
        <asp:BoundField DataField="PHONE_NUMBER" HeaderText="PHONE_NUMBER" SortExpression="PHONE_NUMBER" />
    </Columns>
    <HeaderStyle BackColor="#2B2626" ForeColor="White" />
    <PagerStyle BackColor="#2B2626" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:GridView>
</div>



<div class="row-view" style="margin-top: -50px;">
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TEACHER_ID" DataSourceID="SqlDataSource2" Width="726px" CellPadding="5">
        <Columns>
            <asp:BoundField DataField="TEACHER_ID" HeaderText="TEACHER_ID" ReadOnly="True" SortExpression="TEACHER_ID" />
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
            <asp:CommandField ShowEditButton="True">
            <ControlStyle CssClass="btn btn-primary" ForeColor="White" Width="72px" />
            </asp:CommandField>
            <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Delete">
            <ControlStyle CssClass="btn btn-danger" ForeColor="White" Width="72px" />
            <ItemStyle Width="50px" />
            </asp:ButtonField>
        </Columns>
        <HeaderStyle BackColor="#2B2626" ForeColor="White" />
        <PagerStyle BackColor="#2B2626" ForeColor="White" HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" ProviderName="System.Data.OracleClient" SelectCommand="SELECT TEACHER.EMAIL, PERSON.NAME, PERSON.DEPT_ID, PERSON_ADDRESS.PERSON_ID, ADDRESS.ADDRESS, ADDRESS.PHONE_NUMBER FROM TEACHER, PERSON, PERSON_ADDRESS, ADDRESS WHERE TEACHER.TEACHER_ID = PERSON.PERSON_ID AND PERSON.PERSON_ID = PERSON_ADDRESS.PERSON_ID AND PERSON_ADDRESS.ADDRESS_ID = ADDRESS.ADDRESS_ID"></asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="TEACHER_ID" DataSourceID="SqlDataSource2" HeaderText="ADD PERSON AS A TEACHER" Width="615px">
        <EditItemTemplate>
            TEACHER_ID:
            <asp:Label ID="TEACHER_IDLabel1" runat="server" Text='<%# Eval("TEACHER_ID") %>' />
            <br />
            EMAIL:
            <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <HeaderStyle Font-Bold="True" Font-Size="Large" />
        <InsertItemTemplate>
            <br />
            &nbsp; TEACHER&nbsp; ID*&nbsp;&nbsp;
            <asp:TextBox ID="TEACHER_IDTextBox" runat="server" Text='<%# Bind("TEACHER_ID") %>' />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:CustomValidator ID="pkVal" runat="server" ControlToValidate="TEACHER_IDTextBox" ErrorMessage="Teacher ID already exists!" ForeColor="#CC3300" OnServerValidate="pkVal_ServerValidate" SetFocusOnError="True" ValidateEmptyText="True"></asp:CustomValidator>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EMAIL&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" Width="72px" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" Width="73px" style="margin-left: 13px" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<br />
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="btn btn-primary" Font-Size="Large" Text="Add Teacher" Width="272px" style="margin-left: 0px" />
        </ItemTemplate>
    </asp:FormView>
</div>
</asp:Content>
