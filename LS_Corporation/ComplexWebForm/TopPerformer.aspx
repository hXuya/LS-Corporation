<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopPerformer.aspx.cs" Inherits="LS_Corporation.ComplexWebForm.TopPerformer" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Top Performers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        body { background-color: #f8f9fa; padding-top: 70px; }
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
        .navbar-brand span { color: white; font-size: 1.5rem; font-weight: bold; }
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
        .project-filter { background-color: #f8f9fa; padding: 15px; border-radius: 6px; margin-bottom: 20px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        .top-rank { font-size: 1.2rem; color: #444444; font-weight: bold; }
        .rank-1 { color: #d4af37; } 
        .rank-2 { color: #a8a8a8; } 
        .rank-3 { color: #cd7f32; } 
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark mb-4">
            <div class="container-fluid">
                <a class="navbar-brand" href="../../MainPage/Home.aspx">
                    <img src="<%= ResolveUrl("~/Images/logo.png") %>" alt="LS Corporation Logo" />
                    <span>  Corporation</span>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../../MainPage/Dashboard.aspx"><i class="fas fa-home me-1"></i> Dashboard</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="basicDropdown" role="button" data-bs-toggle="dropdown">
                                <i class="fas fa-folder me-1"></i> Basic WebForm
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../../BasicWebForm/User.aspx">User Details</a></li>
                                <li><a class="dropdown-item" href="../../BasicWebForm/Project.aspx">Project Details</a></li>
                                <li><a class="dropdown-item" href="../../BasicWebForm/Task.aspx">Task Details</a></li>
                                <li><a class="dropdown-item" href="../../BasicWebForm/Resource.aspx">Resource Details</a></li>
                                <li><a class="dropdown-item" href="../../BasicWebForm/Subtask.aspx">Subtask Details</a></li>
                                <li><a class="dropdown-item" href="../../BasicWebForm/Milestone.aspx">Milestone Details</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle active" href="#" id="complexDropdown" role="button" data-bs-toggle="dropdown">
                                <i class="fas fa-folder-tree me-1"></i> Complex WebForm
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../../ComplexWebForm/ProjectMilestone.aspx">Project Milestone Details</a></li>
                                <li><a class="dropdown-item" href="../../ComplexWebForm/UserProject.aspx">User Project Details</a></li>
                                <li><a class="dropdown-item" href="../../ComplexWebForm/TopPerformer.aspx">Top Performer Details</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <h2 class="mb-4 pb-2 border-bottom">Top Performers</h2>
            
            <div class="project-filter">
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <label class="form-label mb-0"><strong>Select Project:</strong></label>
                    </div>
                    <div class="col-md-6">
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource2" DataTextField="PROJECTNAME" DataValueField="PROJECTID"
                            CssClass="form-select">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            
            <div class="table-responsive mb-4">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    DataSourceID="SqlDataSource1" AutoGenerateColumns="False"
                    CssClass="table table-striped table-hover" 
                    HeaderStyle-CssClass="table-dark" PagerStyle-CssClass="pagination-container" PageSize="5">
                    <Columns>
                        <asp:TemplateField HeaderText="Rank" ItemStyle-Width="80px">
                            <ItemTemplate>
                                <span class="top-rank rank-<%# Container.DataItemIndex + 1 %>">
                                    <%# Container.DataItemIndex + 1 %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="USERID" HeaderText="User ID" />
                        <asp:BoundField DataField="USERNAME" HeaderText="Name" />
                        <asp:BoundField DataField="USEREMAIL" HeaderText="Email" />
                        <asp:BoundField DataField="PROJECTID" HeaderText="Project ID" />
                        <asp:BoundField DataField="TASKS_COMPLETED" HeaderText="Completed Tasks" />
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="«" LastPageText="»" />
                    <PagerStyle HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        <div class="alert alert-danger m-3">
                            <i class="fas fa-exclamation-circle me-2"></i> No top performers found for this project.
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM (
                    SELECT
                        u.UserId,
                        u.UserName,
                        u.UserEmail,
                        upt.ProjectId,
                        COUNT(t.TaskId) AS tasks_completed
                    FROM &quot;User&quot; u
                    JOIN UserProjectTask upt ON u.UserId = upt.UserId
                    JOIN Task t ON upt.TaskId = t.TaskId
                    WHERE upt.ProjectId = :ProjectId
                    AND t.TaskStatus = 'Completed'
                    GROUP BY u.UserId, u.UserName, u.UserEmail, upt.ProjectId
                    ORDER BY tasks_completed DESC
                )
                WHERE ROWNUM &lt;= 3">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="ProjectId" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot; FROM &quot;PROJECT&quot;">
            </asp:SqlDataSource>
        </div>
    </form>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>