# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |i|
    poem = Poem.new({
        #teacher_name: "Teacher_Name ##{i}",
        teacher_name: "Ron Alexander",
        county: "County ##{i}",
        email: "Email ##{i}",
        student_name: "Student_Name ##{i}",
        grade: "Grade ##{i}",
        student_teacher_name: "Student_Teacher_Name ##{i}",
        title: "Title ##{i}",
        attachment: "Attachment ##{i}",
        poem: "Poem ##{i}",
        release: "Release ##{i}",
        school: "School ##{i}",
        approval: "pending",
        status: "Pending"
        # fix? pending is case sensitive
        })
    poem.save!(validate: false)
end

5.times do |i|
    tag = Tag.new({
        # add approval column to tag table
        name: "Name ##{i}",
        status: "Pending",
        popularity: i,
        taggings_count: i*10,
        created_at: DateTime.now.to_date,
        updated_at: DateTime.now.to_date
        })
    tag.save!(validate: false)
end

# Make login user
user = User.new
user.email = 'test@test.com'
user.password = '123456'
user.save!