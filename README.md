<div align="center"><h1> FLOW</h1>
  
  <h3>Full-Stack Java: Water Consumption Data Visualization</h3>
  
 <p>FLOW allows users to create an account, using bcrypt for authentication, to keep track of their own personal water footprint. Each entry will be stored in a MySQL database, which can be referenced and deleted on the user's dashboard. Those entries will then be displayed on a graph, made with Graph.js, to allow each user to visually track see how much water they have consumed over the course of their account life.</p>
 </div>
  
  
<div align="center">
<h3>Technologies used:</h3>
<h6>Java  |  JavaScript  |  MySQL  |  CSS  |  HTML  |  bcrypt  |  External APIs  |  Graph.js</h6>
  </div>


<p align="center">
    <img src="https://user-images.githubusercontent.com/107567685/196510836-e6b4d49f-0a2e-4547-88f0-3b7123a7d078.gif" alt="front_page" width="500"/>
    <img src="https://user-images.githubusercontent.com/107567685/196510984-42f03a85-995a-483c-ba8d-49b1d782698e.gif" alt="connect" width="500"/>
    <img src="https://user-images.githubusercontent.com/107567685/196510928-1350412e-c777-4e53-a4f6-27d2b6db975a.gif" alt="dashboard" width="500"/>
    <img src="https://user-images.githubusercontent.com/107567685/196511031-6a2f8682-2326-4383-8de6-b89383627a34.gif" alt="dashboard2" width="500" />
    <img src="https://user-images.githubusercontent.com/107567685/196511592-46509b71-9542-4463-8c49-1204d7cee2c3.gif" alt="graph" width="500" />
</p>

<div>
  <h2>Installation</h2>
  <ul>
    <li>After downloading, you will need to create a new database in MySQL.</li>
    <li>Verify that all dependencies are in your pom.xml (jbcrypt, spring-boot-starter-validation, jquery, bootstrap, webjars-locator, tomcat-embed-jasper)
    <li>In Spring Tool Suite, open the application.properties file (src-> main-> resources)</li>
        <ul>
          <li>Enter your newly created schema name after the following code: spring.datasource.url={your_schema}</li>
          <li>Enter your MySQL username after the following code: spring.datasource.username={your_username}</li>
          <li>Enter your MySQL password after the following code: spring.datasource.password={your_password}</li>
          <li>spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver</li>
          <li>spring.jpa.hibernate.ddl-auto=update</li>
          <li>spring.mvc.view.prefix=/WEB-INF/</li>
          <li>spring.mvc.hiddenmethod.filter.enabled=true</li>
          <li>api.key={your_api_key}</li>
              <ul>
                <li>Sign up for Live World Data API to get your own api.key (https://rapidapi.com/jonaskoscielny/api/live-world-data)</li>
              </ul>
    </ul>
    </div>

  
 <div>
   <h2>Citations</h2>
      <ul>
        <li>https://www.cdc.gov/healthywater/global/wash_statistics.html</li>
        <li>https://ourworldindata.org/water-access</li>
        <li>https://www.theworldcounts.com/challenges/state-of-the-planet/when-will-the-world-run-out-of-water</li>
        <li>https://www.worldometers.info/water/</li>
        <li>https://www.wri.org/insights/domestic-water-use-grew-600-over-past-50-years</li>   
   </ul>
  </div>
