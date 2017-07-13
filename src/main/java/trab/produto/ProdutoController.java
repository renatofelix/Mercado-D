package trab.produto;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/manter")
public class ProdutoController extends HttpServlet {
	private String valor(HttpServletRequest req, String param, String padrao) {
		String result = req.getParameter(param);
		if (result == null) {
			result = padrao;
		}
		return result;
	}
		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				String msg;
				String op = valor(req, "operacao", "");
				String codMercadoria = valor(req, "codMercadoria", "");
				String nome = valor(req, "nome", "");
				String  preco = valor(req, "preco", ""); 
				if (op.equals("incluir")) {
					ProdutoDataAccessObject.inclui(codMercadoria, nome, Float.valueOf(preco.replace(',', '.')));
					msg = "Inclusão realizada com sucesso.";
				} else if (op.equals("alterar")) {
					ProdutoDataAccessObject.alterarPreco(codMercadoria, Float.valueOf( preco.replace(',', '.')));
					msg = "Alteração realizada com sucesso.";
				} else if (op.equals("excluir")) {
					ProdutoDataAccessObject.excluir(codMercadoria);
					msg = "Exclusão realizada com sucesso.";
				} else if (op.equals("")) {
					msg = "";
				} else {
					throw new IllegalArgumentException("Operação \"" + op + "\" não suportada.");
				}
				req.setAttribute("msg", msg);
				req.setAttribute("produtos", ProdutoDataAccessObject.listar());
				
				//req.getRequestDispatcher("CadastrarView.jsp").forward(req, resp);
				req.getRequestDispatcher("usuario/cliente/cadastrar/index.jsp").forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace(resp.getWriter());
			}
		}

}
