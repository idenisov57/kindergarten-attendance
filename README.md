# kindergarten-attendance

https://erd.dbdesigner.net/designer/schema/1705128910-kindergarten


parent {
	parent_id integer pk increments
	fio text
	login text unique
	password text
	contact text
}

job {
	job_id integer pk increments
	name text
}

staff {
	staff_id integer pk increments
	job_id integer >* job.job_id
	login text unique
	password text
	fio text
	contact text
}

group {
	group_id integer pk increments
	name integer
}

kid {
	kid_id integer pk increments
	parent_id integer >* parent.parent_id
	group_id integer >* group.group_id
	fio text
}

attendance {
	date date pk
	kid_id integer >* kid.kid_id
	presence boolean
}

staff_group {
	staff_id integer pk >* staff.staff_id
	group_id integer pk >* group.group_id
}



![kindergarten (1)](https://github.com/idenisov57/kindergarten-attendance/assets/100908566/ca2b3cfb-0035-4bdd-9b44-9e4e02c5a027)
