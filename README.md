# Website-Development2




I am developing a dynamic website as an online platform that connects charitable organizations with community members. Through this website, charitable organizations can effectively showcase their fundraising activities, while the public can easily discover, understand, and register to participate in these activities, thereby contributing to causes in need together.

I designed and implemented a web-based full stack solution that follows a three-tier architecture pattern:

Backend data layer: A standardized database (charityevents_db) was designed using MySQL to store and manage charity organizations, event categories, and detailed event information including event names, descriptions, dates, locations, ticket prices, fundraising goals, and progress.

Intermediate API layer: Built a RESTful API using Node.js and Express framework. These API interfaces are responsible for securely and efficiently retrieving data from the database and providing it to the frontend in JSON format.

Front end presentation layer: Developed a responsive client website using pure HTML, CSS, and JavaScript. It dynamically renders content by calling backend APIs, implementing three core pages: a homepage displaying activity lists, a search page with filtering capabilities, and a page displaying activity details.

The core of this solution lies in achieving dynamic interaction between the client and server. The website content is no longer static, but rather API requests are initiated through JavaScript to obtain the latest activity data from the server, which is then updated in real-time on the webpage, providing users with a smooth, intuitive, and timely information experience.
