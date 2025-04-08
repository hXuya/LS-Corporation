<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subtask.aspx.cs" Inherits="LS_Corporation.BasicWebForm.Subtask" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Subtask Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        body { background-color: #f8f9fa; padding-top: 70px; }
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                                <li><a class="dropdown-item" href="User.aspx">User Details</a></li>
                                <li><a class="dropdown-item" href="Project.aspx">Project Details</a></li>
                                <li><a class="dropdown-item" href="Task.aspx">Task Details</a></li>
                                <li><a class="dropdown-item" href="Resource.aspx">Resource Details</a></li>
                                <li><a class="dropdown-item active" href="Subtask.aspx">Subtask Details</a></li>
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
            <h2 class="mb-4 pb-2 border-bottom">Subtask Details</h2>
            
            <div class="table-responsive mb-4">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1" AllowPaging="True"
                    CssClass="table table-striped table-hover" HeaderStyle-CssClass="table-dark"
                    PagerStyle-CssClass="pagination-container" PageSize="5">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="100px">
                            <ItemTemplate>
                                <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn btn-sm btn-outline-success" ToolTip="Edit">
                                    <i class="fas fa-pen"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-danger" ToolTip="Delete"
                                    OnClientClick="return confirm('Delete this subtask?');">
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
                        <asp:BoundField DataField="SUBTASKID" HeaderText="ID" ReadOnly="True" SortExpression="SUBTASKID" />
                        <asp:BoundField DataField="SUBTASKNAME" HeaderText="Name" SortExpression="SUBTASKNAME" />
                        <asp:BoundField DataField="SUBTASKSTARTDATE" HeaderText="Start Date" SortExpression="SUBTASKSTARTDATE" DataFormatString="{0:MM/dd/yyyy}" />
                        <asp:BoundField DataField="SUBTASKDUEDATE" HeaderText="Due Date" SortExpression="SUBTASKDUEDATE" DataFormatString="{0:MM/dd/yyyy}" />
                        <asp:BoundField DataField="SUBTASKSTATUS" HeaderText="Status" SortExpression="SUBTASKSTATUS" />
                        <asp:BoundField DataField="TASKID" HeaderText="Task ID" SortExpression="TASKID" />
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="«" LastPageText="»" />
                    <PagerStyle HorizontalAlign="Center" />
                </asp:GridView>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM &quot;SUBTASK&quot; WHERE &quot;SUBTASKID&quot; = :SUBTASKID" 
                InsertCommand="INSERT INTO &quot;SUBTASK&quot; (&quot;SUBTASKID&quot;, &quot;SUBTASKNAME&quot;, &quot;SUBTASKSTARTDATE&quot;, &quot;SUBTASKDUEDATE&quot;, &quot;SUBTASKSTATUS&quot;, &quot;TASKID&quot;) VALUES (:SUBTASKID, :SUBTASKNAME, :SUBTASKSTARTDATE, :SUBTASKDUEDATE, :SUBTASKSTATUS, :TASKID)" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;SUBTASKID&quot;, &quot;SUBTASKNAME&quot;, &quot;SUBTASKSTARTDATE&quot;, &quot;SUBTASKDUEDATE&quot;, &quot;SUBTASKSTATUS&quot;, &quot;TASKID&quot; FROM &quot;SUBTASK&quot;" 
                UpdateCommand="UPDATE &quot;SUBTASK&quot; SET &quot;SUBTASKNAME&quot; = :SUBTASKNAME, &quot;SUBTASKSTARTDATE&quot; = :SUBTASKSTARTDATE, &quot;SUBTASKDUEDATE&quot; = :SUBTASKDUEDATE, &quot;SUBTASKSTATUS&quot; = :SUBTASKSTATUS, &quot;TASKID&quot; = :TASKID WHERE &quot;SUBTASKID&quot; = :SUBTASKID">
                <DeleteParameters>
                    <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                    <asp:Parameter Name="SUBTASKNAME" Type="String" />
                    <asp:Parameter Name="SUBTASKSTARTDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKDUEDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SUBTASKNAME" Type="String" />
                    <asp:Parameter Name="SUBTASKSTARTDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKDUEDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                    <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKNAME&quot; FROM &quot;TASK&quot;">
            </asp:SqlDataSource>
            
            <div class="form-section">
                <h4 class="mb-3">Add Subtask</h4>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1" Width="100%">
                    <EditItemTemplate>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Subtask ID:</label>
                                <asp:Label ID="SUBTASKIDLabel1" runat="server" Text='<%# Eval("SUBTASKID") %>' CssClass="form-control-plaintext" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Subtask Name:</label>
                                <asp:TextBox ID="SUBTASKNAMETextBox" runat="server" Text='<%# Bind("SUBTASKNAME") %>' CssClass="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Start Date:</label>
                                <asp:TextBox ID="SUBTASKSTARTDATETextBox" runat="server" Text='<%# Bind("SUBTASKSTARTDATE") %>' CssClass="form-control" TextMode="Date" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Due Date:</label>
                                <asp:TextBox ID="SUBTASKDUEDATETextBox" runat="server" Text='<%# Bind("SUBTASKDUEDATE") %>' CssClass="form-control" TextMode="Date" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Status:</label>
                                <asp:DropDownList ID="SUBTASKSTATUSDropDown" runat="server" CssClass="form-select" SelectedValue='<%# Bind("SUBTASKSTATUS") %>'>
                                    <asp:ListItem Value="Not Started">Not Started</asp:ListItem>
                                    <asp:ListItem Value="In Progress">In Progress</asp:ListItem>
                                    <asp:ListItem Value="Completed">Completed</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Related Task:</label>
                                <asp:DropDownList ID="TASKIDDropDown" runat="server" CssClass="form-select" 
                                    DataSourceID="SqlDataSource2" DataTextField="TASKNAME" DataValueField="TASKID" 
                                    SelectedValue='<%# Bind("TASKID") %>'>
                                </asp:DropDownList>
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
                                <label class="form-label">Subtask ID:</label>
                                <asp:TextBox ID="SUBTASKIDTextBox" runat="server" Text='<%# Bind("SUBTASKID") %>' CssClass="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Subtask Name:</label>
                                <asp:TextBox ID="SUBTASKNAMETextBox" runat="server" Text='<%# Bind("SUBTASKNAME") %>' CssClass="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Start Date:</label>
                                <asp:TextBox ID="SUBTASKSTARTDATETextBox" runat="server" Text='<%# Bind("SUBTASKSTARTDATE") %>' CssClass="form-control" TextMode="Date" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Due Date:</label>
                                <asp:TextBox ID="SUBTASKDUEDATETextBox" runat="server" Text='<%# Bind("SUBTASKDUEDATE") %>' CssClass="form-control" TextMode="Date" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Status:</label>
                                <asp:DropDownList ID="SUBTASKSTATUSDropDown" runat="server" CssClass="form-select" SelectedValue='<%# Bind("SUBTASKSTATUS") %>'>
                                    <asp:ListItem Value="Completed">Completed</asp:ListItem>
                                    <asp:ListItem Value="In Progress">In Progress</asp:ListItem>
                                    <asp:ListItem Value="On Hold">On Hold</asp:ListItem>
                                    <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                    <asp:ListItem Value="Delayed">Delayed</asp:ListItem>
                                    <asp:ListItem Value="Cancelled">Cancelled</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Related Task:</label>
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select" 
                                    AutoPostBack="True" DataSourceID="SqlDataSource2" 
                                    DataTextField="TASKNAME" DataValueField="TASKID" 
                                    SelectedValue='<%# Bind("TASKID") %>'>
                                </asp:DropDownList>
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
                                <i class="fas fa-plus me-1"></i> Add New Subtask
                            </asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </form>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>