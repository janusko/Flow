var userScript4 = (function() {

	const ctx = document.getElementById("myChart4").getContext("2d");
	
	let delayed;
		
	let labels = ["USA", "CHINA", "FRANCE", "CANADA", "THAILAND", "CONGO", "ARGENTINA", "JAPAN"];

	let dataArray = [382, 175, 149, 335, 101, 47, 387, 287];
	

	let gradient = ctx.createLinearGradient(0, 0, 0, 400);
	gradient.addColorStop(0, "rgba(0, 210, 255, 0.1)");
	gradient.addColorStop(1, '#ff6384');

	const data = {
		labels,
		datasets: [
			{
				label: 'AVERAGE CONSUMPTION',
				backgroundColor: gradient,
				borderColor: 'rgb(255, 99, 132)',
				data: dataArray,
				fill: true,
				borderColor: "rgba(0, 210, 255, 0.3)",
				pointBackgroundColor: "rgba(180, 195, 199, 0.4)",
				tension: .2,
			}]
	};

	const config = {
		type: 'line',
		data: data,
		options: {

			animation: {
				onComplete: () => {
					delayed = true;
				},
				delay: (context) => {
					let delay = 0;
					if (context.type === "data" && context.mode === "default" && !delayed) {
						delay = context.dataIndex * 300 + context.datasetIndex * 100;
					}
					return delay;
				}
			},
			radius: 5,
			hitRadius: 30,
			hoverRadius: 12,
			responsive: true,
			scales: {
				y: {
					ticks: {
						callback: function(value) {
							return value + " liters " ;
						},
					},
				},
			},
		},
	};

	const myChart4 = new Chart(ctx, config);

})(this);