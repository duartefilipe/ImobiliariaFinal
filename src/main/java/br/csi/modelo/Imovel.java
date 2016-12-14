package br.csi.modelo;
public class Imovel {
	
	private int id;
	private String cidade;
	private String endereco;
	private String valor;
	private String caracteristicas;
	private String tipo;
	private String imagem;
	
	public Imovel(String cidade, String endereco, String valor, String caracteristicas, String tipo, String imagem) { //, String imagem
		this.cidade = cidade;
		this.endereco = endereco;
		this.valor = valor;
		this.caracteristicas = caracteristicas;
		this.tipo = tipo;
		this.imagem = imagem;
	}
	
	public Imovel(){
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public String getCaracteristicas() {
		return caracteristicas;
	}

	public void setCaracteristicas(String caracteristicas) {
		this.caracteristicas = caracteristicas;
	}
	
	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	
}

