<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:ListBox ID="ListBox1" runat="server" Height="102px" Width="96px">
			<asp:ListItem>guig</asp:ListItem>
		</asp:ListBox>
		<asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/trees/XMLFile.xml" XPath="RunTLM/gameName[@gameCode=17]/answer"></asp:XmlDataSource>
		<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1">
			<Columns>
				<asp:TemplateField HeaderText="פריטים נכונים">
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server"  Text='<%#XPathBinder.Eval(Container.DataItem, "../answer").ToString()%>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
    </div>
    </form>
</body>
</html>
