const express = require('express')
const controller_getData = require('./controllers/get_AllData')
const controller_getPacientsWithParam = require('./controllers/get_pacientsWithParam')
const controller_getDoctors = require('./controllers/get_doctors')

const router = express.Router()

router.get('/allData', controller_getData)
router.get('/patients', controller_getPacientsWithParam)
router.get('/doctors', controller_getDoctors)

module.exports = router