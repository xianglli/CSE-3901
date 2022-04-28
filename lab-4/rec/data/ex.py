import pandas as pd

data = pd.read_csv("./features_sample.csv")
uniq_course = (data["courseID"].unique())

course_id = {}
count = 1
for i in uniq_course:
    course_id[i] = str(count)
    count = count + 1

data["courseID"] = data["courseID"].map(course_id)
data.to_csv("./features_sample.csv",index = None)
print("finished")