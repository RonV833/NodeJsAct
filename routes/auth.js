//will be exported, use module.exports
const express = require('express');
const router = express.Router();
const regController = require('../controllers/authAccount'); //inside authAccount will be login and register, or sql statements or database manipulation

//route for food table
router.post('/food', regController.food);
router.get('/delete_food/:food_id', regController.delete_food);
router.get('/updatefood/:food_id', regController.updatefood_form);
router.post('/update_food', regController.update_food);

//route for registration
router.post('/login', regController.login);
router.post('/register', regController.register);
router.get('/updateform/:email', regController.update_form); //called the updateform
router.post('/update_user', regController.update_user); //for the update user 
router.get('/delete/:email', regController.delete);
//call the controllers here, inside controllers is mysql statements

//exports the router variable
module.exports = router;