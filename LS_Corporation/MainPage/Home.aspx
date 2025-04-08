<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="LS_Corporation.MainPage.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        .hero-section { text-align: center; padding: 30px 0; }
        .hero-section img { max-width: 100%; height: 450px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.2); margin-bottom: 50px; margin-top: 30px;}
        .container { 
            background-color: white; border-radius: 8px; box-shadow: 0 0 15px rgba(0,0,0,0.1); padding: 25px; margin-top: 20px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark mb-4">
            <div class="container-fluid">
                <a class="navbar-brand" href="Home.aspx">
                    <img src="<%= ResolveUrl("~/Images/logo.png") %>" alt="LS Corporation Logo" />
                    <span>  Corporation</span>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="Dashboard.aspx"><i class="fas fa-home me-1"></i> Dashboard</a>
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
                            <a class="nav-link dropdown-toggle" href="#" id="complexDropdown" role="button" data-bs-toggle="dropdown">
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
            <div class="hero-section">
                <h1 class="mb-4">Welcome to LS Corporation Project Management System</h1>
                <img src="<%= ResolveUrl("~/Images/Main.png") %>" alt="Project Management" class="img-fluid" />
                <p class="lead mt-3">Welcome to LS Corporation's Project Management System, designed to simplify and improve the way we manage projects. The system helps teams stay organized by keeping track of tasks, milestones, and deadlines in one central place. It allows users to collaborate easily, with the ability to assign tasks, add comments, and share updates. Each project is broken down into clear milestones to ensure progress is on track, and resources are managed efficiently. With this system, teams can work together smoothly, stay updated, and complete projects on time and within scope.</p>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
