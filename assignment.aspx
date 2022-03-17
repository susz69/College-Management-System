<%@ Page Title="" Language="C#" MasterPageFile="~/app.Master" AutoEventWireup="true" CodeBehind="assignment.aspx.cs" Inherits="abccollege.assignment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" runat="server">
    <h3 style="margin-top: 10px"><b>ASSIGNMENT DETAILS</b></h3>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" DeleteCommand="DELETE FROM &quot;ASSIGNMENT&quot; WHERE &quot;ASSIGNMENT_ID&quot; = :ASSIGNMENT_ID" InsertCommand="INSERT INTO &quot;ASSIGNMENT&quot; (&quot;ASSIGNMENT_ID&quot;, &quot;ASSIGNMENT_TYPE&quot;) VALUES (:ASSIGNMENT_ID, :ASSIGNMENT_TYPE)" ProviderName="System.Data.OracleClient" SelectCommand="SELECT * FROM &quot;ASSIGNMENT&quot;" UpdateCommand="UPDATE &quot;ASSIGNMENT&quot; SET &quot;ASSIGNMENT_TYPE&quot; = :ASSIGNMENT_TYPE WHERE &quot;ASSIGNMENT_ID&quot; = :ASSIGNMENT_ID">
        <DeleteParameters>
            <asp:Parameter Name="ASSIGNMENT_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ASSIGNMENT_ID" Type="String" />
            <asp:Parameter Name="ASSIGNMENT_TYPE" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ASSIGNMENT_TYPE" Type="String" />
            <asp:Parameter Name="ASSIGNMENT_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="row-view" style="margin-top:-35rem">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ASSIGNMENT_ID" DataSourceID="SqlDataSource1" Width="886px" CellPadding="5" Height="332px">
            <Columns>
                <asp:BoundField DataField="ASSIGNMENT_ID" HeaderText="ASSIGNMENT_ID" ReadOnly="True" SortExpression="ASSIGNMENT_ID" />
                <asp:BoundField DataField="ASSIGNMENT_TYPE" HeaderText="ASSIGNMENT_TYPE" SortExpression="ASSIGNMENT_TYPE" />
                <asp:CommandField ShowEditButton="True">
                    <ControlStyle CssClass="btn btn-primary" ForeColor="White" Width="72px" />
                </asp:CommandField>
                <asp:ButtonField CommandName="Delete" Text="Delete">
                    <ControlStyle CssClass="btn btn-danger" ForeColor="White" />
                </asp:ButtonField>
            </Columns>
            <HeaderStyle BackColor="#3A3636" ForeColor="White" />
            <PagerStyle BackColor="#3A3636" ForeColor="White" HorizontalAlign="Center" />
        </asp:GridView>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ASSIGNMENT_ID" DataSourceID="SqlDataSource1" HeaderText="ADD NEW ASSIGNMENT TYPE" Width="466px">
            <EditItemTemplate>
                ASSIGNMENT_ID:
            <asp:Label ID="ASSIGNMENT_IDLabel1" runat="server" Text='<%# Eval("ASSIGNMENT_ID") %>' />
                <br />
                ASSIGNMENT_TYPE:
            <asp:TextBox ID="ASSIGNMENT_TYPETextBox" runat="server" Text='<%# Bind("ASSIGNMENT_TYPE") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <HeaderStyle Font-Bold="True" Font-Size="Large" />
            <InsertItemTemplate>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ASSIGNMENT ID*&nbsp;&nbsp;
            <asp:TextBox ID="ASSIGNMENT_IDTextBox" runat="server" Text='<%# Bind("ASSIGNMENT_ID") %>' />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:CustomValidator ID="pkVal" runat="server" ControlToValidate="ASSIGNMENT_IDTextBox" ErrorMessage="Assignment ID already exists!" ForeColor="#CC3300" OnServerValidate="pkVal_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
                <br />
                &nbsp;&nbsp; ASSIGNMENT TYPE*&nbsp;&nbsp;
            <asp:TextBox ID="ASSIGNMENT_TYPETextBox" runat="server" Text='<%# Bind("ASSIGNMENT_TYPE") %>' />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ASSIGNMENT_TYPETextBox" ErrorMessage="Please enter assignment type*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" Style="margin-left: 20px" />
            </InsertItemTemplate>
            <ItemTemplate>
                <br />
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Assignment" CssClass="btn btn-primary" Width="191px" />
            </ItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>
