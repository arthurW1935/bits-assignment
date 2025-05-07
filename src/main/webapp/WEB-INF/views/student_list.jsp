<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .nav-buttons {
            margin: 20px 0;
        }
        .table-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h2 class="mb-4">Student Management</h2>
        
        <div class="nav-buttons">
            <a href="/student/add" class="btn btn-primary">Add New Student</a>
            <a href="/courses" class="btn btn-secondary ms-2">View Courses</a>
        </div>

        <div class="table-container">
            <table class="table table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Name</th>
                        <th>Courses</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="student" items="${students}">
                        <tr>
                            <td>${student.name}</td>
                            <td>
                                <c:forEach var="course" items="${student.courses}">
                                    <span class="badge bg-info me-1">${course.title}</span>
                                </c:forEach>
                            </td>
                            <td>
                                <a href="/student/edit/${student.id}" class="btn btn-sm btn-warning">Edit</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
