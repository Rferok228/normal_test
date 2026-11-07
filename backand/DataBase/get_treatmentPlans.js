const db = require('./connect_DB')

const get_planAndtreatmens = async (id) => {
    const sql = `SELECT c.patient_id, tp.plan_description, tp.start_date, tp.end_date, tp.status, p.medication_name, p.dosage, p.frequency, p.instructions, tr.scheduled_at, tr.performed_at, tr.status, tr.notes FROM consultations as c
        JOIN treatment_plans as tp on tp.consultation_id = c.id
        LEFT JOIN prescriptions as p on p.treatment_plan_id = tp.id
        LEFT JOIN treatment_records as tr on tr.prescription_id = tp.id
        WHERE c.patient_id = ?`
    const response = await db.execute(sql, [id])

    return response[0]
}

module.exports = get_planAndtreatmens