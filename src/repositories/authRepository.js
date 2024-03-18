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

    validateToken(req, res) {
      const authHeader = req.headers['authorization']
      const token = authHeader && authHeader.split(' ')[1]
    
      if (token == null) return res.sendStatus(401)
    
      jwt.verify(token, process.env.TOKEN_SECRET, (err, user) => {
        console.log(err)
    
        if (err) return res.sendStatus(403)
    
        req.user = user
    
        next()
      })
    }
}