package trab.produto;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;



public class ProdutoDataAccessObject {
	
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistence-meta");
	
	public static void inclui(String codMercadoria, String nome, float preco) {
		// Obter "conexão".
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();

		Produto produto = new Produto();
		produto.setCodMercadoria(codMercadoria);
		produto.setNome(nome);
		produto.setPreco(preco);

		// Grava o objeto no banco de dados.
		em.persist(produto);
		em.getTransaction().commit();
		em.close();
	}

	//altera o preço
	public static void alterarPreco(String codMercadoria, float preco) {
		
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		
		Produto produto = em.find(Produto.class, codMercadoria);
		produto.setPreco(preco);
		em.getTransaction().commit();
		em.close();
	}

	public static void excluir(String codMercadoria) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		
		Produto produto = em.find(Produto.class, codMercadoria);
		em.remove(produto);
		em.getTransaction().commit();
		em.close();		
	}

	public static List<Produto> listar() {
		EntityManager em = emf.createEntityManager();
		String jpql = "from Produto";
		TypedQuery<Produto> query = em.createQuery(jpql, Produto.class);
		List<Produto> result = query.getResultList();
		em.close();
		return result;
	}
	
}
