import AuthRepository from '../repositories/authRepository.js';

const iniciarSesion = async (req, res) => {
  try { 
    const repository = new AuthRepository();
    const result = await repository.validarUsuario(req.body.identificacion, req.body.contraseña);

    if(result == true){
        let token = jwt.sign({ user: req.body.identificacion }, process.env.AUT_SECRET, { expiresIn: process.env.AUT_EXPIRE });
        return res.status(200).json({ token: token, message: 'Usuario autorizado..' });
    }else {
        return res.status(400).json({ message: "Usuario inválido." });
    }
} catch (error) {
    console.error('Error en el inicio de sesión:', error);
    return res.status(500).json({ message: 'Error en el sistema' });
}
};

export const validarToken = (req, res) => {
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
    
export default iniciarSesion;