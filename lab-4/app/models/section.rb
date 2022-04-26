class Section < ApplicationRecord

    include PgSearch::Model
    pg_search_scope :pg_search, against: [:classNumber, :section, :instructionMode, :buildingDescription], using: { tsearch: { prefix: true, tsvector_column: "tsv" } }

end
