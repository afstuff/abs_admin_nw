using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CustodianAdmin.Model
{
    public class UserDetail
    {
        public virtual int? User_RecId { get; set; }
        public virtual int User_Id { get; set; }
        public virtual string User_Login { get; set; }
        public virtual string User_Name { get; set; }
        public virtual string User_ShortName { get; set; }
        public virtual string User_GroupCode { get; set; }
        public virtual string User_Role { get; set; }
        public virtual string User_Password { get; set; }
        public virtual string User_Branch { get; set; }
        public virtual string User_Phone1 { get; set; }
        public virtual string User_Phone2 { get; set; }
        public virtual string User_Email1 { get; set; }
        public virtual string User_Email2 { get; set; }

        public virtual string User_Tag { get; set; }
        public virtual DateTime User_Last_Pword_change { get; set; }

        public virtual DateTime User_Last_Login_Date { get; set; }

        public virtual string User_FlagID { get; set; }
        public virtual string User_OperID { get; set; }

        public virtual DateTime User_Keydate { get; set; }

    }
}
