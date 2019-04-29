using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Web.UI.HtmlControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    SQLClass myDataClass = new SQLClass(); //Syncing to Access

    protected void Page_Init(object sender, EventArgs e)
    {
        SqlDataSourceGamesRep.SelectCommand = "SELECT * FROM games WHERE share = True order by copies DESC";   //connect GridView to Access
        string gamesListQuery = "SELECT COUNT(*) FROM games where share=True";  //QUERY THAT COUNTS HOW MANY SHARED GAMES EXSIST
        DataSet AllGames = myDataClass.sqlRet(gamesListQuery);
        int myGamesNum = Convert.ToInt16(AllGames.Tables[0].Rows[0][0]);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    //protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)     // this function will run with any click on the text boxeS
    //{
    //    // finding the ID of the item in the XML
    //    CheckBox myCheckBox = (CheckBox)sender;
    //    // Attract the item's ID using the manually added attribute to the box
    //    string theId = myCheckBox.Attributes["theItemId"];
    //    //A query to find the game we want to update
    //    string gameToUpdte = "select * from games where ID = " + theId;
    //    DataSet gameToUpdateQuery = myDataClass.sqlRet(gameToUpdte); //call to sqlClass
    //    string gamgToUpdateQueryCheck = gameToUpdateQuery.Tables[0].Rows[0][0].ToString(); //show the data
    //    //Receive the new value of the textbox after a click
    //    bool NewIsPass = myCheckBox.Checked;
    //    //Update the attribute in the DB
    //    string updatePublishAtt = "UPDATE games set published =" + NewIsPass.ToString() + " where ID =" + gamgToUpdateQueryCheck;
    //    myDataClass.updSql(updatePublishAtt);  //call to sqlClass
    //    GridViewTableGamesRep.DataBind();
    //    //ifPublishedCB();
    //}



    //protected void saveGameFunc(object sender, EventArgs e)     //Game creation function
    //{
    //    string newGameName = addNewGame.Text; //Inserting the text from the text box to VAR
    //    //Creating new game UPDATE   query
    //    string ChangeGameNameQuary = "INSERT INTO games (gamename, published, userID, share) VALUES('" + newGameName + "', false, " + UserID + ", false)";
    //    myDataClass.updSql(ChangeGameNameQuary);  //call to sqlClass
    //    GridViewTable.DataBind();        //update the gridview
    //    addNewGame.Text = ""; // clearing text box
    //    gameNameCounterLabel.Value = "0/20";
    //    ifPublishedCB();
    //}



    //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)    // Delete and edit function

    //{
    //    //getting the game ID  where the user clicked
    //    ImageButton imageId = (ImageButton)e.CommandSource;
    //    string theId = imageId.Attributes["theItemID"];
    //    Session["theItemIdSession"] = imageId.Attributes["theItemID"];

    //    switch (e.CommandName)
    //    {
    //        case "deleteRow": //Incase user clicked on delete row (earser)
    //            //Recoloring the selected row 
    //            GridViewRow selectedRow = (GridViewRow)((ImageButton)e.CommandSource).NamingContainer;
    //            int RowIndexx = Convert.ToInt32(selectedRow.RowIndex);
    //            GridViewTable.Rows[RowIndexx].BackColor = System.Drawing.ColorTranslator.FromHtml("#81BEF7");
    //            Session["mySelectToDeleteRow"] = RowIndexx;

    //            //Show delete popUp
    //            DeleteGamePanel.Visible = true;
    //            PopUpbackground.Visible = true;
    //            string theGameNameTextQuery = "SELECT gameName from games where ID = " + theId; //getting the selected gameName QUERY           
    //            DataSet AllGames = myDataClass.sqlRet(theGameNameTextQuery);                //call to sqlClass
    //            gameName.Text = AllGames.Tables[0].Rows[0][0].ToString(); //show the data in delete POPUP window
    //            Session["gameNameToDelete"] = gameName.Text; //saving the game name in session incase with to delete this game
    //            break;

    //        case "editGame": //Incase user clicked on edit row (pencil)
    //            Session["theItemIdSessions"] = imageId.Attributes["theItemId"];
    //            Response.Redirect("editGame.aspx");
    //            break;
    //    }

    //    ifPublishedCB();

    //}

    //protected void cancelDelete(object sender, EventArgs e) //cancel delete func, cancelling the selected line
    //{
    //    int selectDelRow = (int)Session["mySelectToDeleteRow"];
    //    if (selectDelRow % 2 == 0)
    //    {
    //        GridViewTable.Rows[selectDelRow].BackColor = System.Drawing.ColorTranslator.FromHtml("#F7F6F3");
    //    }
    //    else
    //    {
    //        GridViewTable.Rows[selectDelRow].BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
    //    }
    //}
    //protected void editor(object sender, EventArgs e)
    //{
    //    Response.Redirect("login.aspx");
    //}

    //protected void deleteRow(object sender, EventArgs e) //Delete game Func after user clicks on Delete button from delete POPUP alert
    //{
    //    string gameName = (string)Session["gameNameToDelete"]; // the requested game to delete
    //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(" + gameName + ")", true); //alert, can delete later
    //    string deleteGameQuery = "DELETE FROM games WHERE gameName = '" + gameName + "'"; //Delete game query
    //    myDataClass.updSql(deleteGameQuery);
    //    GridViewTable.DataBind();

    //    //Incase user deleted all games
    //    string gamesListQuery = "SELECT COUNT(*)  FROM games where userID = " + UserID;  //QUERY THAT COUNTS HOW MANY GAMES USER CREATED
    //    DataSet AllGames = myDataClass.sqlRet(gamesListQuery);
    //    int myGamesNum = Convert.ToInt16(AllGames.Tables[0].Rows[0][0]);
    //    int Games = myGamesNum;
    //    if (Games == 0)
    //    {
    //        noGames.Visible = true;
    //        arrow.Visible = true;
    //    }
    //    else
    //    {
    //        noGames.Visible = false;
    //        arrow.Visible = false;
    //    }
    //    ifPublishedCB();
    //}
    ////// A function that checks whether the Publish button should be disaible or not
    //protected void ifPublishedCB()
    //{
    //    bool canPublish = false;
    //    foreach (GridViewRow myRow in GridViewTable.Rows)
    //    {
    //        // Take the game ID and count how much games exist in any game
    //        string gameID = ((Label)myRow.FindControl("GameCode")).Text;
    //        string itemListQuery = "SELECT COUNT(*)  FROM items where game_id = " + gameID;  //QUERY THAT COUNTS HOW MANY ITEMS IN A CERTAIN GAME USER CREATED
    //        DataSet AllGames = myDataClass.sqlRet(itemListQuery);
    //        int itemSum = Convert.ToInt16(AllGames.Tables[0].Rows[0][0]);

    //        //check if there are atleast 25 items in a game
    //        if (itemSum >= 25)
    //        {
    //            string correctItemListQuery = "SELECT Count(*) FROM items WHERE game_id =" + gameID + " AND correct = True ";  //QUERY THAT COUNTS HOW MANY CORRECT ITEMS IN A CERTAIN GAME USER CREATED
    //            DataSet correctItems = myDataClass.sqlRet(correctItemListQuery);
    //            int correctItemSum = Convert.ToInt16(correctItems.Tables[0].Rows[0][0]);

    //            //check if there are atleast 5 items in a game are correct
    //            if (correctItemSum >= 5)
    //            {
    //                //check if there are atleast 5 items in a game are wrong
    //                if (itemSum - correctItemSum >= 5)
    //                {
    //                    string instructionQuery = "SELECT instruction FROM games WHERE ID =" + gameID;
    //                    DataSet gameIstruction = myDataClass.sqlRet(instructionQuery);
    //                    string instructionQueryResult = gameIstruction.Tables[0].Rows[0][0].ToString(); ;
    //                    //check if there is an instruction

    //                    if (string.IsNullOrEmpty(instructionQuery))
    //                    {
    //                        canPublish = false;
    //                    }
    //                    else
    //                    {
    //                        canPublish = true;
    //                    }
    //                }
    //            }
    //        }
    //        if (canPublish == false)
    //        {

    //            string updatePublished = "UPDATE games set published = false where ID =" + gameID;
    //            myDataClass.updSql(updatePublished);  //call to sqlClass

    //            CheckBox GamePublishCheck = (CheckBox)myRow.FindControl("ifPass");
    //            GamePublishCheck.Enabled = false;
    //            GamePublishCheck.Checked = false;
    //        }
    //        else
    //        {
    //            CheckBox GamePublishCheck = (CheckBox)myRow.FindControl("ifPass");
    //            Label publishLabel = (Label)myRow.FindControl("tooltipCheckboxSpan");
    //            publishLabel.Style["visibility"] = "hidden";
    //        }
    //        string checkIfShare = "select published,isDuplicated from games where ID = " + gameID;
    //        DataSet checkQuery = myDataClass.sqlRet(checkIfShare);
    //        string checkQueryIsDuplicatedResult = checkQuery.Tables[0].Rows[0][1].ToString(); ;
    //        string checkQueryIsPublishedResult = checkQuery.Tables[0].Rows[0][0].ToString(); ;

    //        if (checkQueryIsDuplicatedResult == "False" && checkQueryIsPublishedResult == "True")
    //        {
    //            Label publishLabel = (Label)myRow.FindControl("shareTooltipCheckboxSpan");
    //            publishLabel.Style["visibility"] = "hidden";
    //        }
    //        else
    //        {
    //            string updateSharing = "UPDATE games set share = false where ID =" + gameID;
    //            myDataClass.updSql(updateSharing);  //call to sqlClass
    //            CheckBox GameShareCheck = (CheckBox)myRow.FindControl("ifShare");
    //            GameShareCheck.Enabled = false;
    //            GameShareCheck.Checked = false;
    //        }
    //        canPublish = false;

    //    }
    //}
}