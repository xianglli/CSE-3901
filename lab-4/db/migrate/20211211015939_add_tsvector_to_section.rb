class AddTsvectorToSection < ActiveRecord::Migration[6.1]
  def change
    add_column :sections, :tsv, :tsvector
    add_index :sections, :tsv, using: 'gin'

    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE ON sections
          FOR EACH ROW EXECUTE PROCEDURE
          tsvector_update_trigger(tsv, 'pg_catalog.simple', "classNumber", "section", "instructionMode", "buildingDescription");
        SQL

        # Trigger re-index on existing movies
        execute("UPDATE courses SET id = id")
      end

      dir.down { execute("DROP TRIGGER IF EXISTS tsvectorupdate ON sections") }

    end
  end
end
