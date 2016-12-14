package br.csi.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import br.csi.modelo.Imobiliaria;
import br.csi.util.ConectaBanco;

public class ImobiliariaDao {
	public boolean cadastraImobiliaria(Imobiliaria i) throws SQLException{
		Connection c = null;
		PreparedStatement stmt = null;
		boolean retorno = false;
		
		



		try {
			c = ConectaBanco.getConexao();
			String sql="insert into imobiliaria (nome, cidade, endereco, telefone, cnpj, email, senha, tipo) values (?,?,?,?,?,?,?,?)";
			stmt = c.prepareStatement(sql);
			stmt.setString(1,  i.getNome());
			stmt.setString(2,  i.getCidade());
			stmt.setString(3,  i.getEndereco());
			stmt.setString(4,  i.getTelefone());
			stmt.setString(5,  i.getCnpj());
			stmt.setString(6,  i.getEmail());
			stmt.setString(7, i.getSenha());
			stmt.setInt(8, i.getTipo());

			
			stmt.execute();
			stmt.close();
			retorno = true;
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return retorno;
		}
		return retorno;
	}
	
	public boolean alteraImobiliaria(Imobiliaria i) throws ClassNotFoundException, SQLException {
	    boolean retorno = false;
        Connection c = null;
		PreparedStatement stmt = null;

			c = ConectaBanco.getConexao();
			String sql="update imobiliaria set nome = ?, cidade = ?, endereco = ?, telefone = ?, cnpj = ?, email = ?, senha = ?, tipo = ? where id = ?";
			stmt = c.prepareStatement(sql);
			
			stmt.setString(1,  i.getNome());
			stmt.setString(2,  i.getCidade());
			stmt.setString(3,  i.getEndereco());
			stmt.setString(4,  i.getTelefone());
			stmt.setString(5,  i.getCnpj());
			stmt.setString(6,  i.getEmail());
			stmt.setString(7, i.getSenha());
			stmt.setInt(8, i.getTipo());
			stmt.setInt(9, i.getId());
					
			stmt.execute();
			stmt.close();
			retorno = true;
		
 return retorno;
}
	

	public long buscacodigo() throws SQLException, ClassNotFoundException {
		Connection c = null;
		PreparedStatement stmt = null;

		c = ConectaBanco.getConexao();
		String sql = "";

		sql = "select MAX(id) as id from imobiliaria";
		stmt = c.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		long codigo = rs.getInt("id");
		rs.close();
		stmt.close();
		return codigo;
	}

	public ArrayList<Imobiliaria> getImobiliarias() throws ClassNotFoundException {

		ArrayList<Imobiliaria> log4 = new ArrayList<Imobiliaria>();
		Connection con = ConectaBanco.getConexao();
		Imobiliaria Imo;

		try {
			String sql = "SELECT * FROM Imobiliaria where tipo = '2' ORDER BY nome ASC";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				Imo = new Imobiliaria();
				Imo.setId(rs.getInt("id"));
				Imo.setNome(rs.getString("nome"));
				Imo.setCidade(rs.getString("cidade"));
				Imo.setEndereco(rs.getString("endereco"));
				Imo.setTelefone(rs.getString("telefone"));
				Imo.setCnpj(rs.getString("cnpj"));
				Imo.setEmail(rs.getString("email"));
				Imo.setSenha(rs.getString("senha"));
				Imo.setTipo(rs.getInt("tipo"));
				


				log4.add(Imo);
				System.out.println("Adicionado no Array");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return log4;
	}

	
	
	
	public Imobiliaria getimobiliaria(int id) throws ClassNotFoundException {
		Connection con = ConectaBanco.getConexao();
		Imobiliaria Imo = new Imobiliaria();
		;
		try {
			String sql = "SELECT * FROM imobiliaria WHERE id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Imo.setId(rs.getInt("id"));
				Imo.setNome(rs.getString("nome"));
				Imo.setCidade(rs.getString("cidade"));
				Imo.setEndereco(rs.getString("endereco"));
				Imo.setTelefone(rs.getString("telefone"));
				Imo.setCnpj(rs.getString("cnpj"));
				Imo.setEmail(rs.getString("email"));
				Imo.setSenha(rs.getString("senha"));
				Imo.setTipo(rs.getInt("tipo"));
				

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return Imo;
	}
	
	
	public Imobiliaria pesquisaImobiliaria(int id ) throws ClassNotFoundException, SQLException{
		
		Imobiliaria i = null;
		
		Connection c = ConectaBanco.getConexao();
		String sql = "select * from imobiliaria where id=?";
		PreparedStatement stmtPre = c.prepareStatement(sql);
		
		
		stmtPre.setInt(1, id);
		
		ResultSet rs= stmtPre.executeQuery();
		while(rs.next()){
			i = new Imobiliaria();	
			i.setId(rs.getInt("id"));
			i.setNome(rs.getString("nome"));
			i.setCidade(rs.getString("cidade"));
			i.setEndereco(rs.getString("endereco"));
			i.setTelefone(rs.getString("telefone"));
			i.setCnpj(rs.getString("cnpj"));
			i.setEmail(rs.getString("email"));
			i.setSenha(rs.getString("senha"));
			i.setTipo(rs.getInt("tipo"));
				

		}
		return i;
	}
	

	public boolean deletarImobiliaria(int id) throws SQLException, Exception {
        boolean deletar = false;
        Connection c = null;
		PreparedStatement stmt = null;
		
		c = ConectaBanco.getConexao();
		String sql=" delete from  imobiliaria where id=?";
		stmt = c.prepareStatement(sql);
		stmt.setInt(1,id); 
		stmt.execute();
		stmt.close();
		deletar = true;
        
		return deletar;
    }
}
