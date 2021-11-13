package dao;

import java.sql.Connection;
import conexaojdbc.SingleConnection;
public class UsuarioDAO {	
	private Connection connection;		
	public UsuarioDAO(){
		connection = SingleConnection.getConnection();
	}
}
