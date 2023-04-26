package baithuchanhso3.model.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Optional;

import com.google.common.collect.Table;

import baithuchanhso3.model.entity.Table1;
import baithuchanhso3.model.utils.CrudRepository;
import baithuchanhso3.model.utils.DBUtils;

public class Table1Repository extends CrudRepository<Table1, Integer> {
    public Table1Repository() {
        super(Table1.class, Integer.class);
    }

    private Optional<Table1> FromResultSet(ResultSet result) {
        try {
            Integer id = result.getInt("Id");
            String name = result.getString("Name");
            String address = result.getString("Address");
            Double total = result.getDouble("Total");
            return Optional.of(new Table1(id, name, address, total));
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

    @Override
    public Collection<Table1> findAll() {
        String query = "SELECT * FROM Table1";
        ResultSet result = DBUtils.instance.executeQuery(query);
        Collection<Table1> entities = new ArrayList<>();
        try {
            result.beforeFirst();
            while(result.next()) {
                Integer id = result.getInt("Id");
                String name = result.getString("Name");
                String address = result.getString("Address");
                Double total = result.getDouble("Total");
                entities.add(new Table1(id, name, address, total));
            }
        } catch(SQLException e) {
            System.out.println(e.getSQLState());
            e.printStackTrace();
        } finally {
            try {
                if(result != null)
                    result.close();
            } catch (SQLException e) {
                System.out.println(e.getSQLState());
                e.printStackTrace();
            }
        }
        return entities;
    }

    @Override
    public Optional<Table1> findById(Integer id) {
        String query = "SELECT * FROM Table1 WHERE Id=" + id;
        ResultSet result = DBUtils.instance.executeQuery(query);
        try {
            if(!result.first())
                return Optional.empty();
            Integer _id = result.getInt("Id");
            String name = result.getString("Name");
            String address = result.getString("Address");
            Double total = result.getDouble("Total");
            Table1 entity = new Table1(_id, name, address, total);
            return Optional.of(entity);
        } catch(SQLException e) {
            System.out.println(e.getSQLState());
            e.printStackTrace();
        } finally {
            try {
                if(result != null)
                    result.close();
            } catch (SQLException e) {
                System.out.println(e.getSQLState());
                e.printStackTrace();
            }
        }
        return Optional.empty();
    }

    @Override
    public void save(Table1 entity) {
        String query = "SELECT * FROM Table1 WHERE Id=" + entity.getId();
        ResultSet result = DBUtils.instance.executeQuery(query);
        try {
            if(!result.first()) {
                String insertQuery = "INSERT INTO Table1 VALUES (" + entity.getId() + "," + entity.getName() + "," + entity.getAddress() + "," + entity.getTotal() +")";
                DBUtils.instance.executeUpdate(insertQuery);
                return;
            }
            result.updateString(1, entity.getName());
            result.updateString(2, entity.getAddress());
            result.updateDouble(3, entity.getTotal());
        } catch(SQLException e) {
            System.out.println(e.getSQLState());
            e.printStackTrace();
        } finally {
            try {
                if(result != null)
                    result.close();
            } catch (SQLException e) {
                System.out.println(e.getSQLState());
                e.printStackTrace();
            }
        }
    }

    @Override
    public void delete(Table1 entity) {
        String query = "SELECT * FROM Table1 WHERE Id=" + entity.getId();
        ResultSet result = DBUtils.instance.executeQuery(query);
        try {
            if(!result.first())
                return;
            String deleteQuery = "DELETE FROM Table1 WHERE Id=" + entity.getId();
            DBUtils.instance.executeUpdate(deleteQuery);
        } catch(SQLException e) {
            System.out.println(e.getSQLState());
            e.printStackTrace();
        } finally {
            try {
                if(result != null)
                    result.close();
            } catch (SQLException e) {
                System.out.println(e.getSQLState());
                e.printStackTrace();
            }
        }
    }

    @Override
    public void deleteById(Integer id) {
        String query = "DELETE FROM Table1 WHERE Id=" + id;
        DBUtils.instance.executeUpdate(query);
    }

    public Collection<Table1> customQuery(String query) {
        if(!DBUtils.instance.testQuery(query))
            DBUtils.instance.executeUpdate(query);
        ResultSet result = DBUtils.instance.executeQuery(query);
        if(result == null)
            return null;
        try {
            result.beforeFirst();
            Collection<Table1> entities = new ArrayList<>();
            while(result.next()) {
                Integer id = result.getInt("Id");
                String name = result.getString("Name");
                String address = result.getString("Address");
                Double total = result.getDouble("Total");
                entities.add(new Table1(id, name, address, total));
            }
            return entities;
        } catch(SQLException e) {
            System.out.println(e.getSQLState());
            e.printStackTrace();
        } finally {
            try {
                if(result != null)
                    result.close();
            } catch (SQLException e) {
                System.out.println(e.getSQLState());
                e.printStackTrace();
            }
        }
        return null;
    }
}
