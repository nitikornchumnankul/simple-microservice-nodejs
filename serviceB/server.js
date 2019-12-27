const express = require('express');
const app   = express();

app.get('/serviceB',(req,res) =>{
    res.json({message:'serviceB'})
})
app.listen(9000,() =>{
    console.log('application is running on port 9000')
})