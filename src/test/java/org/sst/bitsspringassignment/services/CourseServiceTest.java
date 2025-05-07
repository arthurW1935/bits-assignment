package org.sst.bitsspringassignment.services;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.sst.bitsspringassignment.models.Courses;
import org.sst.bitsspringassignment.repository.CourseRepository;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import static org.mockito.Mockito.*;
import static org.assertj.core.api.Assertions.assertThat;

class CourseServiceTest {

    @Mock
    private CourseRepository courseRepository;

    @InjectMocks
    private CourseService courseService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testGetAllCourses() {
        // Arrange
        Courses course1 = new Courses();
        course1.setId(1L);
        course1.setTitle("Course 1");

        Courses course2 = new Courses();
        course2.setId(2L);
        course2.setTitle("Course 2");

        when(courseRepository.findAll()).thenReturn(Arrays.asList(course1, course2));

        // Act
        List<Courses> courses = courseService.getAllCourses();

        // Assert
        assertThat(courses).hasSize(2);
        assertThat(courses).extracting(Courses::getTitle)
                .containsExactlyInAnyOrder("Course 1", "Course 2");
        verify(courseRepository, times(1)).findAll();
    }

    @Test
    void testSaveCourse() {
        // Arrange
        Courses course = new Courses();
        course.setTitle("New Course");

        Courses savedCourse = new Courses();
        savedCourse.setId(1L);
        savedCourse.setTitle("New Course");

        when(courseRepository.save(any(Courses.class))).thenReturn(savedCourse);

        // Act
        Courses result = courseService.saveCourse(course);

        // Assert
        assertThat(result).isNotNull();
        assertThat(result.getId()).isEqualTo(1L);
        assertThat(result.getTitle()).isEqualTo("New Course");
        verify(courseRepository, times(1)).save(any(Courses.class));
    }

    @Test
    void testGetCourseById() {
        // Arrange
        Courses course = new Courses();
        course.setId(1L);
        course.setTitle("Test Course");

        when(courseRepository.findById(1L)).thenReturn(Optional.of(course));

        // Act
        Courses result = courseService.getCourseById(1L);

        // Assert
        assertThat(result).isNotNull();
        assertThat(result.getId()).isEqualTo(1L);
        assertThat(result.getTitle()).isEqualTo("Test Course");
        verify(courseRepository, times(1)).findById(1L);
    }

    @Test
    void testGetCourseByIdNotFound() {
        // Arrange
        when(courseRepository.findById(999L)).thenReturn(Optional.empty());

        // Act
        Courses result = courseService.getCourseById(999L);

        // Assert
        assertThat(result).isNull();
        verify(courseRepository, times(1)).findById(999L);
    }
} 