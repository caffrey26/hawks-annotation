class Annotation < ActiveRecord::Base
def annotated_file
    f_name = ProjectFile.find(self.file_id).file_name
    f_name + " (" + "#{try(:text)}"+ ")"
end
end
