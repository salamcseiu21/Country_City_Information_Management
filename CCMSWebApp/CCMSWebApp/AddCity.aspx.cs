using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryCityInformationManagementSystem.BLL;
using CountryCityInformationManagementSystem.Models;

namespace CCMSWebApp
{
    public partial class AddCity : System.Web.UI.Page
    {
        CountryManager countryManager=new CountryManager();
        CityManager cityManager=new CityManager();
        private string message;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillDropDownListWithCountryInforamtion();
                LoadAllCity();
            }
        }

        private void LoadAllCity()
        {
            cityWithCountryGridView.DataSource = cityManager.GetCityInformation();
            cityWithCountryGridView.DataBind();
            
        }

        private void FillDropDownListWithCountryInforamtion()
        {
            countryDropDownList.DataSource = countryManager.GetAll();
            countryDropDownList.DataValueField = "Id";
            countryDropDownList.DataTextField = "Name";
            countryDropDownList.DataBind();
        }

        protected void cityWithCountryGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            cityWithCountryGridView.PageIndex = e.NewPageIndex;
            cityWithCountryGridView.DataSource = cityManager.GetCityInformation();
            cityWithCountryGridView.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {

            try
            {
                string name = cityNameTextBox.Text;
                string about = aboutCityTextBox.Text;
                long noofDwellers = Convert.ToInt64(dwellersTextBox.Text);
                string location = locationTextBox.Text;
                string weather = weatherTextBox.Text;
                int countryId = Convert.ToInt32(countryDropDownList.SelectedValue);
                City aCity=new City(name,about,noofDwellers,location,weather,countryId);
                message = cityManager.Save(aCity);
                messageLabel.Text = message;
                LoadAllCity();
                ClearAlltextBoxes();
            }
            catch (Exception exceptionObj)
            {

                message = exceptionObj.Message;
                if (exceptionObj.InnerException != null)
                {
                    message += "<br/>System Error:" + exceptionObj.InnerException.Message;
                }
                messageLabel.Text = message;
            }
            
        }

        private void ClearAlltextBoxes()
        {
            cityNameTextBox.Text = string.Empty;
            aboutCityTextBox.Text = string.Empty;
            dwellersTextBox.Text = string.Empty;
            locationTextBox.Text = string.Empty;
            weatherTextBox.Text = string.Empty;
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}