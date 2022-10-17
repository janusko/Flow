<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flow</title>
<!-- OWN CSS -->
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="/js/app.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript" src="/js/main.js"></script>
<script type="text/javascript" src="/js/counter.js"></script>
</head>
<body onload=counter()>
	<video autoplay muted loop id="ocean">
		<source src="/img/ocean.mp4" type="video/mp4">
	</video>
	<div class="internBackground">
		<div class="header">
		<div class="logoName">
			<img src="/img/drop_logo.png" id="drop_logo" />
			<div class="title">
				<h1>FLOW</h1>
				<h2>Water Data Visualization</h2>
			</div>
			</div>
			<div class="login">
			<c:choose>
				<c:when test="${userId == null}">
					<a href="/connect">CONNECT</a>
				</c:when>
				<c:otherwise>
					<a href="/dashboard">DASHBOARD</a>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
		<div class="presentation">

			<p>Save water and it will save you... a quote told for many generations. Not only are we facing pollution issues with our water sources, but it is also estimated that we will run out of freshwater by the year 2040. Water just might be the single most important resource we have on planet Earth. Every animal, plant, and even micro-organism needs it to survive. Whether we know it or not, everything single item that we eat, buy, or use needs water to be produced.</p>

			<p>Here at FLOW, we want to protect this essential natural resource by raising awareness of water conditions, agricultural use, freshwater renewability and conservation, as well as tracking our own personal water footprint. Connect with us to create an account that will allow you to track your daily water consumption. You will then be able to compare your numbers with daily averages from around the globe. We believe that holding ourselves accountable can bring individual changes. Waters may physically separate us from one another, but the only way we can protect it is by doing it together.</p>


		</div>
