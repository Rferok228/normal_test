const express = require('express')
const router = express.Router()
const insert_ClinicalData = require('./controllers/insert_clinicalData')
const insert_consultationData = require('./controllers/insert_consultation')

router.post('/clinicalData', insert_ClinicalData)
router.post('/consultation', insert_consultationData)

module.exports = router