const db = require('./connect_DB')

const get_clinicalAnalise = async (id, first_date, last_date, measurement_type) => {
    const sql = `SELECT  cd.measurement_value, cd.unit, cd.measured_at, cd.source, MAX(cd.measurement_value) OVER () as 'max',  MIN(cd.measurement_value) OVER () as 'min',  AVG(cd.measurement_value) OVER () as 'avg' FROM clinical_data_all as cd
        WHERE cd.measurement_type = ? AND cd.patient_id = ? AND cd.measured_at > ? AND cd.measured_at < ?
        ORDER BY cd.measured_at DESC;`
    const response = await db.execute(sql, [measurement_type, id, first_date, last_date])

    if(!response[0]){
        return response[0]
    }

    const array = response[0].map(element => {
        const { max, min, avg, unit, ...rest } = element

        return rest
    })

    const obj = [
        {
            patient_id: id,
            measurement_type: measurement_type,
            first_date: first_date, 
            last_date: last_date,
            unit: response[0][0].unit,
            max: response[0][0].max,
            min: response[0][0].min,
            avg: response[0][0].avg,
            data: array
        }   
    ]

    console.log(obj)

    return obj
}

module.exports = get_clinicalAnalise