<div class="api">

			<div class="apiColumnOne">
				<img src="/img/skull.png" id="skull" />
				<p>
					DEATHS CAUSED <br>BY <br>WATER RELATED <br>DISEASES
					<br>THIS YEAR
				</p>
				<p id="deathNum">
					361312
					<%-- ${waterRessources[1].counter } --%>
				</p>

			</div>

			<div class="apiColumnTwo">

				<img src="/img/allWater.png" id="allWaterIcon" />
				<p id="allWaterUsed">
					<%-- ${waterRessources[0].counter } --%>
					1930285418
				</p>
				<p>(million L)</p>
			</div>

			<div class="apiColumnThree">
				<p id="safe">
					<%-- ${waterRessources[2].counter } --%>
					781705126
				</p>
				<p>
					PEOPLE WITH NO ACCESS TO <br>A SAFE DRINKING WATER SOURCE
				</p>
			</div>
		</div>
		
		<div class="row">
			<div class="columnOneRowOne">
				<h3>Total World Water:</h3>
				<img src="/img/total_water.png" id="totalWater1" />
			</div>
			<div class="columnTwoRowOne" id="pink">
				<div class="columnTwoRowOneTop" id="green">
					<div class="columnTwoRowOnePackOneL">
						<img src="/img/big_drop_light.png" id="lightDrop" />
						<p>97% SALT WATER</p>
					</div>
					<div class="columnTwoRowOnePackOneL">
						<img src="/img/big_drop_dark.png" id="lightDrop" />
						<p>3% FRESH WATER</p>
					</div>
				</div>
				<div class="columnTwoRowOneBottom" id="green">
					<div class="columnTwoRowOneBottomLeft" id=orange>
						<div class="columnTwoRowOneBottomLeftTop" id="red"></div>
						<div class="columnTwoRowOneBottomLeftBottom" id="red">
							<div class="columnTwoRowOneLeftBottomLeft" id="blue">
								<img src="/img/drop_1.png" id="dropOne" />
							</div>
							<div class="columnTwoRowOneLeftBottomRight" id="blue">
								<ul>
									<li>RIVERS AND LAKES</li>
									<li class="liTop">GROUND WATER</li>
									<li class="liTop">ICE CAPS</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="columnTwoRowOneBottomLeftA" id="orange">
						<h4>70%</h4>
						<p id="existing">OF EXISTING FRESH WATER IS WITHDRWAN FOR
							IRRIGATION IN AGRICULTURE</p>
					</div>
				</div>
			</div>
			<div class="columnThreeRowOne" id="pink">
				<div class="columnThreeRowOneTop" id="green">
					<div>
						<img src="/img/map.png" id="map" />
					</div>
					<div>
						<p>
							GLOBAL AVERAGE WATER <br> FOOTPRINT IS AROUND
						</p>
						<h1>1,240</h1>
						<p>M³ PER YEAR PER PERSON</p>
					</div>
				</div>
				<div class="columnThreeRowOneBottom" id="green">
					<div class="columnThreeRowOneBottomLeft" id="orange">
						<div class="columnThreeRowOneBottomLeftTop" id="red">
							<h4>10 gallons</h4>
							<p>
								ON AVERAGE <br>PER DAY OF YOUR <br>WATER FOOTPRINT IS
								<br>LOST TO LEAKS <br> <span id="pourcent">(10%
									OF YOUR INDOOR USE)</span>
							</p>
						</div>
						<div class="columnThreeRowOneBottomLeftBottom" id="red">
							<img src="/img/people.png" id="people" />
							<p>
								<span id="one">1</span> in <span id="one">8</span> <br>PEOPLE
							</p>
						</div>
					</div>
					<div class="columnThreeRowOneBottomRight" id="orange">
						<img src="/img/faucet.png" id="faucet" />
						<p>
							DO NOT <br>HAVE ACCESS <br>TO CLEAN WATER
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row2">
			<div class="row2rowOne">
				<div class="row2rowOneLeft">
					<p>MAP OF THE WATER FOOTPRINT PER CAPITA, M³ PER YEAR</p>
					<div class="legend">
						<div id="light"></div>
						<div id="clear"></div>
						<div id="blue2"></div>
						<div id="darkblue"></div>
						<div id="dark"></div>
						<div id="oceanColor"></div>
						<div id="black"></div>
					</div>
					<div class=legendNum>
						<ul>
							<li>2100-2500</li>
							<li>1800-2100</li>
							<li>1500-1800</li>
							<li>1300-1500</li>
							<li>1200-1300</li>
							<li>1000-1200</li>
							<li>600-1000</li>
						</ul>
					</div>
				</div>
				<div class="row2rowOneRightMap">
					<span id="line"></span>
					<p id="pBigger">>0.01%</p>
					<p>AVAILABLE TO HUMANS</p>
				</div>
			</div>
			<div class="row2rowTwo">
				<img src="/img/map_world.png" id="mapWorld" />
			</div>
		</div>
	</div>
	
	
	
		<!-- COUNTDOWN -->
		<div class="row3">
		<div class="countDown">
			<h2>Count Down To Earth Running Out Of Fresh Water</h2>
			<iframe title='Earth running out of freshwater' src='https://www.theworldcounts.com/embeds/counters/113?background_color=transparent&color=white&font_family=%22Helvetica+Neue%22%2C+Arial%2C+sans-serif&font_size=25' id="countDown"></iframe>
			</div>
		</div>
		


		<!-- GRAPHS -->
		<div class="internBackground">
			<h2 class="titleGraph">RENEWABLE FRESHWATER RESOURCES PER CAPITA (2015)</h2>
			<div class="chart">
				<canvas id="myChart3"></canvas>
			</div>
			
			<h2 class="titleGraph" id="myGraph2">ANNUAL FRESHWATER WITHDRAWALS</h2>
			<div class="chart">
				<canvas id="myChart2"></canvas>
			</div>
			
			
			<script type="text/javascript" src="/js/graph3.js"></script>
			<script type="text/javascript">
				userScript2.myChart3();
			</script>
			
			
			<script type="text/javascript" src="/js/graph2.js"></script>
			<script type="text/javascript">
				userScript3.myChart2();
			</script>
		</div>
</body>

</html>