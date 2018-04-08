package Help;

import com.matisse.*;
import java.sql.*;

public class Connect {
    private Connection conn;
    public Connect() throws MtException, ClassNotFoundException, SQLException
    {
        Class.forName("com.matisse.sql.MtDriver");
        conn = DriverManager.getConnection("jdbc:mt://localhost/Auction");
    }


    public Statement getStatement() throws SQLException {
        Statement stm = conn.createStatement();
        return stm;
    }


    public void closeConnection() throws SQLException {
        conn.close();
    }

    public String get(){
        return "Hello World";
    }

}