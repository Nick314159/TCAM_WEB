<?php
?>
<html>
<!DOCTYPE HTML>
<head>
    <meta name=viewport content="width=device-width, initial-scale=1">
    <title>Discrete Structures</title>
</head>

<link rel='stylesheet' type='text/css' href='../../stylesheet.css'>

<body>
<!-- Title -->
<div class="title">
  <h2>CSC/MAT-220: Discrete Structures</h2>
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
      <li><strong>Place: </strong> WALL 320 (classroom), WALL 380 (lab)</li>
      <li><strong>Important Dates</strong>
      <hr class="hrstyle-two" style="width: 25%">
        <ul>
          <li><strong>Midterm: </strong>October 6 - 13</li>
          <li><strong><a href="https://www.davidson.edu/academics/mathematics-and-computer-science/student-activities/bernard-lecture">Bernard Lecture:</a> </strong>October 23
          <li><strong>Final: </strong>December 6 - 14</li>
        </ul>
      </li>
      <li><strong>Links </strong>
      <hr class="hrstyle-two" style="width: 25%">
        <ul>
          <li><a href="syllabus/mat_220_syllabus.pdf" target="_blank">Syllabus</a></li>
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
        <td>Introduction<br><a href="handouts/proof_writing_howto.pdf">Mathematical Writing</a><br><strong>Read: Section 1.1-1.2</strong></td><td>Making a lot<br>out of a definition<br><strong>Read: Section 1.3-1.4</td><td>The proof of a statement<br><a href="homework/homework1.pdf">Homework 1 Due Today</a><br><strong>Read: Section 1.5</strong></td>
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
        <td></td><td></td><td></td>
      </tr>
      </table>
    </div>
    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>
  </div>
  <script>
  var slideIndex = 1;
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
