var userScript2 = (function() {

	const ctx = document.getElementById("myChart2").getContext("2d");

	let delayed;
	

	/const DATA_COUNT = 8;/
	const labels = ['1965', '1975', '1985', '1995', '2005', '2015'];
	
	const data = {
		labels:labels,
		datasets: [
			{
				label: 'UNITED STATES',
				data: [100, 106.5, 194.7, 196.5, 191.9, 175.1],
				backgroundColor: "rgba(180, 195, 199, 0.1)",
			},
			{
				label: 'CHINA',
				data: [391.2, 391.2, 415.2, 407.7, 360, 385.2],
				backgroundColor: "rgba(0, 210, 255, 0.3)",
			},
			{
				label: 'CENTRAL EUROPE',
				data: [70, 72, 85, 73, 69, 68],
				backgroundColor:  "rgba(0, 230, 275, 0.1)",
			},
		]
	};

	const config = {
		type: 'bar',
		data: data,
		options: {
			animation: {
				onComplete: () => {
					delayed = true;
				},
				delay: (context) => {
					let delay = 0;
					if (context.type === 'data' && context.mode === 'default' && !delayed) {
						delay = context.dataIndex * 300 + context.datasetIndex * 100;
					}
					return delay;
				},
			},
			scales: {
				x: {
					stacked: true,
				},
				y: {
					beginAtZero: true,
					ticks: {
						callback: function(value) {
							return value + " billion m³ " ;
						},
					}
				}
			}
		}
	};

	const myChart2 = new Chart(ctx, config);

})(this);