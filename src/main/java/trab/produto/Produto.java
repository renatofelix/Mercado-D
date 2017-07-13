package trab.produto;


import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Produto {



	@Id
	private String codMercadoria;

	private String nome;
	
	private float preco;
	
	public String getCodMercadoria() {
		return codMercadoria;
	}

	public void setCodMercadoria(String codMercadoria) {
		this.codMercadoria = codMercadoria;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public float getPreco() {
		return preco;
	}

	public void setPreco(float preco) {
		this.preco = preco;
	}



}