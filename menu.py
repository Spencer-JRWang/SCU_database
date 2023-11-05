#!/usr/bin/python
# schema方案和选择的原因：
#
#
#
#

import psycopg2 as p
import getpass


def menu():
    print()
    print("-"*30)
    print("[1] 每个班级的学生数量")
    print("[2] 学生的平均分")
    print("[3] 学生的选课清单")
    print('[4] 课程模块的管理者')
    print("[5] 年度最佳管理者及学生")
    print("[0] 退出")
    print("-"*30)

# 定义查询每个班级的学生数量的函数
def stu_count(conn):
    cur = conn.cursor()
    cur.execute("select count(class_name) from student group by class_name;")
    data_classname = cur.fetchone()
    print(data_classname)
    cur.close()

# 定义查询学生平均分的函数
def avg_grade(conn):
    print("clients")

# 定义查询学生选课清单的函数
def list_ch(conn):
    print("display")

# 定义查询课程模块管理者的函数
def admin(conn):
    print("reports")

# 定义查询年度最佳管理者和学生的函数
def best_admin_stu(conn):
    print("reports")

def run():
    conn = None
    try:
        # read password from stdin
        print("Please provide your password.")
        pw = getpass.getpass()

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = p.connect(
            "host=localhost dbname=school user=postgres password="+pw)

        menu()
        option = int(input("Enter your option: "))

        while option != 0:
            if option == 1:
                stu_count(conn)

            elif option == 2:
                avg_grade(conn)

            elif option == 3:
                list_ch(conn)

            elif option == 4:
                admin(conn)
            elif option == 5:
                best_admin_stu(conn)    
            else:
                print("Invalid option.")

            menu()
            option = int(input("Enter your option: "))
            # sa nu intre in bucla
    except (Exception, p.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')


if __name__ == '__main__':
    run()