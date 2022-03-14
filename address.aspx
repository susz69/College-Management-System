<%@ Page Title="" Language="C#" MasterPageFile="~/app.Master" AutoEventWireup="true" CodeBehind="address.aspx.cs" Inherits="abccollege.address" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" runat="server">
    <h3 style="margin-top: 10px;"><b>PERSON ADDRESS DETAILS</b></h3>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" DeleteCommand="DELETE FROM &quot;ADDRESS&quot; WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID" InsertCommand="INSERT INTO &quot;ADDRESS&quot; (&quot;ADDRESS_ID&quot;, &quot;ADDRESS&quot;, &quot;PHONE_NUMBER&quot;) VALUES (:ADDRESS_ID, :ADDRESS, :PHONE_NUMBER)" ProviderName="System.Data.OracleClient" SelectCommand="SELECT * FROM &quot;ADDRESS&quot;" UpdateCommand="UPDATE &quot;ADDRESS&quot; SET &quot;ADDRESS&quot; = :ADDRESS, &quot;PHONE_NUMBER&quot; = :PHONE_NUMBER WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID">
        <DeleteParameters>
            <asp:Parameter Name="ADDRESS_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ADDRESS_ID" Type="String" />
            <asp:Parameter Name="ADDRESS" Type="String" />
            <asp:Parameter Name="PHONE_NUMBER" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ADDRESS" Type="String" />
            <asp:Parameter Name="PHONE_NUMBER" Type="Decimal" />
            <asp:Parameter Name="ADDRESS_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" DeleteCommand="DELETE FROM &quot;PERSON_ADDRESS&quot; WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID AND &quot;PERSON_ID&quot; = :PERSON_ID" InsertCommand="INSERT INTO &quot;PERSON_ADDRESS&quot; (&quot;ADDRESS_ID&quot;, &quot;PERSON_ID&quot;) VALUES (:ADDRESS_ID, :PERSON_ID)" ProviderName="System.Data.OracleClient" SelectCommand="SELECT * FROM &quot;PERSON_ADDRESS&quot;">
        <DeleteParameters>
            <asp:Parameter Name="ADDRESS_ID" Type="String" />
            <asp:Parameter Name="PERSON_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ADDRESS_ID" Type="String" />
            <asp:Parameter Name="PERSON_ID" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <div class="row-view" style="margin-top:40px">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1" Width="762px" Height="183px" PageSize="7">
            <Columns>
                <asp:BoundField DataField="ADDRESS_ID" HeaderText="ADDRESS_ID" ReadOnly="True" SortExpression="ADDRESS_ID" />
                <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
                <asp:BoundField DataField="PHONE_NUMBER" HeaderText="PHONE_NUMBER" SortExpression="PHONE_NUMBER" />
                <asp:CommandField ShowEditButton="True" >
                <ControlStyle CssClass="btn btn-primary" ForeColor="White" Width="72px" />
                <ItemStyle Wrap="False" />
                </asp:CommandField>
                <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Delete">
                <ControlStyle CssClass="btn btn-danger" ForeColor="White" />
                </asp:ButtonField>
            </Columns>
            <HeaderStyle BackColor="#3A3636" ForeColor="White" />
            <PagerStyle BackColor="#3A3636" ForeColor="White" HorizontalAlign="Center" />
        </asp:GridView>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1" HeaderText="ADD NEW ADDRESS">
            <EditItemTemplate>
                ADDRESS_ID:
            <asp:Label ID="ADDRESS_IDLabel1" runat="server" Text='<%# Eval("ADDRESS_ID") %>' />
                <br />
                ADDRESS:
            <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
                <br />
                PHONE_NUMBER:
            <asp:TextBox ID="PHONE_NUMBERTextBox" runat="server" Text='<%# Bind("PHONE_NUMBER") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <HeaderStyle Font-Bold="True" Font-Size="Large" />
            <InsertItemTemplate>
                &nbsp;<br />ADDRESS ID*&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="ADDRESS_IDTextBox" runat="server" Text='<%# Bind("ADDRESS_ID") %>' />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:CustomValidator ID="pkVal" runat="server" ControlToValidate="ADDRESS_IDTextBox" ErrorMessage="Address ID already exists!" ForeColor="#CC3300" OnServerValidate="pkVal_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ADDRESS*&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ADDRESSTextBox" ErrorMessage="Please enter address*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                <br />
                &nbsp;&nbsp;&nbsp; PHONE NO.&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="PHONE_NUMBERTextBox" runat="server" Text='<%# Bind("PHONE_NUMBER") %>' />
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" Style="margin-left: 0px" Width="70px" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" Style="margin-left: 17px" />
            </InsertItemTemplate>
            <ItemTemplate>
                <br />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Address" CssClass="btn btn-primary" Style="margin-left: 0px" Width="139px" />
            </ItemTemplate>
        </asp:FormView>
    </div>

    <div class="row-view">
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ADDRESS_ID,PERSON_ID" DataSourceID="SqlDataSource2" Height="342px" Width="543px" PageSize="7">
            <Columns>
                <asp:BoundField DataField="ADDRESS_ID" HeaderText="ADDRESS_ID" ReadOnly="True" SortExpression="ADDRESS_ID" />
                <asp:BoundField DataField="PERSON_ID" HeaderText="PERSON_ID" ReadOnly="True" SortExpression="PERSON_ID" />
                <asp:CommandField ShowDeleteButton="True">
                    <ControlStyle CssClass="btn btn-danger" ForeColor="White" />
                </asp:CommandField>
            </Columns>
            <HeaderStyle BackColor="#3A3636" ForeColor="White" />
            <PagerStyle BackColor="#3A3636" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:FormView ID="FormView2" runat="server" DataKeyNames="ADDRESS_ID,PERSON_ID" DataSourceID="SqlDataSource2" HeaderText="ADD ADDRESS FOR AN EXISTING PERSON">
            <EditItemTemplate>
                ADDRESS_ID:
            <asp:Label ID="ADDRESS_IDLabel1" runat="server" Text='<%# Eval("ADDRESS_ID") %>' />
                <br />
                PERSON_ID:
            <asp:Label ID="PERSON_IDLabel1" runat="server" Text='<%# Eval("PERSON_ID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <HeaderStyle Font-Italic="False" Font-Bold="True" Font-Size="Large" />
            <InsertItemTemplate>
                <br />
                ADDRESS ID*&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="ADDRESS_IDTextBox" runat="server" Text='<%# Bind("ADDRESS_ID") %>' />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ADDRESS_IDTextBox" ErrorMessage="Please enter Address  ID*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                &nbsp; PERSON ID*&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="PERSON_IDTextBox" runat="server" Text='<%# Bind("PERSON_ID") %>' />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PERSON_IDTextBox" ErrorMessage="Please enter Person ID*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" Style="margin-left: 0px" Width="75px" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" Style="margin-left: 19px" />
            </InsertItemTemplate>
            <ItemTemplate>
                <br />
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Person Address" CssClass="btn btn-primary" Style="margin-left: 0px" Width="224px" />
            </ItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>
