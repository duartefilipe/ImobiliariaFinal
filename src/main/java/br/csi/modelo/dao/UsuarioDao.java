package br.csi.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import br.csi.modelo.Usuario;
import br.csi.util.ConectaBanco;

public class UsuarioDao {

	public Usuario autenticar(String nome, String senha) throws ClassNotFoundException, SQLException {

		Connection con = ConectaBanco.getConexao();

		System.out.println("Autenticando...");

			String sql = "SELECT * FROM imobiliaria where nome =? and senha=?";
			PreparedStatement stmt = con.prepareStatement(sql);
			
			Usuario u = null;
			
			stmt.setString(1, nome);
			stmt.setString(2, senha);
			
			
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				u = new Usuario();
				u.setNome(rs.getString("nome"));
				System.out.println("nome: " +u.getNome());
				u.setSenha(rs.getString("senha"));
				System.out.println("senha: " +u.getSenha());
				u.setTipo(rs.getInt("tipo"));
				System.out.println("tipo: " +u.getTipo());
				
			}
		return u;
	}



}
