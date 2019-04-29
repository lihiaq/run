<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GamesRep.aspx.cs" Inherits="_Default" %>

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
    <title>רוץ בטל"מ | מאגר משחקים</title>

</head>
<body>
    <form id="form1" runat="server">
        <header>
            <!-- Item 0  לוגו רוץ בטלמ-->
            <asp:ImageButton ID="runTLMLogo" runat="server" ImageUrl="~/icons/images/logo.png" float="right" />
            <!--תפריט ניווט -->
            <nav class="slidemenu">
                <!-- Item 1 -->
                <div class="col-2">
                    <input type="radio" name="slideItem" id="slide-item-1" class="slide-toggle" value="1" />
                    <label for="slide-item-1"></label>
                    <a href="index.html" class="navLabel DictionaryText" dictionaryvalue="game"></a>
                </div>
                <!-- Item 2 -->
                <div class="col-2">
                    <input type="radio" name="slideItem" id="slide-item-2" class="slide-toggle" value="2" />
                    <label for="slide-item-2"></label>
                    <a href="myGames.aspx" class="navLabel DictionaryText" style="opacity: 1; text-decoration: underline;" dictionaryvalue="Editor"></a>
                </div>
                <!-- Item 3 -->
                <div class="col-2">
                    <input data-toggle="modal" data-target="#howToPlayModal" type="radio" name="slideItem" id="slide-item-3" class="slide-toggle" value="3" />
                    <label for="slide-item-3" class="navLabel DictionaryText" dictionaryvalue="HowToPlay"></label>
                </div>
                <!-- Item 4 -->
                <div class="col-2">
                    <input data-toggle="modal" data-target="#aboutModal" type="radio" name="slideItem" id="slide-item-4" class="slide-toggle" value="4" />
                    <label for="slide-item-4" class="navLabel DictionaryText" dictionaryvalue="About"></label>
                </div>
                <!-- Item 5 -->
                <div class="col-2">
                    <input type="radio" name="slideItem" id="slide-item-5" class="slide-toggle" value="5" checked="checked" />
                    <a href="GamesRep.aspx" class="navLabel DictionaryText" dictionaryvalue="GamesRep"></a>
                </div>
                <!-- Item 6 -->
                <div class="col-2">
                    <input type="radio" name="slideItem" id="slide-item-6" class="slide-toggle" value="6" />
                    <label for="slide-item-5" class="navLabel DictionaryText">
                        <a id="SwitchLangToEn" href="#">English</a>
                        <a id="SwitchLangToHe" href="#">עברית</a></label>
                </div>
                <!-- Bar -->
                <div class="slider">
                    <div class="nabBar"></div>
                </div>
            </nav>

            <!-- About Modal -->
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


        </header>


        <!-- page title -->
        <div class="row">
            <div class="col-12" style="margin-top: 60px;">
                <div id="topGamesRep">
                    <asp:Label class="DictionaryText" dictionaryvalue="GamesRep" ID="pageTitle" runat="server"></asp:Label>
                </div>
            </div>
        </div>
        <!-- END page title -->

        <div id="pageContainer" class="container">
            <div class="row">
                <div class="col-12">
                    <asp:TextBox dictionaryvalue="SearchHere" ID="TypeSearch" runat="server" CssClass="textBoxInput DictionaryText" autocomplete="off"></asp:TextBox>
                    <span class="textBar" id="gameRepTextBar"></span>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-12">
                <asp:SqlDataSource ID="SqlDataSourceGamesRep" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"></asp:SqlDataSource>
                <asp:GridView ID="GridViewTableGamesRep" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceGamesRep" CellPadding="4" Style="color: #333333; border-collapse: collapse; color: #333333; height: 16px; width: 70%; border-color: #189AAF; text-align: center; margin-right: 11%;">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="dictionaryGameName" runat="server" Class="DictionaryText " dictionaryvalue="gameNameTextbox"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="GameName" runat="server" Text='<%#Bind("gameName")%>'> </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="dictionaryGameCode" runat="server" Class="DictionaryText " dictionaryvalue="gameCode"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="GameCode" runat="server" Text='<%#Bind("ID")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="Watching" runat="server" Class="DictionaryText " dictionaryvalue="Watching"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:ImageButton Style="outline: none;" ID="Watching" ImageUrl="icons/images/icons8-eye-32.png" theItemID='<%#Eval("ID").ToString()%>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="dictionaryCreator" runat="server" Class="DictionaryText " dictionaryvalue="creator"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="creatorLabel" runat="server" Text='<%#Bind("creator")%>'> </asp:Label>
                                <asp:ImageButton OnClientClick="mailto()" Style="outline: none;" ID="mail" ImageUrl="icons/images/icons8-secured-letter-32.png" theItemID='<%#Eval("ID").ToString()%>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="CopiesHeader" runat="server" Class="DictionaryText" dictionaryvalue="Copies"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Copies" Text='<%#Bind("copies")%>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="CopyGameHeader" runat="server" Class="DictionaryText " dictionaryvalue="CopyGame"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:ImageButton Style="outline: none;" ID="copyGame" ImageUrl="icons/images/icons8-copy-32.png" theItemID='<%#Eval("ID").ToString()%>' runat="server" />

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
    </form>
</body>
</html>
