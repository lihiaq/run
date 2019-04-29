<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editGame.aspx.cs" Inherits="_Default" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link href="styles/runTlmStyleSheet.css" rel="stylesheet" />
    <!-- script -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script src="scripts/jquery-1.12.0.min.js"></script>
    <script src="scripts/JavaScript.js"></script>

    <link rel="shortcut icon" type="image/x-icon" href="icons/images/favicon.png" />



    <link href="bootstrap/css/bootstrap-reboot.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap-grid.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <!-- Latest compiled JavaScript -->
    <script src="bootstrap/js/bootstrap.js"></script>
    <title>רוץ בטל"מ | עריכת משחק</title>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <!--תפריט ניווט -->
            <nav class="slidemenu">
                <!-- Item 0  לוגו רוץ בטלמ-->
                <asp:ImageButton ID="runTLMLogo" runat="server" ImageUrl="~/icons/images/logo.png" float="right" />
                <!-- Item 1 -->
                <input type="radio" name="slideItem" id="slide-item-1" class="slide-toggle" value="1" />
                <label for="slide-item-1"></label>
                <a href="index.html" class="navLabel DictionaryText" dictionaryvalue="game"></a>
                <!-- Item 2 -->
                <input type="radio" name="slideItem" id="slide-item-2" class="slide-toggle" value="2" checked="checked" />
                <label for="slide-item-2"></label>
                <a href="myGames.aspx" class="navLabel DictionaryText" style="opacity: 1; text-decoration: underline;" dictionaryvalue="Editor"></a>
                <!-- Item 3 -->
                <input data-toggle="modal" data-target="#howToPlayModal" type="radio" name="slideItem" id="slide-item-3" class="slide-toggle" value="3" />
                <label for="slide-item-3" class="navLabel DictionaryText" dictionaryvalue="HowToPlay"></label>

                <!-- Item 4 -->
                <input data-toggle="modal" data-target="#aboutModal" type="radio" name="slideItem" id="slide-item-4" class="slide-toggle" value="4" />
                <label for="slide-item-4" class="navLabel DictionaryText" dictionaryvalue="About"></label>
                <!-- Item 5 -->
                <input type="radio" name="slideItem" id="slide-item-5" class="slide-toggle" value="5" />
                <a href="GamesRep.aspx" class="navLabel DictionaryText" dictionaryvalue="GamesRep"></a>
                <!-- Item 6 -->
                <input type="radio" name="slideItem" id="slide-item-6" class="slide-toggle" value="6" />
                <label for="slide-item-5" class="navLabel DictionaryText">
                    <a id="SwitchLangToEn" href="#">English</a>
                    <a id="SwitchLangToHe" href="#">עברית</a></label>
                <!-- Bar -->
                <div class="slider">
                    <div class="nabBar"></div>
                </div>
            </nav>

        </header>

        <%--About--%>



        <!-- odot_ Modal -->
        <div class="modal fade" id="aboutModal" tabindex="-1" role="dialog" aria-labelledby="aboutModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="border-bottom: none !important;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body text-center">
                        <h1 class="titleDesign DictionaryText" dictionaryvalue="About"></h1>
                        <h1 class="titleDesign DictionaryText" dictionaryvalue="RunTLM" style="font-size: 26pt;"></h1>
                        <p class="DictionaryText" dictionaryvalue="SpecAndDevelopment" style="font-size: 18pt; font-weight: bold;">
                            <span class="DictionaryText" dictionaryvalue="NoyAndLihi" style="font-style: italic;"></span>
                        </p>
                        <p class="DictionaryText" dictionaryvalue="finalProject" style="font-weight: bold;"></p>
                        <%--                    <p  class="DictionaryText"dictionaryvalue="finalProject" style="font-weight: bold;">סביבות לימוד אינטראקטיביות 2 + תכנות 2 + תכנות אינטראקטיבי 2  תשע"ח </p>--%>
                        <img src="../icons/images/HITlogo.PNG" id="logoHIT" />
                        <br />
                        <a class="DictionaryText" dictionaryvalue="faculty" target="_blank" href="http://www.hit.ac.il/telem/overview" style="font-weight: bold; font-size: 13pt;"></a>
                        <br />
                        <p class="DictionaryText" dictionaryvalue="HIT" style="font-weight: bold; font-size: 13pt;"></p>
                        <br />
                    </div>
                </div>
            </div>
        </div>

        <!-- how to play Modal -->
        <div class="modal fade" id="howToPlayModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header" style="border-bottom: none !important;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="//www.youtube.com/embed/YE7VzlLtp-4"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--        <asp:Panel CssClass="PopUpPanelOdot" ID="Panel1" runat="server" Style="visibility: hidden;">
            <div runat="server" id="Div1">
                <h1 class="titleDesign DictionaryText" dictionaryvalue="About"></h1>
                <h1 class="titleDesign DictionaryText" dictionaryvalue="RunTLM" style="font-size: 26pt;"></h1>
                <p class="DictionaryText" dictionaryvalue="SpecAndDevelopment" style="font-size: 18pt; font-weight: bold;">
                    <span class="DictionaryText" dictionaryvalue="NoyAndLihi" style="font-style: italic;"></span>
                </p>
                <p class="DictionaryText" dictionaryvalue="finalProject" style="font-weight: bold;"></p>
                <br />
                <a class="DictionaryText" dictionaryvalue="faculty" target="_blank" href="http://www.hit.ac.il/telem/overview" style="font-weight: bold; font-size: 13pt;"></a>
                <p class="DictionaryText" dictionaryvalue="HIT" style="margin-left: 43px; font-weight: bold; font-size: 13pt;"></p>
                <div id="logoHIT"></div>
                <a href="https://icons8.com" style="margin-left: 50px;">Icon pack by Icons8</a>

                <div id="exitOdot" onclick="exitOdotEdit()" class="exitBtn"></div>
            </div>

        </asp:Panel>--%>
        <%--How to play--%>
        <%--        <div id="Iframediv" style="visibility: hidden; margin-left: -44px; margin-top: 102px;">
            <div id="exitHowToPlay" onclick="exitHowToEdit()" class="exitBtn"></div>
            <iframe id="HowToWindow" width="560" height="315" style="top: 137px; z-index: 1; right: 595px; visibility: hidden; position: absolute;"
                src="https://www.youtube.com/embed/DDEQ_K_Xy9c"></iframe>
        </div>--%>






        <!--page title -->
        <div class="row" id="topEditGame">
            <div class="col-12" style="margin-top: 60px;">

                <asp:Label ID="pageTitle" class="DictionaryText" dictionaryvalue="editGame" runat="server"></asp:Label>
                <!--condisions for publishing -->
                <asp:Label ID="tnaySafLabel" runat="server" dictionaryvalue="condisions" Class="DictionaryText titleDesign"></asp:Label>
                <asp:Label ID="firstTnay" runat="server" dictionaryvalue="condision1" CssClass="xTnayBackgroundImage DictionaryText"></asp:Label>
                <asp:Label ID="secondTnay" runat="server" dictionaryvalue="condision2" CssClass="xTnayBackgroundImage"></asp:Label>
                <asp:Label ID="thirdTnay" runat="server" dictionaryvalue="condision3" CssClass="xTnayBackgroundImage"></asp:Label>
                <!-- כפתור חזרה למשחקים שלי -->
                <asp:Button ID="submitBtn" OnClick="myGamesBtn" CssClass="buttons blueButtons  DictionaryText" dictionaryvalue="back" runat="server" />
                <div class="tooltip" style="float: left;">
                    <asp:Image ID="btn1" runat="server" ImageUrl="icons/images/i.png" Style="float: left; position: relative; top: 34px;" />
                    <span style="width: 250px; left: 25%; top: 70px; font-size: 16pt;" class="tooltiptext DictionaryText" dictionaryvalue="tooltipBack">אל דאגה, המשחק נשמר לאחר לחיצה על כפתורי הוסף, שמור ומחק.</span>
                </div>
            </div>
        </div>

        <div id="pageContainer">
            <div class="row">
                <div class="col-4">
                    <div id="namesSign" class="row">

                        <div class="col-12">
                            <asp:TextBox ID="addGameTextBox" OnTextChanged="Page_Load" runat="server" CssClass="textBoxInput" Style="margin-top: 20px; font-size: 15pt; text-align: center; font-weight: bold; color: #135C84;"
                                autocomplete="off" onKeyUp=" textCounterFunc(this,'gameNameCounterLabel',20)" onKeyDown="TextCountEditGame()"></asp:TextBox>
                            <span class="textBar"></span>
                            <input runat="server" type="text" id='gameNameCounterLabel' size="3" maxlength="3" value="0/20" readonly="true" style="position: absolute; right: 285px; top: 44px; border-color: transparent; font-size: 9pt; color: darkgray; font-family: Calibri;" />

                        </div>

                        <div class="col-12">
                            <asp:Label ID="categoryLabel" runat="server" Class="titleDesign DictionaryText" dictionaryvalue="categoryTitle"></asp:Label>
                            <asp:TextBox onKeyDown="TextCountEditGame()" Style="width: 260px; font-size: 11pt;" ID="addCategoryTextBox" runat="server" CssClass="textBoxInput" autocomplete="off" onkeypress="textCounter(this);" onKeyUp=" textCounterFunc(this,'categoryCounterLabel' ,30)"></asp:TextBox>
                            <span class="textBar" style="width: 275px;"></span>
                            <input runat="server" type="text" id='categoryCounterLabel' size="3" maxlength="3" value="0/30" readonly="true" style="position: absolute; right: 285px; top: 44px; border-color: transparent; font-size: 9pt; color: darkgray; font-family: Calibri;" />
                        </div>


                    </div>
                    <div class="row">

                        <div class="col-12">
                            <%--כפתור ששומר את הקטגוריה ואת השם משחק--%>
                            <asp:Button Enabled="false" ID="gameNameCategorySaveBtn" OnClick="gameNameCategorySave" CssClass="disableBtn DictionaryText" dictionaryvalue="save" runat="server" Text="שמור" BorderStyle="None" Style="border-style: None; height: 35px; width: 60px; float: left; font-size: 11pt;" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <asp:Label ID="paritActionLabel" runat="server" Class="titleDesign DictionaryText" dictionaryvalue="add"></asp:Label>
                            <br />
                        </div>

                        <div class="col-4">
                            <!-- כפתור העלאת טקסט -->
                            <asp:Button ID="textBtn" Class="buttons blueButtons" runat="server" Text="A" Height="70px" Width="70px" BorderStyle="None" Style="background-size: 70px 70px; font-size: 50px; float: right;" OnClick="addText_Click" />
                        </div>

                        <div class="col-4">
                            <asp:Label ID="orLabel" runat="server" Class="titleDesign DictionaryText" dictionaryvalue="Or" Style="float: right; padding: 30px;"></asp:Label>
                        </div>

                        <!-- כפתור העלאת תמונה -->
                        <div class="col-4">

                            <asp:Button ID="picBtn" Class="buttons blueButtons picClass " runat="server" Height="70px" Width="70px" BorderStyle="None" Style="background-size: 70px 70px; float: right; margin-right: -5px;" OnClientClick="uploadPicture(); return false;" />
                            <%-- פקד מוסתר על מנת להעביר משתנה סוג הפריט, במקרה הזה תמונה,  מג'אוה סקריפט אל סי שארפ--%>
                            <input id="picTypeHidden" type="hidden" runat="server" />
                            <asp:FileUpload ID="imageUpload" runat="server" />
                        </div>

                    </div>
                    <%--<asp:FileUpload ID="picBtn" Class="buttons blueButtons picClass " runat="server" Height="70px" Width="70px" BorderStyle="None" Style="background-size: 70px 70px; float: right; margin-right: -5px;" OnClick="imageUpload_Click" />--%>

                    <!-- צינור -->
                    <div class="row" id="tubeDiv">

                        <div class="col-12 align-self-center" >
                            <%-- תיבת הטקסט על גבי הצינור--%>
                            <asp:TextBox ID="paritText" runat="server" Visible="false" onKeyUp="textCounterFunc(this,'paritTextCounterLabel' ,20),itemTextCount()" CssClass="textBoxInput DictionaryText" OnTextChanged="Page_Load" autocomplete="off"></asp:TextBox>
                            <span class="textBar" style="width: 241px; position: absolute;"></span>
                            <br />
                            <input runat="server" type="text" id='paritTextCounterLabel' visible="false" size="3" maxlength="3" value="0/20" readonly="true" />
                            <asp:Image ID="uploadedImage" runat="server" CssClass="hiddenUploadedImage" />

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 ">

                            <%-- בחירת פריט נכון או לא נכון --%>
                            <asp:RadioButtonList ID="paritStatusRadio" runat="server" CssClass="paritStatusRadio" RepeatDirection="Horizontal">
                                <asp:ListItem runat="server" ID="good" Value="good" Selected="true">
                                </asp:ListItem>
                                <asp:ListItem runat="server" ID="notGood" Value="notGood"></asp:ListItem>
                            </asp:RadioButtonList>

                         

                            <asp:Button ID="addParitBtn" Enabled="false" CssClass=" disableBtn DictionaryText" dictionaryvalue="addItem" runat="server" Text="הוסף" Height="43" Width="80" BorderStyle="None" Style="float: right; font-size: 14pt;"
                                OnClick="addParit_Click" />

                            <%--כפתור שמירת פריט--%>
                            <asp:Button ID="saveParitBtn" Visible="false" CssClass=" buttons blueButtons  DictionaryText" dictionaryvalue="save" runat="server" Text="שמור" Height="43" Width="80" BorderStyle="None" Style="float: right; font-size: 14pt;"
                                OnClick="saveParitBtn_Click" />

                            <%--כפתור מחיקת פריט--%>
                            <asp:Button ID="deleteParitBtn" Visible="false" CssClass=" buttons redButtons DictionaryText" dictionaryvalue="delete" runat="server" Text="מחק" Height="43" Width="80" BorderStyle="None" Style="float: right; font-size: 14pt;"
                                OnClick="deleteParitBtn_Click" />
                        </div>
                    </div>

                </div>



                <div class="col-8 ">
                    <div class="row no-gutters">
                        <asp:Label ID="sumParit" runat="server" Class="titleDesign DictionaryText" dictionaryvalue="totalItems"></asp:Label>
                    </div>

                    <div class="row no-gutters">
                        <div class="col-6 text-center tableTh">
                            <asp:Label ID="correctTotal" CssClass="DictionaryText" runat="server"></asp:Label>
                            <asp:Label ID="IDtotalcorrectItems" CssClass="DictionaryText" dictionaryvalue="totalCorrectItems" runat="server" Text=""></asp:Label>

                        </div>


                        <div class="col-6 text-center tableTh">
                            <asp:Label ID="inCorrectTotal" CssClass="DictionaryText" runat="server"></asp:Label>
                            <asp:Label ID="IDtotalIncorrectItems" CssClass="DictionaryText" dictionaryvalue="totalIncorrectItems" runat="server"></asp:Label>
                        </div>


                    </div>
                    <div class="row no-gutters">

                        <!-- טבלת הפריטים -->
                        <div class="col-6">
                            <div id="paritTableContainer">
                                <div class="paritdiv">
                                    <%--<asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/trees/XMLFile.xml"></asp:XmlDataSource>--%>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"></asp:SqlDataSource>
                                    <asp:GridView ID="goodParits" OnRowDataBound="goodParits_RowDataBound" ShowHeader="False" class="tableParits" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" dir="rtl" Style="border-color: transparent;">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="goodParit1" OnClick="editParitFunc" runat="server" Style="background-repeat: no-repeat; background-size: contain; background-position: center; overflow-wrap: break-word; word-wrap: break-word; font-family: Calibri; white-space: normal; cursor: pointer; height: 50px; width: 88px; border-color: transparent; background-color: transparent; outline: none; color: black; font-size: 9.3pt;"
                                                        Text='<%#Bind("itemText")%>' itemType='<%#Eval("type").ToString()%>' ParitID='<%#Eval("ID").ToString()%>'></asp:Button>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">

                            <div class="paritdiv">
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"></asp:SqlDataSource>
                                <asp:GridView ID="badParits" OnRowDataBound="badParits_RowDataBound" ShowHeader="False" class="tableParits" runat="server" AutoGenerateColumns="False" dir="rtl" DataSourceID="SqlDataSource2" Style="border-color: transparent;">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="badParit1" OnClick="editParitFunc" runat="server" Style="background-repeat: no-repeat; background-size: contain; background-position: center; overflow-wrap: break-word; word-wrap: break-word; font-size: 9.3pt; font-family: Calibri; white-space: normal; cursor: pointer; height: 50px; width: 88px; border-color: transparent; background-color: transparent; outline: none; color: black;"
                                                    Text='<%#Bind("itemText")%>' itemType='<%#Eval("type").ToString()%>' ParitID='<%#Eval("ID").ToString()%>'></asp:Button>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>

        <!-- pop up item changing -->
        <%--        רקע אפור לפופאפים--%>
        <asp:Panel ID="PopUpbackgroundItemChange" CssClass="PopupBackground" runat="server"></asp:Panel>

        <%--      פופ אפ העלאת תמונה--%>
        <asp:Panel ID="blackBackground" CssClass="visibileFalse" runat="server"></asp:Panel>

        <asp:Panel CssClass="visibileFalse" ID="picUploadPop" runat="server" Style="bottom: 65%;">
            <asp:Label runat="server" ID="Label1">
                <h1 class="titleDesign DictionaryText" dictionaryvalue="imageUploadPopupH1"></h1> 
