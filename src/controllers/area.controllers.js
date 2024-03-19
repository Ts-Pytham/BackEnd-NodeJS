import AreaRepository from '../repositories/areaRepository.js';

export const registrarArea = async (req, res) => {
    try {
        const { nombre } = req.body;

        const areaRepository = new AreaRepository();
        const result = await areaRepository.registrarArea(nombre);

        if (result > 0) {
            return res.status(200).json({
                status: "200 OK",
                message: 'Area registrado con éxito',
            });
        } else {
            return res.status(400).json({
                status: "400 Bad Request",
                message: 'No se pudo registrar el area',
            });
        }
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "500 Internal Server Error",
            message: 'Error en el servidor' + err.message,
        });
    }
};


export const listarArea = async (req, res) => {
    try {
        const areaRepository = new AreaRepository();
        const result = await areaRepository.listarAreas();
        res.status(200).json(result);
  
    } catch (e) {
        res.status(500).json({ massage: 'Error en el controlador area:' + e });
    }
  };
  
  export const buscarAreaPorId = async (req, res) => {
    try {
        const id = req.params.id;

        const areaRepository = new AreaRepository();
        const result = await areaRepository.buscarAreaPorId(id);

        if (result.length > 0) {
            return res.status(200).json(result[0]);
        } else {
            return res.status(404).json({
                status: "404 Not Found",
                message: 'No se encontró el area',
            });
        }
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "500 Internal Server Error",
            message: 'Error en el servidor' + err.message,
        });
    }
};

export const actualizarArea = async (req, res) => {
    try{ 
        let id = req.params.id;
        let{nombre} =req.body;

        const areaRepository = new AreaRepository();
        const result = await areaRepository.actualizarArea(id, nombre);

        if (result > 0)
            return res.status(200).json({ 
                'status':"200 OK",
                'message':'Se actualizo con exito el area',
            });
        else
            return res.status(401).json({ 
                'status':"401 Not Found",
                'message':'No se actualizo el area' 
            });
    } catch (err) {
        res.status(500).json({
            'status':"500 Internal Server Error",
            'message':'Error en el servidor' + err.message,
        });
    }
};
