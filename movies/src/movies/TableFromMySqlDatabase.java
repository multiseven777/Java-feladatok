package movies;

import java.awt.BorderLayout;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;

import com.mysql.jdbc.Statement;

public class TableFromMySqlDatabase extends JFrame {
	
	 public TableFromMySqlDatabase()
	    {
	        ArrayList columnNames = new ArrayList();
	        ArrayList data = new ArrayList();

	        //  Connect to an MySQL Database
	        String url = "jdbc:mysql://127.0.0.1:3306/movies";
	        String userid = "user1";
	        String password = "password1";
	        String sql = "SELECT * FROM movie_collection";

	        // This will ensure that the sql objects are closed
	        
	        try (Connection connection = DriverManager.getConnection( url, userid, password );
	            Statement stmt = (Statement) connection.createStatement();
	            ResultSet rs = stmt.executeQuery( sql ))
	        {
	            ResultSetMetaData md = rs.getMetaData();
	            int columns = md.getColumnCount();

	            //  Get column names
	            for (int i = 1; i <= columns; i++)
	            {
	                columnNames.add( md.getColumnName(i) );
	            }

	            //  Get row data
	            while (rs.next())
	            {
	                ArrayList row = new ArrayList(columns);

	                for (int i = 1; i <= columns; i++)
	                {
	                    row.add( rs.getObject(i) );
	                }

	                data.add( row );
	            }
	        }
	        catch (SQLException e)
	        {
	            System.out.println( e.getMessage() );
	        }

	        // Create Vectors and copy over elements from ArrayLists
	       
	        Vector columnNamesVector = new Vector();
	        Vector dataVector = new Vector();

	        for (int i = 0; i < data.size(); i++)
	        {
	            ArrayList subArray = (ArrayList)data.get(i);
	            Vector subVector = new Vector();
	            for (int j = 0; j < subArray.size(); j++)
	            {
	                subVector.add(subArray.get(j));
	            }
	            dataVector.add(subVector);
	        }

	        for (int i = 0; i < columnNames.size(); i++ )
	            columnNamesVector.add(columnNames.get(i));

	        //  Create table with database data    
	        JTable table = new JTable(dataVector, columnNamesVector)
	        {
	            public Class getColumnClass(int column)
	            {
	                for (int row = 0; row < getRowCount(); row++)
	                {
	                    Object o = getValueAt(row, column);

	                    if (o != null)
	                    {
	                        return o.getClass();
	                    }
	                }

	                return Object.class;
	            }
	        };

	        JScrollPane scrollPane = new JScrollPane( table );
	        getContentPane().add( scrollPane );

	        JPanel buttonPanel = new JPanel();
	        getContentPane().add( buttonPanel, BorderLayout.SOUTH );
	    }

	    public static void main(String[] args)
	    {
	        TableFromMySqlDatabase frame = new TableFromMySqlDatabase();
	        frame.setDefaultCloseOperation( EXIT_ON_CLOSE );
	        frame.pack();
	        frame.setVisible(true);
	    }
	
	

}
