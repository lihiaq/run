<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myGames.aspx.cs" Inherits="_Default" %>

<!doctype html>
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
    <title>רוץ בטל"מ | המשחקים שלי</title>

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





            <%--About--%>
            <%--  <asp:Panel CssClass="PopUpPanelOdot" ID="odotPanel" runat="server" Style="visibility: hidden;">
                <div runat="server" id="OdotH1">
                    <h1 class="titleDesign DictionaryText" dictionaryvalue="About"></h1>
                    <h1 class="titleDesign DictionaryText" dictionaryvalue="RunTLM" style="font-size: 26pt;"></h1>
                    <p class="DictionaryText" dictionaryvalue="SpecAndDevelopment" style="font-size: 18pt; font-weight: bold;">
                        <span class="DictionaryText" dictionaryvalue="NoyAndLihi" style="font-style: italic;"></span>
                    </p>
                    <p class="DictionaryText" dictionaryvalue="finalProject" style="font-weight: bold;"></p>--%>
            <%--                    <p  class="DictionaryText"dictionaryvalue="finalProject" style="font-weight: bold;">סביבות לימוד אינטראקטיביות 2 + תכנות 2 + תכנות אינטראקטיבי 2  תשע"ח </p>--%>
            <%--    <br />
                    <a class="DictionaryText" dictionaryvalue="faculty" target="_blank" href="http://www.hit.ac.il/telem/overview" style="font-weight: bold; font-size: 13pt;"></a>
                    <p class="DictionaryText" dictionaryvalue="HIT" style="margin-left: 43px; font-weight: bold; font-size: 13pt;"></p>
                    <div id="logoHIT1"></div>
                    <a href="https://icons8.com" style="margin-left: 50px;">Icon pack by Icons8</a>

                    <div id="exitOdot" onclick="exitOdotEdit()" class="exitBtn"></div>
                </div>

            </asp:Panel>--%>
            <%--How to play--%>
            <%--            <div id="Iframediv" style="visibility: hidden; margin-left: -44px; margin-top: 102px;">
                <div id="exitHowToPlay" onclick="exitHowToEdit()" class="exitBtn"></div>
                <iframe id="HowToWindow" width="560" height="315" style="top: 137px; z-index: 1; right: 595px; visibility: hidden; position: absolute;"
                    src="https://www.youtube.com/embed/DDEQ_K_Xy9c"></iframe>
            </div>--%>
        </header>



        <!-- page title -->
        <div class="row">
            <div class="col-12" style="margin-top: 60px;">

                <div id="topMyGames">
                    <asp:Label class="DictionaryText" dictionaryvalue="myGamesTitle" ID="pageTitle" runat="server"></asp:Label>
                </div>
            </div>
        </div>
        <!-- END page title -->





        <div id="pageContainer" class="container">
            <div class="row">
                <div class="col-12">
                    <asp:Label dictionaryvalue="gameNameTextbox" ID="newGameLabel" runat="server" Class="titleDesign DictionaryText"></asp:Label>
                    <asp:TextBox dictionaryvalue="gameNameSample" ID="addNewGame" runat="server" CssClass="textBoxInput DictionaryText" OnTextChanged="Page_Load" autocomplete="off" onKeyUp=" textCounterFunc(this,'gameNameCounterLabel',20) , TextCount(this.ID)"></asp:TextBox>
                    <span class="textBar" style="width: 24%;"></span>

                    <div class="myTooltip" id="gameNameDiv" style="position: relative; display: inline-block; font-family: Calibri; width: 174px; height: 0;">
                        <asp:Button ID="cretateGameBtn" runat="server" dictionaryvalue="createGame" OnClientClick="CreateGameJS();" OnClick="saveGameFunc" CssClass=" disableBtn disableBlueBtn DictionaryText" />
                        <span id="gameNameSpan" dictionaryvalue="newGameTooltip" class="tooltiptext DictionaryText"></span>
                    </div>

                    <input runat="server" type="text" id='gameNameCounterLabel' size="3" maxlength="3" value="0/20" readonly="true" style="border-color: transparent; font-size: 9pt; color: darkgray; font-family: Calibri; float: right;" />
                </div>
            </div>

            <br />
            <div class="row">

                <div class="col-12">

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"></asp:SqlDataSource>

                    <asp:GridView ID="GridViewTable" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand" CellPadding="4" Style="color: #333333; height: 16px; width: 960px; margin: 0 auto; border-color: #189AAF;" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="dictionaryGameName" runat="server" Class="DictionaryText" dictionaryvalue="gameNameTextbox"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="GameName" runat="server" Text='<%#Bind("gameName")%>'> </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="dictionaryGameCode" runat="server" Class="DictionaryText" dictionaryvalue="gameCode"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="GameCode" runat="server" Text='<%#Bind("ID")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="dictionaryEdit" runat="server" Class="DictionaryText" dictionaryvalue="edit"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton Style="outline: none;" CommandName="editGame" ID="editGame" ImageUrl="~/icons/images/edit.png" theItemID='<%#Eval("ID").ToString()%>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="dictionaryDelete" runat="server" Class="DictionaryText" dictionaryvalue="delete"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton Style="outline: none;" CommandName="deleteRow" ID="deleteStudent" ImageUrl="~/icons/images/delete.png" theItemID='<%#Eval("ID").ToString()%>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <div class="myTooltip">
                                        <asp:Label ID="Label1" runat="server" Class="DictionaryText" dictionaryvalue="publish"></asp:Label>
                                        <asp:Image ID="btn1" runat="server" ImageUrl="icons/images/icons8-info-48.png" Style="height: 19px;" />
                                        <span style="width: 250px; font-weight: normal;" class="tooltiptext DictionaryText" dictionaryvalue="publishToolTip"></span>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div id="checkBoxTooltipDIV" class="myTooltip">
                                        <asp:CheckBox ID="ifPass" AutoPostBack="true" OnCheckedChanged="GridView1_SelectedIndexChanged" Checked='<%#Bind("published")%>' theItemID='<%#Eval("ID").ToString()%>' runat="server" Style="font-family: Calibri; width: 200px;" />
                                        <asp:Label ID="tooltipCheckboxSpan" Style="width: 200px;" class="tooltiptext DictionaryText" dictionaryvalue="publishCheckboxToolTip" runat="server" Text="המשחק לא עומד בתנאי הפרסום"></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <div class="myTooltip">
                                        <asp:Label ID="Label1" runat="server" Class="DictionaryText" dictionaryvalue="share"></asp:Label>
                                        <asp:Image ID="btn1" runat="server" ImageUrl="icons/images/icons8-info-48.png" Style="height: 19px;" />
                                        <span style="width: 250px; font-weight: normal;" class="tooltiptext DictionaryText" dictionaryvalue="shareTooltip"></span>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div id="shareCheckBoxTooltipDIV" class="myTooltip">

                                        <asp:CheckBox ID="ifShare" AutoPostBack="true" OnCheckedChanged="GridView1_SelectedIndexChanged" Checked='<%#Bind("share")%>' theItemID='<%#Eval("ID").ToString()%>' runat="server" Style="font-family: Calibri; width: 200px;" />
                                        <asp:Label ID="shareTooltipCheckboxSpan" Style="width: 200px;" class="tooltiptext DictionaryText" dictionaryvalue="shareCheckboxTooltip" runat="server"></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#189AC8" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#189AC8" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Center" CssClass="TableRow" BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#F7F6F3" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                </div>
            </div>

        </div>




        <%--        רקע אפור לפופאפים--%>
        <asp:Panel ID="PopUpbackground" CssClass="PopupBackground" runat="server"></asp:Panel>
        <%--      פופ אפ מחיקה--%>
        <asp:Panel CssClass="PopUpPanel" ID="DeleteGamePanel" runat="server" Style="top: 26px;">
            <asp:Label runat="server" ID="h1PopUp1Default">
                <h1 class="titleDesign DictionaryText" dictionaryvalue="deletePopupH1"></h1>
                                <h2 class=" DictionaryText" dictionaryvalue="deletePopupH2"></h2>

            </asp:Label>
            <asp:Label ID="gameName" runat="server" Text="" Style="font-weight: bold;"></asp:Label>?
            <br />
            <br />
            <%--כפתורים מחיקה וביטול--%>
            <div>
                <asp:Button ID="DeleteGameBtn" Class="buttons redButtons DictionaryText" dictionaryvalue="deleteButton" OnClick="deleteRow" runat="server" />
            </div>
            <div>
                <asp:Button ID="CancelGameDeleteBtn" OnClick="cancelDelete" Class="buttons blueButtons DictionaryText" dictionaryvalue="deleteCencel" runat="server" />
            </div>
        </asp:Panel>
        <br />
        <div>
            <asp:Label CssClass="noGames DictionaryText" dictionaryvalue="noGamesAlert" ID="noGames" runat="server"></asp:Label>
            <asp:Image ID="arrow" runat="server" src="icons/images/arrow.png" Style="position: absolute; right: 22%; top: 43%; z-index: -1;" />
        </div>
        <a href="https://icons8.com" style="visibility: hidden;">Icon pack by Icons8</a>









    </form>
</body>
</html>
