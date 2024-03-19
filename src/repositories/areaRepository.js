import { pool } from '../database/conexion.js';
export default class AreaRepository{
    async registrarArea(nombre){
        try {
            const sql = `
                INSERT INTO area (nombre)
                VALUES (?)
            `;
            const values = [nombre];
            const [result] = await pool.query(sql, values);
            return result.affectedRows;
        } catch (error) {
            console.log(error);
        }
    }

    async listarAreas(){
        try {
            const [result] = await pool.query('select * from area');
            return result;
        } catch (error) {
            console.log(error);
        }
    }

    async buscarAreaPorId(id){
        try {
            const sql = `
                SELECT * FROM area
                WHERE id_area = ?
            `;
            const values = [id];
            const [result] = await pool.query(sql, values);
            return result;
        } catch (error) {
            console.log(error);
        }
    }

    async actualizarArea(id, nombre){
        try {
            const sql = `
                UPDATE area
                SET nombre = ?
                WHERE id_area = ?
            `;
            const values = [nombre, id];
            const [result] = await pool.query(sql, values);
            return result.affectedRows;
        } catch (error) {
            console.log(error);
        }
    }
}