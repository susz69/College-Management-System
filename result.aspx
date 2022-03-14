<%@ Page Title="" Language="C#" MasterPageFile="~/app.Master" AutoEventWireup="true" CodeBehind="result.aspx.cs" Inherits="abccollege.result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <h3 style="margin-top: 10px"><b>STUDENT RESULT DETAILS</b></h3>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" ProviderName="System.Data.OracleClient" SelectCommand="SELECT STUDENT.STUDENT_ID, PERSON.NAME FROM STUDENT, PERSON WHERE STUDENT.STUDENT_ID = PERSON.PERSON_ID"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" ProviderName="System.Data.OracleClient" SelectCommand="SELECT STUDENT.STUDENT_ID, PERSON.NAME, ADDRESS.PHONE_NUMBER FROM STUDENT, PERSON, PERSON_ADDRESS, ADDRESS WHERE STUDENT.STUDENT_ID = PERSON.PERSON_ID AND PERSON.PERSON_ID = PERSON_ADDRESS.PERSON_ID AND PERSON_ADDRESS.ADDRESS_ID = ADDRESS.ADDRESS_ID AND (STUDENT.STUDENT_ID = :STUDENT_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="STUDENT_ID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div class="row-view" style="margin-top:-200px;">
       
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource3" Width="935px" CellPadding="10">
            <Columns>
                <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                <asp:BoundField DataField="PHONE_NUMBER" HeaderText="PHONE_NUMBER" SortExpression="PHONE_NUMBER" />
            </Columns>
            <EmptyDataRowStyle Font-Bold="True" Font-Size="XX-Large" />
            <HeaderStyle BackColor="#3A3636" ForeColor="White" />
        </asp:GridView> 
        &nbsp;
        &nbsp;
        &nbsp;
        &nbsp;
        &nbsp;
        &nbsp;
        <div>
            <asp:Label ID="Label1" runat="server" Text="SELECT STUDENT" Font-Bold="True" Font-Size="Large"></asp:Label><br />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="NAME" DataValueField="STUDENT_ID" Width="224px" Height="32px" Font-Size="Large">
            </asp:DropDownList>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" ProviderName="System.Data.OracleClient" SelectCommand="SELECT STUDENT_RESULT.MODULE_CODE, STUDENT_RESULT.STUDENT_ID, STUDENT_RESULT.ASSIGNMENT_ID, STUDENT_RESULT.GRADE, &quot;MODULE&quot;.MODULE_NAME, ASSIGNMENT.ASSIGNMENT_TYPE, REMARK.STATUS FROM STUDENT, STUDENT_RESULT, &quot;MODULE&quot;, ASSIGNMENT, REMARK WHERE STUDENT.STUDENT_ID = STUDENT_RESULT.STUDENT_ID AND STUDENT_RESULT.MODULE_CODE = &quot;MODULE&quot;.MODULE_CODE AND STUDENT_RESULT.ASSIGNMENT_ID = ASSIGNMENT.ASSIGNMENT_ID AND STUDENT_RESULT.GRADE = REMARK.GRADE AND (STUDENT_RESULT.STUDENT_ID = :STUDENT_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="STUDENT_ID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ASSIGNMENT_TYPE" DataSourceID="SqlDataSource4" EmptyDataText="NO RESULTS FOUND" Width="1219px">
        <Columns>
            <asp:BoundField DataField="MODULE_CODE" HeaderText="MODULE_CODE" SortExpression="MODULE_CODE" />
            <asp:BoundField DataField="MODULE_NAME" HeaderText="MODULE_NAME" SortExpression="MODULE_NAME" />
            <asp:BoundField DataField="ASSIGNMENT_TYPE" HeaderText="ASSIGNMENT_TYPE" ReadOnly="True" SortExpression="ASSIGNMENT_TYPE" />
            <asp:BoundField DataField="GRADE" HeaderText="GRADE" SortExpression="GRADE" />
            <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
        </Columns>
        <EmptyDataRowStyle Font-Bold="True" Font-Size="X-Large" />
        <HeaderStyle BackColor="#3A3636" ForeColor="White" />
    </asp:GridView>
</asp:Content>
