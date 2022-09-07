import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chart"
export default class extends Controller {
  connect() {

    let ctx = document.getElementById('myChart').getContext('2d');
    let value = document.getElementById("data").innerHTML;
    value = value.split("-")
    console.log(value)
    let bobo = document.getElementById("value").innerHTML;
    let data = bobo.split("-")

    let myChart = new Chart(ctx, {
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

    },

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
        },
        scales: {
           r: {
            min: 0,
            ticks: {
              display: false // Hides the labels in the middel (numbers)
            },
            grid: {
              color: "rgb(81, 74, 74)",
            },
            pointLabels: {
              color: "rgb(20, 20, 20)",
            },
          }
        }
      },
    });
  }}
