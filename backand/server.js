const express = require('express')
const cors = require('cors')
const router_data = require('./server/router.js')

const serv = express()

serv.use(cors())
serv.use('/data', router_data)

serv.listen(3000, () => console.log("Server started on 3000 port"))



