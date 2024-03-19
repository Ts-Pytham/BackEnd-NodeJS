import { pool } from '../database/conexion.js';
export default class AuthRepository {
    async validarUsuario(identificacion, contraseña) {
        try {
            let sql = `SELECT id_usuario, nombres, rol FROM usuario WHERE identificacion = ? and contraseña = ?`;
            const [rows] = await pool.query(sql, [identificacion, contraseña]);

            if (rows.length > 0) {
                return true;
            } else {
                return false;
            }
        } catch (e) {
            console.error('Error en el sistema:', e);
            return false;
        }
    }

    async cambiarContraseña(id, antigua, nueva) {
        try {
            let sql = `UPDATE usuario SET contraseña = ? WHERE id_usuario = ? and contraseña = ?`;
            const [rows] = await pool.query(sql, [nueva, id, antigua]);

            if (rows.affectedRows > 0) {
                return true;
            } else {
                return false;
            }
        } catch (e) {
            console.error('Error en el sistema:', e);
            return false;
        }
    }
}