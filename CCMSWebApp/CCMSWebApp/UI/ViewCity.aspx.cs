using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using CountryCityInformationManagementSystem.BLL;
using CountryCityInformationManagementSystem.Models;

namespace CCMSWebApp
{
    public partial class ViewCity : System.Web.UI.Page
    {
        private List<CityViewerModel> cityViewerModels = null;
        CountryManager countryManager = new CountryManager();
        CityManager cityManager = new CityManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllCountry();
               
                LoadAllCityInformation();
            }
        }

        private void LoadAllCountry()
        {

            List<Country> countries = countryManager.GetAll();
            countryDropDownList.DataSource = countries;
            countryDropDownList.DataValueField = "Id";
            countryDropDownList.DataTextField = "Name";
            countryDropDownList.DataBind();
        }
        private void LoadAllCityInformation()
        {

            cityViewerModels = cityManager.GetCityInformation();
            showCityInformationGridView.DataSource = cityViewerModels;
            showCityInformationGridView.DataBind();
        }
        protected void searchButton_Click(object sender, EventArgs e)
        {
            if (serarchKeyRadioButton.SelectedValue == "1")
            {
                string cityName = cityNameTextBox.Text;
                showCityInformationGridView.DataSource = cityManager.GetCityInformation(cityName);
                showCityInformationGridView.DataBind();
            }
            else if (serarchKeyRadioButton.SelectedValue == "2")
            {
                string countryName = countryDropDownList.SelectedItem.Text;
                showCityInformationGridView.DataSource = cityManager.GetCityInformationByCountryName(countryName);
                showCityInformationGridView.DataBind();
            }
        }

        protected void showCityInformationGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (serarchKeyRadioButton.SelectedValue == "1")
            {
                showCityInformationGridView.PageIndex = e.NewPageIndex;
                string cityName = cityNameTextBox.Text;
                showCityInformationGridView.DataSource = cityManager.GetCityInformation(cityName);
                showCityInformationGridView.DataBind();
            }
            else if (serarchKeyRadioButton.SelectedValue == "2")
            {
                showCityInformationGridView.PageIndex = e.NewPageIndex;
                string countryName = countryDropDownList.SelectedItem.Text;
                showCityInformationGridView.DataSource = cityManager.GetCityInformationByCountryName(countryName);
                showCityInformationGridView.DataBind();
            }
            else
            {
                showCityInformationGridView.PageIndex = e.NewPageIndex;
                LoadAllCityInformation();
            }
        }
    }
}