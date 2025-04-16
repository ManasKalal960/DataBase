const express = require('express');
const cookieParser = require('cookie-parser');
const cors = require('cors');
const routes = require('./routes');
const logger = require('./utils/logger');
const path = require('path');

const app = express();



// Middleware
app.use(express.json());
app.use(cookieParser());  // Important for parsing cookies
app.use(cors({
  origin: true,
  credentials: true  // Important for cookies with CORS
}));

app.use(express.static(path.join(__dirname, 'public')));

// Routes
app.use('/api', routes);

// Simple test endpoint for checking server health
app.get('/test', (req, res) => {
  res.json({ message: 'Server is working!' });
});

// Error handler
app.use((err, req, res, next) => {
  logger.error(`Server error: ${err.message}`);
  res.status(500).json({ error: "Internal server error" });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  logger.info(`Server started on port ${PORT}`);
  console.log(`Server running on port ${PORT}`);
});

app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});
