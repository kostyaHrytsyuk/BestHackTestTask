<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RssAgg.aspx.cs" Inherits="EmptyBestHack.RssAgg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ListView ID="ListView1" runat="server">
                <Layouttemplate>
                    <ul>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                    </ul>
                </Layouttemplate>
                <itemtemplate>
                    <li>
                        <a href="<%#Eval("link") %>"><%#Eval("title")%></a>
                        <span><%#Eval("PublishDate") %></span>
                    </li>
                    <br />
                </itemtemplate>
            </asp:ListView>
        </div>
    </form>
</body>
</html>
