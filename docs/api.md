# API = Application Programming Interface

- control access to hardware and software resources
- specifies how software components should interact
- defines the kinds of calls or requests that can be made, how to make them, the data formats that should be used, the conventions to follow etc.
- APIs enable modular programming (using independently of implementation)
- request -> HTTP -> response

APIs are used when programming graphical user interface (GUI) components. A good application programming interface makes it easier to develop a program by providing all the building blocks.

REST-ful API is an application programming interface that works on the representational state transfer technology.
Rest-ful API - architectural style of building API

REST API (Representational state transfer) is an API that uses HTTP requests for communication.

REST APIs must follow certain constraints:
a) Client-server architecture - the client handles the user interface and the server handles the backend and data storage. Client and server are independent and each of them can be replaced separately.
b) Stateless - no data from the client is stored on the server-side. The session state is stored on the client-side.
c) Cacheable - clients can cache server responses to improve performance

CRUD = Create + Read + Update + Delete - basic actions that can be performed on the data

POST = create action; adds new data to the server
GET = read action; retrieve information
PUT = update action; changes existing information
DELETE = delete action; deletes existing information

> All communications between server/server, server/browser, browser/browser are done in text (usually in JSON)

**Resource-Method chart**

- summarizes what your API does

Resource -> method -> path -> used for -> param -> status codes
`+ -> POST -> /add -> add_2_nums -> x: int, y: int -> 200 OK, 301 missing`

**Requests**
GET, POST
browser -> REQUEST -> server -> response

**Status codes**
1xx informational response - the request was received, continuing process
2xx successful - the request was successfully received, understood, and accepted
3xx redirection - further action needs to be taken in order to complete the request
4xx client error - the request contains bad syntax or cannot be fulfilled
5xx server error - the server failed to fulfil an apparently valid request

For more detailed information check out wikipedia on [HTTP status codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)

## Postman

- IDE for building an API; collaboration platform for API development
- API Client, Automated testing, design & mock, documentation, monitors, wokspaces
- test GET and POST messages on your server

# Apache HTTP Server

- open-source HTTP server
- provide HTTP services in sync with the current HTTP standards

# Apache Spark

- unified analytics engine for large-scale data processing
- open-source distributed general-purpose cluster-computing framework
- interface for programming entire clusters with implicit data parallelism and fault tolerance

# SDK

- software development kit = collection of software development tools in one installable package
- provides a set of tools, libraries, relevant documentation, code samples, processes or guides that allow developers to create software applications on a specific platform

## Choosing the language for the APIs

Factors to consider:

1. How confident is the team with each language? What is the preference across the entire company?
2. Does the language come with plenty of different options for libraries or frameworks that aid in the developing of APIs?
   Multiple options within a single language is better than one in case some of your use cases gets stuck on a specific limitation within a particular language where the options are limited.
3. Are the frameworks and libraries for this programming language still being supported? How active is the community of developers? Are there plenty of resources for you to learn from? How clear and available is the documentation?

Some of the most important aspects of an API framework are - its architecture and features such as support for customization, flexibility, extensibility, security, compatibility with other libraries etc.

### Python and APIs

- fast scripting language
- well-defined, easy to understand and extensible syntax
- highly scalable APIs

[Comparison of Django and Flask](https://hackr.io/blog/flask-vs-django)
As Flask is easier to learn for beginners, we will prepare the tutorial APIs in Flask to demonstrate API creation in Python.

[Django](https://www.djangoproject.com/)

- web development framework for Python
  Django REST framework

#### Flask

[Flask](https://flask.palletsprojects.com/en/1.1.x/)

- lightweight web application framework
- start quick and easy, scale up fast
- Flask-Restful works with all the existing libraries

Install the libraries
`pip install flask`
`pip install flask_restful`

Code example

```
from flask import Flask
from flask_restful import Resource, Api
app = Flask(__name__)
api = Api(app)
class HelloWorld(Resource):
    def get(self):
        return {'Protorix'}
api.add_resource(HelloWorld, '/')
if __name__ == '__main__':
    app.run(debug=True)
```

Another example can be accessed within the repository in the file `test_ai_api.py` or `test_flask_hello.py` or `test_flask_restful_app.py`

To run the API locally using Windows Powershell use the following:
`$env:FLASK_APP="test_flask_hello"`
`flask run`

Flask already has a web server built within itself. This means it will create it on your local host. (simulating the code as if it was on the internet, used for development locally)

Web services usually return JSON.
Web applications usually return a page e.g. HTML.

### Validating JSON schema of the request/response

Use the [jsonschema][1] package.


### R and environments

- reproduce work (schedule reporting, team collaboration, project validation); making sure the code always runs (making sure the right package versions and other environment variables are in place); safely upgrade packages
  Strategies for the environment management
- snapshot and restore -> using renv to record and restore project's dependencies
- the shared baseline -> providing a common set of packages to use across projects
- the validated -> packages must be controlled and meet specific organization standards

- further reading in [environments Rstudio](https://environments.rstudio.com/)
- [Docker and R](https://environments.rstudio.com/docker.html)

### R and APIs

- there are two API frameworks in R: openCPU and plumber
- uncommon to use R for product development; most of the popular APIs do not offer software development kits (SDKs) or how-to guides for analysts working in R (as for e.g. Python)

#### Plumber

- install the package called `plumber`
- R package for creating RESTful APIs
- turning existing R functions into API endpoints; to do so you need to provide specialized R comments before R functions (use `#*`)

Code example:

```
library(plumber)

#* @apiTitle Simple API

#* Echo provided text
#* @param text The text to be echoed in the response
#* @get /echo
function(text = "") {
  list(
    message_echo = paste("The text is:", text)
  )
}
```

- by default `plumber` will serialize the object returned from a function into JSON using the `jsonlite` package
- read more on [R, plumber and API](https://rviews.rstudio.com/2018/07/23/rest-apis-and-plumber/)
- RStudio now uses swagger-generated UI to view and interact with the created API

- all current code in Nano is written in R
- current prevailing expertise in the team is in R

### NodeJS and APIs

Node JS + Express

- powerful collection of features for web and mobile application development
- routing libraries providing fundamental web application features adding to the existing features of NodeJS
- high performance and support of robust routing
- HTTP helpers such as rendering, setting headers etc.

A simple implementation of a Node JS + Express API that returns a JSON response with names when a request is sent to the route /url.

```
var express = require("express");
var app = express();app.listen(3000, () => {
 console.log("Server runs on port 3000");
});
app.get(“/url”, (req, res, next) => {
 res.json([“Kevin”,”Neil”,”Antony”,”Jonas”,”Lambert”]);
});
```

[1]: https://python-jsonschema.readthedocs.io/en/latest/