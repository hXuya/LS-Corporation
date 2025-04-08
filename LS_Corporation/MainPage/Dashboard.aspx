<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="LS_Corporation.MainPage.Dashboard" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        body { background-color: #f8f9fa; padding-top: 70px; }
        .container { background-color: white; border-radius: 8px; box-shadow: 0 0 15px rgba(0,0,0,0.1); padding: 25px; margin-top: 20px; }
        .chart-container { background-color: #f8f9fa; padding: 20px; border-radius: 6px; margin-top: 20px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); text-align: center; }
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
        .navbar-brand img { height: 50px; margin-right: 10px; }
        .navbar-brand span { color: white; font-size: 1.5rem; font-weight: bold; }
        .navbar-nav { display: flex; justify-content: center; width: auto; }
        .navbar-nav .nav-item { margin: 0 25px; }
        .navbar-nav .nav-link { padding: 10px 15px; }
        .dropdown-menu { border-radius: 6px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); border: 1px solid #ddd; }
        .dropdown-item:hover { background-color: #f8f9fa; }
        .chart-title { 
            font-size: 1.2rem; 
            font-weight: bold; 
            margin-bottom: 15px; 
            color: #444444; 
            border-bottom: 1px solid #ddd; 
            padding-bottom: 10px; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark mb-4">
            <div class="container-fluid">
                <a class="navbar-brand" href="Home.aspx">
                    <img src="<%= ResolveUrl("~/Images/logo.png") %>" alt="LS Corporation Logo" />
                    <span>Corporation</span>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" href="Dashboard.aspx"><i class="fas fa-home me-1"></i> Dashboard</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="basicDropdown" role="button" data-bs-toggle="dropdown">
                                <i class="fas fa-folder me-1"></i> Basic WebForm
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../BasicWebForm/User.aspx">User Details</a></li>
                                <li><a class="dropdown-item" href="../BasicWebForm/Project.aspx">Project Details</a></li>
                                <li><a class="dropdown-item" href="../BasicWebForm/Task.aspx">Task Details</a></li>
                                <li><a class="dropdown-item" href="../BasicWebForm/Resource.aspx">Resource Details</a></li>
                                <li><a class="dropdown-item" href="../BasicWebForm/Subtask.aspx">Subtask Details</a></li>
                                <li><a class="dropdown-item" href="../BasicWebForm/Milestone.aspx">Milestone Details</a></li>
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
            <h2 class="mb-4 pb-2 border-bottom">
                Dashboard
            </h2>
            
            <div class="row">
                <!-- Project Status Chart -->
                <div class="col-md-4">
                    <div class="chart-container">
                        <div class="chart-title">
                            Project Status
                        </div>
                        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="350" Height="300">
                            <Series>
                                <asp:Series ChartType="Bar" Name="Series1" XValueMember="PROJECTSTATUS" YValueMembers="PROJECTCOUNT" 
                                    IsValueShownAsLabel="true" LabelFormat="{0}" Color="#4472C4">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                    <AxisX Title="Status" LineColor="#444444">
                                        <MajorGrid LineColor="#e5e5e5" />
                                    </AxisX>
                                    <AxisY Title="Count" LineColor="#444444">
                                        <MajorGrid LineColor="#e5e5e5" />
                                    </AxisY>
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </div>
                </div>
                
                <!-- Task Status Chart -->
                <div class="col-md-4">
                    <div class="chart-container">
                        <div class="chart-title">
                            Task Status
                        </div>
                        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" Width="350" Height="300">
                            <Series>
                                <asp:Series ChartType="Doughnut" Name="Series1" XValueMember="TASKSTATUS" YValueMembers="TASKCOUNT" 
                                    IsValueShownAsLabel="true" LabelFormat="{0}" Palette="BrightPastel">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                    <Area3DStyle Enable3D="true" Inclination="30" />
                                </asp:ChartArea>
                            </ChartAreas>
                            <Legends>
                                <asp:Legend Alignment="Center" Docking="Bottom" IsDockedInsideChartArea="false" Name="Default" />
                            </Legends>
                        </asp:Chart>
                    </div>
                </div>
                
                <!-- Completed Milestones Chart -->
                <div class="col-md-4">
                    <div class="chart-container">
                        <div class="chart-title">
                            Completed Milestones by Month
                        </div>
                        <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource3" Width="350" Height="300">
                            <Series>
                                <asp:Series ChartType="Pie" Name="Series1" XValueMember="MONTH" YValueMembers="MILESTONECOUNT" 
                                    IsValueShownAsLabel="true" LabelFormat="{0}" Palette="Excel">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                    <Area3DStyle Enable3D="true" Inclination="30" />
                                </asp:ChartArea>
                            </ChartAreas>
                            <Legends>
                                <asp:Legend Alignment="Center" Docking="Bottom" IsDockedInsideChartArea="false" Name="Default" />
                            </Legends>
                        </asp:Chart>
                    </div>
                </div>
            </div>
            
            <!-- Data Sources -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT ProjectStatus, COUNT(*) AS ProjectCount FROM Project GROUP BY ProjectStatus ORDER BY ProjectStatus">
            </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT TaskStatus, COUNT(*) AS TaskCount FROM Task GROUP BY TaskStatus ORDER BY TaskStatus">
            </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT TO_CHAR(MilestoneDueDate, 'YYYY-MM') AS Month, COUNT(*) AS MilestoneCount FROM Milestone WHERE MilestoneStatus = 'Completed' GROUP BY TO_CHAR(MilestoneDueDate, 'YYYY-MM') ORDER BY Month">
            </asp:SqlDataSource>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>