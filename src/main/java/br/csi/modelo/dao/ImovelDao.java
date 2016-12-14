package br.csi.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import br.csi.modelo.Imovel;
import br.csi.util.ConectaBanco;

public class ImovelDao {
	public boolean cadastraImovel(Imovel i) throws SQLException{
		Connection c = null;
		PreparedStatement stmt = null;
		boolean retorno = false;
		
		
		String cidade = i.getCidade();
		String endereco = i.getEndereco();
		String valor = i.getValor();
		String caracteristicas = i.getCaracteristicas();
		String tipo = i.getTipo();
		String imagem = i.getImagem();
		


		try {
			c = ConectaBanco.getConexao();
			String sql="insert into imovel (cidade, endereco, valor, caracteristicas, tipo, imagem) values (?,?,?,?,?,?)";
			stmt = c.prepareStatement(sql);
			stmt.setString(1, cidade);
			stmt.setString(2, endereco);
			stmt.setString(3, valor);
			stmt.setString(4, caracteristicas);
			stmt.setString(5, tipo);
			stmt.setString(6, imagem);

			
			stmt.execute();
			stmt.close();
			retorno = true;
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return retorno;
		}
		return retorno;
	}
	
	public boolean alteraImovel(Imovel i) throws ClassNotFoundException, SQLException {
	    boolean retorno = false;
        Connection c = null;
		PreparedStatement stmt = null;

			c = ConectaBanco.getConexao();
			String sql="update imovel set cidade = ?, endereco = ?, valor = ?, caracteristicas = ?, tipo = ? where id = ?";
			stmt = c.prepareStatement(sql);
			
			stmt.setString(1, i.getCidade());
			stmt.setString(2, i.getEndereco());
			stmt.setString(3, i.getValor());
			stmt.setString(4, i.getCaracteristicas());
			stmt.setString(5, i.getTipo());
			stmt.setInt(6, i.getId());
					
			stmt.execute();
			stmt.close();
			retorno = true;
			System.out.println("AQUI NO ALTERAR DAO--"+i.getId());
		
 return retorno;
}
	

	public long buscacodigo() throws SQLException, ClassNotFoundException {
		Connection c = null;
		PreparedStatement stmt = null;

		c = ConectaBanco.getConexao();
		String sql = "";

		sql = "select MAX(id) as id from imovel";
		stmt = c.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		long codigo = rs.getInt("id");
		rs.close();
		stmt.close();
		return codigo;
	}

	public ArrayList<Imovel> getImoveis() throws ClassNotFoundException {

		ArrayList<Imovel> log1 = new ArrayList<Imovel>();
		Connection con = ConectaBanco.getConexao();
		Imovel Imo;

		try {
			String sql = "SELECT * FROM imovel ORDER BY nome ASC";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				Imo = new Imovel();
				Imo.setId(rs.getInt("id"));
				Imo.setCidade(rs.getString("cidade"));
				Imo.setEndereco(rs.getString("endereco"));
				Imo.setValor(rs.getString("valor"));
				Imo.setCaracteristicas(rs.getString("caracteristicas"));
				Imo.setTipo(rs.getString("tipo"));
				


				log1.add(Imo);
				System.out.println("Adicionado no Array");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return log1;
	}

	
	public ArrayList<Imovel> getImoveisAl() throws ClassNotFoundException {

		ArrayList<Imovel> log2 = new ArrayList<Imovel>();
		Connection con = ConectaBanco.getConexao();
		Imovel Imo;

		try {
			String sql = "SELECT * FROM imovel where tipo = 'alugar'";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				Imo = new Imovel();
				Imo.setId(rs.getInt("id"));
				Imo.setCidade(rs.getString("cidade"));
				Imo.setEndereco(rs.getString("endereco"));
				Imo.setValor(rs.getString("valor"));
				Imo.setCaracteristicas(rs.getString("caracteristicas"));
				Imo.setTipo(rs.getString("tipo"));
				


				log2.add(Imo);
				System.out.println("Adicionado no Array");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return log2;
	}
	
	public ArrayList<Imovel> getImoveisV() throws ClassNotFoundException {

		ArrayList<Imovel> log3 = new ArrayList<Imovel>();
		Connection con = ConectaBanco.getConexao();
		Imovel Imo;

		try {
			String sql = "SELECT * FROM imovel where tipo = 'vender'";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				Imo = new Imovel();
				Imo.setId(rs.getInt("id"));
				Imo.setCidade(rs.getString("cidade"));
				Imo.setEndereco(rs.getString("endereco"));
				Imo.setValor(rs.getString("valor"));
				Imo.setCaracteristicas(rs.getString("caracteristicas"));
				Imo.setTipo(rs.getString("tipo"));
				


				log3.add(Imo);
				System.out.println("Adicionado no Array");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return log3;
	}
	
	public Imovel getimovel(int id) throws ClassNotFoundException {
		Connection con = ConectaBanco.getConexao();
		Imovel imo = new Imovel();
		;
		try {
			String sql = "SELECT * FROM imovel WHERE id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				imo.setId(rs.getInt("id"));
				imo.setCidade(rs.getString("cidade"));
				imo.setEndereco(rs.getString("endereco"));
				imo.setValor(rs.getString("valor"));
				imo.setCaracteristicas(rs.getString("caracteristicas"));
				imo.setTipo(rs.getString("tipo"));
				

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return imo;
	}
	
	
	public Imovel pesquisaImovel(int id ) throws ClassNotFoundException, SQLException{
		
		Imovel i = null;
		
		Connection c = ConectaBanco.getConexao();
		String sql = "select * from imovel where id=?";
		PreparedStatement stmtPre = c.prepareStatement(sql);
		
		System.out.println("ID NO DAO DO IMOVEL "+id);
		
		stmtPre.setInt(1, id);
		
		ResultSet rs= stmtPre.executeQuery();
		while(rs.next()){
				i = new Imovel();	    
				i.setId(rs.getInt("id"));
				i.setCidade(rs.getString("cidade"));
				i.setEndereco(rs.getString("endereco"));
				i.setValor(rs.getString("valor"));
				i.setCaracteristicas(rs.getString("caracteristicas"));
				i.setTipo(rs.getString("tipo"));
				

		}
		return i;
	}
	

	public boolean deletarImovel(int id) throws SQLException, Exception {
        boolean deletar = false;
        Connection c = null;
		PreparedStatement stmt = null;
		
		c = ConectaBanco.getConexao();
		String sql=" delete from  imovel where id=?";
		stmt = c.prepareStatement(sql);
		stmt.setInt(1,id); 
		stmt.execute();
		stmt.close();
		deletar = true;
        
		return deletar;
    }
}
