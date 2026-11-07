const express = require('express')
const controller_getData = require('./controllers/get_clinicalData')
const controller_getPacientsWithParam = require('./controllers/get_pacientsWithParam')
const controller_getDoctors = require('./controllers/get_doctors')
const controller_getMedCard = require('./controllers/get_medCardById')
const controller_getPlan = require('./controllers/get_treatmentPlans')
const { get_consultationData } = require('./controllers/consultation')
const get_Analise = require('./controllers/clinicalAnalise')

const router = express.Router()

router.get('/allData', controller_getData)
router.get('/patients', controller_getPacientsWithParam)
router.get('/doctors', controller_getDoctors)
router.get('/medCard/:id', controller_getMedCard)
router.get('/treatmentPlan/:id', controller_getPlan)
router.get('/getConsultation/:id', get_consultationData)
router.get('/getClinicalAnalise/:id', get_Analise)

module.exports = router