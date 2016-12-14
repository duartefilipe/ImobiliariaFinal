package br.csi.controller;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import br.csi.modelo.Imobiliaria;
import br.csi.modelo.dao.ImobiliariaDao;

@Controller
public class ImobiliariaController {
	
	@RequestMapping ("CadastrarImobiliaria")
	public String adiciona (Imobiliaria imobiliaria) throws ClassNotFoundException, SQLException{
		boolean retorno = new ImobiliariaDao().cadastraImobiliaria(imobiliaria);
		if(retorno){
			return "Administrador/administrador";
		}else{
			return "Administrador/administrador";
		}
	}
	
	@RequestMapping("RemoverImobiliaria")
	public String DeletaImobiliaria(int id , HttpServletRequest rq) throws SQLException, Exception{
		
		ImobiliariaDao iD = new ImobiliariaDao();
			
			
			
			boolean retorno = iD.deletarImobiliaria(id);
			if(retorno){
				rq.setAttribute("imobiliarias", iD.getImobiliarias());
				return "Administrador/administrador";
			}else{
				rq.setAttribute("msg","roblema pra excluir");
				return "Administrador/administrador";
			}
		}
	
	@RequestMapping("AlterarImobiliaria")
	public String AlteraImobiliaria(Imobiliaria i,HttpServletRequest rq) throws NoSuchAlgorithmException, ClassNotFoundException, SQLException{
		
		ImobiliariaDao iD = new ImobiliariaDao();
		 System.out.println("imobiliaria no ALTERA nome imobiliaria---"+i.getNome());
		
		
			boolean retorno = iD.alteraImobiliaria(i);
			
			System.out.println("No Altera professor  :   "+retorno);
			if(retorno){
				return "Administrador/administrador";
			}else{
				rq.setAttribute("msg","problemas ao alterar professor");
				return "erro";
			}
	}
}	
