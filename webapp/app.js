const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello, GitOps with ArgoCD and Flux!');
});

app.listen(port, () => {
  console.log(`Web app listening at http://localhost:${port}`);
});
