const express = require('express');
const app   = express();

app.get('/',(req,res) =>{
    res.json({message:'defautl'})
})
app.listen(9000,() =>{
    console.log('application is running on port 9000')
})