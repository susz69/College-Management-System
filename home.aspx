<%@ Page Title="" Language="C#" MasterPageFile="~/app.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="abccollege.home" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <h2 style="margin-top: 10px;"><b>DASHBOARD</b></h2>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" DeleteCommand="DELETE FROM &quot;ADDRESS&quot; WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID" InsertCommand="INSERT INTO &quot;ADDRESS&quot; (&quot;ADDRESS_ID&quot;, &quot;ADDRESS&quot;, &quot;PHONE_NUMBER&quot;) VALUES (:ADDRESS_ID, :ADDRESS, :PHONE_NUMBER)" ProviderName="System.Data.OracleClient" SelectCommand="SELECT COUNT(STUDENT_ID) AS EXPR1 FROM STUDENT" UpdateCommand="UPDATE &quot;ADDRESS&quot; SET &quot;ADDRESS&quot; = :ADDRESS, &quot;PHONE_NUMBER&quot; = :PHONE_NUMBER WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID">
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

    <div class="dash">
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="20" CellSpacing="20" CssClass="st" DataSourceID="SqlDataSource1" GridLines="Horizontal" Width="256px">
            <Fields>
                <asp:BoundField DataField="EXPR1" HeaderText="NO. OF STUDENTS" SortExpression="EXPR1"></asp:BoundField>
            </Fields>
            <HeaderStyle BorderStyle="Double" CssClass="ml-5" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" ProviderName="System.Data.OracleClient" SelectCommand="SELECT COUNT(TEACHER_ID) AS EXPR1 FROM TEACHER"></asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" CellPadding="20" CellSpacing="20" CssClass="st" DataSourceID="SqlDataSource2" GridLines="Horizontal" Width="256px">
            <Fields>
                <asp:BoundField DataField="EXPR1" HeaderText="NO. OF TEACHERS" SortExpression="EXPR1"></asp:BoundField>
            </Fields>
            <HeaderStyle BorderStyle="Double" CssClass="ml-5" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" ProviderName="System.Data.OracleClient" SelectCommand="SELECT COUNT(DEPT_ID) AS EXPR1 FROM DEPARTMENT"></asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" CellPadding="20" CellSpacing="20" CssClass="st" DataSourceID="SqlDataSource3" GridLines="Horizontal" Width="256px">
            <Fields>
                <asp:BoundField DataField="EXPR1" HeaderText="TOTAL DEPARTMENTS" SortExpression="EXPR1"></asp:BoundField>
            </Fields>
            <HeaderStyle BorderStyle="Double" CssClass="ml-5" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" ProviderName="System.Data.OracleClient" SelectCommand="SELECT COUNT(PAYMENT_ID) AS EXPR1 FROM PAYMENT"></asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" CellPadding="20" CellSpacing="20" CssClass="st" DataSourceID="SqlDataSource4" GridLines="Horizontal" Width="256px">
            <Fields>
                <asp:BoundField DataField="EXPR1" HeaderText="TOTAL PAYMENTS" SortExpression="EXPR1"></asp:BoundField>
            </Fields>
            <HeaderStyle BorderStyle="Double" CssClass="ml-5" />
        </asp:DetailsView>
    </div>

    <div class="row-col">
        <div class="col-view">
            <h4><b>STUDENT FEES COLLECTED/DATE</b></h4>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" ProviderName="System.Data.OracleClient" SelectCommand="SELECT PAYMENT_DATE, AMOUNT FROM PAYMENT"></asp:SqlDataSource>
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource5" Width="689px" Height="336px" Palette="Bright">
                <Series>
                    <asp:Series Name="Amount" XValueMember="PAYMENT_DATE" YValueMembers="AMOUNT" YValuesPerPoint="4">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>
        <div class="col-view">
            <h4><b>NO. MODULES TAUGHT BY TEACHER</b></h4>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=abc;Password=susz;Unicode=True" ProviderName="System.Data.OracleClient" SelectCommand="SELECT PERSON.NAME, TEACHER.TEACHER_ID, COUNT(TEACHER_MODULE.MODULE_CODE) AS &quot;COUNT&quot; FROM TEACHER, TEACHER_MODULE, PERSON WHERE TEACHER.TEACHER_ID = TEACHER_MODULE.TEACHER_ID AND TEACHER.TEACHER_ID = PERSON.PERSON_ID GROUP BY PERSON.NAME, TEACHER.TEACHER_ID"></asp:SqlDataSource>
            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource6" Width="428px" Height="336px" Palette="EarthTones">
                <Series>
                    <asp:Series Name="Series1" XValueMember="NAME" YValueMembers="COUNT" YValuesPerPoint="4">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>
    </div>
</asp:Content>
