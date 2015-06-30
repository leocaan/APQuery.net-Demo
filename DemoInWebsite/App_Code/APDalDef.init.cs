using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public partial class APDalDef
{

	public partial class DepartmentDal : DepartmentDalBase
	{

		public override List<Department> GetInitData()
		{
			List<Department> list = new List<Department>();

			for (int i = 1; i <= 5; i++)
			{
				list.Add(new Department(){
					DepartmentId = i,
					ParentId = 0,
					DeptName = String.Format("MainDept-{0:D2}", i),
					Phone = String.Format("000-000-{0:D4}", i)
				});
			}

			for (int i = 11; i <= 50; i++)
			{
				list.Add(new Department()
				{
					DepartmentId = i,
					ParentId = 1,
					DeptName = String.Format("SubDept-{0:D2}", i),
					Phone = String.Format("000-000-{0:D4}", i)
				});
			}

			return list;
		}

	}

	public partial class EmployeeDal : EmployeeDalBase
	{

		public override List<Employee> GetInitData()
		{
			List<Employee> list = new List<Employee>();

			int id = 1;

			list.Add(new Employee()
			{
				EmployeeId = id++,
				DepartmentId = 1,
				Name = "Leonard",
				Birthday = new DateTime(1980, 1, 1),
				Email = "Leonard@demo.com"
			});
			list.Add(new Employee()
			{
				EmployeeId = id++,
				DepartmentId = 2,
				Name = "Johnny",
				Birthday = new DateTime(1980, 1, 1),
				Email = "Johnny@demo.com"
			});
			list.Add(new Employee()
			{
				EmployeeId = id++,
				DepartmentId = 3,
				Name = "Lily",
				Birthday = new DateTime(1981, 2, 2),
				Email = "Lily@demo.com"
			});
			list.Add(new Employee()
			{
				EmployeeId = id++,
				DepartmentId = 4,
				Name = "Jessica",
				Birthday = new DateTime(1983, 3, 3),
				Email = "Jessica@demo.com"
			});
			list.Add(new Employee()
			{
				EmployeeId = id++,
				DepartmentId = 5,
				Name = "Tony",
				Birthday = new DateTime(1984, 4, 4),
				Email = "Tony@demo.com"
			});

			return list;
		}

	}

}