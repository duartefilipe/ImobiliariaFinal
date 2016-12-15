package br.csi.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import br.csi.modelo.Imobiliaria;
import br.csi.modelo.Imovel;
import br.csi.modelo.dao.ImobiliariaDao;
import br.csi.modelo.dao.ImovelDao;


@Controller
public class RedirectController {
	
	@RequestMapping("index")
	public String redirect(HttpServletRequest rq) throws ClassNotFoundException{
		return "index";
	}
	
	@RequestMapping("RedImoveis")
	public String redirectRedImoveis(HttpServletRequest rq) throws ClassNotFoundException{
		return "Administrador/Imoveis";
	}
	
	@RequestMapping("RedInicioAdm")
	public String redirectRedInicioAdm(HttpServletRequest rq) throws ClassNotFoundException{
		return "Administrador/administrador";
	}
	
	@RequestMapping("RedInicioImob")
	public String redirectRedInicioImob(HttpServletRequest rq) throws ClassNotFoundException{
		return "Imobiliaria/Principal";
	}
	
	@RequestMapping("Red360")
	public String redirectRed360(HttpServletRequest rq) throws ClassNotFoundException{
		return "Administrador/360";
	}
	
	@RequestMapping("RedSobreIndex")
	public String redirectSobre(HttpServletRequest rq) throws ClassNotFoundException{
		return "Sobre";
	}
	
	@RequestMapping("RedContato")
	public String redirectContato(HttpServletRequest rq) throws ClassNotFoundException{
		return "Contato";
	}
	
	@RequestMapping("RedLocacao")
	public String redirectLocacao(HttpServletRequest rq) throws ClassNotFoundException{
		return "Locacao";
	}
	
	@RequestMapping("RedVenda")
	public String redirectVenda(HttpServletRequest rq) throws ClassNotFoundException{
		return "Venda";
	}
	
	@RequestMapping("RedListaImobiliarias")
	public String redirectListaImobiliarias(HttpServletRequest rq) throws ClassNotFoundException{
		return "ListaImobiliarias";
	}
	
	

	
	//-----------------------------------------Imoveis------------------------------------------------
	
		@RequestMapping("RedAlteraImovelAluga")
		public String redirectAlteraImovelAluga(HttpServletRequest rq) throws ClassNotFoundException, SQLException{
			
			int id = Integer.parseInt(rq.getParameter("id"));
			
			System.out.println("AQUI NO REDIRECT imovel ALTERA"+id);
			
			Imovel i = new Imovel();
			ImovelDao iD = new ImovelDao();
			
			i = iD.pesquisaImovel(id);
			
			rq.setAttribute("imoAl", i);
			return "Imobiliaria/AlterarImovelAluga";
		}
	
		@RequestMapping("RedAlteraImovelVenda")
		public String redirectAlteraImovelVenda(HttpServletRequest rq) throws ClassNotFoundException, SQLException{
			
			int id = Integer.parseInt(rq.getParameter("id"));
			
			System.out.println("AQUI NO REDIRECT imovel ALTERA"+id);
			
			Imovel i = new Imovel();
			ImovelDao iD = new ImovelDao();
			
			i = iD.pesquisaImovel(id);
			
			rq.setAttribute("imoV", i);
			return "Imobiliaria/AlterarImovelVende";
		}
		
		@RequestMapping("RedMostraCasa")
		public String redirectMostraCasa(HttpServletRequest rq) throws ClassNotFoundException, SQLException{
			
			int id = Integer.parseInt(rq.getParameter("id"));
			
			Imovel i = new Imovel();
			ImovelDao iD = new ImovelDao();
			
			i = iD.pesquisaImovel(id);
			
			rq.setAttribute("imo", i);
			return "InformacoesImovel";
		}
		
		//-----------------------------------------imoveis fim------------------------------------------------
		
		//-----------------------------------------imobiliaria inicio------------------------------------------------
		
		@RequestMapping("RedAlteraImobiliaria")
		public String redirectAlteraImobiliaria(HttpServletRequest rq) throws ClassNotFoundException, SQLException{
			
			int id = Integer.parseInt(rq.getParameter("id"));
			
			System.out.println("AQUI NO REDIRECT imobiliaria ALTERA"+id);
			
			Imobiliaria i = new Imobiliaria();
			ImobiliariaDao iD = new ImobiliariaDao();
			
			i = iD.pesquisaImobiliaria(id);
			
			rq.setAttribute("imo", i);
			return "Administrador/AlteraImobiliaria";
		}
		
		@RequestMapping("RedAlteraImovelAdmin")
		public String redirectAlteraImovelAdmin(HttpServletRequest rq) throws ClassNotFoundException, SQLException{
			
			int id = Integer.parseInt(rq.getParameter("id"));
			
			System.out.println("AQUI NO REDIRECT imovel ALTERA"+id);
			
			Imovel i = new Imovel();
			ImovelDao iD = new ImovelDao();
			
			i = iD.pesquisaImovel(id);
			
			rq.setAttribute("imo", i);
			return "Administrador/AlteraImovelAdmin";
		}
		
		
		//-----------------------------------------imobiliaria fim------------------------------------------------
	
}
