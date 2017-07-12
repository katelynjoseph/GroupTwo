<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="Content/bootstrap.min.css"/>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="Content/bootstrap-theme.min.css"/>
</head>
<body> 
    <form runat="server">
    <div class="jumbotron text-center">
       <h2>Group Two's Email Application </h2> 
    </div>

<div class="container"> 
       <div class="row">
           <div class="col-md-8">
               <div class="panel panel-primary">
                 <div class="panel-heading">Email</div>
                    <div class="panel-body">
                        <asp:DropDownList ID="ddlFrom" runat="server" DataSourceID="dsUser" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
                            <asp:ListItem Selected="True">Select a Sender:</asp:ListItem>
                        </asp:DropDownList>
                        <br /><br />
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsUser" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
                            <asp:ListItem Selected="True">Select a Recipient:</asp:ListItem>
                        </asp:DropDownList>

                        <asp:XmlDataSource runat="server" ID="dsUser" DataFile="~/Data/Users.xml" XPath="Users/User"></asp:XmlDataSource> <br />
                        <br />
                        Enter your email here:
  
                        <asp:TextBox ID="txtEmailBody" runat="server" Width="100%"></asp:TextBox> <br /> <br />
                        <asp:LinkButton runat="server" ID="btnSend" CssClass="btn btn-default pull-right" OnClick="btnSend_Click"><i class="glyphicon-envelope"></i> Send Email</asp:LinkButton>
                    </div>
            </div>
           </div>
           <div class="col-md-4">
               <div class="panel panel-success">
                 <div class="panel-heading">Add Users</div>
                    <div class="panel-body">
                        User's Name: <asp:TextBox ID="txtNewUser" runat="server"></asp:TextBox><br />
                        <asp:LinkButton ID="btnAddUser" CssClass="pull-right" runat="server">+ Add</asp:LinkButton>
                    </div>
            </div>
           </div>
           
       </div>
    
           

    <div class="row"> 
        <div class="col-md-6">
            <div class="panel panel-success">
                 <div class="panel-heading">Sender</div>
                    <div class="panel-body">
                        This is the encrypted text : <asp:Label ID="lblEncrypted" runat="server"></asp:Label>
                    </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-success">
                <div class="panel-heading">Recipient</div>
                    <div class="panel-body">
                        <asp:Button runat="server" ID="btnOpenEmail" Text="Open Email" OnClick="btnOpenEmail_Click" />
                        This is the decrypted text : <asp:Label ID="lblDecrypted" runat="server"></asp:Label>
                    </div>
            </div>
        </div>
    </div>
</div>

 </form>
</body>
    
</html>
