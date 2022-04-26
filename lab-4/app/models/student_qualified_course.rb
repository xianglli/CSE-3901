class StudentQualifiedCourse < ApplicationRecord
    PREFERENCE = Hash[
        1 => "Qualified",
        5 => "willingly",
        10 => "strongly willingly"
    ]
end
