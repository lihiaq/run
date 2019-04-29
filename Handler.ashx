s<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using Newtonsoft.Json;
using System.Data;
using System.Data.OleDb;
using System.Collections.Generic;


public class Handler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        string gameCode = context.Request["gameCode"]; // חשוב לשים לב שזה אותו שם משתנה כמו באנימייט
        if (gameCode != null)
        {
            //שאילתא למציאת המשחק לפי קוד המשחק
            string myQueryGameD = "select * from games where ID=" + gameCode;
            DataSet GameDit = sqlRet(myQueryGameD);

            //האם המשחק קיים
            if (GameDit.Tables[0].Rows.Count != 0)
            {
                //האם המשחק מפורסם
                if (Convert.ToBoolean(GameDit.Tables[0].Rows[0]["published"]) != false)
                {

                    //יצירת הjson עם פרטי המשחק
                    string jsonGameText = " {\"gameName\" : \"" + GameDit.Tables[0].Rows[0]["gameName"].ToString() + "\","
                                         + " \"instruction\" : \"" + GameDit.Tables[0].Rows[0]["instruction"].ToString() + "\","
                                         + " \"published\" : \"" + GameDit.Tables[0].Rows[0]["published"].ToString() + "\","
                                         + " \"share\" : \"" + GameDit.Tables[0].Rows[0]["share"].ToString() + "\",";

                    //קבלת כל הפריטים של המשחק הרלוונטי
                    string myQuery = "select * from items where game_id=" + GameDit.Tables[0].Rows[0]["ID"];
                    DataSet GameItems = sqlRet(myQuery);

                    //הוספה של הפריטים לJson
                    jsonGameText += "\"items\": " + JsonConvert.SerializeObject(GameItems.Tables[0]) +"}";

                    context.Response.Write(jsonGameText);
                }
                else
                {
                    //במידה ולא מפורסם
                    context.Response.Write("המשחק קיים אך לא מפורסם");
                }
            }
            else
            {
                //במידה והמשחק לא קיים
                context.Response.Write("לא נמצא משחק");
            }
        }
    }

    public DataSet sqlRet(string myQuery)
    {
        string mySource = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + HttpContext.Current.Server.MapPath("/App_Data/myData.accdb") + ";";

        OleDbDataAdapter oda = new OleDbDataAdapter(myQuery, mySource);
        DataSet ds = new DataSet();
        oda.Fill(ds);
        return ds;
    }

    public bool IsReusable
    {
        get
        {
            return true;
        }
    }
}
















