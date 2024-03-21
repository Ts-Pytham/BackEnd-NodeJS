import { Router } from 'express';
import { actualizarArea, buscarAreaPorId, listarArea, registrarArea } from '../controllers/area.controllers.js';
import { validarToken } from '../controllers/auth.controllers.js';
import validacionArea from '../validation/validatorarea.js';
import { ROLES } from '../helpers/constants.js';
const areaRouter = Router();

areaRouter.get('/listar', validarToken(ROLES.admin), listarArea);
areaRouter.post('/registrar', validarToken(ROLES.admin), validacionArea, registrarArea);
areaRouter.get('/buscar/:id', validarToken(ROLES.admin), buscarAreaPorId);
areaRouter.put('/actualizar/:id', validarToken(ROLES.admin), validacionArea, actualizarArea);

export default areaRouter;