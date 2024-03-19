import { pool } from '../database/conexion.js';

export default class UsuarioRepository{
    async listarUsuarios(){
        try {
            const [result] = await pool.query('SELECT * FROM usuario');
            return result;
        } catch (error) {
            console.log(error);
        }
    }

    async buscarUsuarioPorIdentificacion(id){
        try {
            const [result] = await pool.query('SELECT * FROM usuario WHERE Identificacion = ?', [id]);
            return result;
        } catch (error) {
            console.log(error);
        }
    }

    async registrarUsuario(usuario){
        try {
            const [result] = await pool.query('INSERT INTO usuario (identificacion, nombres, apellidos, telefono, correo, estado, contraseña, rol) VALUES (?, ?, ?, ?, ?, ?, ?, ?)'
            , [
                usuario.identificacion, 
                usuario.nombres, 
                usuario.apellidos, 
                usuario.telefono, 
                usuario.correo, 
                usuario.estado, 
                usuario.contraseña,
                usuario.rol]);
            return result.affectedRows;
        } catch (error) {
            console.log(error);
        }
    }

    async actualizarUsuario(id, usuario){
        try {
            const [result] = await pool.query('UPDATE usuario SET identificacion = ?, nombres = ?, apellidos = ?, telefono = ?, correo = ?, estado = ?, rol = ? WHERE id_usuario = ?',
            [
                usuario.identificacion, 
                usuario.nombres, 
                usuario.apellidos, 
                usuario.telefono, 
                usuario.correo, 
                usuario.estado, 
                usuario.rol,
                id
            ]);
            return result.affectedRows;
        } catch (error) {
            console.log(error);
        }
    }

    async eliminarUsuario(id){
        try {
            let sqlMantenimiento = `DELETE FROM mantenimiento WHERE id_usuario = ?`;
            await pool.query(sqlMantenimiento, [id]);

            const [result] = await pool.query('DELETE FROM usuario WHERE id_usuario = ?', [id]);
            return result.affectedRows;
        } catch (error) {
            console.log(error);
        }
    }
}