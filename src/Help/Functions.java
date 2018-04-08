package Help;

import java.sql.*;

import com.matisse.MtException;

public class Functions {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {

    }
    public String getWorkingPath() {
        String userDir = System.getProperty("user.dir");
        return userDir + "src\\main\\webapp";
    }
    // Unique key for each item
    int key;


    public int generateKey() throws MtException, ClassNotFoundException, SQLException {
        Connect c = new Connect();
        Statement stm = c.getStatement();
        ResultSet rs = stm.executeQuery("SELECT MAX(item_lot_number) FROM auction_items");
        try{
            while(rs.next()) {
                key = Integer.parseInt(rs.getString(1)) + 1;
            }
        }
        catch(Exception e){
            key = 52432345;
        }

        c.closeConnection();
        return key;
    }
}
