using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using CountryCityInformationManagementSystem.BLL;
using CountryCityInformationManagementSystem.Models;

namespace CCMSWebApp
{
    public partial class ViewCountry : System.Web.UI.Page
    {
        CityManager cityManager = new CityManager();
        private List<CountryViewerModel> countryList = null; 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                LoadCountryInformation();
            }
        }

        private void LoadCountryInformation()
        {
            countryList = new List<CountryViewerModel>();
            countryList = cityManager.GetCountryInformation();
            showCuntryInformationGridView.DataSource = countryList;
            showCuntryInformationGridView.DataBind();
        }

       
        protected void searchButton_Click(object sender, EventArgs e)
        {
            string name = searchTextBox.Text;
            countryList = cityManager.GetCountryInformationByName(name);
            showCuntryInformationGridView.DataSource = countryList;
            showCuntryInformationGridView.DataBind(); 
        }

        protected void showCuntryInformationGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            showCuntryInformationGridView.PageIndex = e.NewPageIndex;
            string name = searchTextBox.Text;
            showCuntryInformationGridView.DataSource = cityManager.GetCountryInformationByName(name);
            showCuntryInformationGridView.DataBind();  
        }
    }
}