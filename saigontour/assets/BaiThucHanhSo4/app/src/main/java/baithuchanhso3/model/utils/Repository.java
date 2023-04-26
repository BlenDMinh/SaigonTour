package baithuchanhso3.model.utils;

import java.lang.reflect.Field;

public class Repository<TEntity, TPrimary> {
    /*
     * TODOS
     * Create Table for @Entity: Done
     * Read record and mapping into @Entity: How??
     */
    private String tableName;
    private final Class<TEntity> EntityClass;
    private final Class<TPrimary> PrimaryClass;
    public Repository(Class<TEntity> EntityClass, Class<TPrimary> PrimaryClass) {
        this.EntityClass = EntityClass;
        this.PrimaryClass = PrimaryClass;
        this.tableName = this.EntityClass.getSimpleName();
        createTable();
    }

    private void createTable() {
        String query = "CREATE TABLE IF NOT EXISTS " + this.tableName + "(";

        for(int i = 0; i < EntityClass.getDeclaredFields().length; i++) {
            Field field = EntityClass.getDeclaredFields()[i];
            String fieldname = field.getName();
            String typename = SqlTypeMapper.GetSQLType(field.getType().getName());
            String sfield = fieldname + " " + typename;
            if(field.isAnnotationPresent(Primary.class))
               sfield += " PRIMARY KEY";
            if(i != EntityClass.getDeclaredFields().length - 1)
                sfield += ",";
            query += sfield;
        }
        query = query + ")";
        DBUtils.instance.executeUpdate(query);
    }
}
