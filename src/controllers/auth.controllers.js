import AuthRepository from '../repositories/authRepository.js';
import UsuarioRepository from '../repositories/usuarioRepository.js';
import jwt from 'jsonwebtoken';
import { validationResult } from 'express-validator';
import { ROLES } from '../helpers/constants.js'

export const iniciarSesion = async (req, res) => {
  try { 
        const repository = new AuthRepository();
        const result = await repository.validarUsuario(req.body.identificacion, req.body.contraseña);

        if(result != null){
            let token = jwt.sign({ user: req.body.identificacion, role: result }, process.env.AUT_SECRET, { expiresIn: process.env.AUT_EXPIRE });
            return res.status(200).json({ token: token, message: 'Usuario autorizado..' });
        }else {
            return res.status(400).json({ message: "Usuario inválido." });
        }
    } catch (error) {
    console.error('Error en el inicio de sesión:', error);
    return res.status(500).json({ message: 'Error en el sistema' });
    }
};

export const registrarUsuario = async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }

        const { identificacion, nombres, apellidos, telefono, correo, estado, rol } = req.body;
        const contraseña = nombres.split(' ')[0] + identificacion;

        const usuarioRepository = new UsuarioRepository();

        const user = {
            identificacion,
            nombres,
            apellidos,
            telefono,
            correo,
            contraseña,
            estado,
            rol,
        }

        const result = await usuarioRepository.registrarUsuario(user);

        if (result > 0) {
            return res.status(200).json({ 
                'status':"200 OK",
                'message':'Se registro con exito el Usuario',
            });
        } else {
            return res.status(404).json({ 
                'status':"404 Not Found",
                'message':'No se registro el Usuario' 
            });
        }
    } catch (err) {
        res.status(500).json({
            'status':"500 Internal Server Error",
            'message':'Error en el servidor' + err.message,
        });
    }
};
export const validarToken = (rolRequerido) => (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];
    if (token == null) return res.sendStatus(401);
  
    jwt.verify(token, process.env.AUT_SECRET, (err, user) => {
        if (err) return res.sendStatus(403);
        console.log(user.role);
        if (rolRequerido === ROLES.tec && user.role === ROLES.user) {
            return res.status(403).json({ mensaje: 'Acceso no autorizado' });
        }
        if (rolRequerido === ROLES.admin && user.role !== rolRequerido) {
            return res.status(403).json({ mensaje: 'Acceso no autorizado' });
        }
    
        req.user = user;
    
        next();
    });
  };
    
export const cambiarclave = async (req, res) => {
    try {
        const repository = new AuthRepository();
        const result = await repository.cambiarContraseña(req.body.id, req.body.antigua, req.body.nueva);

        if(result == true){
            return res.status(200).json({ message: 'Contraseña actualizada..' });
        }else {
            return res.status(400).json({ message: "Contraseña inválida." });
        }
    } catch (error) {
        console.error('Error en el cambio de contraseña:', error);
        return res.status(500).json({ message: 'Error en el sistema' });
    }
};
export default iniciarSesion;