ניתן להעלות  קבצים רק מסוג:
                <br />
                jpeg, jpg png, gif                
            </asp:Label>
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <%--כפתור אישור--%>
            <div>
                <asp:Button ID="okUploadImagePop" Class="buttons blueButtons DictionaryText" dictionaryvalue="OK" runat="server" Text="אישור " Height="55px" Width="95" Style="position: absolute; margin-right: -47px;" />
            </div>
        </asp:Panel>

        <%--      פופ אפ מחיקה--%>

        <asp:Panel CssClass="PopUpPanel" ID="DeleteGamePanel" runat="server" Style="bottom: 65%;">
            <asp:Label runat="server" ID="h1PopUp1Default">
                <h1 class="titleDesign  DictionaryText" dictionaryvalue="deleteItemPopUpH1"></h1> 
                האם ברצונך למחוק את הפריט
                
            </asp:Label>
            <asp:Label ID="gameName" runat="server" Text=""></asp:Label>?
            <br />
            <br />
            <%--כפתורים מחיקה וביטול--%>
            <div>
                <asp:Button ID="DeletePBtn" OnClick="approvedDeleteParit_Click" Class="buttons redButtons DictionaryText" dictionaryvalue="delete" runat="server" Text="מחק" Height="55px" Width="95" Style="position: absolute; margin-right: -100px;" />
            </div>
            <div>
                <asp:Button ID="CancelPDeleteBtn" Class="buttons blueButtons DictionaryText" dictionaryvalue="deleteCencel" runat="server" Text="ביטול " Height="55px" Width="95" Style="position: absolute;" />
            </div>
        </asp:Panel>

    </form>
</body>
</html>
