// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
const to1 = document.getElementById("today1").value;
const to2 = document.getElementById("today2").value;
const to3 = document.getElementById("today3").value;
const to4 = document.getElementById("today4").value;
const to5 = document.getElementById("today5").value;
const to6 = document.getElementById("today6").value;

console.log(to4)
console.log(to5)
console.log(to6)

function convertDateFormat(date) {
          return date.toLocaleDateString().replace(/\./g, '').split(' ').map((v,i)=> i > 0 && v.length < 2 ? '0' + v : v).join('-');
      }
        var now = new Date();
        const today1 = convertDateFormat(new Date());
        const today2 = convertDateFormat(new Date(now.setDate(now.getDate()-1)));
        const today3 = convertDateFormat(new Date(now.setDate(now.getDate()-1)));
        const today4 = convertDateFormat(new Date(now.setDate(now.getDate()-1)));
        const today5 = convertDateFormat(new Date(now.setDate(now.getDate()-1)));
        const today6 = convertDateFormat(new Date(now.setDate(now.getDate()-1)));

console.log("today1 : "+ to1)
console.log("today2 : "+ to2)
console.log("today3 : "+ to3)
console.log("today4 : "+ to4)
console.log("today5 : "+ to5)
console.log("today6 : "+ to6)
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: [today6+"/",today5+"/",today4+"/",today3+"/",today2+"/",today1+"/"],
    datasets: [{
      label: "day",
      lineTension: 0.3,
      backgroundColor: "rgba(2,117,216,0.2)",
      borderColor: "rgba(2,117,216,1)",
      pointRadius: 5,
      pointBackgroundColor: "rgba(2,117,216,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(2,117,216,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: [to6,to5,to4, to3, to2, to1],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 3000000,
          maxTicksLimit: 5
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
