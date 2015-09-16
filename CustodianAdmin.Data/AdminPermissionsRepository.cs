﻿using System;
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

          //  string hqlOptions = "from AdminPermissions i where i.ADM_Role_ID = '" + _roleID + "'";

            using (
                var session = GetSession())
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



    }
}