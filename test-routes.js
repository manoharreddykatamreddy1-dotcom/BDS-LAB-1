const app = require('./server');
const { EventEmitter } = require('events');

async function testRoute(method, url) {
    return new Promise((resolve) => {
        const req = new EventEmitter();
        req.method = method;
        req.url = url;
        req.originalUrl = url;
        req.headers = {};
        req.get = (name) => req.headers[name.toLowerCase()];

        const res = new EventEmitter();
        res.statusCode = 200;
        res.headers = {};
        res.setHeader = (k, v) => { res.headers[k.toLowerCase()] = v; };
        res.getHeader = (k) => res.headers[k.toLowerCase()];
        res.writeHead = (code, headers) => {
            res.statusCode = code;
            if (headers) Object.assign(res.headers, headers);
        };
        res.status = function(code) {
            this.statusCode = code;
            return this;
        };
        res.send = function(content) {
            this.body = content;
            this.emit('finish');
            resolve({ statusCode: this.statusCode, body: this.body });
        };
        res.json = function(content) {
            this.body = content;
            this.emit('finish');
            resolve({ statusCode: this.statusCode, body: this.body });
        };
        res.end = function(content) {
            if (content) this.body = content;
            this.emit('finish');
            resolve({ statusCode: this.statusCode, body: this.body });
        };

        app.handle(req, res);
    });
}

async function runTests() {
    console.log('--- Testing Express Server Routes ---');

    const routes = [
        { method: 'GET', path: '/' },
        { method: 'GET', path: '/about' },
        { method: 'GET', path: '/time' },
        { method: 'GET', path: '/unknown' }
    ];

    for (const r of routes) {
        const res = await testRoute(r.method, r.path);
        console.log(`Route: ${r.method} ${r.path}`);
        console.log(`Status Code: ${res.statusCode}`);
        console.log('Response Body:', res.body);
        console.log('-----------------------------------');
    }
}

runTests();
