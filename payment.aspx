<%@ Page Title="" Language="C#" MasterPageFile="~/app.Master" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="abccollege.payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
            margin-right: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <h3 style="margin-top: 10px;"><b>STUDENT FEE PAYMENT DETAILS</b></h3>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" ProviderName="System.Data.OracleClient" SelectCommand="SELECT STUDENT.STUDENT_ID, PERSON.NAME FROM STUDENT, PERSON WHERE STUDENT.STUDENT_ID = PERSON.PERSON_ID"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" ProviderName="System.Data.OracleClient" SelectCommand="SELECT STUDENT.STUDENT_ID, PERSON.NAME, ADDRESS.PHONE_NUMBER FROM STUDENT, PERSON, PERSON_ADDRESS, ADDRESS WHERE STUDENT.STUDENT_ID = PERSON.PERSON_ID AND PERSON.PERSON_ID = PERSON_ADDRESS.PERSON_ID AND PERSON_ADDRESS.ADDRESS_ID = ADDRESS.ADDRESS_ID AND (STUDENT.STUDENT_ID = :STUDENT_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="STUDENT_ID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="row-view" style="margin-top: -100px;">
        <div class="row-view-2">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource3" Width="541px" CellPadding="5" BorderStyle="None">
                <Columns>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                    <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                    <asp:BoundField DataField="PHONE_NUMBER" HeaderText="PHONE_NUMBER" SortExpression="PHONE_NUMBER" />
                </Columns>
                <EmptyDataRowStyle Font-Bold="True" Font-Size="XX-Large" />
                <HeaderStyle BackColor="#3A3636" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" ProviderName="System.Data.OracleClient" SelectCommand="SELECT AMOUNT, PAYMENT_DATE, STUDENT_ID FROM PAYMENT WHERE (STUDENT_ID = :STUDENT_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="STUDENT_ID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" AllowPaging="True" AllowSorting="True" CellPadding="5" EmptyDataText="Payment records not found." Width="421px" BorderStyle="None">
                <Columns>
                    <asp:BoundField DataField="AMOUNT" HeaderText="AMOUNT" SortExpression="AMOUNT" />
                    <asp:BoundField DataField="PAYMENT_DATE" HeaderText="PAYMENT_DATE" SortExpression="PAYMENT_DATE" />
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" SortExpression="STUDENT_ID" Visible="False" />
                </Columns>
                <EmptyDataRowStyle Font-Bold="True" Font-Size="X-Large" />
                <HeaderStyle BackColor="#3A3636" ForeColor="White" />
            </asp:GridView>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="SELECT STUDENT" Font-Size="Large"></asp:Label>
            <br />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="NAME" DataValueField="STUDENT_ID" Width="224px" Height="32px" Font-Size="Large">
            </asp:DropDownList>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" DeleteCommand="DELETE FROM &quot;PAYMENT&quot; WHERE &quot;PAYMENT_ID&quot; = :PAYMENT_ID" InsertCommand="INSERT INTO &quot;PAYMENT&quot; (&quot;PAYMENT_ID&quot;, &quot;AMOUNT&quot;, &quot;PAYMENT_DATE&quot;, &quot;DESCRIPTION&quot;, &quot;STUDENT_ID&quot;) VALUES (:PAYMENT_ID, :AMOUNT, :PAYMENT_DATE, :DESCRIPTION, :STUDENT_ID)" ProviderName="System.Data.OracleClient" SelectCommand="SELECT * FROM &quot;PAYMENT&quot;" UpdateCommand="UPDATE &quot;PAYMENT&quot; SET &quot;AMOUNT&quot; = :AMOUNT, &quot;PAYMENT_DATE&quot; = :PAYMENT_DATE, &quot;DESCRIPTION&quot; = :DESCRIPTION, &quot;STUDENT_ID&quot; = :STUDENT_ID WHERE &quot;PAYMENT_ID&quot; = :PAYMENT_ID" OnSelecting="SqlDataSource2_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="PAYMENT_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PAYMENT_ID" Type="String" />
            <asp:Parameter Name="AMOUNT" Type="Decimal" />
            <asp:Parameter Name="PAYMENT_DATE" Type="DateTime" />
            <asp:Parameter Name="DESCRIPTION" Type="String" />
            <asp:Parameter Name="STUDENT_ID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="AMOUNT" Type="Decimal" />
            <asp:Parameter Name="PAYMENT_DATE" Type="DateTime" />
            <asp:Parameter Name="DESCRIPTION" Type="String" />
            <asp:Parameter Name="STUDENT_ID" Type="String" />
            <asp:Parameter Name="PAYMENT_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="row-view">
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PAYMENT_ID" DataSourceID="SqlDataSource2" CellPadding="5" Width="1122px" CssClass="auto-style1">
            <Columns>
                <asp:BoundField DataField="PAYMENT_ID" HeaderText="PAYMENT_ID" ReadOnly="True" SortExpression="PAYMENT_ID" />
                <asp:BoundField DataField="AMOUNT" HeaderText="AMOUNT" SortExpression="AMOUNT" />
                <asp:BoundField DataField="PAYMENT_DATE" HeaderText="PAYMENT_DATE" SortExpression="PAYMENT_DATE" />
                <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION" />
                <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" SortExpression="STUDENT_ID" />
                <asp:CommandField ShowEditButton="True">
                    <ControlStyle CssClass="btn btn-primary" ForeColor="White" Width="72px" />
                    <ItemStyle Wrap="False" />
                </asp:CommandField>
                <asp:ButtonField CommandName="Delete" Text="Delete">
                    <ControlStyle CssClass="btn btn-danger" />
                    <ItemStyle Width="20px" />
                </asp:ButtonField>
            </Columns>
            <HeaderStyle BackColor="#3A3636" ForeColor="White" />
        </asp:GridView>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="PAYMENT_ID" DataSourceID="SqlDataSource2" HeaderText="ADD PAYMENT DETAILS" HorizontalAlign="Center" Width="422px">
            <EditItemTemplate>
                PAYMENT_ID:
            <asp:Label ID="PAYMENT_IDLabel1" runat="server" Text='<%# Eval("PAYMENT_ID") %>' />
                <br />
                AMOUNT:
            <asp:TextBox ID="AMOUNTTextBox" runat="server" Text='<%# Bind("AMOUNT") %>' />
                <br />
                PAYMENT_DATE:
            <asp:TextBox ID="PAYMENT_DATETextBox" runat="server" Text='<%# Bind("PAYMENT_DATE") %>' />
                <br />
                DESCRIPTION:
            <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>' />
                <br />
                STUDENT_ID:
            <asp:TextBox ID="STUDENT_IDTextBox" runat="server" Text='<%# Bind("STUDENT_ID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <HeaderStyle Font-Bold="True" Font-Size="Large" />
            <InsertItemTemplate>
                &nbsp;&nbsp;
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp; PAYMENT ID*&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="PAYMENT_IDTextBox" runat="server" Text='<%# Bind("PAYMENT_ID") %>' Width="136px" />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CustomValidator ID="pkVal" runat="server" ControlToValidate="PAYMENT_IDTextBox" ErrorMessage="Payment ID already exists!" ForeColor="#CC3300" OnServerValidate="pkVal_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMOUNT*&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="AMOUNTTextBox" runat="server" Text='<%# Bind("AMOUNT") %>' Width="136px" TextMode="Number" />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="AMOUNTTextBox" ErrorMessage="Please enter fees amount*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                <br />
                PAYMENT DATE*&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="PAYMENT_DATETextBox" runat="server" Text='<%# Bind("PAYMENT_DATE") %>' Width="136px" TextMode="Date" />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PAYMENT_DATETextBox" ErrorMessage="Please select date*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                <br />
                &nbsp;&nbsp; DESCRIPTION&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>' Width="136px" />
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp; STUDENT ID*&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="STUDENT_IDTextBox" runat="server" Text='<%# Bind("STUDENT_ID") %>' Width="136px" />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="STUDENT_IDTextBox" ErrorMessage="Please enter student_id*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" Width="72px" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" Style="margin-left: 15px" />
            </InsertItemTemplate>
            <ItemTemplate>
                <br />
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="btn btn-primary" Text="Add Payment" Style="margin-left: 0px" Width="158px" />
            </ItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>
