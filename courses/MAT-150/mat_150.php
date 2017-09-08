<?php
?>
<html>
<!DOCTYPE HTML>
<head>
    <title>Linear Algebra</title>
</head>

<link rel='stylesheet' type='text/css' href='../../stylesheet.css'>

<body>
<!-- Title -->
<div class="title">
  <h2>MAT-150: Linear Algebra</h2>
</div>
<!-- Split page into two parts -->
<div style="width: 100%">
  <!--Left Margin -->
  <div style="float: left; width: 30%">
  <!-- Info -->
  <div class="header">
    <h3>Course Information</h3>
  </div>
  <hr class="hrstyle-one" style="width: 50%">
  <div class="list">
    <ul>
      <li><strong>Time: </strong> M,W,F 9:30 - 10:20 am</li>
      <li><strong>Place: </strong> CHAM B027 (classroom), LIB B110 (lab)</li>
      <li><strong>Important Dates</strong>
      <hr class="hrstyle-two" style="width: 25%">
        <ul>
          <li><strong>Midterm: </strong>October 6 - 13</li>
          <li><strong><a href="https://www.davidson.edu/academics/mathematics-and-computer-science/student-activities/bernard-lecture" target="_blank">Bernard Lecture:</a> </strong>October 23
          <li><strong>Final: </strong>December 8 - 14</li>
        </ul>
      </li>
      <li><strong>Links </strong>
      <hr class="hrstyle-two" style="width: 25%">
        <ul>
          <li><a href="mat_150_syllabus.pdf" target="_blank">Syllabus</a></li>
          <li><a href="" target="_blank">Grades</a></li>
        </ul>
      </li>
    </ul>
  </div>
  <hr class="hrstyle-one" style="width: 50%">
  </div>
  <!-- Right Margin -->
  <div style="float: left; width: 70%">
  <!-- Calender -->
  <div class="header">
    <h3>Calender of Events</h3>
  </div>
  <hr class="hrstyle-one" style="width: 50%">
  <div class="schedule-container">
    <!-- Week 1 -->
    <div class="mySlides fade">
      <div class="header"><h3>Week 1 (8/21 - 8/25)</h3></div>
      <table width="100%" align="center" class="schedule">
      <tr>
        <th>Monday</th><th>Wednesday</th><th>Friday</th>
      </tr>
      <tr>
        <td>Introduction<br>Motivation for Systems of Linear of Equations<br><strong>Read: Section 1.1</strong></td><td>Solving Linear Systems<br>and Vector Equations<br><strong>Read: Section 1.2-1.3</strong></td><td>Lab Day<br><strong><a href="notebooks/MAT_150_Lab1.nb">Lab 1: Due 8/28/2017</a></strong><br><strong><a href="efy/efy1.pdf">EFY1 Solution</a></strong><br><strong><a href="notebooks/MAT_150_Solution1.nb">Lab1 Solution</a></strong></td>
      </tr>
      </table>
    </div>
    <!-- Week 2 -->
    <div class="mySlides fade">
      <div class="header"><h3>Week 2 (8/28 - 9/1)</h3></div>
      <table width="100%" align="center" class="schedule">
      <tr>
        <th>Monday</th><th>Wednesday</th><th>Friday</th>
      </tr>
      <tr>
        <td>Matrix Equations<br>Solution Sets of Linear Equations<br><strong>Read: Section 1.4-1.5</strong></td><td>Applications of Linear Systems<br><strong>Read: Section 1.6</strong><br><strong><a href="efy/efy2.pdf">EFY2 Solution</a></strong></td><td>Linear Independence<br><strong><a href="homework/homework1.pdf">Homework 1: Due Today</a></strong><br><strong>Read: Section 1.7<br><strong><a href="homework/solution1.pdf">Solution 1</a></strong></td>
      </tr>
      </table>
    </div>
    <!-- Week 3 -->
    <div class="mySlides fade">
      <div class="header"><h3>Week 3 (9/4 - 9/8)</h3></div>
      <table width="100%" align="center" class="schedule">
      <tr>
        <th>Monday</th><th>Wednesday</th><th>Friday</th>
      </tr>
      <tr>
        <td>Linear Transformations<br>Acting on Vectors<br><strong>Read: Section 1.8</strong></td><td>Matrix Representations<br>of Linear Transformations<br><strong>Read: Section 1.9</strong><br><strong><a href="efy/efy3.pdf">EFY3 Solution</a></strong></td><td>Lab Day<br><strong><a href="notebooks/MAT_150_Lab2.nb">Lab 2: Due 9/11/2017</a></strong></td>
      </tr>
      </table>
    </div>
    <!-- Week 4 -->
    <div class="mySlides fade">
      <div class="header"><h3>Week 4 (9/11 - 9/15)</h3></div>
      <table width="100%" align="center" class="schedule">
      <tr>
        <th>Monday</th><th>Wednesday</th><th>Friday</th>
      </tr>
      <tr>
        <td>Matrix Operations<br>the Matrix Exponential<br><strong>Read: Section 2.1</strong></td><td>The Inverse<br>of a Matrix<br><strong>Read: Section 2.2-2.3</strong></td><td>Matrix Factorizations<br>solving Matrix Equations<br><strong><a href="homework/homework2.pdf">Homework 2: Due Today</a></strong><br><strong>Read: Section 2.5</strong></td>
      </tr>
      </table>
    </div>
    <!-- Week 5 -->
    <div class="mySlides fade">
      <div class="header"><h3>Week 5 (9/18 - 9/22)</h3></div>
      <table width="100%" align="center" class="schedule">
      <tr>
        <th>Monday</th><th>Wednesday</th><th>Friday</th>
      </tr>
      <tr>
        <td></td><td></td><td>Lab Day<br><strong><a href="">Lab 3: Due 9/25/2017</a></strong></td>
      </tr>
      </table>
    </div>
    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>
  </div>
  <script>
  var slideIndex = 3;
  showSlides(slideIndex);

  function plusSlides(n) {
    showSlides(slideIndex += n);
  }

  function currentSlide(n) {
    showSlides(slideIndex = n);
  }

  function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    if (n > slides.length) {slideIndex = 1}
    if (n < 1) {slideIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
    }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  }
  </script>
  <hr class="hrstyle-one" style="width: 50%">
  </div>
</div>
</body>

</html>