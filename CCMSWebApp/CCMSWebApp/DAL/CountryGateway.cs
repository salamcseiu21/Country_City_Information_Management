using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using CountryCityInformationManagementSystem.Models;

namespace CountryCityInformationManagementSystem.DAL
{
    public class CountryGateway:DBGateway
    {
        public int Insert(Country country)
        {
            try
            {
                string query = "INSERT INTO t_Country VALUES(@name,@about)";
                CommandObj.CommandText = query;
                CommandObj.Parameters.Clear();
                CommandObj.Parameters.AddWithValue("@name", country.Name);
                CommandObj.Parameters.AddWithValue("@about", country.About);
                ConnectionObj.Open();
                int rowAffected = CommandObj.ExecuteNonQuery();
                return rowAffected;
            }
            catch (Exception exception)
            {
                throw new Exception("Could not save.",exception);
            }
            finally
            {
                ConnectionObj.Close();
                CommandObj.Dispose();
            }

        }

        public List<Country> GetAll()
        {
            try
            {
                List<Country> countries = new List<Country>();
                string query = "SELECT * FROM t_Country ORDER BY Name";
                CommandObj.CommandText = query;
                ConnectionObj.Open();
                SqlDataReader reader = CommandObj.ExecuteReader();
                while (reader.Read())
                {
                    Country aCountry = new Country();
                    aCountry.Id = Convert.ToInt32(reader["Id"].ToString());
                    aCountry.Name = reader["Name"].ToString();
                    aCountry.About = reader["About"].ToString();
                    countries.Add(aCountry);
                }
                reader.Close();
                return countries;
            }
            catch (Exception exception)
            {
                throw new Exception("Unable to Collect the coutries.",exception);
            }
            finally
            {
                ConnectionObj.Close();
                CommandObj.Dispose();
            }
        }

        public Country GetCountryInformationByName(string countryName)
        {
            try
            {
                string query = "SELECT * FROM t_Country WHERE Name=@countryName";
                CommandObj.CommandText = query;
                CommandObj.Parameters.Clear();
                CommandObj.Parameters.AddWithValue("@countryName", countryName);
                Country country = null;
                ConnectionObj.Open();
                SqlDataReader reader = CommandObj.ExecuteReader();
                if (reader.Read())
                {
                    country = new Country();
                    country.Id = Convert.ToInt32(reader["Id"].ToString());
                    country.Name = reader["Name"].ToString();
                    country.About = reader["About"].ToString();
                }
                reader.Close();
                return country;
            }
            catch (Exception exception)
            {
                throw new Exception("Unable to get country information",exception);
            }
            finally
            {
                ConnectionObj.Close();
                CommandObj.Dispose();
            }
        }


        public List<Country> GetAll(int pageIndex, int pageSise, out int totalRecords)
        {
            //string cs = WebConfigurationManager.ConnectionStrings["countryInformaitonDb"].ConnectionString;

            List<Country> countries=new List<Country>();

            //using (SqlConnection connection = new SqlConnection(cs))
            //{
                SqlCommand command = new SqlCommand("spGetCityInformaiton", ConnectionObj);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@PageIndex", pageIndex);
                command.Parameters.AddWithValue("@PageSize", pageSise);
                SqlParameter totalrecord = new SqlParameter();
                totalrecord.ParameterName = "@TotalRecord";
                totalrecord.Direction = ParameterDirection.Output;
                totalrecord.SqlDbType = SqlDbType.Int;
                command.Parameters.Add(totalrecord);
                ConnectionObj.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Country aCountry = new Country();
                    aCountry.Id = Convert.ToInt32(reader["Id"].ToString());
                    aCountry.Name = reader["Name"].ToString();
                    aCountry.About = reader["About"].ToString();
                    countries.Add(aCountry);
                }
                reader.Close();
                totalRecords = (int)command.Parameters["@TotalRecord"].Value;
               
           // }
             ConnectionObj.Close();
            return countries;
        }
    }
}