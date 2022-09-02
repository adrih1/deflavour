import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chart"
export default class extends Controller {
  connect() {
    console.log('hello')
    var ctx = document.getElementById('myChart').getContext('2d');
    value = document.getElementById("data").innerHTML;
    value = value.split("-")
    bobo = document.getElementById("value").innerHTML;
    data = bobo.split("-")

    var myChart = new Chart(ctx, {
    type: 'radar',
    data: {
      labels: data,

      datasets: [{
        label: 'Your alcoholic profile',
        data: value,
        fill: true,
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgb(255, 99, 132)',
        pointBackgroundColor: 'rgb(255, 99, 132)',
        pointBorderColor: '#fff',
        pointHoverBackgroundColor: '#fff',
        pointHoverBorderColor: 'rgb(255, 99, 132)'
      },],
      options: {
      elements: {
        line: {
          borderWidth: 3
        }
      },
      plugins: {
        legend: {
            display: false
        },
    }
    },
    },
    });

  }
}
