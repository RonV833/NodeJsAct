const mysql = require('mysql2');
const bcrypt = require('bcrypt');
const dotenv = require('dotenv');
dotenv.config({path: './.env'});
const db = mysql.createConnection ({
    host: process.env.DATABASE_HOST,
    port: process.env.DATABASE_PORT,
    user: process.env.DATABASE_USER,
    password: process.env.DATABASE_PASSWORD,
    database: process.env.DATABASE_NAME
})
//validate database connection
db.connect((err)=> {
    if(err) console.log('Error', err);
    else console.log('DB connected');
});


exports.register = (request, response) => {
    const {first_name, last_name, email, password, confirm_password} = request.body;
    db.query ('SELECT email FROM register WHERE email = ?', [email], //validate if username, like email is existing or not
    async (err, result)=>{
        if (err) console.log(err);
        if (result.length > 0) {
            return response.render('registration', {message: 'Email Entered is Already in use'})
        }
        else if (password!=confirm_password) {
            return response.render('registration', {message: 'password and confirm password does not match!'})
        }
        //db.query('INSERT INTO register (first_name, last_name, email, password) VALUES (?,?,?,?)')
        const hashpassword =await bcrypt.hash(password,8); //hash is a function, combine 8 alpha numeric

        db.query('INSERT INTO register SET ?', {first_name:first_name, last_name: last_name, email:email, password:hashpassword}, (err, result)=>{
            if (err) {
                console.log(err)
            }
            else {
                return response.render('registration', {message: 'User Registered'})
            }
        })
    })
}

//login function 
exports.login = async (request, response) => {  //async to make it asychronous function
    try {
        const {email, password} = request.body;
        if (!email || !password) {  //condition check if email and password has content
            return response.status(400).render('index', {message: 'Provide Email and Password!'}) //400 badrequest, authentication credinteials
        }
        db.query('SELECT * FROM register WHERE email=?', [email], //first param is select for the db, and second is the variable email
        async (err, result) => {
            if(!result.length || !(await bcrypt.compare(password, result[0].password))) { //.compare will compare the password
                console.log(result);
                return response.status(401).render('index', {message: 'Email or Password is incorrect!'}); //allowed
            }
            else {
                //console.log(result[0].email);
                //will display in list.hbs
                db.query('SELECT * FROM register', (error, result) => {
                    response.render('list', {user: result, title: 'List of Users'}); //result is passed in user variable
                })

            }
        }
        )
    }
    catch (error) {
        console.log(error);
    }
}
exports.update_form = (request, response) => {
    const email = request.params.email; //body involves forms, params parameter
    db.query('SELECT * FROM register WHERE email=?',[email], 
    (err, results) => {
        response.render('updateform', {title:'Edit User', user:results[0]});
    }
    )
}

exports.update_user = (request, response) => {
    const {first_name, last_name, email, } = request.body;
    db.query('UPDATE register SET first_name=(?), last_name=? WHERE email=(?)', [first_name, last_name, email],
    (err, result)=> {
        console.log(result);
        if (err) return console.log(err.message)
        
        db.query('SELECT * FROM register', (error, result) => {
                response.render('list', {user: result, title: 'List of Users', message:'Form Has been Updated'}); 
            })
    }
    )
}
exports.delete = (request, response) => {
    const email = request.params.email;
    db.query('DELETE FROM register WHERE email=?',[email], 
    (err, result)=> {
        console.log(result);
        if (err) return console.log(err.message)
        
        db.query('SELECT * FROM register', (error, result) => {
                response.render('list', {user: result, title: 'List of Users', message:`An Entry Has Been Deleted With this email: ${email}`}); 
            })
    }
    )
}
//function for adding food in the food 
exports.food =  (req, res) => {
    const {food_name, price, food_category_id} = req.body;
    db.query('INSERT INTO food SET ?', {food_name:food_name, price: price, food_category_id:food_category_id}, (err, result)=>{
        if (err) {
            console.log(err)
        }
        else {
            db.query('SELECT * FROM food', (error, result) => {
                res.render('orderlist', {food: result, title: 'List of Food Order', message:`Order is added with name ${food_name}`}); //result is passed in user variable
            })

        }
    })
}

//function for deleting entry
exports.delete_food = (request, response) => {
    const {food_id} = request.params;
    db.query('DELETE FROM food WHERE food_id=?',[food_id], 
    (err, result)=> {
        console.log(result);
        if (err) return console.log(err.message)
        
        db.query('SELECT * FROM food', (error, result) => {
            response.render('orderlist', {food: result, title: 'List of Food Order', message:`Order is deleted with id ${food_id} `}); //result is passed in user variable
        })
    }
    )
}

//function for getting and displaying the update form
exports.updatefood_form = (request, response) => {
    const food_id = request.params.food_id; 
    db.query('SELECT * FROM food WHERE food_id=?',[food_id], 
    (err, results) => {
        response.render('updatefood', {title:'Edit Food Entry', food:results[0]});
    }
    )
}
//function for posting the update inputs and displaying the new lists
exports.update_food = (request, response) => {
    const {food_id, food_name, price, food_category_id } = request.body;
    db.query('UPDATE food SET food_name=?, price=?, food_category_id=? WHERE food_id=?', [food_name, price, food_category_id, food_id],
    (err, result)=> {
        console.log(result);
        if (err) return console.log(err.message)
        
        db.query('SELECT * FROM food', (err, result) => {
            if (err) return console.log(err.message);
            else
                response.render('orderlist', {food: result, title: 'List Updated Food Orders', message:`Food Order with name ${food_name} is updated`}); 
            })
    }
    )
}

