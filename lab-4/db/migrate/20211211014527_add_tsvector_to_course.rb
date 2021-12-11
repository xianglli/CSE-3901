class AddTsvectorToCourse < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :tsv, :tsvector
    add_index :courses, :tsv, using: 'gin'

    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE ON courses
          FOR EACH ROW EXECUTE PROCEDURE
          tsvector_update_trigger(tsv, 'pg_catalog.simple', title, "catalogNumber", "description");
        SQL

        # Trigger re-index on existing movies
        execute("UPDATE courses SET id = id")
      end

      dir.down { execute("DROP TRIGGER IF EXISTS tsvectorupdate ON courses") }

    end
  end
end
