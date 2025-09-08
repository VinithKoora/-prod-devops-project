 const express = require('express');
 const app = express();
 const PORT = process.env.PORT || 3000;
 app.get('/healthz', (_, res) => res.send('ok'));
 app.get('/api', (_, res) => res.json({message: 'Hello from EKS with 
Karpenter!'}));
 app.listen(PORT, () => console.log(`API on :${PORT}`));
