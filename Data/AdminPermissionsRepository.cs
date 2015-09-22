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
    public class AdminPermissionsRepository
    {
        private static ISession GetSession()
        {
            return SessionProvider.SessionFactory.OpenSession();
        }

        public void Save(AdminPermissions saveObj)
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


        public void DeleteRoles(int _roleID)
        {
            using (var session = GetSession())
            {
                using (var trans = session.BeginTransaction())
                {
                    var search = session.CreateCriteria<AdminPermissions>().List<AdminPermissions>().Where(c => c.ADM_Role_ID == _roleID).ToList();
                    int a = search.Count();
                    if (search != null)
                    {
                        for (int i = 0; i <= a; i++)
                        {
                            var delRoles = session.CreateCriteria<AdminPermissions>().List<AdminPermissions>().Where(c => c.ADM_Role_ID == _roleID).FirstOrDefault();
                            if (delRoles != null)
                            {
                                session.Delete(delRoles);
                            }

                        }
                        trans.Commit();
                    }
                }
            }

        }






        public void Delete(AdminPermissions delObj)
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
        public IList<AdminCode> AdminCodes()
        {
            using (var session = GetSession())
            {
                var pDet = session.CreateCriteria<AdminCode>()

                                     .List<AdminCode>();

                return pDet;
            }
        }
        public AdminCode GetById(Int32? id)
        {
            using (var session = GetSession())
            {
                return session.Get<AdminCode>(id);
            }
        }

        public IList<AdminPermissions> GetAdminPermissions(int _roleID)
        {
            using (var session = GetSession())
            {
                // return session.CreateQuery(hqlOptions).List<AdminPermissions>();
                return session.CreateCriteria<AdminPermissions>().List<AdminPermissions>().Where(c => c.ADM_Role_ID == _roleID).ToList();
            }
        }
        public IList<AdminCode> GetAdminCodes(String _classcode, String _criteria)
        {

            string hqlOptions = "from AdminCode i where i.ClassCode = '" + _classcode + "' and i.ItemDesc like '%" + _criteria.Trim() + "%'";

            using (var session = GetSession())
            {
                return session.CreateQuery(hqlOptions).List<AdminCode>();

            }
        }

        public IList<AdminCode> GetAdminOtherCodes(String _classcode, String _criteria)
        {

            string hqlOptions = "from AdminCode i where i.ClassCode = '" + _classcode + "' and i.Branch = '" + _criteria.Trim() + "'";

            using (var session = GetSession())
            {
                return session.CreateQuery(hqlOptions).List<AdminCode>();

            }
        }

        public IList<MotorCar> GetCarMakes()
        {
            using (var session = GetSession())
            {
                var pDet = session.CreateCriteria<MotorCar>()

                                     .List<MotorCar>();

                return pDet;
            }

        }


        public String GetMiscAdminInfo(String _classcode, String _itemcode)
        {
            //queries the generic admincodes table and extract info for the vehicles only
            string query = "SELECT * "
                          + "FROM CiFn_GetMiscAdminCodeDetails('" + _classcode + "','"
                          + _itemcode + "',NULL,NULL,NULL)";

            return GetDataSet(query).GetXml();
        }

        private static DataSet GetDataSet(string qry)
        {
            using (var session = GetSession())
            {
                using (var conn = session.Connection as SqlConnection)
                {
                    var adapter = new SqlDataAdapter(qry, conn);
                    var dataSet = new System.Data.DataSet();

                    adapter.Fill(dataSet);
                     
                    return dataSet;
                }
            }
        }



        private static DataTable GetDataTable(string qry)
        {
            using (var session = GetSession())
            {
                using (var conn = session.Connection as SqlConnection)
                {
                    var adapter = new SqlDataAdapter(qry, conn);
                    var dataSet = new System.Data.DataSet();

                    adapter.Fill(dataSet);
                    DataTable dt = dataSet.Tables[0];

                    return dt;
                }
            }
        }


        public String GeUserRoleInfo(Int32 roleId)
        {
            //queries the generic admincodes table and extract info for the vehicles only
            string query = "SELECT * "
                          + "FROM ADMPermissions where ADM_Role_ID = " + roleId + "";

            return GetDataSet(query).GetXml();
        }


        public String DoUserLogin(string userName, string userPassword)
        {
            string query = "SELECT * "
                          + "FROM ADM_USER_LIFE_DETAIL where (SEC_USER_LOGIN = '" + userName + "') AND ( SEC_USER_PASSWORD = '" + userPassword + "')";
            return GetDataSet(query).GetXml();
        }


        public DataTable GeUserRoleInfoDt(Int32 roleId)
        {
            //queries the generic admincodes table and extract info for the vehicles only
            string query = "SELECT * "
                          + "FROM ADMPermissions where ADM_Role_ID = " + roleId + "";

            return GetDataTable(query);
        }


        public DataTable DoUserLoginDt(string userName, string userPassword)
        {
            string query = "SELECT * "
                          + "FROM ADM_USER_LIFE_DETAIL where (SEC_USER_LOGIN = '" + userName + "') AND ( SEC_USER_PASSWORD = '" + userPassword + "')";
            return GetDataTable(query);
        }

    }
}
