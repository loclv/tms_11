user = User.create!(name:  "Example Supervisor",
                    email: "supervisor@gmail.com",
                    password:              "123456",
                    password_confirmation: "123456",
                    admin:     true)

course = Course.create! name: "Traning Basic Ruby",
                        description: "For HEDSPI K55 - HUST by Sensei",
                        begin_at: "2016-01-08",
                        end_at:   "2017-02-15"

UserCourse.create! user_id: user.id, course_id: course.id