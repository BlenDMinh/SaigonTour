package baithuchanhso3.model.repository;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Optional;

import baithuchanhso3.model.entity.Student;
import baithuchanhso3.model.utils.CrudRepository;
import baithuchanhso3.model.utils.DBUtils;

public class StudentRepository extends CrudRepository<Student, Integer> {

    public StudentRepository() {
        super(Student.class, Integer.class);
    }

    private Optional<Student> fromResultSet(ResultSet result) {
        try {
            Integer id = result.getInt("Id");
            String name = result.getString("Name");
            String strDate = result.getString("Date");
            Date date = Date.valueOf(strDate);
            String address = result.getString("Address");
            String gender = result.getString("Gender");
            return Optional.of(new Student(id, name, date, address, gender));
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

    private String[] toRecord(Student student) {
        return new String[] {
            student.getId().toString(),
            student.getName(),
            student.getDate().toString(),
            student.getAddress(),
            student.getGender()
        };
    }

    @Override
    public Collection<Student> findAll() {
        return customQuery("SELECT * FROM Student");
    }

    @Override
    public Optional<Student> findById(Integer id) {
        ArrayList<Student> res = (ArrayList<Student>) customQuery("SELECT * FROM Student WHERE Id="+id);
        if(res.size() > 1)
            return Optional.of(res.get(0));
        return Optional.empty();
    }

    @Override
    public void save(Student entity) {
        customQuery("INSERT INTO Student VALUES (" + String.join(",", toRecord(entity)) + ")");
    }

    @Override
    public void delete(Student entity) {
        deleteById(entity.getId());
    }

    @Override
    public void deleteById(Integer id) {
        customQuery("DELETE FROM Student WHERE Id="+id);
    }
    
    public Collection<Student> customQuery(String query) {
        if(!DBUtils.instance.testQuery(query))
            DBUtils.instance.executeUpdate(query);
        ResultSet result = DBUtils.instance.executeQuery(query);
        if(result == null)
            return null;
        try {
            result.beforeFirst();
            Collection<Student> entities = new ArrayList<>();
            while(result.next()) {
                Optional<Student> student = fromResultSet(result);
                if(student.isPresent())
                    entities.add(student.get());
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
