#!/usr/bin/python
import psycopg2 as p
import getpass


def menu():
    print()
    print("-"*30)
    print("[1] Add new client")
    print("[2] Client update")
    print("[3] Delete client")
    print('[4] Go back to main page')
    print("[0] Exit the program.")
    print("-"*30)


def products(conn):
    # Adăugarea/ Ștergerea/ Actualizarea unui nou produs
    print("products")


def clients(conn):
    # Adăugarea/ Ștergerea/ Actualizarea unui nou client
    print("clients")


def display(conn):
    # Afișarea listei de produse/ clienți
    # Afișarea unui client/ produs specific
    print("display")


def reports(conn):
    # Media de varsta a clientilor
    # Prețul mediu al produselor
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
                products(conn)

            elif option == 2:
                clients(conn)

            elif option == 3:
                display(conn)

            elif option == 4:
                reports(conn)

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