// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Pie Chart Example

const movieTitle1 = document.getElementById("movieTitle1").value
const movieTitle2 = document.getElementById("movieTitle2").value
const movieTitle3 = document.getElementById("movieTitle3").value
const movieTitle4 = document.getElementById("movieTitle4").value

const totalPeople1 = document.getElementById("totalPeople1").value
const totalPeople2 = document.getElementById("totalPeople2").value
const totalPeople3 = document.getElementById("totalPeople3").value
const totalPeople4 = document.getElementById("totalPeople4").value


var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: [movieTitle1, movieTitle2, movieTitle3, movieTitle4],
    datasets: [{
      data: [totalPeople1, totalPeople2,totalPeople3, totalPeople4],
      backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745'],
    }],
  },
});
