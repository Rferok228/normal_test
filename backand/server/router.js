const express = require('express')
const controller_getData = require('./controllers/get_AllData')

const router = express.Router()

router.get('/allData', controller_getData)

module.exports = router