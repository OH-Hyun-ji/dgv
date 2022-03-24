// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example
var ctx = document.getElementById("myBarChart");

	
	var genreTo1 = document.getElementById("genre1").value;
	var genreTo2 = document.getElementById("genre2").value;
	var genreTo3 = document.getElementById("genre3").value;
	var genreTo4 = document.getElementById("genre4").value;
	var genreTo5 = document.getElementById("genre5").value;
//	var genreTo6 = document.getElementById("genre6").value;
//	var genreTo7 = document.getElementById("genre7").value;
//	var genreTo8 = document.getElementById("genre8").value;
//	var genreTo9 = document.getElementById("genre9").value;
//	var genreTo10 = document.getElementById("genre10").value;
	
	var genreCount1 = document.getElementById("genreCount1").value;
	var genreCount2 = document.getElementById("genreCount2").value;
	var genreCount3 = document.getElementById("genreCount3").value;
	var genreCount4 = document.getElementById("genreCount4").value;
	var genreCount5 = document.getElementById("genreCount5").value;
//	var genreCount6 = document.getElementById("genreCount6").value;
//	var genreCount7 = document.getElementById("genreCount7").value;
//	var genreCount8 = document.getElementById("genreCount8").value;
//	var genreCount9 = document.getElementById("genreCount9").value;
//	var genreCount10 = document.getElementById("genreCount10").value;
	
	
	console.log("genreTo3 : "+genreTo3 )
	if(genreTo3 === "다큐멘터리"){
		
	}
	
	var arrGenreName = [genreTo1,genreTo2,genreTo3]
	var arrGenreCount =[genreCount1,genreCount2,genreCount3]
	for(let i=0;i<arrGenreCount.length;i++){
		console.log(arrGenreCount[i])
	}
	
	

var myLineChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: [genreTo1, genreTo2, genreTo3, genreTo4, genreTo5],
    datasets: [{
      label: "Revenue",
      backgroundColor: "rgba(2,117,216,1)",
      borderColor: "rgba(2,117,216,1)",
      data: [genreCount1, genreCount2, genreCount3, genreCount4, genreCount5],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'count'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 6
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 10,
          maxTicksLimit: 5
        },
        gridLines: {
          display: true
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
