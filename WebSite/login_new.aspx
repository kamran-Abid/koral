<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login_new.aspx.cs" Inherits="login_new" %>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en">
<!--<![endif]-->

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="css/Login_StyleSheet.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body >

    <form id="form1" runat="server" >

        <div class="card" style="width: 60%; background-color: white;  border-radius: 15px; margin-top: -2%; margin-bottom: -4%; margin-left: 21%;">
             <section class="container" style="display:flex; flex-direction: column;">
            <div class="Bs-img" style="margin-top:-10px;"> <%--bismill009      Bismillah-removebg-preview--%>
                <img src="images/Bismillah-removebg-preview.png" style="display:flex; justify-content: center;width:500px; height:110px; padding-left:12%; margin-top:35px; margin-bottom:3px;"/>
            </div> 
            <div >       
<%--             <h1><span style="color:black; font-size:medium; padding-left:18%"> یٰۤاَیُّهَا الَّذِیْنَ اٰمَنُوْا خُذُوْا حِذْرَكُمْ فَانْفِرُوْا ثُبَاتٍ اَوِ انْفِرُوْا جَمِیْعًا</span></h1>--%>
              <img src="images/ayat003-removebg-preview.png" style="height:95px; width:600px; padding-left:4%; margin-top:-10px" />
            </div>
            <div class="title-text" style="display:flex; justify-content:space-between; align-items: center; ">
                <div>
                    <img src="images/krl-removebg-preview.png" style="height:100px; width:100px;"/>
                </div>
                <h2 style="color:black; font-size: 1.5rem;">HQ SECURITY GROUP KRL</h2>
                <div>
                    <img  src="images/krl-removebg-preview.png" style="height:100px; width:100px;"/>
                </div>
               
            </div>
             <div> 
                    <h2 style="color:black; font-size:1.2rem; padding-left:36%; text-shadow:0 0 black; margin-top:5px;">PACS/VACS</h2>
                </div>
            <div class="login" style="width:600px; margin-top:7px; margin-bottom:25px;" >
<%--                <div style="border-bottom:1px solid #ccc;" ><h1>Access Control Managment System</h1></div>--%>

                    <p>
                        <asp:TextBox  runat="server" id="TxtUserName" Width="500px" placeholder="Username"></asp:TextBox></p>
                    <p>
                        <asp:TextBox  runat="server" TextMode="Password" Width="500px" id="TxtPassword"  placeholder="Password"></asp:TextBox></p>
                    <p class="remember_me">
                        <label>
                            <input type="checkbox" name="remember_me" id="remember_me">
                            Remember me on this computer
                        </label>
                    </p>
                    <p class="submit">
                        <asp:Button ID="BtnLogin" runat="server"  Height="40px" Width="300px" OnClick="btnLogin_Click" Text="Login" />
                    </p>
                 <asp:Label ID="lblErrorMessage" runat="server" Style="color:maroon; font-size: 14px; font-weight: bold;"></asp:Label>
            </div>
        </section>
        </div>  
            
    </form>

</body>
</html>
