<%@ Page Title="Add City" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCity.aspx.cs" Inherits="CCMSWebApp.AddCity" ValidateRequest="false" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />
    <div class="panel panel-primary">
        <div class="panel-heading">City Information</div>
        <div class="panel-body">
            <div class="form-horizontal">
                <asp:Label ID="msgLabel" runat="server" Text=""></asp:Label>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="cityNameTextBox" CssClass="col-md-2 control-label">City Name</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="cityNameTextBox" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cityNameTextBox"
                            CssClass="text-danger" ErrorMessage="City name  is required!" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="aboutCityTextBox" CssClass="col-md-2 control-label">About City</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox ID="aboutCityTextBox" TextMode="multiline" Columns="50" Rows="5" runat="server" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="aboutCityTextBox"
                            CssClass="text-danger" ErrorMessage="Please! Write something about city" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="dwellersTextBox" CssClass="col-md-2 control-label">No. of dwellers</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="dwellersTextBox" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dwellersTextBox"
                            CssClass="text-danger" ErrorMessage="No. of dwellers  is required!" /><br/>
                        <asp:RegularExpressionValidator ID="dwellersRegularExpressionValidator" runat="server" ErrorMessage="Please! Enter numeric figure only!" ControlToValidate="dwellersTextBox" CssClass="text-danger" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="locationTextBox" CssClass="col-md-2 control-label">Location</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="locationTextBox" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="locationTextBox"
                            CssClass="text-danger" ErrorMessage="Location of City is required!" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="weatherTextBox" CssClass="col-md-2 control-label">Weather</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="weatherTextBox" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="weatherTextBox"
                            CssClass="text-danger" ErrorMessage="Please! write down the weather of city" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="countryDropDownList" CssClass="col-md-2 control-label">Country</asp:Label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="countryDropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                        
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" ID="saveButton" Text="Save" CssClass="btn btn-info" OnClick="saveButton_Click" />
                        <asp:Button runat="server" ID="cancelButton" Text="Cancel" CssClass="btn btn-danger" CausesValidation="False" OnClick="cancelButton_Click" />
                    </div>
                    <asp:Label runat="server" ID="messageLabel"></asp:Label>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-primary">
        <div class="panel-heading">City Information</div>
        <div class="panel-body">
            <%--<asp:GridView ID="cityWithCountryGridView" runat="server"></asp:GridView>--%>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    
               
            <asp:GridView ID="cityWithCountryGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="4" OnPageIndexChanging="cityWithCountryGridView_PageIndexChanging" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderText="SL#">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("CityName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="No. of Dwellers">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("NoOfDewellers") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("CountryName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
             </ContentTemplate>
            </asp:UpdatePanel>
            <asp:LinkButton runat="server" PostBackUrl="~/Default.aspx" CausesValidation="False">Back</asp:LinkButton>
        </div>
    </div>
    <script>
        $(function () {
            $('#MainContent_aboutCityTextBox').editable({ inlineMode: false, height: 250, alwaysBlank: true });
        });
    </script>
</asp:Content>
