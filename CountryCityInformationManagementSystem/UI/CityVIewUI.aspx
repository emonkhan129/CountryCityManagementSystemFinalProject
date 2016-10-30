﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CityVIewUI.aspx.cs" Inherits="CountryCityInformationManagementSystem.UI.CityVIewUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <html lang="en" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>City View Page</title>

    <!-- Bootstrap -->
     <link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
     <link href="../alertifyjs/css/alertify.min.css" rel="stylesheet" />
    <link href="../alertifyjs/css/alertify.rtl.min.css" rel="stylesheet" />
   
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .auto-style1 {
            width: 129px;
        }
    </style>
    <style type="text/css">
        .GridviewDiv {
            font-size: 100%;
            font-family: 'Lucida Grande', 'Lucida Sans Unicode', Verdana, Arial, Helevetica, sans-serif;
            color: #303933;
        }

        .headerstyle {
            color: #FFFFFF;
            border-right-color: #abb079;
            border-bottom-color: #abb079;
            background-color: #df5015;
            padding: 0.5em 0.5em 0.5em 0.5em;
            text-align: center;
        }
         .footer {
   position:fixed;
   left:0px;
   bottom:0px;
   height:30px;
   width:100%;
   background:#999;
}

/* IE 6 */
* html .footer {
   position:absolute;
   top:expression((0-(footer.offsetHeight)+(document.documentElement.clientHeight ? document.documentElement.clientHeight : document.body.clientHeight)+(ignoreMe = document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop))+'px');
}
    </style>
   </head>
<body>
 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Country City Information</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="Home.aspx">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Country <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="CountryEntryUI.aspx">Country Add</a></li>
            <li><a href="CountryViewUI.aspx">Country View</a></li>
          </ul>
        </li>
           <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">City <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="CItyEntryUI.aspx">City Add</a></li>
            <li class="active"><a href="CityVIewUI.aspx">City View</a></li>
          </ul>
        </li>
       </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
    <form id="form1" runat="server">
        <div class="container">
            <div class="col-md-10 col-md-offset-1">
                    <table class="tab-content table table-bordered table-responsive">
                        <tr>
                            <div class="form-group">
                               
                                <td>
                                    <asp:RadioButton ID="cityNameRadioButton" class="form-control" runat="server" Text="City Name" Checked="True" GroupName="oneChoice" />

                                </td>
                                <td>
                                   <asp:TextBox ID="cityNameTextBox" class="form-control" runat="server"></asp:TextBox>
                                </td>
                            </div>
                        </tr>
                         <tr>
                            <div class="form-group">
                                
                                <td>
                                    <asp:RadioButton ID="countryRadioButton" class="form-control" runat="server" Text="Country" GroupName="oneChoice" />

                                </td>
                                <td>
                                    <asp:DropDownList ID="countryDropDownList" class="form-control" runat="server">
                                        <asp:ListItem Text="--Select Country--" Value="0" />
                                    </asp:DropDownList>
                                </td>
                            </div>
                        </tr>
                         <tr>
                            <div class="form-group">
                                
                                <td>
                                    

                                </td>
                                <td>
                                     <asp:Button ID="searchButton" runat="server" class="form-control btn btn-primary" Text="Search" OnClick="searchButton_Click" />
                                <asp:Label ID="messageLabel" runat="server"></asp:Label>

                                </td>
                            </div>
                        </tr>

                    </table>
                                    
                <br />   
                
          <div class="GridviewDiv">
            <asp:GridView runat="server" ID="cityListGridView" AllowPaging="True" AutoGenerateColumns="False" Width="100%" OnPageIndexChanging="gvDetails_PageIndexChanging" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle CssClass="headerstyle" BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <Columns>
                    <asp:TemplateField HeaderText="serial No">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="cityName" HeaderText="City Name" />
                    <asp:TemplateField HeaderText="City About">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("cityAbout") %>'></asp:Label>
                                </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="noOfDwellers" HeaderText="No Of Dwellers" />                  
                    <asp:BoundField DataField="location" HeaderText="Location" />
                    <asp:BoundField DataField="weather" HeaderText="Weather" />
                    <asp:BoundField DataField="countryName" HeaderText="Country" />
                    <asp:TemplateField HeaderText="Country About">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("countryAbout") %>'></asp:Label>
                                </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
              <br />
              <br />
              <br />
              <br />
              <br />
            </div>
            </div>
        </div>
         <div class="footer" style="background-color: black; height: 60px; text-align: center">
          <p style="color: white; padding: 20px" >Copyright @ 2016 Websites</p>
        </div>
    </form>

     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../alertifyjs/alertify.js"></script>
    <script src="../alertifyjs/alertify.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="../Bootstrap/js/bootstrap.min.js"></script>
    
   
    

</body>
</html>
