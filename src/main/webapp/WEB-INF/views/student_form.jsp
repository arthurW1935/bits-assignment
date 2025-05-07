<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 600px;
            margin: 20px auto;
        }
        .course-checkboxes {
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="form-container">
            <h2 class="mb-4">Add/Edit Student</h2>
            
            <form action="/student/save" method="post" class="needs-validation" novalidate>
                <input type="hidden" name="id" value="${student.id}" />
                
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="${student.name}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Courses</label>
                    <div class="course-checkboxes">
                        <c:forEach var="course" items="${courses}">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="courses" value="${course.id}" 
                                    id="course${course.id}" ${student.courses.contains(course) ? 'checked' : ''}>
                                <label class="form-check-label" for="course${course.id}">
                                    ${course.title}
                                </label>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-primary">Save</button>
                    <a href="/" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Form validation
        (function () {
            'use strict'
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        })()
    </script>
</body>
</html>
