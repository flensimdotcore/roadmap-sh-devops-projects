const express = require('express');
const basicAuth = require('basic-auth');
const path = require('path');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

const requiredEnvVars = ['SECRET_MESSAGE', 'USERNAME', 'PASSWORD'];
const missingEnvVars = requiredEnvVars.filter(envVar => !process.env[envVar]);

if (missingEnvVars.length > 0) {
    console.error('Error: Missing some env variables:');
    missingEnvVars.forEach(envVar => {
        console.error(`- ${envVar}`);
    });
    console.error('Please, create .env file containig these variables');
    process.exit(1);
}

const authMiddleware = (req, res, next) => {
    const credentials = basicAuth(req);

    if (!credentials ||
        credentials.name !== process.env.USERNAME ||
        credentials.pass !== process.env.PASSWORD) {

        res.set('WWW-Authenticate', 'Basic realm="Secret Area"');
        return res.status(401).json({
            error: 'Access denied',
            message: 'Invalid username or password'
        });
    }

    next();
};

app.get('/', (req, res) => {
    res.json({
        message: 'Hello, world!',
        timestamp: new Date().toISOString()
    });
});

app.get('/secret', authMiddleware, (req, res) => {
    res.json({
        message: process.env.SECRET_MESSAGE,
        accessTime: new Date().toISOString(),
        status: 'success'
    });
});

app.use('*', (req, res) => {
    res.status(404).json({
        error: 'Route not found',
        availableRoutes: ['/', '/secret']
    });
});

app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).json({
        error: 'Something went wrong!',
        message: err.message
    });
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
    console.log(`Visit http://localhost:${PORT} to see the Hello World message`);
    console.log(`Visit http://localhost:${PORT}/secret to access the secret route`);
    console.log(`Username: ${process.env.USERNAME}`);
    console.log(`Password: ${process.env.PASSWORD}`);
});