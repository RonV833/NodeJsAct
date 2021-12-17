//we will render index here

const express = require('express');
const router = express.Router();
//we will call index
router.get('/', (req, res) => {
    res.render('index'); //view the filename in hbs for index.hbs
});
router.get ('/register', (req, res) => {
    res.render('registration'); //view the filename registration.hbs
});
router.get ('/list', (req, res) => {
    res.render('list'); //view the filename list.hbs
});

router.get ('/food', (req, res) => {
    res.render('food'); //view the filename list.hbs
});
module.exports = router;