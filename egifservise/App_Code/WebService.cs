using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService 
{
    public SqlConnection con = new SqlConnection("server=.;user id=sa;password=admin123;database=EGiftShopee");
    public SqlCommand cmd;
    public SqlDataAdapter adp;
    public SqlDataReader dr;
    public DataSet ds = new DataSet();
    string str = "";
    string s = "";
    int a = 0;
    public WebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }
    [WebMethod]
    public DataSet GetLogin(string name, string pwd)
    {

        con.Open();
        adp=new SqlDataAdapter("select RoleId from tblUserAccount where UserName='"+name+"' and Password='"+pwd+"'",con);
        adp.Fill(ds);
        con.Close();  
        return ds;
             
    }
    [WebMethod]
    public void logintime(string s1, string s2)
    {
        con.Open();
        cmd = new SqlCommand("insert into LoginTime values('" + s1 + "','" + s2 + "')", con);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    [WebMethod]
    public void logout(string s3, string s4)
    {
        con.Open();
        cmd = new SqlCommand("insert into Logout values('" + s3 + "','" + s4 + "')", con);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    [WebMethod]
    public DataSet loginhistory(string frm, string to)
    {
        con.Open();
        adp = new SqlDataAdapter("select * from LoginTime  where Logintime between '" + frm + "' and '" + to + "'", con);
        adp.Fill(ds);
        
        return ds;

    }
    [WebMethod]
    public DataSet logouthistory(string frm, string to)
    {
        con.Open();
        adp = new SqlDataAdapter("select * from Logout  where time1 between '" + frm + "' and '" + to + "'", con);
        adp.Fill(ds);

        return ds;

    }
    [WebMethod]
    public string GetRoleByUsername(string uname)
    {
        con.Open();
        cmd = new SqlCommand("select RoleId from tblUserAccount where UserName='" + uname + "'", con);
        dr = cmd.ExecuteReader();
       
        if (dr.Read())
        {
            str = dr[0].ToString();
                      
            
        }
        con.Close();
        return str;
    }
    [WebMethod]
    public void getupdate(string p, string p1, string p2, string p3, string p4, DateTime since, string p5, string p6, string p7, string p8, int p9, int p10, int p11)
    {
        con.Open();
        cmd = new SqlCommand("insert into tblUser values('"+p1+"','"+p2+"','"+p3+"','"+p4+"','"+p5+"','"+p6+"','"+p7+"','"+p8+"','"+p9+"','"+p10+"','"+p11+"',)", con);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    [WebMethod]
    public DataSet RetrieveOrderDetails(string name)
    {
        con.Open();
        adp = new SqlDataAdapter("select * from tblOrder",con);
        adp.Fill(ds);
        con.Close();
        return ds;
        
    }
    [WebMethod]
    public void InsertBrand(string BrandName, string Discription, string Logo)
    {
        con.Open();
        cmd = new SqlCommand("insert into tblBrand values('" + BrandName + "','" + Discription + "','" +Logo+ "')");
        cmd.ExecuteNonQuery();
        con.Close();

    }
    [WebMethod]
    public void BankAcc(string b1, string b2, string b3, string b4, string b5,string b6, DateTime b7)
    {
        con.Open();
        cmd = new SqlCommand("insert into tblBankAccount values('" + b1 + "','" + b2 + "','" + b3 + "','" + b4 + "','" + b5 + "','" + b6 + "','"+b7+"')",con);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    [WebMethod]
    public string validity(string accno)
    {
        con.Close();
        con.Open();
        //cmd = new SqlCommand("select count(*) from tblBankAccount where AccNo='" + accno + "'", con);
        cmd = new SqlCommand("select * from tblBankAccount where AccName='" + Session["UserName"] + "'", con);
       int b = Convert.ToInt32(cmd.ExecuteScalar());
        if (b==1)
        {
                accno = "Valid Card";
                return accno;
        }
        else
        {
                accno = "Invalid Card";
                return accno;
        }
       

     }

    
    [WebMethod]
    public void payment(string p1, string p2, string p3, string p4, string p5,string p6)
    {
        con.Open();
        cmd = new SqlCommand("insert into payment values('" + p1 + "','" + p2 + "','" + p3 + "','" + p4 + "','" + p5 + "','"+p6+"')",con);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    [WebMethod]
     public string pointaccess(string p67)
    {
        con.Close();
        con.Open();
        adp = new SqlDataAdapter("select sum(cast(point as int)) from payment where accno='" + p67 + "'", con);
        System.Data.DataSet ds22 = new DataSet();
        adp.Fill(ds22);
        for (int a = 0; a < ds22.Tables[0].Rows.Count; a++)
        {
            p67 = ds22.Tables[0].Rows[a][0].ToString();
        }
        return p67;
    }
    [WebMethod]
    public bool balancecheck(string userid,string balance)
    {
        con.Close();
        con.Open();
        cmd = new SqlCommand("select count(*) from tblBankAccount where Balance<='"+balance+"' and AccName='"+userid+"'",con);
        int a = Convert.ToInt32(cmd.ExecuteScalar());

       // con.Close();
        if (a == 1)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    [WebMethod]
    public void onetimepwd(string session,string onepwd)
    {
        con.Close();
        con.Open();
        cmd = new SqlCommand("select count(*) from OnetimePwd where AccNo='" + session + "'", con);
       
        int a = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
        con.Open();
        if (a == 1)
        {
            adp = new SqlDataAdapter("update OnetimePwd set Password='" + onepwd + "' where AccNo='"+session+"'", con);
            adp.Fill(ds);
        }
        else
        {
            SqlCommand cmd11 = new SqlCommand("insert into OnetimePwd values('"+session+"','"+onepwd+"')",con);
            cmd11.ExecuteNonQuery();
        }
        con.Close();

        //cmd=new SqlCommand ("insert into OnetimePwd values('"+emailid+"','"+onepwd+"')",con);
        //cmd.ExecuteNonQuery();
       
    }
    [WebMethod]
    public bool validonetime(string transact, string pwd1)
    {
        con.Close();
        con.Open();
        cmd = new SqlCommand("select count(*) from OnetimePwd where AccNo='"+transact+"' and Password='"+pwd1+"'",con);
        int a = Convert.ToInt32(cmd.ExecuteScalar());
        if (a == 1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
     [WebMethod]
     public void amountdeduct(string accno,string  balance)
     {
         con.Close();
         con.Open();
         SqlCommand cmd2 = new SqlCommand("select Balance from tblBankAccount where AccNo='"+accno+"'",con);
       
         string total = "";
         decimal bal,netbal;
        
             bal = Convert.ToDecimal(cmd2.ExecuteScalar());
             netbal = Convert.ToDecimal(balance);
             total =(bal - netbal).ToString();

         
         con.Close();
         con.Open();
         cmd = new SqlCommand("update tblBankAccount set Balance='"+total+"'",con); 
         //cmd = new SqlCommand("pro_deduct",con);
         //cmd.CommandType = CommandType.StoredProcedure;
         //cmd.Parameters.AddWithValue("@accno",accno);
         //cmd.Parameters.AddWithValue("@balance", balance);
         cmd.ExecuteNonQuery();
         con.Close();
     }
     [WebMethod]
     public void Passwordupdate(string userid,string pwd)
     {
         con.Close();
         con.Open();
        // cmd = new SqlCommand("update payment set point=ISNULL(point,0) where accno='"+account+"'",con);
         cmd = new SqlCommand("update tblUserAccount set Password='"+pwd+"' where UserName='" + userid + "'", con);
         cmd.ExecuteNonQuery();
         con.Close();
     }
    [WebMethod]
    public string PinCode(string pincard)
    {
        con.Close();
        con.Open();
        cmd = new SqlCommand("select count(*) from tblBankAccount where PinNo='" + pincard + "'", con);
        int b = Convert.ToInt32(cmd.ExecuteScalar());
        if (b == 1)
        {
            pincard = "True";
            return pincard;
        }
        else
        {
            pincard = "False";
            return pincard;
        }
    }

    [WebMethod]
    public DataSet CustomFilter(int Operator, double Amount)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public void deleteadminorder(int id)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public void DeleteBrand(int BrandId)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public void Deletecartlogout(string Sessionid)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public void DeleteCategory(int CatId)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public void DeleteOrderDetails(int Ordernum)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public void DeleteProduct(int Id)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public void DeleteWishList(int ProductId)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet filterbydate(DateTime from, DateTime to)
    {
        throw new NotImplementedException();
    }
    //[WebMethod]
    //public SqlDataReader filterbyname(string name)
    //{
    //    throw new NotImplementedException();
    //}
    //[WebMethod]
    //public SqlDataReader filterbyorderno(int id)
    //{
    //    throw new NotImplementedException();
    //}
    [WebMethod]
    public DataSet filterbystatus(string status)
    {
        throw new NotImplementedException();
    }
    //[WebMethod]
    //public SqlDataReader getAccountDetails(string username)
    //{
    //    throw new NotImplementedException();
    //}
    [WebMethod]
    public DataSet getadminorder()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet GetAllBrandBYBrandID(int BrandId)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet getALLBrands()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet getALLCategories()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet GetAllCategoriesBYCategoryID(int CatId)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet GetAllProducts()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet GetAllProductsBYBrandID(int BrandID)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet GetAllProductsByCategoryID(int CategoryID)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet GetAllProductsBYID(int Id)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet getAllStatedetails()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet getAllStatesByCountryID(int CountryID)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public string getBrandName(int ProductID)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public string GetBrandName(int BrandId)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet getBrandNames()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public float GetCartTotal(string SID)
    {
        con.Close();
        con.Open();
        float vall;

        cmd = new SqlCommand("select sum(*) from (select Price*Quantity from tblShoppingCart where Sessionid='" + SID + "')", con);
        vall=cmd.ExecuteNonQuery();
        con.Close();
        return vall;
    }
    [WebMethod]
    public DataSet getCategoryNames()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet getCitydetails()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet getCitydetailsByStateID(int StateID)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet getCountrydetails()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet getHintquestion()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public int GetIdFromtblUserAccount(string username)
    {
        throw new NotImplementedException();
    }
    //[WebMethod]
    //SqlDataReader Product.GetLogin(string Username, string Password)
    //{
    //    throw new NotImplementedException();
    //}
    [WebMethod]
    public void GetLoginDetails(string p_username, string p_fname, string p_lname, string p_password, string p_question, string p_answer, DateTime p_dob, string p_no, string p_gender, string p_email, string p_address, int p_country, int p_state, int p_city, string p_zcode)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet GetOffers(int ProductID)
    {
        throw new NotImplementedException();
    }
    //[WebMethod]
    //public SqlDataReader getPassword(string username, string answer)
    //{
    //    throw new NotImplementedException();
    //}
    [WebMethod]
    public DataSet getPopularBrands()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet getPopularCategories()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet getPopularTypes()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet GetProductAttributes(int ProductID)
    {
        throw new NotImplementedException();
    }
    //[WebMethod]
    //public SqlDataReader GetProductDesc(string ProductID)
    //{
    //    throw new NotImplementedException();
    //}
    [WebMethod]
    public DataSet GetProductNameDetails(int ProductID)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet GetProductNameImage(int ProductID)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public string getProductPrice(int ProductID)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet GetQuantity(int ProductID, string SessionID, int Quantity, float Price)
    {
        throw new NotImplementedException();
    }
   [WebMethod]
    public DataSet getQuestion(string user)
   {
        con.Open();
        adp = new SqlDataAdapter("select * from tblUserAccount where UserName='" + user + "'", con);
        adp.Fill(ds);
        con.Close();
        return ds;
             
        
        
       // throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet GetRating(int ProductID)
    {
        throw new NotImplementedException();
    }
    //[WebMethod]
    //object Product.GetRoleByUsername(string Username)
    //{
    //    throw new NotImplementedException();
    //}
    [WebMethod]
    public DataSet GetShoppingCartDetails(string SessionID)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public string getuserpwd(string username, string password, string newpwd)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet GetWishListDetails(string username)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public int[] InsertAddress(string fname, string lname, string email, string gender, string contact, string nadrr, string ncountry, string nstate, string ncity)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public void InsertCategory(string Name, string Description, string Image)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public int insertorder(int custid, float orderamnt, float taxamnt, float netamnt, int shipaddrId, int billaddrId, string sessionid, string billfname)
    {
        //con.Close();
        //con.Open();
        //int Ordernum;
        //cmd = new SqlCommand(" update tblOrder set OrderAmount="+orderamnt+",TaxAmount="+taxamnt+",NetAmount="+netamnt+"where ShippingAddresssID="+shipaddrId, con);
       //Ordernum= cmd.ExecuteNonQuery();
       // con.Close();
        //return Ordernum;
        throw new NotImplementedException();
    }
        
    
    [WebMethod]
    public void InsertProduct(string name, float PurchasePrice, float SalePrice, int Quantity, string Description, string Image, int BrandId, int CategoryId)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public void InsertWishlist(string Username, string ProductId)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public void RemoveShoppingCartItem(string SessionId, int ProductId)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet RetrieveOrderStatus(string User, int OrderId)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public int shoppingcartitems(string Sessionid)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet sortbycustnameasc()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet sortbycustnamedesc()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet sortbyorderdateasc()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet sortbyorderdatedesc()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet sortbyordernoasc()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet sortbyordernodesc()
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public int[] spInsertAddressV2(string fname, string lname, string email, string gender, string contact, string nadrr, int ncountry, int nstate, int ncity)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public void updateadminorder(float amount, string status, int id)
    {
        throw new NotImplementedException();
    }
    //[WebMethod]
    //public SqlDataReader updateadminorder1(int id)
    //{
    //    throw new NotImplementedException();
    //}
    [WebMethod]
    public void UpdateBrand(int BrandId, string BrandName, string Description, string Logo)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public void UpdateCategory(int Id, string Name, string Description, string Image)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public void UpdateProduct(int Id, string Name, string Description, int Quantity, string Image, float PurchasePrice, float SalePrice)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public void UpdateRate(string ProductId, int RateId)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public void UpdateShoppingCartItem(string SessionId, int ProductId, int Quantity)
    {
        throw new NotImplementedException();
    }
    [WebMethod]
    public DataSet ViewGallery()
    {
        throw new NotImplementedException();
    }
}
