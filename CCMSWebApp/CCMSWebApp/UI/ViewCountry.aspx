<%@ Page Title="View Country" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCountry.aspx.cs" Inherits="CCMSWebApp.ViewCountry" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />
    <div class="panel panel-primary">
        <div class="panel-heading">View Country</div>
        <div class="panel-body">
        
            <fieldset>
                <legend>Search</legend>
                <asp:Label runat="server" Text="Name"></asp:Label>
                <asp:TextBox runat="server" ID="searchTextBox"></asp:TextBox>
                <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" />

                <br />
                <br />
               
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        
                   
               
                     
                <asp:GridView ID="showCuntryInformationGridView" runat="server" AutoGenerateColumns="False" CellPadding="3" GridLines="Vertical" AllowPaging="True" OnPageIndexChanging="showCuntryInformationGridView_PageIndexChanging" PageSize="2" EnableViewState="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px">

                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                    <Columns>
                        <asp:TemplateField HeaderText="SL#">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("CountryName")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="About">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("AboutCountry")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total City">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("NoOfCities")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Dwellers">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("NoOfCityDwellers")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                         </ContentTemplate>
                </asp:UpdatePanel>
                <asp:LinkButton runat="server" PostBackUrl="~/Default.aspx">Back</asp:LinkButton>
                   </fieldset> 
                   

         </div>
    </div>
</asp:Content>
