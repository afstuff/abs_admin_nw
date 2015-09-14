﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CustodianAdmin.Model;


namespace CustodianAdmin.Repositories
{
    public interface IOutsourceBillRepository:IRepository<OutsourceBill,Int32?>
    {
        IList<OutsourceBill> OutsourceBills();
    }
}
