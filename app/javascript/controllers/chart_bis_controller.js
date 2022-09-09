import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chart"
export default class extends Controller {
  connect() {
      console.log("coucou")

    let ctd = document.getElementById('myChartd').getContext('2d');
    let value = document.getElementById("datad").innerHTML;
    value = value.split("-")
    let bobo = document.getElementById("valued").innerHTML;
    let data = bobo.split("-")
    console.log(value)
    console.log(bobo)


    let myChartd = new Chart(ctd, {
    type: 'radar',
    data: {
      labels: ['Vineux', 'Epicé', 'Boisé', 'Animal', 'Fruité', 'Floral', 'Herbacé', 'Céréale', 'Empyreumatique', 'Tourbé'],

      datasets: [{
        label: 'Mon profil',
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
          borderWidth: 3,
        }
      }
    },
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
          grid: {
            color: "rgb(81, 74, 74)",
          },
          pointLabels: {
            color: "rgb(20, 20, 20)",
          },
          min: 0,
          ticks: {
              display: false // Hides the labels in the middel (numbers)
          },
        }
      }
    },
    });

    let ctw = document.getElementById('myChartw').getContext('2d');
    value = document.getElementById("dataw").innerHTML;
    console.log(value)
    value = value.replace("\n","").split("-")
    console.log(value)
    bobo = document.getElementById("valuew").innerHTML;

    data = bobo.split("-")
    console.log("whisky")
    let myChartw = new Chart(ctw, {
    type: 'radar',
    data: {
      labels: ['Vineux', 'Epicé', 'Boisé', 'Animal', 'Fruité', 'Floral', 'Herbacé', 'Céréale', 'Empyreumatique', 'Tourbé'],

      datasets: [{
        label: 'Whisky',
        data: value,
        fill: true,
        backgroundColor: 'rgba(151, 111, 41, 0.2)',
        borderColor: 'rgb(151, 111, 41)',
        pointBackgroundColor: 'rgb(151, 111, 41)',
        pointBorderColor: '#fff',
        pointHoverBackgroundColor: '#fff',
        pointHoverBorderColor: 'rgb(151, 111, 41)'
      },],
      options: {
      elements: {
        line: {
          borderWidth: 3
        }
      }
    },
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
          grid: {
            color: "rgb(81, 74, 74)",
          },
          pointLabels: {
            color: "rgb(20, 20, 20)",
          },
          min: 0,
            ticks: {
                display: false // Hides the labels in the middel (numbers)
            }
        }
      }
    },
    });

    console.log('gin')
    let ctg = document.getElementById('myChartg').getContext('2d');
    value = document.getElementById("datag").innerHTML;
    console.log(value)
    value = value.split("-")
    bobo = document.getElementById("valueg").innerHTML;
    console.log(bobo)
    data = bobo.split("-")

    let myChartg = new Chart(ctg, {
    type: 'radar',
    data: {
      labels: ['Vineux', 'Epicé', 'Boisé', 'Animal', 'Fruité', 'Floral', 'Herbacé', 'Céréale', 'Empyreumatique', 'Tourbé'],

      datasets: [{
        label: 'Gin',
        data: value,
        fill: true,
        backgroundColor: 'rgba(217, 225, 197, 0.2)',
        borderColor: 'rgb(217, 225, 197)',
        pointBackgroundColor: 'rgb(217, 225, 197)',
        pointBorderColor: '#fff',
        pointHoverBackgroundColor: '#fff',
        pointHoverBorderColor: 'rgb(217, 225, 197)'
      },],
      options: {
      elements: {
        line: {
          borderWidth: 3
        }
      }
    },
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
          grid: {
            color: "rgb(81, 74, 74)",
          },
          pointLabels: {
            color: "rgb(20, 20, 20)",
          },
          min: 0,
            ticks: {
                display: false // Hides the labels in the middel (numbers)
            }
        }
      }
    },
    });

    console.log('rhum')
    let ctr = document.getElementById('myChartr').getContext('2d');
    value = document.getElementById("datar").innerHTML;
    value = value.split("-")
    bobo = document.getElementById("valuer").innerHTML;
    data = bobo.split("-")

    let myChartr = new Chart(ctr, {
    type: 'radar',
    data: {
      labels: ['Vineux', 'Epicé', 'Boisé', 'Animal', 'Fruité', 'Floral', 'Herbacé', 'Céréale', 'Empyreumatique', 'Tourbé'],

      datasets: [{
        label: 'Rhum',
        data: value,
        fill: true,
        backgroundColor: 'rgba(253, 206, 167, 0.2)',
        borderColor: 'rgb(253, 206, 167)',
        pointBackgroundColor: 'rgb(253, 206, 167)',
        pointBorderColor: '#fff',
        pointHoverBackgroundColor: '#fff',
        pointHoverBorderColor: 'rgb(253, 206, 167)'
      },],
      options: {
      elements: {
        line: {
          borderWidth: 3
        }
      }
    },
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
          grid: {
            color: "rgb(81, 74, 74)",
          },
          pointLabels: {
            color: "rgb(20, 20, 20)",
          },
          min: 0,
            ticks: {
                display: false // Hides the labels in the middel (numbers)
            }
        }
      }
    },
    });

    console.log('tequila')
    let ctt = document.getElementById('myChartt').getContext('2d');
    value = document.getElementById("datat").innerHTML;
    value = value.split("-")
    bobo = document.getElementById("valuet").innerHTML;
    data = bobo.split("-")

    let myChartt = new Chart(ctt, {
    type: 'radar',
    data: {
      labels: ['Vineux', 'Epicé', 'Boisé', 'Animal', 'Fruité', 'Floral', 'Herbacé', 'Céréale', 'Empyreumatique', 'Tourbé'],

      datasets: [{
        label: 'Tequila',
        data: value,
        fill: true,
        backgroundColor: 'rgba(190, 205, 198, 0.2)',
        borderColor: 'rgb(190, 205, 198)',
        pointBackgroundColor: 'rgb(190, 205, 198)',
        pointBorderColor: '#fff',
        pointHoverBackgroundColor: '#fff',
        pointHoverBorderColor: 'rgb(190, 205, 198)'
      },],
      options: {
      elements: {
        line: {
          borderWidth: 3
        }
      }
    },
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
          grid: {
            color: "rgb(81, 74, 74)",
          },
          pointLabels: {
            color: "rgb(20, 20, 20)",
          },
          min: 0,
            ticks: {
                display: false // Hides the labels in the middel (numbers)
            }
        }
      }
    },
    });


    console.log('cognac')
    let ctc = document.getElementById('myChartc').getContext('2d');
    value = document.getElementById("datac").innerHTML;
    value = value.split("-")
    bobo = document.getElementById("valuec").innerHTML;
    data = bobo.split("-")

    let myChartc = new Chart(ctc, {
    type: 'radar',
    data: {
      labels: ['Vineux', 'Epicé', 'Boisé', 'Animal', 'Fruité', 'Floral', 'Herbacé', 'Céréale', 'Empyreumatique', 'Tourbé'],

      datasets: [{
        label: 'Cognac',
        data: value,
        fill: true,
        backgroundColor: 'rgba(187, 97, 68, 0.2)',
        borderColor: 'rgb(187, 97, 68)',
        pointBackgroundColor: 'rgb(187, 97, 68)',
        pointBorderColor: '#fff',
        pointHoverBackgroundColor: '#fff',
        pointHoverBorderColor: 'rgb(187, 97, 68)'
      },],
      options: {
      elements: {
        line: {
          borderWidth: 3
        }
      }
    },
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
          grid: {
            color: "rgb(81, 74, 74)",
          },
          pointLabels: {
            color: "rgb(20, 20, 20)",
          },
          min: 0,
            ticks: {
                display: false // Hides the labels in the middel (numbers)
            }
        }
      }
    },
    });

    console.log('calvados')
    let ctca = document.getElementById('myChartca').getContext('2d');
    value = document.getElementById("dataca").innerHTML;
    value = value.split("-")
    bobo = document.getElementById("valueca").innerHTML;
    data = bobo.split("-")

    let myChartca = new Chart(ctca, {
    type: 'radar',
    data: {
      labels: ['Vineux', 'Epicé', 'Boisé', 'Animal', 'Fruité', 'Floral', 'Herbacé', 'Céréale', 'Empyreumatique', 'Tourbé'],

      datasets: [{
        label: 'Calvados',
        data: value,
        fill: true,
        backgroundColor: 'rgba(169, 142, 121, 0.2)',
        borderColor: 'rgb(169, 142, 121)',
        pointBackgroundColor: 'rgb(169, 142, 121)',
        pointBorderColor: '#fff',
        pointHoverBackgroundColor: '#fff',
        pointHoverBorderColor: 'rgb(169, 142, 121)'
      },],
      options: {
      elements: {
        line: {
          borderWidth: 3
        }
      }
    },
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
          grid: {
            color: "rgb(81, 74, 74)",
          },
          pointLabels: {
            color: "rgb(20, 20, 20)",
          },
          min: 0,
            ticks: {
                display: false // Hides the labels in the middel (numbers)
            }
        }
      }
    },
    });

    console.log('mezcal')
    let ctm = document.getElementById('myChartm').getContext('2d');
    value = document.getElementById("datam").innerHTML;
    value = value.split("-")
    bobo = document.getElementById("valuem").innerHTML;
    data = bobo.split("-")

    let myChartm = new Chart(ctm, {
    type: 'radar',
    data: {
      labels: ['Vineux', 'Epicé', 'Boisé', 'Animal', 'Fruité', 'Floral', 'Herbacé', 'Céréale', 'Empyreumatique', 'Tourbé'],

      datasets: [{
        label: 'Mezcal',
        data: value,
        fill: true,
        backgroundColor: 'rgba(235, 211, 151)',
        borderColor: 'rgb(235, 211, 151)',
        pointBackgroundColor: 'rgb(235, 211, 151)',
        pointBorderColor: '#fff',
        pointHoverBackgroundColor: '#fff',
        pointHoverBorderColor: 'rgb(235, 211, 151)'
      },],
      options: {
      elements: {
        line: {
          borderWidth: 3
        }
      }
    },
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
          grid: {
            color: "rgb(81, 74, 74)",
          },
          pointLabels: {
            color: "rgb(20, 20, 20)",
          },
          min: 0,
            ticks: {
                display: false // Hides the labels in the middel (numbers)
            }
        }
      }
    },
    });

    console.log('vodka')
    let ctv = document.getElementById('myChartv').getContext('2d');
    value = document.getElementById("datav").innerHTML;
    value = value.split("-")
    bobo = document.getElementById("valuev").innerHTML;
    data = bobo.split("-")

    let myChartv = new Chart(ctv, {
    type: 'radar',
    data: {
      labels: ['Vineux', 'Epicé', 'Boisé', 'Animal', 'Fruité', 'Floral', 'Herbacé', 'Céréale', 'Empyreumatique', 'Tourbé'],

      datasets: [{
        label: 'Vodka',
        data: value,
        fill: true,
        backgroundColor: 'rgba(191, 192, 237)',
        borderColor: 'rgb(191, 192, 237)',
        pointBackgroundColor: 'rgb(191, 192, 237)',
        pointBorderColor: '#fff',
        pointHoverBackgroundColor: '#fff',
        pointHoverBorderColor: 'rgb(191, 192, 237)'
      },],
      options: {
      elements: {
        line: {
          borderWidth: 3
        }
      }
    },
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
          grid: {
            color: "rgb(81, 74, 74)",
          },
          pointLabels: {
            color: "rgb(20, 20, 20)",
          },
          min: 0,
            ticks: {
                display: false // Hides the labels in the middel (numbers)
            }
        }
      }
    },
    });



    console.log('armagnac')
    let cta = document.getElementById('myCharta').getContext('2d');
    value = document.getElementById("dataa").innerHTML;
    value = value.split("-")

    bobo = document.getElementById("valuea").innerHTML;
    data = bobo.split("-")

    let myCharta = new Chart(cta, {
    type: 'radar',
    data: {
      labels: ['Vineux', 'Epicé', 'Boisé', 'Animal', 'Fruité', 'Floral', 'Herbacé', 'Céréale', 'Empyreumatique', 'Tourbé'],

      datasets: [{
        label: 'Armagnac',
        data: value,
        backgroundColor: 'rgba(134, 108, 120)',
        borderColor: 'rgb(134, 108, 120)',
        pointBackgroundColor: 'rgb(134, 108, 120)',
        pointBorderColor: '#fff',
        pointHoverBackgroundColor: '#fff',
        pointHoverBorderColor: 'rgb(134, 108, 120)'
      },],
      options: {
      elements: {
        line: {
          borderWidth: 3
        }
      }
    },
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
          grid: {
            color: "rgb(81, 74, 74)",
          },
          pointLabels: {
            color: "rgb(20, 20, 20)",
          },
          min: 0,
            ticks: {
                display: false // Hides the labels in the middel (numbers)
            }
        }
      }
    },
    });
  }}
