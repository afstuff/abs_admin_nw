using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CustodianAdmin.Model
{
    public class AdminPermissions
    {
        public virtual int? ADM_REC_ID { get; set; }
        public virtual int ADM_Role_ID { get; set; }
        public virtual string ADM_Menu_Position { get; set; }
        public virtual string ADM_Menu_Name { get; set; }
        public virtual int ADM_Option_Add { get; set; }
        public virtual int ADM_Option_Edit { get; set; }
        public virtual int ADM_Option_Delete { get; set; }
        public virtual int ADM_Option_Print { get; set; }
        public virtual string ADM_FlagID { get; set; }
        public virtual string ADM_OperID { get; set; }
        public virtual DateTime ADM_Keydate { get; set; }
    }
}
