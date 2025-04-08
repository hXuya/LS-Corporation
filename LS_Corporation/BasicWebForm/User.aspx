<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="LS_Corporation.BasicWebForm.Uesr" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {  background-color: #f8f9fa; padding-top: 70px; }
        .navbar { 
            background-color: #231f20; 
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); 
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 9999;
            width: 100%;
            padding: 10px 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .navbar-brand { display: flex; align-items: center; }
        .navbar-nav { display: flex; justify-content: center; width: auto; }
        .navbar-nav .nav-item { margin: 0 25px; }
        .navbar-nav .nav-link { padding: 10px 15px; }
        .navbar-brand img { height: 50px; margin-right: 10px; }
        .navbar-brand span { color: white; font-size: 1.5rem; font-weight: bold;}
        .dropdown-menu { border-radius: 6px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); border: 1px solid #ddd; }
        .dropdown-item:hover { background-color: #f8f9fa; }
        .container { background-color: white; border-radius: 8px; box-shadow: 0 0 15px rgba(0,0,0,0.1); padding: 25px; margin-top: 20px; }
        .pagination-container a { font-size: 1.1rem; padding: 5px 12px; margin: 0 3px; border-radius: 4px; background-color: #f8f9fa; border: 1px solid #000; color: #444444; }
        .pagination-container span { font-size: 1.1rem; padding: 5px 12px; margin: 0 3px; border-radius: 4px; background-color: #444444; border: 1px solid #000; color: white; }
        .form-section { background-color: #f8f9fa; padding: 20px; border-radius: 6px; margin-top: 20px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        .table-responsive { border-radius: 6px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); overflow: hidden; }
        .table { margin-bottom: 0; }
        .btn-primary { background-color: #444444; border-color: #000; }
        .btn-success { background-color: #28a745; border-color: #000; }
        .btn-secondary { background-color: #dc3545; border-color: #000; }
        .btn-outline-success { color: #28a745; border-color: #000; }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <!-- Navigation Bar Added from Home.aspx -->
        <nav class="navbar navbar-expand-lg navbar-dark mb-4">
            <div class="container-fluid">
                <a class="navbar-brand" href="../MainPage/Home.aspx">
                    <img src="<%= ResolveUrl("~/Images/logo.png") %>" alt="LS Corporation Logo" />
                    <span>  Corporation</span>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../MainPage/Dashboard.aspx"><i class="fas fa-home me-1"></i> Dashboard</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle active" href="#" id="basicDropdown" role="button" data-bs-toggle="dropdown">
                                <i class="fas fa-folder me-1"></i> Basic WebForm
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item active" href="User.aspx">User Details</a></li>
                                <li><a class="dropdown-item" href="Project.aspx">Project Details</a></li>
                                <li><a class="dropdown-item" href="Task.aspx">Task Details</a></li>
                                <li><a class="dropdown-item" href="Resource.aspx">Resource Details</a></li>
                                <li><a class="dropdown-item" href="Subtask.aspx">Subtask Details</a></li>
                                <li><a class="dropdown-item" href="Milestone.aspx">Milestone Details</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="complexDropdown" role="button" data-bs-toggle="dropdown">
                                <i class="fas fa-folder-tree me-1"></i> Complex WebForm
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../ComplexWebForm/ProjectMilestone.aspx">Project Milestone Details</a></li>
                                <li><a class="dropdown-item" href="../ComplexWebForm/UserProject.aspx">User Project Details</a></li>
                                <li><a class="dropdown-item" href="../ComplexWebForm/TopPerformer.aspx">Top Performer Details</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <h2 class="mb-4 pb-2 border-bottom">User Details</h2>
            
            <div class="table-responsive mb-4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="USERID" DataSourceID="SqlDataSource1" AllowPaging="True"
                    CssClass="table table-striped table-hover" HeaderStyle-CssClass="table-dark"
                    PagerStyle-CssClass="pagination-container" PageSize="5">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="100px">
                            <ItemTemplate>
                                <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn btn-sm btn-outline-success" ToolTip="Edit">
                                    <i class="fas fa-pen"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-danger" ToolTip="Delete"
                                    OnClientClick="return confirm('Delete this user?');">
                                    <i class="fas fa-trash"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" CssClass="btn btn-sm btn-success" ToolTip="Save">
                                    <i class="fas fa-check"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CssClass="btn btn-sm btn-secondary" ToolTip="Cancel">
                                    <i class="fas fa-times"></i>
                                </asp:LinkButton>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="USERID" HeaderText="ID" ReadOnly="True" SortExpression="USERID" />
                        <asp:BoundField DataField="USERNAME" HeaderText="Name" SortExpression="USERNAME" />
                        <asp:BoundField DataField="USEREMAIL" HeaderText="Email" SortExpression="USEREMAIL" />
                        <asp:BoundField DataField="USERCONTACT" HeaderText="Contact" SortExpression="USERCONTACT" />
                        <asp:BoundField DataField="USERROLE" HeaderText="Role" SortExpression="USERROLE" />
                        <asp:BoundField DataField="USERPASSWORD" HeaderText="Password" SortExpression="USERPASSWORD" DataFormatString="••••••••" />
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="«" LastPageText="»" />
                    <PagerStyle HorizontalAlign="Center" />
                </asp:GridView>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM &quot;User&quot; WHERE &quot;USERID&quot; = :USERID" 
                InsertCommand="INSERT INTO &quot;User&quot; (&quot;USERID&quot;, &quot;USERNAME&quot;, &quot;USEREMAIL&quot;, &quot;USERCONTACT&quot;, &quot;USERROLE&quot;, &quot;USERPASSWORD&quot;) VALUES (:USERID, :USERNAME, :USEREMAIL, :USERCONTACT, :USERROLE, :USERPASSWORD)" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot;, &quot;USEREMAIL&quot;, &quot;USERCONTACT&quot;, &quot;USERROLE&quot;, &quot;USERPASSWORD&quot; FROM &quot;User&quot; ORDER BY &quot;USERID&quot; ASC" 
                UpdateCommand="UPDATE &quot;User&quot; SET &quot;USERNAME&quot; = :USERNAME, &quot;USEREMAIL&quot; = :USEREMAIL, &quot;USERCONTACT&quot; = :USERCONTACT, &quot;USERROLE&quot; = :USERROLE, &quot;USERPASSWORD&quot; = :USERPASSWORD WHERE &quot;USERID&quot; = :USERID">
                <DeleteParameters>
                    <asp:Parameter Name="USERID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="USERID" Type="Decimal" />
                    <asp:Parameter Name="USERNAME" Type="String" />
                    <asp:Parameter Name="USEREMAIL" Type="String" />
                    <asp:Parameter Name="USERCONTACT" Type="String" />
                    <asp:Parameter Name="USERROLE" Type="String" />
                    <asp:Parameter Name="USERPASSWORD" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="USERNAME" Type="String" />
                    <asp:Parameter Name="USEREMAIL" Type="String" />
                    <asp:Parameter Name="USERCONTACT" Type="String" />
                    <asp:Parameter Name="USERROLE" Type="String" />
                    <asp:Parameter Name="USERPASSWORD" Type="String" />
                    <asp:Parameter Name="USERID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
            <div class="form-section">
                <h4 class="mb-3">Add User</h4>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="USERID" DataSourceID="SqlDataSource1" Width="100%">
                    <EditItemTemplate>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">User ID:</label>
                                <asp:Label ID="USERIDLabel1" runat="server" Text='<%# Eval("USERID") %>' CssClass="form-control-plaintext" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Name:</label>
                                <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' CssClass="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Email:</label>
                                <asp:TextBox ID="USEREMAILTextBox" runat="server" Text='<%# Bind("USEREMAIL") %>' CssClass="form-control" TextMode="Email" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Contact:</label>
                                <asp:TextBox ID="USERCONTACTTextBox" runat="server" Text='<%# Bind("USERCONTACT") %>' CssClass="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Role:</label>
                                <asp:TextBox ID="USERROLETextBox" runat="server" Text='<%# Bind("USERROLE") %>' CssClass="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Password:</label>
                                <asp:TextBox ID="USERPASSWORDTextBox" runat="server" Text='<%# Bind("USERPASSWORD") %>' CssClass="form-control" TextMode="Password" />
                            </div>
                            <div class="col-12 mt-3">
                                <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" CssClass="btn btn-success">
                                    <i class="fas fa-check me-1"></i> Update
                                </asp:LinkButton>
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CommandName="Cancel" CssClass="btn btn-secondary">
                                    <i class="fas fa-times me-1"></i> Cancel
                                </asp:LinkButton>
                            </div>
                        </div>
                    </EditItemTemplate>
                    
                    <InsertItemTemplate>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">User ID:</label>
                                <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' CssClass="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Name:</label>
                                <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' CssClass="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Email:</label>
                                <asp:TextBox ID="USEREMAILTextBox" runat="server" Text='<%# Bind("USEREMAIL") %>' CssClass="form-control" TextMode="Email" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Contact:</label>
                                <asp:TextBox ID="USERCONTACTTextBox" runat="server" Text='<%# Bind("USERCONTACT") %>' CssClass="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Role:</label>
                                <asp:TextBox ID="USERROLETextBox" runat="server" Text='<%# Bind("USERROLE") %>' CssClass="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Password:</label>
                                <asp:TextBox ID="USERPASSWORDTextBox" runat="server" Text='<%# Bind("USERPASSWORD") %>' CssClass="form-control" TextMode="Password" />
                            </div>
                            <div class="col-12 mt-3">
                                <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" CssClass="btn btn-success">
                                    <i class="fas fa-plus me-1"></i> Insert
                                </asp:LinkButton>
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CommandName="Cancel" CssClass="btn btn-secondary">
                                    <i class="fas fa-times me-1"></i> Cancel
                                </asp:LinkButton>
                            </div>
                        </div>
                    </InsertItemTemplate>
                    
                    <ItemTemplate>
                        <div class="text-center">
                            <asp:LinkButton ID="NewButton" runat="server" CommandName="New" CssClass="btn btn-success">
                                <i class="fas fa-user-plus me-1"></i> Add New User
                            </asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>