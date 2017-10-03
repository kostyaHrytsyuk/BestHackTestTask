<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NewsAgg._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="max-height: 350px; overflow:auto">
        <asp:XmlDataSource ID="NYTimes" runat="server" DataFile="http://rss.nytimes.com/services/xml/rss/nyt/Technology.xml" XPath="rss"></asp:XmlDataSource>
        <asp:XmlDataSource ID="LifehackerSourse" runat="server" DataFile="https://lifehacker.com/rss" XPath="rss"></asp:XmlDataSource>
        <br />
        <br />
        <asp:ListView ID="ListView1" runat="server" >
            <LayoutTemplate>
                <ul>
                    <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>  
                </ul>
            </LayoutTemplate>
            <ItemTemplate>
                <li>
                    <a href="<%#Eval("link") %>"><%#Eval("title") %></a>
                </li>
                <br />
            </ItemTemplate>
        </asp:ListView>  
    </div>

</asp:Content>
