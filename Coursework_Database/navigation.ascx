<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="navigation.ascx.cs" Inherits="Coursework_Database.navigation" %>

<!-- Link to Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

<style>
    /* Custom Styles for Navigation */
    nav {
        background-color: black; /* Black background */
    }

    nav ul {
        padding-left: 0;
        margin: 0;
        list-style: none;
        display: flex;
        justify-content: space-between; /* Align menu items side-by-side */
    }

    nav ul li {
        display: inline-block;
        margin-right: 15px; /* Space between links */
    }

    nav ul li a {
        color: white; /* White text */
        text-decoration: none;
        font-size: 16px;
        padding: 10px 20px;
        display: block;
    }

    /* Hover effect */
    nav ul li a:hover {
        background-color: lightgray; /* Light gray hover effect */
        color: black; /* Change text color to black when hovered */
    }
</style>

<nav>
    <ul>
        <li><a href="dashboard.aspx">Dashboard</a></li>
        <li><a href="user_details.aspx">User Details</a></li>
        <li><a href="project_details.aspx">Project Details</a></li>
        <li><a href="task_details.aspx">Task Details</a></li>
        <li><a href="subtask_details.aspx">Subtask Details</a></li>
        <li><a href="milestone_details.aspx">Milestone & Details</a></li>
        <li><a href="project_milestone.aspx">Project Milestones</a></li>
        <li><a href="top_performer.aspx">Top Performers</a></li>
        <li><a href="user_project.aspx">User & Project</a></li>
    </ul>
</nav>

<!-- Link to Bootstrap JS (Optional) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

