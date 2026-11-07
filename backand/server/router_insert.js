const express = require('express')
const router = express.Router()
const insert_ClinicalData = require('./controllers/insert_clinicalData')
const { insert_consultationData } = require('./controllers/consultation')
const insert_wellbeingDiary = require('./controllers/insert_wellbeingDiary')

router.post('/clinicalData/:id', insert_ClinicalData)
router.post('/insertConsultation/:id', insert_consultationData)
router.post('/wellbeingDiary/:id', insert_wellbeingDiary)

module.exports = router