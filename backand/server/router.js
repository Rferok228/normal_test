const express = require('express')
const controller_getData = require('./controllers/get_AllData')
const controller_getPacients = require('./controllers/')

const router = express.Router()

router.get('/allData', controller_getData)
router.get('/pacients', controller_getPacients)

module.exports = router