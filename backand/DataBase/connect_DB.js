const db = require('mysql2/promise')

const pool = db.createPool({
    host: 'localhost', 
    user: 'root',
    database: 'medical_championship'
})

module.exports = pool