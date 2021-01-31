# Writing applications with Dash

Checkout the [official tutorial for Dash](https://dash.plotly.com/)
Checkout the [official FAQ for Dash](https://dash.plotly.com/faqs)

- multi-user environments where multiple people may view the application at the same time and will have independent sessions
  > if your app uses modified `global` variables, then one user's session could set the variable to one value which would affect the next user's session
- dash is designed to be able to run with multiple python workers so that callbacks can be executed in parallel

If you host your application on 0.0.0.0 mind the following:

```
0.0.0.0 is not a valid IP address, so you can't actually connect to it. 

When the server says it's "runinng on 0.0.0.0" it means it is accepting connections on any network adapter, not a specific one. 

Use 127.0.0.1 to actually connect to a server running on your machine.
```

## Layout

- defines how the app looks like
- a hierarchical tree of components
- use CSS to style your Dash app as you would standard HTML

The **dash_html_components** library has a component class as for every HTML tag as well as keyword arguments for all HTML arguments.

- support inline CSS styling through a `style` attribute

```
# Generates <h1>Hello Dash</h1>
html.H1(children="Hello Dash")
```

The **dash_core_components** describe higher-level components that are interactive and are generated with JavaScript, HTML and CSS through React.js library.

- generates higher-level components like controls and graphs
- Dash is declarative. Each component is described entirely through keyword attributes.
- Dash includes "hot-reloading", this features is activated by default when you run your app with app.run_server(debug=True). This means that Dash will automatically refresh your browser when you make a change in your code.
- [Dash core components library](https://dash.plotly.com/dash-core-components)
- all of the components can be updated by callback functions

Callback function - functions that are automatically called by Dash whenever an input component's property changes
Dash tutorial on [the callback function](https://dash.plotly.com/basic-callbacks)
Reactive programming - whenever an input changes, all the outputs that depend on it are updated automatically

> Loading data into memory can be expensive. By loading querying data at the start of the app instead of inside the callback functions, we ensure that this operation is only done when the app server starts. When a user visits the app or interacts with the app, that data (the df) is already in memory. If possible, expensive initialization (like downloading or querying data) should be done in the global scope of the app instead of within the callback functions.

> **Combining outputs**: it's not always a good idea to combine Outputs, even if you can:
> If the Outputs depend on some but not all of the same Inputs, keeping them separate can avoid unnecessary updates.
> If they have the same Inputs but do independent computations with these inputs, keeping the callbacks separate can allow them to run in parallel.

The **Graph** component renders interactive data visualizations using the open source plotly.js JavaScript graphing library. The `figure` argument in the `dash_core_components.Graph` component is the same `figure` argument that is used by `plotly.py`

[Multiple URLs within a single App and file structure](https://dash.plotly.com/urls)

### Web Server Gateway Interface (WSGI)

- simple calling convention for web servers to forward requests to web applications or frameworks written in the Python programming language
- describes how a web server communicates with web applications and how web applications can be chained together to process one request

### gunicorn (green unicorn)

- Python WSGI HTTP Server for UNIX
- native support for WSGI, Django and Paster
- automatic worker process management
- simple Python configuration
- multiple worker configurations
- various server hooks for extensibility

### redis

- in-memory data structure store used as a database, cashe and message broker
- supports strings, hashes, lists, sets, sorted sets with range queries, bitmaps, hyperloglogs, geospatial indexes with radius queries and streams
- run atomic operations (appending to a string, incrementing the value in a hash, pushing an element to a list, computing set intersection, union and difference, getting the member with highest ranking in a sorted set)
- learn more on [redis](https://redis.io/)
