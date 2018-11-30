package Service;

import DAO.LoginDAO;

public class LoginService {
    private LoginDAO dao = new LoginDAO();

    public boolean verificaUsuario(String login, String senha){
        return dao.VerificaUsuario(login,senha);
    }
    public boolean criaUsuario(String nome,String login,String senha){
        return dao.CriaUsuario(nome, login, senha);
    }
    public boolean resetSenha(String nome,String login,String senha){
        return dao.ResetSenha(nome, login, senha);
    }
}
