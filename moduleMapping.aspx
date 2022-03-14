<%@ Page Title="" Language="C#" MasterPageFile="~/app.Master" AutoEventWireup="true" CodeBehind="moduleMapping.aspx.cs" Inherits="abccollege.moduleMapping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="bootstrap/js/bootstrap.js"></script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" runat="server">
    <h3 style="margin-top: 10px"><b>TEACHER MODULE MAPPING</b></h3>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" ProviderName="System.Data.OracleClient" SelectCommand="SELECT TEACHER.TEACHER_ID, PERSON.NAME FROM PERSON, TEACHER WHERE PERSON.PERSON_ID = TEACHER.TEACHER_ID"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" ProviderName="System.Data.OracleClient" SelectCommand="SELECT TEACHER.TEACHER_ID, PERSON.NAME, TEACHER.EMAIL, ADDRESS.PHONE_NUMBER FROM TEACHER, PERSON, PERSON_ADDRESS, ADDRESS WHERE TEACHER.TEACHER_ID = PERSON.PERSON_ID AND PERSON.PERSON_ID = PERSON_ADDRESS.PERSON_ID AND PERSON_ADDRESS.ADDRESS_ID = ADDRESS.ADDRESS_ID AND (PERSON_ADDRESS.PERSON_ID = :TEACHER_ID)">
        <FilterParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="Select Teacher" Name="TEACHER_ID" PropertyName="SelectedValue" />
        </FilterParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="TEACHER_ID" PropertyName="SelectedValue" DefaultValue="" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div class="row-view" style="margin-top: -200px;">
        
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="917px" Height="101px" HorizontalAlign="Center" DataKeyNames="TEACHER_ID" CellPadding="5">
        <Columns>
            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
            <asp:BoundField DataField="PHONE_NUMBER" HeaderText="PHONE_NUMBER" SortExpression="PHONE_NUMBER" />
            <asp:BoundField DataField="TEACHER_ID" HeaderText="TEACHER_ID" SortExpression="TEACHER_ID" ReadOnly="True" />
        </Columns>
        <EditRowStyle ForeColor="White" />
        <HeaderStyle BackColor="#3A3636" ForeColor="White" />
    </asp:GridView>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="SELECT TEACHER" Font-Size="Large"></asp:Label>
            <br />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="NAME" DataValueField="TEACHER_ID" Width="224px" CssClass="mx-0" Height="32px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Font-Size="Large">
            </asp:DropDownList>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" ProviderName="System.Data.OracleClient" SelectCommand="SELECT TEACHER_MODULE.MODULE_CODE, &quot;MODULE&quot;.MODULE_NAME, &quot;MODULE&quot;.CREDIT_HOURS, TEACHER_MODULE.TEACHER_ID FROM &quot;MODULE&quot;, TEACHER_MODULE WHERE &quot;MODULE&quot;.MODULE_CODE = TEACHER_MODULE.MODULE_CODE AND (TEACHER_MODULE.TEACHER_ID = :TEACHER_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="TEACHER_ID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Height="101px" Width="1220px" EmptyDataText="No module found for selected teacher." CellPadding="5">
        <Columns>
            <asp:BoundField DataField="MODULE_CODE" HeaderText="MODULE_CODE" SortExpression="MODULE_CODE" />
            <asp:BoundField DataField="MODULE_NAME" HeaderText="MODULE_NAME" SortExpression="MODULE_NAME" />
            <asp:BoundField DataField="CREDIT_HOURS" HeaderText="CREDIT_HOURS" SortExpression="CREDIT_HOURS" />
        </Columns>
        <EmptyDataRowStyle BorderStyle="None" Font-Size="XX-Large" />
        <HeaderStyle BackColor="#3A3636" ForeColor="White" />
    </asp:GridView>
</asp:Content>
