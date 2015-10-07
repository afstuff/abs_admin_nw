using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data;
using System.Data.SqlClient;
using CustodianAdmin.Model;
using CustodianAdmin.Repositories;
using NHibernate;
namespace CustodianAdmin.Data
{
    public class UserDetailRepository
    {
        private static ISession GetSession()
        {
            return SessionProvider.SessionFactory.OpenSession();
        }

        public void Save(UserDetail saveObj)
        {
            using (var session = GetSession())
            {

                using (var trans = session.BeginTransaction())
                {
                    session.FlushMode = FlushMode.Commit;
                    session.SaveOrUpdate(saveObj);
                    trans.Commit();
                    session.Flush();
                    //}
                }
            }
        }

        public void Delete(UserDetail delObj)
        {
            using (var session = GetSession())
            {
                using (var trans = session.BeginTransaction())
                {
                    session.Delete(delObj);
                    trans.Commit();
                }
            }
        }
        public UserDetail GetByLoginName(string _loginName)
        {
            using (var session = GetSession())
            {
                return session.CreateCriteria<UserDetail>().List<UserDetail>().Where(c => c.User_Login == _loginName).FirstOrDefault();

            }
        }

        //public ICriteria GetUsersHelp(string value)
        public IList<UserDetail> GetUsersHelp(string value)
        {

            string hqlOptions = "from UserDetail i where i.User_Name like '%" + value.Trim() + "%'";

            using (var session = GetSession())
            {
                return session.CreateQuery(hqlOptions).List<UserDetail>();
            }
        }


        public void Update(UserDetail saveObj)
        {
            using (var session = GetSession())
            {

                using (var trans = session.BeginTransaction())
                {
                    var search = GetByLoginName(saveObj.User_Login);
                    if (search != null)
                    {
                        search.User_Id = saveObj.User_Id;
                        search.User_Login = saveObj.User_Login;
                        search.User_Name = saveObj.User_Name;
                        search.User_ShortName = saveObj.User_ShortName;
                        search.User_GroupCode = saveObj.User_GroupCode;
                        search.User_Role = saveObj.User_Role;
                        search.User_Branch = saveObj.User_Branch;
                        search.User_Password = saveObj.User_Password;
                        search.User_Phone1 = saveObj.User_Phone1;
                        search.User_Phone2 = saveObj.User_Phone2;
                        search.User_Email1 = saveObj.User_Email1;
                        search.User_Email2 = saveObj.User_Email2;
                        search.User_Last_Pword_change = saveObj.User_Last_Pword_change;
                        search.User_Last_Login_Date = saveObj.User_Last_Login_Date;
                        search.User_FlagID = saveObj.User_FlagID;

                        session.FlushMode = FlushMode.Commit;
                        session.SaveOrUpdate(search);
                        trans.Commit();
                        session.Flush();
                    }
                    //}
                }
            }
        }


        //get secret phrase
        public UserDetail GetBySecretPhrase(string _loginName, string _secretPhrase)
        {
            using (var session = GetSession())
            {
                return session.CreateCriteria<UserDetail>().List<UserDetail>().FirstOrDefault(c => c.User_Login == _loginName && c.User_SecretPhrase == _secretPhrase);

            }
        }

        public void UpdateUserPassword(string _loginName, string _secretPhrase)
        {
            using (var session = GetSession())
            {
                using (var trans = session.BeginTransaction())
                {
                    UserDetail sUserDetail = GetByLoginName(_loginName);
                    if (sUserDetail != null)
                    {

                        sUserDetail.User_Password = _secretPhrase;

                        //sUserDetail.User_Last_Pword_change = saveObj.User_Last_Pword_change;
                        //sUserDetail.User_Last_Login_Date = saveObj.User_Last_Login_Date;
                        //sUserDetail.User_FlagID = saveObj.User_FlagID;

                        session.FlushMode = FlushMode.Commit;
                        session.SaveOrUpdate(sUserDetail);
                        trans.Commit();
                        session.Flush();
                    }
                    //}
                }
            }
        }

    }
}
