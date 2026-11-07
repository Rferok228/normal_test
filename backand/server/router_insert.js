const express = require('express')
const router = express.Router()
const insert_ClinicalData = require('./controllers/insert_clinicalData')
const { insert_consultationData } = require('./controllers/consultation')
const insert_wellbeingDiary = require('./controllers/insert_wellbeingDiary')
const { insert_prescriptionData, update_prescriptionData } = require('./controllers/prescription')

router.post('/clinicalData/:id', insert_ClinicalData)
router.post('/insertConsultation/:id', insert_consultationData)
router.post('/wellbeingDiary/:id', insert_wellbeingDiary)
router.post('/insertPrescription', insert_prescriptionData)
router.post('/updatePrescription', update_prescriptionData)

module.exports = router