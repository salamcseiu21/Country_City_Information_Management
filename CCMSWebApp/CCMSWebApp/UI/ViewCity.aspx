<%@ Page Title="View City" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCity.aspx.cs" Inherits="CCMSWebApp.ViewCity" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />
    <div class="panel panel-primary">
        <div class="panel-heading">City Inforamtion</div>
        
        <div id="searchSection" style="margin-left: 50px; height: 164px; width: 345px;">
               <fieldset style="width: 271px;">
                <legend>Search Criteria </legend>
                <div style="float: left">
                    <asp:RadioButtonList ID="serarchKeyRadioButton" runat="server">
                        <asp:ListItem Value="1">City Name</asp:ListItem>
                        <asp:ListItem Value="2">Country</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div>
                    <asp:TextBox ID="cityNameTextBox" runat="server"></asp:TextBox>
                    <br/>
                    <br/>
                    <asp:DropDownList ID="countryDropDownList" runat="server" Width="172px"></asp:DropDownList>
                </div>

                <div style="float: right">
                    <br />
                    <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" />
                </div>
                
            </fieldset>
        </div>


        <div class="panel-body">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    
                
            <asp:GridView ID="showCityInformationGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="2" OnPageIndexChanging="showCityInformationGridView_PageIndexChanging" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderText="SL#">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City Name">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("CityName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="About">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("AboutCity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="No. of Dwellers">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("NoOfDewellers") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Location">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("Location") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Weather">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("Weather") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("CountryName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="About Country">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("AboutCountry") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle ForeColor="Black" BackColor="#EEEEEE" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />

            </asp:GridView>
                    </ContentTemplate>
            </asp:UpdatePanel>
            <asp:LinkButton runat="server" PostBackUrl="~/Default.aspx">Back</asp:LinkButton>
        </div>
    </div>
</asp:Content>
