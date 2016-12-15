package br.csi.controller;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import br.csi.modelo.Imovel;
import br.csi.modelo.dao.ImobiliariaDao;
import br.csi.modelo.dao.ImovelDao;

@Controller
public class ImovelController {
	
	@RequestMapping ("CadastrarImovel")
	public String adiciona (Imovel imovel) throws ClassNotFoundException, SQLException{
		boolean retorno = new ImovelDao().cadastraImovel(imovel);
		if(retorno){
			return "Imobiliaria/Principal";
		}else{
			return "principal";
		}
	}
	
	@RequestMapping("RemoverImovel")
	public String DeletaImovel(int id , HttpServletRequest rq) throws SQLException, Exception{
		
		ImovelDao bD = new ImovelDao();
			
			
			
			boolean retorno = bD.deletarImovel(id);
			if(retorno){
				rq.setAttribute("imoveis", bD.getImoveis());
				return "Imobiliaria/Principal";
			}else{
				rq.setAttribute("msg","roblema pra excluir");
				return "erro";
			}
		}
	
	@RequestMapping("AlteraImovel")
	public String AlteraImovel(Imovel i, HttpServletRequest rq) throws NoSuchAlgorithmException, ClassNotFoundException, SQLException{
		
		ImovelDao iD = new ImovelDao();
		
			boolean retorno = iD.alteraImovel(i);
			
			System.out.println("No Altera professor  :   "+retorno);
			if(retorno){
				return "Imobiliaria/Principal";
			}else{
				rq.setAttribute("msg","problemas ao alterar professor");
				return "erro";
			}
	}	
	
	@RequestMapping("AlteraImovelAdmin")
	public String AlteraImovelAdmin(Imovel i, HttpServletRequest rq) throws NoSuchAlgorithmException, ClassNotFoundException, SQLException{
		
		ImovelDao iD = new ImovelDao();
		
			boolean retorno = iD.alteraImovel(i);
			
			System.out.println("No Altera professor  :   "+retorno);
			if(retorno){
				return "Administrador/Imoveis";
			}else{
				rq.setAttribute("msg","problemas ao alterar professor");
				return "erro";
			}
	}	
}	
