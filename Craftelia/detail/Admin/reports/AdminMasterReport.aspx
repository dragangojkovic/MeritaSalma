<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.master" AutoEventWireup="true" CodeFile="AdminMasterReport.aspx.cs" Inherits="Admin_reports_AdminMasterReport" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


    <div class="form-div">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="900px" PageCountMode="Actual" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
    <LocalReport ReportPath="Admin\RDLC\Report.rdlc">
        <DataSources>
            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet2" />
            <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DataSet1" />
            <rsweb:ReportDataSource DataSourceId="ObjectDataSource3" Name="DataSet3" />
            <rsweb:ReportDataSource DataSourceId="ObjectDataSource4" Name="DataSet4" />
            <rsweb:ReportDataSource DataSourceId="ObjectDataSource5" Name="DataSet5" />
            <rsweb:ReportDataSource DataSourceId="ObjectDataSource6" Name="DataSet6" />
            <rsweb:ReportDataSource DataSourceId="ObjectDataSource7" Name="DataSet7" />
            <rsweb:ReportDataSource DataSourceId="ObjectDataSource8" Name="DataSet8" />
        </DataSources>
    </LocalReport>
</rsweb:ReportViewer>
</div>

<asp:ObjectDataSource ID="ObjectDataSource8" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AdminAllreportTableAdapters.OrderTableAdapter"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource7" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AdminAllreportTableAdapters.top20productTableAdapter"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource6" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AdminAllreportTableAdapters.SalesTypeTableAdapter"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource5" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AdminAllreportTableAdapters.ProductsTableAdapter"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AdminAllreportTableAdapters.ProductCategoryTableAdapter"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AdminAllreportTableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AdminAllreportTableAdapters.ProfileTypeTableAdapter"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AdminAllreportTableAdapters.ProfileTableAdapter"></asp:ObjectDataSource>
    <br />
    <br />
    
</asp:Content>

