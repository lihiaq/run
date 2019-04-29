using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.Data;


public partial class _Default : System.Web.UI.Page
{
    SQLClass myDataClass = new SQLClass(); //Syncing to Access


    string imagesLibPath = "uploadedFiles/";     //משתנה לצורך שמירת הנתיב של התקייה אליה יועלו התמונות
    private object paritToedit;

    //*****************************************************טעינת טבלאות הפריטים ואת שמות הקטגוריה ושם המשחק לתוך תיבות הטקסט******************************************************
    protected void Page_init(object sender, EventArgs e)
    {
        if (Session["theItemIdSessions"] == null)        ////במידה ולא נכנסנו מהעמוד הקודם ואין ערך בסשיין הוא יחזור אותנו אחורה

        {
            Response.Redirect("myGames.aspx");
        }

        string GameCode = Session["theItemIdSessions"].ToString();         ////מקבל את מספר המשחק מהעמוד הקודם 

        SqlDataSource1.SelectCommand = "SELECT* FROM items Where game_id = " + GameCode + " and Correct = TRUE";   //connect good parit GridView to Access
        SqlDataSource2.SelectCommand = "SELECT* FROM items Where game_id =  " + GameCode + " and Correct = FALSE";   //connect bad parit GridView to Access
        submitBtn.Enabled = true;        // כפתור שמור יהיה פעיל
        string theItemId = (string)Session["theItemIdSessions"];        //בעת לחיצה על כפתור עריכה בטבלה, שמור את המשתנה של האיידי של השורה

        // ****************Show game name in the sign****************
        string theGameNameTextQuery = "SELECT gameName from games where ID = " + GameCode; //getting the selected gameName QUERY           
        DataSet AllGames = myDataClass.sqlRet(theGameNameTextQuery);                //call to sqlClass
        string myGameNameToTextBox = Server.UrlDecode(AllGames.Tables[0].Rows[0][0].ToString());
        addGameTextBox.Text = Server.UrlDecode(myGameNameToTextBox);//show the game name in the sign
        gameNameCounterLabel.Value = (myGameNameToTextBox.Length).ToString() + "/20";

        // ****************Show game instructions in the sign****************
        string gameInstructionQuery = "SELECT instruction from games where ID = " + GameCode; //getting the selected gameName QUERY           
        DataSet gameInstruction = myDataClass.sqlRet(gameInstructionQuery);                //call to sqlClass
        string myInstruction = Server.UrlDecode(gameInstruction.Tables[0].Rows[0][0].ToString());

        if (myInstruction != null)  //Only when there's instruction show it in text box
        {
            addCategoryTextBox.Text = Server.UrlDecode(myInstruction);
            categoryCounterLabel.Value = (myInstruction.Length).ToString() + "/30";
        }
    }
    //*********************************************************************************** page load  טעינת דף  ******************************************************************************
    protected void Page_Load(object sender, EventArgs e)
    {
        string GameCode = Session["theItemIdSessions"].ToString();

        DeleteGamePanel.Visible = false; //Hide delete Popup alert
        PopUpbackgroundItemChange.Visible = false; // Hide delete Popup alert
        string theItemId = (string)Session["theItemIdSessions"];

        string validationQuery = "SELECT a.Correct, b.Incorrect, c.Total, d.Instr FROM (SELECT Count(*) AS Correct     FROM items     WHERE game_id = " + GameCode + " AND correct=true) AS a,  (SELECT Count(*) AS Incorrect     FROM items     WHERE game_id = 1 AND  correct=false) AS b,   (SELECT Count(*) AS Total     FROM items     WHERE game_id = " + GameCode + ") AS c,    (SELECT  instruction AS Instr    FROM games    WHERE ID= " + GameCode + ") AS d"; //getting the selected gameName QUERY           
        DataSet validationQueryResluts = myDataClass.sqlRet(validationQuery); //call to sqlClass
        int correctItems = Convert.ToInt16(validationQueryResluts.Tables[0].Rows[0][0]); //sum of correct items in game
        int inCorrectItems = Convert.ToInt16(validationQueryResluts.Tables[0].Rows[0][1]); //sum of incorrect items in game
        int allItems = Convert.ToInt16(validationQueryResluts.Tables[0].Rows[0][2]); //sum of all items in game
        string myGameIns = validationQueryResluts.Tables[0].Rows[0][3].ToString(); //game instruction

        if (correctItems >= 5 && inCorrectItems >= 5) //if 5 items correct and 5 items incorrect
        {
            thirdTnay.CssClass = "viBackgroundImage DictionaryText";  //update V design next to the validation
        }
        else
        {
            thirdTnay.CssClass = "xTnayBackgroundImage DictionaryText"; //update X design next to the validation
        }

        if (allItems >= 25) //if atleast 25 items in game
        {
            secondTnay.CssClass = "viBackgroundImage DictionaryText";//update V design next to the validation
        }
        else
        {
            secondTnay.CssClass = "xTnayBackgroundImage DictionaryText"; //update X design next to the validation
        }

        if (string.IsNullOrEmpty(myGameIns)) //if game instruction is empty
        {
            firstTnay.CssClass = "xTnayBackgroundImage DictionaryText"; //update X design next to the validation
        }
        else
        {
            firstTnay.CssClass = "viBackgroundImage DictionaryText";//update V design next to the validation
        }

        //********************Update items table titles with the correct SUM******************** 
        int goodParitCount = goodParits.Rows.Count;
        int badParitCount = badParits.Rows.Count;
        int paritsum = goodParitCount + badParitCount;
        correctTotal.Text = goodParitCount.ToString();
        inCorrectTotal.Text = badParitCount.ToString();

        sumParit.Text = "הכנסת סך הכל " + paritsum + " פריטים";
    }

