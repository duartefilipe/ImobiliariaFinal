package br.csi.controller;

import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import br.csi.modelo.dao.UsuarioDao;
import br.csi.modelo.Usuario;

@Controller
public class UsuarioController {
	
	@RequestMapping("login")
	public String AutenticaUsuario(String nome, String senha , HttpServletRequest rq) throws ClassNotFoundException, SQLException {
		
			
		System.out.println("controller atuenticar");
		HttpSession sessao = rq.getSession(true);
		try{

			Usuario u = new Usuario();
			UsuarioDao uD = new UsuarioDao();
			
			u = uD.autenticar(nome, senha);
			
			if(u != null){
				System.out.println(" vai pagina imobiliaria");
				
				if(u.getTipo() == 1){
					 rq.getSession().invalidate();
				        rq.getSession().setAttribute("usuario", u);
						return "Administrador/administrador";
				}
				if(u.getTipo() == 2){
					rq.getSession().invalidate();
			        rq.getSession().setAttribute("usuario", u);
					return "Imobiliaria/Principal";
				}
				
				
			}else{
					rq.setAttribute("msg","Problemas ao Logar");
					return "index";
				
				
			}
			
			}catch(Exception e){
				e.printStackTrace();
			}
				
				
				
				
			
				
			
	
		return "index";
	}
	
	@RequestMapping("logout")
	public String logout (HttpServletRequest rq){
		rq.getSession().invalidate();
		return "index";
	}
}
