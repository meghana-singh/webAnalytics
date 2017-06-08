# README

* Ruby version
Rails 5.1.1

* How to run the test suite
rspec spec/

* Deployment instructions
 
**Register your Application**
You need to create user account and then add the name and url of your application.
Once application is registered, you can add events to the registered app and track them using pie and line chart.

To access the event api, you have to add the below JavaScript snippet to the application which is going to track the event.
The below example is for registered Rails app. Make changes according to your apps framework.

**Create a JavaScript Snippet**

webAnalytics users must be able to track events using JavaScript snippets. There's only one function your snippet needs to support:

webAnalytics.report();
When a browser executes the webAnalytics.report function, make an Ajax request to the server-side API to create the event on your server.

In order to keep your webAnalytics code from colliding with other JavaScript code, you should create a namespace for it. The simplest way to do this is to declare an empty object. Open one of your previous projects and add this to its application.js file:

app/assets/javascripts/application.js
  var webAnalytics = {};
Then create the report function as a property on that object:

app/assets/javascripts/application.js
var webAnalytics = {};
  webAnalytics.report = function(eventName){
    // your code here
  };
Inside the report function, use a POST request to create the event. Assume that jQuery is not present, and use the Ajax functions that are native to web browsers instead (the XMLHttpRequest API).

Create an event with the name sale:

webAnalytics.report = function(eventName) {
   // #1
   var event = {event: { name: eventName }};
 
   // #2
   var request = new XMLHttpRequest();
   // #3
   request.open("POST", "http://localhost:3000/api/events", true);
   // #4
   request.setRequestHeader('Content-Type', 'application/json');
   // #5
   request.send(JSON.stringify(event));
}
At #1, we create an event JSON object to send to the webAnalytics analytics service.

At #2, we initialize a new XMLHttpRequest() (AJAX request)

At #3, we set the HTTP method to POST, the url of our events endpoint, and allow the request to run asynchronously.

At #4, we set the request Content-Type header to 'application/json'. Without that, our API::EventsController would not know to process the request as JSON.

At #5, we finally send the request.


