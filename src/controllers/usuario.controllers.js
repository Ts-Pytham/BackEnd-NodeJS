import { pool } from '../database/conexion.js';
import UsuarioRepository from '../repositories/usuarioRepository.js';

export const buscarusuarios = async (req, res) => {
    try {
        let identificacion = req.params.identificacion;
        console.log(identificacion);
        const usuarioRepository = new UsuarioRepository();
        const result = await usuarioRepository.buscarUsuarioPorIdentificacion(identificacion);

        if (result.length > 0) {
            res.status(200).json(result[0]);
        } else {
            res.status(404).json({
                message: 'No se encontró el usuario',
            });
        }
    } catch (err) {
        res.status(500).json({
            message: 'Error en el servidor ' + err.message,
        });
    }
};


export const listarusuarios = async (_, res) => {
    try {
        const usuarioRepository = new UsuarioRepository();
        const result = await usuarioRepository.listarUsuarios();
        res.status(200).json(result);
    } catch(err) {
        res.status(500).json({ massage: 'Error en el servidor' + err.message });
    }
};

export const actualizarUsuario = async (req, res) => {
    try{ 
        let id = req.params.id;
        let{ identificacion,nombres,apellidos,telefono,correo,estado,rol } =req.body;

        const usuarioRepository = new UsuarioRepository();

        const user = {
            identificacion,
            nombres,
            apellidos,
            telefono,
            correo,
            estado,
            rol,
        }

        const result = await usuarioRepository.actualizarUsuario(id, user);
        
        if (result > 0)
            return res.status(200).json({ 
                'status':"200 OK",
                'message':'Se actualizo con exito el Usuario',
            });
        else
            return res.status(404).json({ 
                'status':"404 Not Found",
                'message':'No se actualizo el Usuario' 
            });
    } catch (err) {
        res.status(500).json({
            'status':"500 Internal Server Error",
            'message':'Error en el servidor' + err
        });
    }
};

export const eliminarUsuario = async (req, res) => {
    try {
        let id = req.params.id;

        let sqlMantenimiento = `DELETE FROM mantenimiento WHERE id_usuario=${id}`;
        await pool.query(sqlMantenimiento);

        let sqlUsuario = `DELETE FROM usuario WHERE id_usuario=${id}`;
        const [rows] = await pool.query(sqlUsuario);

        if (rows.affectedRows > 0)
            return res.status(200).json({
                'status': "200 OK",
                'message': 'Se elimino con exito el Usuario',
            });
        else
            return res.status(404).json({
                'status': "404 Not Found",
                'message': 'No se elimino el Usuario'
            });
    } catch (err) {
        res.status(500).json({
            'status': "500 Internal Server Error",
            'message': 'Error en el servidor' + err
        });
    }
};


export const cambiarEstadoUsuario = async (req, res) => {
    try {
        const { identificacion } = req.params;

        const usuarioRepository = new UsuarioRepository();
        const result = await usuarioRepository.buscarUsuarioPorIdentificacion(identificacion);

        if (result > 0) {
            return res.status(200).json({ 
                'status': "200 OK",
                'message': 'Se actualizó con éxito el estado del usuario'
            });
        } else {
            return res.status(404).json({ 
                'status': "404 Not Found",
                'message': 'No se encontró el usuario con la identificación proporcionada' 
            });
        }
    } catch (err) {
        res.status(500).json({
            'status': "500 Internal Server Error",
            'message': 'Error en el servidor' + err
        });
    }
};
    
