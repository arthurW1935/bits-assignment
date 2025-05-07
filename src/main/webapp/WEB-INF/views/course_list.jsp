<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Course Management</title>
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
        <h2 class="mb-4">Course Management</h2>
        
        <div class="nav-buttons">
            <a href="/courses/add" class="btn btn-primary">Add New Course</a>
            <a href="/" class="btn btn-secondary ms-2">View Students</a>
        </div>

        <div class="table-container">
            <table class="table table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Title</th>
                        <th>Enrolled Students</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="course" items="${courses}">
                        <tr>
                            <td>${course.title}</td>
                            <td>
                                <c:forEach var="student" items="${course.students}">
                                    <span class="badge bg-success me-1">${student.name}</span>
                                </c:forEach>
                            </td>
                            <td>
                                <a href="/courses/edit/${course.id}" class="btn btn-sm btn-warning">Edit</a>
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