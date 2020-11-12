# RUNNING node.js in docker

### App runs in the container but, doesn't appear to map to the host port

> This is not an error with your docker-compose, CLI or stack file configuration.

>This error is particular to node.js applications. When placed inside a container they don't map to the host loopback address (127.0.0.1 or localhost) unless their hostname is set to 0.0.0.0

### Examples:

#### Won't work

```java /* tslint:disable */ /* eslint-disable */
const http = require('http');

const hostname = '127.0.0.1';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
```

> Error message:
```bash
curl: (52) Empty reply from server
```

#### Will Work

> Set the host name to '0.0.0.0' 

```java /* tslint:disable */ /* eslint-disable */
const http = require('http');

const hostname = '0.0.0.0';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
```