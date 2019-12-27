const express = require('express');
const app   = express();

app.get('/serviceA',(req,res) =>{
    res.json({message:'serviceA'})
})
app.listen(9000,() =>{
    console.log('application is running on port 9000')
})