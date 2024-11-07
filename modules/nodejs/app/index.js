// app/index.js
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello, World from Node.js in Docker!');
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