    //*********************************************************************************** הצגת תמונות בטבלת הפריטים הטובים ****************************************************************************
    protected void goodParits_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button allBtn = e.Row.FindControl("goodParit1") as Button;
            if (allBtn.Attributes["itemType"].ToString() == "p")
            {
                allBtn.Style["background-image"] = "url('" + allBtn.Text + "')";
                allBtn.Text = "";
            }
        }
    }
    //*********************************************************************************** הצגת תמונות בטבלת הפריטים  הלא הטובים ***********************************************************************
    protected void badParits_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button allBtn = e.Row.FindControl("badParit1") as Button;
            if (allBtn.Attributes["itemType"].ToString() == "p")
            {
                allBtn.Style["background-image"] = "url('" + allBtn.Text + "')";
                allBtn.Text = "";
            }
        }
    }
    //******************************************************************כפתור ששומר את השינויים בשם המשחק ובקטגוריה******************************************************************
    protected void gameNameCategorySave(object sender, EventArgs e)
    {
        string theItemId = (string)Session["theItemIdSessions"];
        string newGameName = addGameTextBox.Text;  //Inserting the name from the text box to VAR.
        string newInstrucion = addCategoryTextBox.Text; //Inserting the insturction from the text box to VAR.
        string updateGameNameQuery = "UPDATE games SET gameName ='" + newGameName + "', instruction = '" + newInstrucion + "' WHERE ID =" + theItemId; //update query
        myDataClass.updSql(updateGameNameQuery);
        Page_Load(null, null);
    }
    //****************************************************************************פונקציה לכפתור חזור שמעבירה לדף הקודם******************************************************************

    protected void myGamesBtn(object sender, EventArgs e)
    {
        Response.Redirect("myGames.aspx");
    }
    //***************************************************************************************פונקציה הוספת טקסט*******************************************************************
    protected void addText_Click(object sender, EventArgs e)
    {

        // לחיצה על כפתור טקסט תיצור משתנה סשן עם סוג הפריט
        string myItemType = "t";
        Session["myItemType"] = myItemType;
        deleteParitBtn.Visible = false;
        ((Button)FindControl("addParitBtn")).Attributes.CssStyle.Add("display", "initial");
        //addParitBtn.Visible = true;
        paritActionLabel.Text = "הוספה:";
        paritText.Visible = true;
        saveParitBtn.Visible = false;
        paritTextCounterLabel.Visible = true;
        // ניקוי תיבת הטקסט
        paritText.Text = "";
        //איחתול קאונטר התווים של פריט
        paritTextCounterLabel.Value = "0/20";
        paritText.Focus();

        // איפוס צבע הרקע של כל הפריט שהיה לחוץ
        foreach (GridViewRow row in goodParits.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                Button allBtn = row.FindControl("goodParit1") as Button;
                allBtn.CssClass = "";
            }
        }
    }
    //*****************************************************************************************הוספת פריט חדש*****************************************************************************************
    protected void addParit_Click(object sender, EventArgs e)
    {
        //משתנה של ההמשחק הקיים
        string theItemId = (string)Session["theItemIdSessions"];

        ////משיכת המידע מהרדיו בטן של האם פריט נכון או לא נכון והפיכתו למשתנה של נכון או לא נכון
        string paritStatus = paritStatusRadio.SelectedValue; // ********** NEED TO DELETE THE VALUE AND SEACH BY ID

        if (paritStatus == "good")
        {
            paritStatus = "TRUE";
        }
        else
        {
            paritStatus = "FALSE";
        }

        //*************Incase upload picture*************
        if (picTypeHidden.Value == "p")
        {
            string fileType = imageUpload.PostedFile.ContentType;
            if (fileType.Contains("image")) //בדיקה האם הקובץ שהוכנס הוא תמונה
            {
                // הנתיב המלא של הקובץ עם שמו האמיתי של הקובץ
                string fileName = imageUpload.PostedFile.FileName;
                // הסיומת של הקובץ
                string endOfFileName = fileName.Substring(fileName.LastIndexOf("."));
                //לקיחת הזמן האמיתי למניעת כפילות בתמונות
                string myTime = DateTime.Now.ToString("dd_MM_yy-HH_mm_ss");
                // חיבור השם החדש עם הסיומת של הקובץ
                string imageNewName = myTime + endOfFileName;
                // Bitmap המרת הקובץ שיתקבל למשתנה מסוג
                System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(imageUpload.PostedFile.InputStream);
                //קריאה לפונקציה המקטינה את התמונה
                //אנו שולחים לה את התמונה שלנו בגירסאת הביטמאפ ואת האורך והרוחב שאנו רוצים לתמונה החדשה
                System.Drawing.Image objImage = FixedSize(bmpPostedImage, 250, 120);
                //שמירת הקובץ בגודלו החדש בתיקייה
                objImage.Save(Server.MapPath(imagesLibPath) + imageNewName);
                string imagePath = imagesLibPath + imageNewName;

                //Insert the new pic path to the Data base
                string newItemQuery = "INSERT INTO items (itemText, correct, type, game_id) VALUES('" + imagePath + "', " + paritStatus + ", 'p'," + theItemId + ")";
                myDataClass.updSql(newItemQuery);  //call to sqlClass
                picTypeHidden.Value = "";   //איפוס המשתנה 
                uploadedImage.CssClass = uploadedImage.CssClass.Replace("visibleUploadedImage", "hiddenUploadedImage");
            }
        }

        //*************Incase upload text************
        else
        {
            string myParitText = paritText.Text;
            string newItemQuery = "INSERT INTO items (itemText, correct, type, game_id) VALUES('" + myParitText + "', " + paritStatus + ",'t' ," + theItemId + ")";
            myDataClass.updSql(newItemQuery);  //call to sqlClass
            paritText.Text = "";// ניקוי תיבת הטקסט
            paritText.Visible = false;             //העלמת טקסט בוקס של הוספת טקסט לפריט
            paritTextCounterLabel.Value = "0/20";            //איחתול קאונטר התווים של פריט
            paritTextCounterLabel.Visible = false;            //העלמתו
        }

        goodParits.DataBind();
        badParits.DataBind();
        Page_Load(null, null);
    }

    //**************************************************************************************פונקציה בחירת פריט קיים *******************************************************************************

    protected void editParitFunc(System.Object sender, System.EventArgs e)
    {

        ((Button)FindControl("addParitBtn")).Attributes.CssStyle.Add("display", "none");
        //addParitBtn.Visible = false;
        saveParitBtn.Visible = true;
        deleteParitBtn.Visible = true;
        textBtn.Enabled = false;         //בכל מצב עריכה כפתורי הוספת טקסט או תמונה לא יהיו לחיצים
        picBtn.Enabled = false;
        picBtn.CssClass = "grayImageBtn";
        textBtn.CssClass = "disableBtn";
        paritActionLabel.Text = "עריכה:";

        Button btn = (Button)sender;        //מציאת הפריט (שורה) הספציפי עליו לחצו
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;         //Get the row that contains this button
        foreach (GridViewRow row in goodParits.Rows)        // איפוס צבע הרקע של כל הפריט שהיה לחוץ
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                Button allBtn = row.FindControl("goodParit1") as Button;
                allBtn.CssClass = "";
            }
        }
        foreach (GridViewRow row in badParits.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                Button allBtn = row.FindControl("badParit1") as Button;
                allBtn.CssClass = "";
            }
        }

        ((Button)sender).CssClass = "activeItem";

        string ParitID = ((Button)sender).Attributes["ParitID"]; //Find the ID of the selected item
        string myItemQuery = "SELECT type, itemText, correct FROM items where id=" + ParitID; //getting the selected item QUERY           
        DataSet myItemResult = myDataClass.sqlRet(myItemQuery);                //call to sqlClass
        string myParitTypeVar = myItemResult.Tables[0].Rows[0][0].ToString(); //item type
        string myParitName = myItemResult.Tables[0].Rows[0][1].ToString(); // item Text
        string myParitCorrect = myItemResult.Tables[0].Rows[0][2].ToString(); // correct or incorrect
        Session["sessionParitID"] = ParitID;
        Session["sessionMyParitTypeVar"] = myParitTypeVar;

        if (myParitCorrect == "True")

        {
            paritStatusRadio.Items.FindByText("good").Selected = true;
        }
        else
        {
            paritStatusRadio.Items.FindByText("notGood").Selected = true;
        }

        // אם סוג הפריט הוא מסוג טקסט
        if (myParitTypeVar == "t")
        {
            uploadedImage.CssClass = uploadedImage.CssClass.Replace("visibleUploadedImage", "hiddenUploadedImage");
            //הצגת תיבת הטקסט 
            paritText.Visible = true;
            paritText.Focus();
            paritTextCounterLabel.Visible = true;                //הצגת הקאונטר
            paritText.Text = Server.UrlDecode(myParitName);                //הצגתו בתיבת הטקסט       
            paritTextCounterLabel.Value = (paritText.Text.Length).ToString() + "/20";     //עדכון קאונטר
        }

        //הפריט הוא תמונה
        else
        {
            uploadedImage.CssClass = uploadedImage.CssClass.Replace("hiddenUploadedImage", "visibleUploadedImage");
            paritText.Visible = false;
            paritTextCounterLabel.Visible = false;
            uploadedImage.ImageUrl = myParitName;
        }
    }

    //***************************************************************NEED TO DELETE LINES ABOVE*********************************************************************
    //((Button)FindControl("addParitBtn")).Attributes.CssStyle.Add("display", "none");
    ////addParitBtn.Visible = false;
    //saveParitBtn.Visible = true;
    //deleteParitBtn.Visible = true;

    ////בכל מצב עריכה כפתורי הוספת טקסט או תמונה לא יהיו לחיצים
    //textBtn.Enabled = false;
    //picBtn.Enabled = false;
    //picBtn.CssClass = "grayImageBtn";
    //textBtn.CssClass = "disableBtn";


    //paritActionLabel.Text = "עריכה:";
    ////מציאת הפריט (שורה) הספציפי עליו לחצו
    //Button btn = (Button)sender;
    ////Get the row that contains this button
    //GridViewRow gvr = (GridViewRow)btn.NamingContainer;
    //// איפוס צבע הרקע של כל הפריט שהיה לחוץ
    //foreach (GridViewRow row in goodParits.Rows)
    //{
    //    if (row.RowType == DataControlRowType.DataRow)
    //    {
    //        Button allBtn = row.FindControl("goodParit1") as Button;
    //        allBtn.CssClass = "";

    //    }
    //}

    //foreach (GridViewRow row in badParits.Rows)
    //{
    //    if (row.RowType == DataControlRowType.DataRow)
    //    {
    //        Button allBtn = row.FindControl("badParit1") as Button;
    //        allBtn.CssClass = "";

    //    }
    //}

    //((Button)sender).CssClass = "activeItem";
    ////ממציאת האיידי של הגריד ויו שנלחץ
    //string myParitHeader = gvr.Parent.Parent.ID.ToString();
    //Session["myGridViewID"] = myParitHeader;
    ////מספר הפריט שעליו לחצו
    //int myAnswerId = Convert.ToInt16(gvr.RowIndex);
    //Session["sessionAnsweId"] = myAnswerId;
    //string theItemId = (string)Session["theItemIdSessions"];
    //XmlDocument myDoc = new XmlDocument();
    //myDoc.Load(MapPath("/trees/XMLFile.xml"));

    ////יצירת נתיב
    //XmlNode myParitToEdit;
    //// בדיקה האם הפריט משתייך לגריד של הפריטים הטובים או של לא טובים
    //if (myParitHeader == "badParits")   //פריט לא טוב
    //{
    //    //הזנת הנתיב
    //    myParitToEdit = myDoc.SelectNodes("/RunTLM/userName/game[@gameCode=" + theItemId + "]/answer[@correct='false']").Item(myAnswerId);

    //    //עדכון רשימת הרדיו בטן לפי סוג הפריט
    //    paritStatusRadio.Items.FindByText("פריט לא נכון").Selected = true;
    //    XmlNode myParitType = myDoc.SelectNodes("/RunTLM/userName/game[@gameCode=" + theItemId + "]/answer[@correct='false']/@type").Item(myAnswerId);
    //    // שמירת סוג הפריט במשתנה
    //    string myPatitTypeVar = myParitType.InnerText;
    //    // אם סוג הפריט הוא מסוג טקסט
    //    if (myPatitTypeVar == "t")
    //    {

    //        uploadedImage.CssClass = uploadedImage.CssClass.Replace("visibleUploadedImage", "hiddenUploadedImage");

    //        //הצגת תיבת הטקסט 
    //        paritText.Visible = true;
    //        paritText.Focus();
    //        //הצגת הקאונטר
    //        paritTextCounterLabel.Visible = true;
    //        //שמירת הטקסט שבתוך נתיב האקסמל
    //        string myParitTextToTextBox = myParitToEdit.InnerXml;
    //        //הצגתו בתיבת הטקסט
    //        paritText.Text = Server.UrlDecode(myParitTextToTextBox);
    //        //עדכון קאונטר
    //        paritTextCounterLabel.Value = (paritText.Text.Length).ToString() + "/20";
    //    }


    //    //הפריט הוא תמונה
    //    else
    //    {
    //        uploadedImage.CssClass = uploadedImage.CssClass.Replace("hiddenUploadedImage", "visibleUploadedImage");     
    //        paritText.Visible = false;
    //        paritTextCounterLabel.Visible = false;
    //        uploadedImage.ImageUrl = myParitToEdit.InnerXml;

    //    }
    //}
    //else  //פריט טוב
    //{
    //    //הזנת הנתיב
    //    myParitToEdit = myDoc.SelectNodes("/RunTLM/userName/game[@gameCode=" + theItemId + "]/answer[@correct='true']").Item(myAnswerId);
    //    //עדכון רשימת הרדיו בטן לפי סוג הפריט
    //    paritStatusRadio.Items.FindByText("פריט לא נכון").Selected = false;
    //    paritStatusRadio.Items.FindByText("פריט נכון").Selected = true;

    //    // בדיקת סוג הפריט כדי להפוך את הכפתור הנגדי לבלתי לחיץ
    //    XmlNode myParitType = myDoc.SelectNodes("/RunTLM/userName/game[@gameCode=" + theItemId + "]/answer[@correct='true']/@type").Item(myAnswerId);
    //    // שמירת סוג הפריט במשתנה
    //    string myPatitTypeVar = myParitType.InnerText;
    //    // אם סוג הפריט הוא מסוג טקסט
    //    if (myPatitTypeVar == "t")
    //    {
    //        paritText.Focus();
    //        uploadedImage.CssClass = uploadedImage.CssClass.Replace("visibleUploadedImage", "hiddenUploadedImage");

    //        //הצגת תיבת הטקסט 
    //        paritText.Visible = true;
    //        //הצגת הקאונטר
    //        paritTextCounterLabel.Visible = true;
    //        //שמירת הטקסט שבתוך נתיב האקסמל
    //        string myParitTextToTextBox = myParitToEdit.InnerXml;
    //        //הצגתו בתיבת הטקסט
    //        paritText.Text = Server.UrlDecode(myParitTextToTextBox);
    //        //עדכון קאונטר
    //        paritTextCounterLabel.Value = (paritText.Text.Length).ToString() + "/20";
    //    }
    //    //הפריט הוא תמונה
    //    else
    //    {
    //        uploadedImage.CssClass = uploadedImage.CssClass.Replace("hiddenUploadedImage", "visibleUploadedImage");
    //        paritText.Visible = false;
    //        paritTextCounterLabel.Visible = false;
    //        uploadedImage.ImageUrl = myParitToEdit.InnerXml;
    //    }
    //    Session["myParitType"] = myPatitTypeVar;
    //}


    //*****************************************************************************פונקציה שמירת פריט לאחר עריכה**************************************************************************
    protected void saveParitBtn_Click(System.Object sender, System.EventArgs e)
    {

        //משתנה של ההמשחק הקיים
        string paritID = (string)Session["sessionParitID"];
        string myParitType = (string)Session["sessionMyParitTypeVar"];

        string paritStatus = paritStatusRadio.SelectedValue; // ********** NEED TO DELETE THE VALUE AND SEACH BY ID
        if (paritStatus == "good")
        {
            paritStatus = "TRUE";
        }
        else
        {
            paritStatus = "FALSE";
        }

        if (myParitType == "t")
        {
            string newParitText = paritText.Text;  //Inserting text from the text box to VAR.
            string updateGameTextQuery = "UPDATE items SET itemText ='" + newParitText + "', correct = " + paritStatus + "  WHERE ID =" + paritID; //update query
            myDataClass.updSql(updateGameTextQuery);
            Page_Load(null, null);
        }
        else
        {
            string updateGameTextQuery = "UPDATE items SET correct = " + paritStatus + "  WHERE ID =" + paritID; //update query
            myDataClass.updSql(updateGameTextQuery);
            Page_Load(null, null);
        }


        //הסתרת כפתור שמירה והצגת כפתור הוסף
        saveParitBtn.Visible = false;
        ((Button)FindControl("addParitBtn")).Attributes.CssStyle.Add("display", "initial");
        //addParitBtn.Visible = true;

        // ניקוי תיבת הטקסט והעלמת הפריטים הרלוונטים
        paritText.Text = "";
        paritText.Visible = false;
        paritTextCounterLabel.Visible = false;
        deleteParitBtn.Visible = false;
        paritActionLabel.Text = "הוספה:";
        //הצגת הכפתורים של הוספת טקסט ותמונה כפעילים
        uploadedImage.CssClass = uploadedImage.CssClass.Replace("visibleUploadedImage", "hiddenUploadedImage");
        textBtn.CssClass = textBtn.CssClass.Replace("disableBtn", "buttons blueButtons");
        picBtn.CssClass = picBtn.CssClass.Replace("grayImageBtn", "buttons blueButtons picClass");

        picBtn.Enabled = true;
        textBtn.Enabled = true;
        uploadedImage.ImageUrl = "";

        goodParits.DataBind();
        badParits.DataBind();
        Page_Load(null, null);
    }
    //***************************************************************************** אישור שאפשר לעלות רק קבצים מסוג תמונה **************************************************************************
    protected void okUploadImagePop_Click(object sender, EventArgs e)
    {
        picUploadPop.CssClass = picUploadPop.CssClass.Replace("visibleTrue PopUpPanel", "visibleFalse");
        blackBackground.CssClass = blackBackground.CssClass.Replace("visibleTrue PopupBackground", "visibleFalse");
    }

    //*****************************************************************************פונקציה כפתור מחק פריט ראשון**************************************************************************
    protected void deleteParitBtn_Click(object sender, EventArgs e)
    {
        PopUpbackgroundItemChange.Visible = true;
        DeleteGamePanel.Visible = true;
    }

    //*****************************************************************************פונקציה מחיקת פריט לאחר אישור**************************************************************************
    protected void approvedDeleteParit_Click(object sender, EventArgs e)
    {

        string paritID = (string)Session["sessionParitID"];

        string deleteItemQuery = "DELETE FROM items WHERE ID = " + paritID; //Delete game query
        myDataClass.updSql(deleteItemQuery);
        goodParits.DataBind();
        badParits.DataBind();
        Page_Load(null, null);

        PopUpbackgroundItemChange.Visible = false;
        DeleteGamePanel.Visible = false;
        //הסתרת כפתור שמירה והצגת כפתור הוסף
        saveParitBtn.Visible = false;
        ((Button)FindControl("addParitBtn")).Attributes.CssStyle.Add("display", "initial");
        //addParitBtn.Visible = true;


        // ניקוי תיבת הטקסט והעלמת הפריטים הרלוונטים
        paritText.Text = "";
        paritText.Visible = false;
        paritTextCounterLabel.Visible = false;
        deleteParitBtn.Visible = false;
        //הצגת הכפתורים של הוספת טקסט ותמונה כפעילים
        uploadedImage.CssClass = uploadedImage.CssClass.Replace("visibleUploadedImage", "hiddenUploadedImage");
        picBtn.CssClass = picBtn.CssClass.Replace("grayImageBtn", "buttons blueButtons picClass");
        textBtn.CssClass = textBtn.CssClass.Replace("disableBtn", "buttons blueButtons");
        picBtn.Enabled = true;
        textBtn.Enabled = true;
        Page_Load(null, null);

    }
    //*****************************************************************************פונקציה הוספת תמונה**************************************************************************


    // פונקציה המקבלת את התמונה שהועלתה , האורך והרוחב שאנו רוצים לתמונה ומחזירה את התמונה המוקטנת
    static System.Drawing.Image FixedSize(System.Drawing.Image imgPhoto, int Width, int Height)
    {

        int sourceWidth = Convert.ToInt32(imgPhoto.Width);
        int sourceHeight = Convert.ToInt32(imgPhoto.Height);

        int sourceX = 0;
        int sourceY = 0;
        int destX = 0;
        int destY = 0;

        float nPercent = 0;
        float nPercentW = 0;
        float nPercentH = 0;

        nPercentW = ((float)Width / (float)sourceWidth);
        nPercentH = ((float)Height / (float)sourceHeight);
        if (nPercentH < nPercentW)
        {
            nPercent = nPercentH;
            destX = System.Convert.ToInt16((Width -
                          (sourceWidth * nPercent)) / 2);
        }
        else
        {
            nPercent = nPercentW;
            destY = System.Convert.ToInt16((Height -
                          (sourceHeight * nPercent)) / 2);
        }

        int destWidth = (int)(sourceWidth * nPercent);
        int destHeight = (int)(sourceHeight * nPercent);

        System.Drawing.Bitmap bmPhoto = new System.Drawing.Bitmap(Width, Height,
                          PixelFormat.Format24bppRgb);
        bmPhoto.SetResolution(imgPhoto.HorizontalResolution,
                         imgPhoto.VerticalResolution);

        System.Drawing.Graphics grPhoto = System.Drawing.Graphics.FromImage(bmPhoto);
        grPhoto.Clear(System.Drawing.Color.White);
        grPhoto.InterpolationMode =
                InterpolationMode.HighQualityBicubic;

        grPhoto.DrawImage(imgPhoto,
            new System.Drawing.Rectangle(destX, destY, destWidth, destHeight),
            new System.Drawing.Rectangle(sourceX, sourceY, sourceWidth, sourceHeight),
            System.Drawing.GraphicsUnit.Pixel);


        grPhoto.Dispose();
        return bmPhoto;
    }


}



