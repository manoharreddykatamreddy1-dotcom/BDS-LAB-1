# BDF Lab 1 - Node.js and Express Server

**Live Deployment:** [https://bds-lab-1-1-gcon.onrender.com/](https://bds-lab-1-1-gcon.onrender.com/)

**GitHub Repository:** [https://github.com/manoharreddykatamreddy1-dotcom/BDS-LAB-1](https://github.com/manoharreddykatamreddy1-dotcom/BDS-LAB-1)

**Deployment Platform:** Render  
**Deployment Status:** Live — `/`, `/about`, and `/time` return 200; unknown routes return 404

---

## Student Details

- **Name:** K.MANOHAR REDDY
- **Registration Number:** 252U1R5069
- **Section:** AIDE 2A 106
- **Department:** Artificial Intelligence and Data Engineering
- **University:** Aurora Higher Education and Research Academy
- **Course:** Backend Development Fundamentals (BDF)
- **Lab:** Lab 1
- **Faculty:** Sai Shiva Teja Sir

---

## Objective

To create a web server using Node.js and Express.js, implement GET routes, handle unknown routes, and verify HTTP status codes.

The project demonstrates backend server development, API routing, JSON responses, dynamic date and time generation, error handling, and cloud deployment.

The application has been developed locally using Visual Studio Code and uploaded to GitHub. Use the Render deployment link above to create its public service.

---

## Technologies Used

- **Node.js:** JavaScript runtime for backend server development.
- **Express.js:** Framework used to create web servers and API routes.
- **JavaScript:** Programming language used in this project.
- **npm:** Node Package Manager used to install dependencies.
- **VS Code:** Code editor used for development.
- **Git:** Version control system used to manage project changes.
- **GitHub:** Platform used to host project source code.
- **Render:** Cloud hosting platform used for public deployment.
- **Chrome:** Browser used to test and verify the application.
- **PowerShell:** Terminal used to execute Node.js, npm, and Git commands.

---

## Project Structure

```text
BDS-LAB-1/
│
├── screenshots/
│   ├── home.png
│   ├── about.png
│   ├── time.png
│   └── 404.png
│
├── server-http.js
├── server.js
├── package.json
├── package-lock.json
├── render.yaml
├── .gitignore
├── Lab1_Postman_Collection.json
├── test-routes.js
└── README.md
```

### File Description

- **server-http.js:** Creates a basic HTTP server using the built-in Node.js HTTP module.
- **server.js:** Main Express.js server containing all API routes and 404 error handling.
- **package.json:** Contains project details, dependencies, and execution commands.
- **package-lock.json:** Records dependency versions for consistent installations.
- **render.yaml:** Render Blueprint file to deploy automatically on Render.
- **.gitignore:** Excludes unnecessary or sensitive files from Git (`node_modules`, `.env`).
- **screenshots/:** Stores screenshots demonstrating the working server endpoints.
- **README.md:** Contains project documentation, installation instructions, API details, testing, and deployment information.

The `node_modules` directory is generated locally when dependencies are installed and is excluded from the GitHub repository.

---

## Installation and Execution

### Prerequisites

Install Node.js and npm on your computer.

Verify installation:

```bash
node -v
npm -v
```

### Clone the GitHub Repository

```bash
git clone https://github.com/manoharreddykatamreddy1-dotcom/BDS-LAB-1.git
```

Open the downloaded project folder using Visual Studio Code.

### Install Dependencies

Run:

```bash
npm install
```

This command installs Express.js and all required dependencies.

### Run the Basic HTTP Server

```bash
npm run start:http
```

Alternatively:

```bash
node server-http.js
```

Open the browser and visit:

http://localhost:3000/

**Expected Output:**

```text
Hello
```

The basic HTTP server uses `http.createServer()` and listens on port 3000. Stop the server using `Ctrl + C` before starting the Express server.

### Run the Express Server

```bash
npm start
```

Alternatively:

```bash
node server.js
```

**Expected Terminal Output:**

```text
Express server running on http://localhost:3000
```

Open:

http://localhost:3000/

The Express server provides three GET routes and custom 404 handling.

**Windows PowerShell Note:** If npm is blocked by a PowerShell execution policy, the equivalent commands `npm.cmd install`, `npm.cmd start`, and `npm.cmd run start:http` can be used.

---

## API Endpoints

| Method | Endpoint | Description | Status |
|---|---|---|---|
| GET | `/` | Personalized welcome message | 200 |
| GET | `/about` | Student details in JSON format | 200 |
| GET | `/time` | Current date and time | 200 |
| GET | `/unknown` | Page Not Found | 404 |

---

## Example Responses

### 1. GET / — Home Route

**Live URL:** [https://bds-lab-1-1-gcon.onrender.com/](https://bds-lab-1-1-gcon.onrender.com/)

**Response:**

```text
Hi Shiva Teja sir, Welcome to the BDF Lab Server
```

**HTTP Status:** `200 OK`

This route displays a personalized welcome message and confirms that the Express server is functioning.

### 2. GET /about — Student Details

**Live URL:** [https://bds-lab-1-1-gcon.onrender.com/about](https://bds-lab-1-1-gcon.onrender.com/about)

**Expected Response:**

```json
{
  "name": "K.MANOHAR REDDY",
  "rollNumber": "252U1R5069",
  "section": "AIDE 2A 106"
}
```

**HTTP Status:** `200 OK`

This endpoint returns student information in JSON format using `res.json()`.

### 3. GET /time — Current Date and Time

**Live URL:** [https://bds-lab-1-1-gcon.onrender.com/time](https://bds-lab-1-1-gcon.onrender.com/time)

**Example Response:**

```json
{
  "currentDateTime": "2026-11-01T17:08:37.081Z"
}
```

**HTTP Status:** `200 OK`

The date and time are generated dynamically using JavaScript's `new Date()` function.

### 4. GET /unknown — 404 Error Handling

**Live URL:** [https://bds-lab-1-1-gcon.onrender.com/unknown](https://bds-lab-1-1-gcon.onrender.com/unknown)

**Expected Response:**

```text
404 - Page Not Found
```

**HTTP Status:** `404 Not Found`

This route demonstrates custom error handling for unknown URL paths.

---

## Understanding package.json

The `package.json` file stores important information about the Node.js project.

### Project Configuration

```json
{
  "name": "bdf-lab1",
  "version": "1.0.0",
  "description": "BDF Lab 1 Node.js and Express Server",
  "main": "server.js",
  "scripts": {
    "start": "node server.js",
    "start:http": "node server-http.js",
    "test": "node test-routes.js"
  },
  "keywords": [],
  "author": "K.MANOHAR REDDY (252U1R5069)",
  "license": "ISC",
  "dependencies": {
    "express": "^5.3.0"
  },
  "type": "commonjs"
}
```

### Explanation of Fields

- **name:** Defines the project package name.
- **version:** Specifies the current version of the project.
- **description:** Provides a short project summary.
- **main:** Identifies the main application file.
- **scripts:** Contains commands to execute the application (`start`, `start:http`, `test`).
- **dependencies:** Lists the required npm packages (`express`).
- **type:** Specifies the JavaScript module system (`commonjs`).
- **license:** Specifies the declared software license (`ISC`).
- **author:** Stores package author information (`K.MANOHAR REDDY (252U1R5069)`).
- **keywords:** Contains optional search keywords.

---

## Screenshots

The following screenshots provide evidence of the working Express.js routes.

### Screenshot 1 — Home Route
Displays the personalized welcome message.

![Home Route](screenshots/home.png)

### Screenshot 2 — About Route
Displays the student's name, roll number, and section in JSON format.

![About Route](screenshots/about.png)

### Screenshot 3 — Time Route
Displays the dynamically generated current date and time.

![Time Route](screenshots/time.png)

### Screenshot 4 — 404 Error Route
Displays the custom page-not-found response.

![404 Error Route](screenshots/404.png)

---

## Testing

The application can be tested using an automated test script, browser, or curl.

### 1. Automated Test Script
```bash
npm test
```
**Output:**
```text
--- Testing Express Server Routes ---
Route: GET /
Status Code: 200
Response Body: Hi Shiva Teja sir, Welcome to the BDF Lab Server
-----------------------------------
Route: GET /about
Status Code: 200
Response Body: { name: 'K.MANOHAR REDDY', rollNumber: '252U1R5069', section: 'AIDE 2A 106' }
-----------------------------------
Route: GET /time
Status Code: 200
Response Body: { currentDateTime: 2026-11-01T17:08:37.081Z }
-----------------------------------
Route: GET /unknown
Status Code: 404
Response Body: 404 - Page Not Found
-----------------------------------
```

### 2. Local Terminal / Curl Testing

```bash
curl -i http://localhost:3000/
curl -i http://localhost:3000/about
curl -i http://localhost:3000/time
curl -i http://localhost:3000/unknown
```

### 3. Public Deployment Testing

```bash
curl -i https://bds-lab-1-1-gcon.onrender.com/
curl -i https://bds-lab-1-1-gcon.onrender.com/about
curl -i https://bds-lab-1-1-gcon.onrender.com/time
curl -i https://bds-lab-1-1-gcon.onrender.com/unknown
```

### Expected HTTP Status Codes

| Route | Expected HTTP Status |
|---|---|
| `/` | 200 OK |
| `/about` | 200 OK |
| `/time` | 200 OK |
| `/unknown` | 404 Not Found |

---

## 🎓 Viva Questions & Answers

### Q1: What is the difference between `package.json` and `node_modules`?
- **`package.json`**:
  - The project configuration and manifest file.
  - Contains project metadata (name, version, license), scripts, and direct dependencies with version constraints (`^`, `~`).
  - Lightweight text file tracked in version control (Git).
- **`node_modules`**:
  - The local directory where npm installs the compiled code and files for all declared packages and their transitive dependencies.
  - Bulky (often thousands of files) and machine-specific.
  - Excluded from version control via `.gitignore`; easily restored on any machine using `npm install`.

### Q2: What does `app.listen` do?
- `app.listen(port, [host], [callback])` binds the Express application to a network port and host IP, starting a TCP socket server to accept incoming HTTP requests.
- Under the hood, it calls `http.createServer(app).listen(port, ...)`.
- The callback executes once the server is successfully listening and ready to receive traffic.

### Q3: What do `request` (`req`) and `response` (`res`) represent?
- **`request` (`req`)**: An object representing the incoming HTTP request from the client. It contains details like HTTP method (`req.method`), URL path (`req.url`), query parameters (`req.query`), body data (`req.body`), and headers (`req.headers`).
- **`response` (`res`)**: An object used by the server to send an HTTP response back to the client. It provides utility methods such as `res.status()` to set the status code, `res.send()` for text/HTML, `res.json()` for JSON payloads, and `res.end()` to terminate the connection.

---

## GitHub Repository

The complete project source code is hosted on GitHub.

**Repository Name:** `BDS-LAB-1`  
**Repository Branch:** `main`  
**Repository Link:** [https://github.com/manoharreddykatamreddy1-dotcom/BDS-LAB-1](https://github.com/manoharreddykatamreddy1-dotcom/BDS-LAB-1)

### GitHub Commands Used

```bash
git init
git add .
git commit -m "BDF Lab 1 - Node.js and Express Server by K.MANOHAR REDDY (252U1R5069)"
git branch -M main
git remote add origin https://github.com/manoharreddykatamreddy1-dotcom/BDS-LAB-1.git
git push -u origin main
```

---

## Render Deployment

The current public service is available at the Render URL below. The `render.yaml` file describes how to create a web service from this repository if the current service needs to be recreated.

### Deployment Information

| Setting | Value |
|---|---|
| Platform | Render |
| Service Type | Web Service |
| Runtime | Node.js |
| GitHub Branch | main |
| Build Command | `npm install` |
| Start Command | `npm start` |
| Port | `process.env.PORT` or 3000 |
| Deployment URL | https://bds-lab-1-1-gcon.onrender.com/ |
| Plan | Free |

### Live Deployment URL

**https://bds-lab-1-1-gcon.onrender.com/**

### Deployment Details

- Runtime: Node.js
- Build command: `npm install`
- Start command: `npm start`
- Health check: `/`
- Plan: Free

### Port Configuration

The application uses:

```javascript
const PORT = process.env.PORT || 3000;
app.listen(PORT, '0.0.0.0', () => { ... });
```

This allows Render to provide the server port dynamically while running on default port 3000 locally.

---

## Notes

- Express.js is used to handle incoming HTTP requests.
- The basic Node.js HTTP server and Express.js server run separately.
- The `/` endpoint returns a personalized welcome message.
- The `/about` endpoint returns student details in JSON format.
- The `/time` endpoint generates the current date and time dynamically.
- Successful routes return HTTP status 200.
- Unknown routes return HTTP status 404.
- The `node_modules` folder is excluded from version control.
- No `.env` files or passwords are committed.
- The application supports Render's `PORT` environment variable.

---

## Result

The Node.js HTTP server and Express.js server have been successfully implemented.

The project includes:
- Basic Node.js HTTP server (`server-http.js`).
- Express.js backend server (`server.js`).
- Three GET routes (`/`, `/about`, `/time`).
- Student information in JSON format.
- Dynamic current date and time.
- Custom 404 error handling.
- HTTP response status codes.
- Browser, curl, and automated command-line testing.
- Generated evidence screenshots (`screenshots/`).
- GitHub repository and Render cloud deployment.
- Complete documentation and Viva answers.

---

## Conclusion

This project demonstrates the fundamentals of backend development using Node.js and Express.js.

It provides practical understanding of creating HTTP servers, handling requests and responses, implementing API routes, returning JSON data, generating dynamic information, and managing HTTP status codes.

Git and GitHub are used for version control and source code hosting, while Render is used to deploy the backend application publicly.

---

**Project Developed By:** K.MANOHAR REDDY  
**Registration Number:** 252U1R5069  
**Section:** AIDE 2A 106  
**Department:** Artificial Intelligence and Data Engineering  
**Course:** Backend Development Fundamentals  
**University:** Aurora Higher Education and Research Academy  
**Faculty:** Sai Shiva Teja Sir  

**GitHub:** [https://github.com/manoharreddykatamreddy1-dotcom/BDS-LAB-1](https://github.com/manoharreddykatamreddy1-dotcom/BDS-LAB-1)  
**Live Project:** [https://bds-lab-1-1-gcon.onrender.com/](https://bds-lab-1-1-gcon.onrender.com/)
