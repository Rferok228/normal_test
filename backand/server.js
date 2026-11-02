const express = require('express')
const cors = require('cors')
const router_data = require('./server/router_data.js')
const router_insert = require('./server/reouter_insert.js')

const serv = express()

serv.use(cors())
serv.use(express.json())
serv.use('/data', router_data)
serv.use('/insert', router_insert)

serv.listen(3000, () => console.log("Server started on 3000 port"))



