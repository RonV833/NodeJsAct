const express = require('express');
const path = require('path'); 
const port = process.env.PORT || 5000; 
const app = express();

//set hbs
app.set('view engine', 'hbs');

//define a route
app.use(express.urlencoded({extended:true})); 
app.use(express.json());

app.use('/auth', require('./routes/auth'));
app.use('/', require('./routes/registerRoutes'))


//initiate server
app.listen(port, () => {
    console.log('Server Started Here', port);
});