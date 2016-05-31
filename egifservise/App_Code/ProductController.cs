using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Class1
/// </summary>
  interface Product
{
        DataSet CustomFilter(int Operator, double Amount);
        void deleteadminorder(int id);
        void DeleteBrand(int BrandId);
        void Deletecartlogout(string Sessionid);
        void DeleteCategory(int CatId);
        void DeleteOrderDetails(int Ordernum);
        void DeleteProduct(int Id);
        void DeleteWishList(int ProductId);
        DataSet filterbydate(DateTime from, DateTime to);
        SqlDataReader filterbyname(string name);
        SqlDataReader filterbyorderno(int id);
        DataSet filterbystatus(string status);
        SqlDataReader getAccountDetails(string username);
        DataSet getadminorder();
        DataSet GetAllBrandBYBrandID(int BrandId);
        DataSet getALLBrands();
        DataSet getALLCategories();
        DataSet GetAllCategoriesBYCategoryID(int CatId);
        DataSet GetAllProducts();
        DataSet GetAllProductsBYBrandID(int BrandID);
        DataSet GetAllProductsByCategoryID(int CategoryID);
        DataSet GetAllProductsBYID(int Id);
        DataSet getAllStatedetails();
        DataSet getAllStatesByCountryID(int CountryID);
        string getBrandName(int ProductID);
        string GetBrandName(int BrandId);
        DataSet getBrandNames();
        float GetCartTotal(string SID);
        DataSet getCategoryNames();
        DataSet getCitydetails();
        DataSet getCitydetailsByStateID(int StateID);
        DataSet getCountrydetails();
        DataSet getHintquestion();
        int GetIdFromtblUserAccount(string username);
        SqlDataReader GetLogin(string Username, string Password);
        void GetLoginDetails(string p_username, string p_fname, string p_lname, string p_password, string p_question, string p_answer, DateTime p_dob, string p_no, string p_gender, string p_email, string p_address, int p_country, int p_state, int p_city, string p_zcode);
        DataSet GetOffers(int ProductID);
        SqlDataReader getPassword(string username, string answer);
       DataSet getPopularBrands();
       DataSet getPopularCategories();
       DataSet getPopularTypes();
      DataSet GetProductAttributes(int ProductID);
       SqlDataReader GetProductDesc(string ProductID);
       DataSet GetProductNameDetails(int ProductID);
       DataSet GetProductNameImage(int ProductID);
       string getProductPrice(int ProductID);
       DataSet GetQuantity(int ProductID, string SessionID, int Quantity, float Price);
       DataSet getQuestion(string user);
       DataSet GetRating(int ProductID);
      object GetRoleByUsername(string Username);
       DataSet GetShoppingCartDetails(string SessionID);
      //void getupdate(string username, string fname, string lname, string question, string answer, DateTime dob, string no, string gender, string email, string address, int country, int state, int city, string zcode);
      string  getuserpwd(string username, string password, string newpwd);
       DataSet GetWishListDetails(string username);
      int[] InsertAddress(string fname, string lname, string email, string gender, string contact, string nadrr, string ncountry, string nstate, string ncity);
       void InsertBrand(string BrandName, string Discription, string Logo);
       void InsertCategory(string Name, string Description, string Image);
       int insertorder(int custid, float orderamnt, float taxamnt, float netamnt, int shipaddrId, int billaddrId, string sessionid, string billfname);
       void InsertProduct(string name, float PurchasePrice, float SalePrice, int Quantity, string Description, string Image, int BrandId, int CategoryId);
       void InsertWishlist(string Username, string ProductId);
       void RemoveShoppingCartItem(string SessionId, int ProductId);
       DataSet RetrieveOrderDetails(string User);
       DataSet RetrieveOrderStatus(string User, int OrderId);
       int shoppingcartitems(string Sessionid);
       DataSet sortbycustnameasc();
       DataSet sortbycustnamedesc();
       DataSet sortbyorderdateasc();
       DataSet sortbyorderdatedesc();
       DataSet sortbyordernoasc();
       DataSet sortbyordernodesc();
       int[] spInsertAddressV2(string fname, string lname, string email, string gender, string contact, string nadrr, int ncountry, int nstate, int ncity);
       void updateadminorder(float amount, string status, int id);
       SqlDataReader updateadminorder1(int id);
       void UpdateBrand(int BrandId, string BrandName, string Description, string Logo);
       void UpdateCategory(int Id, string Name, string Description, string Image);
       void UpdateProduct(int Id, string Name, string Description, int Quantity, string Image, float PurchasePrice, float SalePrice);
       void UpdateRate(string ProductId, int RateId);
       void UpdateShoppingCartItem(string SessionId, int ProductId, int Quantity);
       DataSet ViewGallery();
}
  class ProductController
{
   

  
}