using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace abccollege
{
    public partial class department : System.Web.UI.Page
    {
        List<String> primaryKeys = new List<String>();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void FormView1_PageIndexChanging1(object sender, FormViewPageEventArgs e)
        {

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {

        }

        protected void InsertButton_Click1(object sender, EventArgs e)
        {

        }

        protected void validationPK(object source, ServerValidateEventArgs args)
        {
            for (int j = 0; j < GridView1.Rows.Count; j++)
            {
                primaryKeys.Add(GridView1.Rows[j].Cells[0].Text);
            }
            CustomValidator customValidator = (CustomValidator)FormView1.FindControl("pkVal");
            if (args.Value.Trim().ToString().Length == 0)
            {
                customValidator.ErrorMessage = "Department ID is required*";
                args.IsValid = false;
            }
            foreach (String key in primaryKeys)
            {
                if (args.Value.Trim().ToString().Equals(key))
                {
                    args.IsValid = false;
                    break;
                }
            }
        }
    }
}