<%@ Page Title="Add Country" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCountry.aspx.cs" Inherits="CCMSWebApp.About" ValidateRequest="false" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />

    <div class="panel panel-primary">
        <div class="panel-heading">Country Information</div>
        <div class="panel-body">
            <div class="form-horizontal">
                <asp:Label ID="msgLabel" runat="server" Text=""></asp:Label>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="countryNameTextBox" CssClass="col-md-2 control-label">Country Name</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="countryNameTextBox" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="countryNameTextBox"
                            CssClass="text-danger" ErrorMessage="Country name  is required!" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="aboutCountryTextBox" CssClass="col-md-2 control-label">About</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox ID="aboutCountryTextBox" TextMode="multiline" Columns="50" Rows="5" runat="server" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="aboutCountryTextBox"
                            CssClass="text-danger" ErrorMessage="Please! Write something about Country!" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" ID="saveButton" Text="Save" CssClass="btn btn-info" OnClick="saveButton_Click" />
                        <asp:Button runat="server" ID="cancelButton" Text="Cancel" CssClass="btn btn-danger" CausesValidation="False" OnClick="cancelButton_Click"/>
                    </div>
                    <asp:Label runat="server" ID="messageLabel"></asp:Label>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-primary">
        <div class="panel-heading">Country Information</div>
        <div class="panel-body">
       <asp:UpdatePanel runat="server">
           <ContentTemplate>
               
           
            <asp:GridView ID="showCountryInforamotionGridView" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="2" OnPageIndexChanging="showCountryInforamotionGridView_PageIndexChanging" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderText="SL#">
                       <ItemTemplate>
                           <%#Container.DataItemIndex+1 %>
                       </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                       <ItemTemplate>
                           <asp:Label runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                       </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="About">
                       <ItemTemplate>
                           <asp:Label runat="server" Text='<%#Eval("About") %>'></asp:Label>
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
            $('#MainContent_aboutCountryTextBox').editable({ inlineMode: false, height: 250, alwaysBlank: true });
        });
    </script>
</asp:Content>
