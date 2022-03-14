<%@ Page Title="" Language="C#" MasterPageFile="~/app.Master" AutoEventWireup="true" CodeBehind="student.aspx.cs" Inherits="abccollege.student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <h3 style="margin-top: 10px;"><b>STUDENT DETAILS</b></h3>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" ProviderName="System.Data.OracleClient" SelectCommand="SELECT PERSON_ADDRESS.PERSON_ID, PERSON.NAME, ADDRESS.ADDRESS, ADDRESS.PHONE_NUMBER FROM STUDENT, PERSON, PERSON_ADDRESS, ADDRESS WHERE STUDENT.STUDENT_ID = PERSON.PERSON_ID AND PERSON.PERSON_ID = PERSON_ADDRESS.PERSON_ID AND PERSON_ADDRESS.ADDRESS_ID = ADDRESS.ADDRESS_ID"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" DeleteCommand="DELETE FROM &quot;STUDENT&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID" InsertCommand="INSERT INTO &quot;STUDENT&quot; (&quot;STUDENT_ID&quot;) VALUES (:STUDENT_ID)" ProviderName="System.Data.OracleClient" SelectCommand="SELECT * FROM &quot;STUDENT&quot;">
        <DeleteParameters>
            <asp:Parameter Name="STUDENT_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="STUDENT_ID" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>

    <div style="margin-top: -20px;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="1223px" AllowPaging="True" AllowSorting="True" CellPadding="7" Height="16px">
        <Columns>
            <asp:BoundField DataField="PERSON_ID" HeaderText="PERSON_ID" SortExpression="PERSON_ID" />
            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
            <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
            <asp:BoundField DataField="PHONE_NUMBER" HeaderText="PHONE_NUMBER" SortExpression="PHONE_NUMBER" />
        </Columns>
            <HeaderStyle BackColor="#2B2626" ForeColor="White" />
            <PagerStyle BackColor="#2B2626" ForeColor="White" />
    </asp:GridView>
    </div>

    <div class="row-view" style="margin-top: -50px;">
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource2" Width="536px" CssClass="auto-style1" Height="286px">
            <Columns>
                <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                <asp:CommandField ShowDeleteButton="True" >
                <ControlStyle CssClass="btn btn-danger" Width="72px" />
                <ItemStyle HorizontalAlign="Center" Wrap="False" />
                </asp:CommandField>
            </Columns>
            <HeaderStyle BackColor="#2B2626" ForeColor="White" />
            <PagerStyle BackColor="#2B2626" ForeColor="White" HorizontalAlign="Center" />
        </asp:GridView>
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource2" HeaderText="ADD PERSON AS A STUDENT" OnPageIndexChanging="FormView1_PageIndexChanging" Width="699px">
            <EditItemTemplate>
                STUDENT_ID:
                <asp:Label ID="STUDENT_IDLabel1" runat="server" Text='<%# Eval("STUDENT_ID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <HeaderStyle Font-Size="Large" Font-Bold="True" />
            <InsertItemTemplate>
                <br />
                STUDENT ID*&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="STUDENT_IDTextBox" runat="server" Text='<%# Bind("STUDENT_ID") %>' />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CustomValidator ID="pkVal" runat="server" ControlToValidate="STUDENT_IDTextBox" ErrorMessage="Student ID already exists!" ForeColor="#CC3300" OnServerValidate="pkVal_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" Width="90px" style="margin-left: 0px" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" Width="86px" style="margin-left: 16px" />
            </InsertItemTemplate>
            <ItemTemplate>
                <br />
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" OnClick="NewButton_Click" Text="Add Student" CssClass="btn  btn-primary" Width="272px" style="margin-left: 0px" />
            </ItemTemplate>
        </asp:FormView>
    </div>
    

</asp:Content>
