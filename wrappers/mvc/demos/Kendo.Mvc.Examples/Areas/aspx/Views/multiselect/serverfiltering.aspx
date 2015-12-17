<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="demo-section k-content">
    <h4>Products</h4>
    <%= Html.Kendo().MultiSelect()
          .Name("products")
          .DataTextField("ProductName")
          .DataValueField("ProductID")
          .Filter("contains")
          .Value(new[] { new {ProductName= "Chang", ProductID = 2 }, new { ProductName = "Uncle Bob's Organic Dried Pears", ProductID = 7 } })          
          .DataSource(source => {
              source.Read(read =>
              {
                  read.Action("GetProducts", "Home");
              })
              .ServerFiltering(true);
          })
    %>
</div>
</asp:Content>
