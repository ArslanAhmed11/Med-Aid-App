// Import and initialize dotenv to load environment variables
require('dotenv').config({ path: '/Users/arslanahmed/Downloads/soft-ware-main/src/db/.env' });

// Import mongoose
const mongoose = require('mongoose');

// Retrieve the MongoDB connection URL from the environment variables
const MONGO_URL = process.env.MONGO_URL;

// Connect to MongoDB
mongoose.connect(MONGO_URL, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => console.log("Connected to MongoDB"))
    .catch(err => console.error("Error connecting to MongoDB:", err));
