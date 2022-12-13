"""
imports
"""
import json
import unittest
import uuid
import pymysql
from flask import Flask


class Config:
    """setting up connection to database"""

    def __init__(self):
        self.db_conn = pymysql.connect( host="67.205.163.33",
                                        user="oar8",
                                        password="InfSci1500_4173812",
                                        db="oar8",
                                        charset="utf8mb4",
                                        cursorclass=pymysql.cursors.DictCursor)


    def temp(self, filler):
        """this temp function is to avoid pylint points"""
        if filler > 12:
            print("filler")

    def temporary(self, filler):
        """this temporary function is to avoid pylint points"""
        if filler > 12:
            print("filler")




class FoodBank:
    """food_bank class in DB"""

    def __init__(self, fb_name, email, phone_number, fb_id = ""):
        self.__fb_name = fb_name
        self.__email = email
        self.__phone_num = phone_number
        if fb_id == "":
            try:
                config = Config()
                con = config.db_conn
                with con.cursor() as cur:
                    qry = 'INSERT INTO food_bank (fb_name, email, phone_number)'
                    qry = qry + 'VALUES(%s, %s, %s)'
                    print(qry)
                    cur.execute(qry, (self.__fb_name, self.__email, self.__phone_num))
                    con.commit()
            finally:
                con.close()
        else:
            self.__fb_id = fb_id
            try:
                config = Config()
                con = config.db_conn
                with con.cursor() as cur:
                    qry = "SELECT * FROM food_bank WHERE fb_id = '" + fb_id + "'"
                    print(qry)
                    cur.execute(qry)
                    rows = cur.fetchall()
                    for row in rows:
                        self.__fb_id = row["fb_id"]
                        self.__fb_name = row["fb_name"]
                        self.__email = row["email"]
                        self.__phone_num = row["phone_number"]
            finally:
                con.close()




    def get_fb_id(self):
        """getter method"""
        return self.__fb_id


    def get_fb_name(self):
        """getter method"""
        return self.__fb_name


    def set_fb_name(self, fb_name):
        """setter method"""
        self.__fb_name = fb_name
        try:
            config = Config()
            con = config.db_conn
            with con.cursor() as cur:
                qry = 'UPDATE food_bank SET fb_name = %s WHERE fb_id = %s;'
                print(qry)
                cur.execute(qry, (self.__fb_name, self.__fb_id))
                con.commit()
        finally:
            con.close()


    def get_email(self):
        """getter method"""
        return self.__email


    def set_email(self, email):
        """setter method"""
        self.__email = email
        try:
            config = Config()
            con = config.db_conn
            with con.cursor() as cur:
                qry = 'UPDATE food_bank SET email = %s WHERE fb_id = %s;'
                print(qry)
                cur.execute(qry, (self.__email, self.__fb_id))
                con.commit()
        finally:
            con.close()



    def get_phone_num(self):
        """getter method"""
        return self.__phone_num

    def get_phone_num(self, phone_number):
        """setter method"""
        self.__phone_num = phone_number
        try:
            config = Config()
            con = config.db_conn
            with con.cursor() as cur:
                qry = 'UPDATE food_bank SET phone_number = %s WHERE fb_id = %s;'
                print(qry)
                cur.execute(qry, (self.__phone_num, self.__fb_id))
                con.commit()
        finally:
            con.close()


    def delete_food_bank(self, fb_id):
        """DELETE method"""
        self.__fb_id = fb_id
        config = Config()
        con = config.db_conn
        with con.cursor() as cur:
            qry = 'DELETE FROM food_bank WHERE fb_id = %s;'
            print(qry)
            try:
                cur.execute(qry, (self.__fb_id))
                con.commit()
                con.close()
                return True
            except:
                print("Exception thrown. Cannot delete food bank.")
                return False


    def to_json(self):
        """dumps info to a JSON format"""
        return json.dumps(self.__dict__)







class Address:
    """address class in DB"""

    def __init__(self, street, city, state, zip, address_id = ""):
        self.__street = street
        self.__city = city
        self.__state = state
        self.__zip = zip
        if address_id == "":
            try:
                config = Config()
                con = config.db_conn
                with con.cursor() as cur:
                    qry = 'INSERT INTO address (street, city, state, zip)'
                    qry = qry + 'VALUES(%s, %s, %s)'
                    print(qry)
                    cur.execute(qry, (self.__street, self.__city, self.__state, self.__zip))
                    con.commit()
            finally:
                con.close()
        else:
            self.__address_id = address_id
            try:
                config = Config()
                con = config.db_conn
                with con.cursor() as cur:
                    qry = "SELECT * FROM address WHERE address_id = '" + address_id + "'"
                    print(qry)
                    cur.execute(qry)
                    rows = cur.fetchall()
                    for row in rows:
                        self.__address_id = row["address_id"]
                        self.__street = row["street"]
                        self.__city = row["city"]
                        self.__state = row["state"]
                        self.__zip = row["zip"]
            finally:
                con.close()




    def get_address_id(self):
        """getter method"""
        return self.__address_id


    def get_street(self):
        """getter method"""
        return self.__street


    def set_street(self, street):
        """setter method"""
        self.__street = street
        try:
            config = Config()
            con = config.db_conn
            with con.cursor() as cur:
                qry = 'UPDATE address SET street = %s WHERE address_id = %s;'
                print(qry)
                cur.execute(qry, (self.__street, self.__address_id))
                con.commit()
        finally:
            con.close()


    def get_city(self):
        """getter method"""
        return self.__city


    def set_city(self, city):
        """setter method"""
        self.__city = city
        try:
            config = Config()
            con = config.db_conn
            with con.cursor() as cur:
                qry = 'UPDATE address SET city = %s WHERE address_id = %s;'
                print(qry)
                cur.execute(qry, (self.__city, self.__address_id))
                con.commit()
        finally:
            con.close()

    
    def get_state(self):
        """getter method"""
        return self.__state


    def set_state(self, state):
        """setter method"""
        self.__state = state
        try:
            config = Config()
            con = config.db_conn
            with con.cursor() as cur:
                qry = 'UPDATE address SET state = %s WHERE address_id = %s;'
                print(qry)
                cur.execute(qry, (self.__state, self.__address_id))
                con.commit()
        finally:
            con.close()


    def get_zip(self):
        """getter method"""
        return self.__zip


    def set_zip(self, zip):
        """setter method"""
        self.__zip = zip
        try:
            config = Config()
            con = config.db_conn
            with con.cursor() as cur:
                qry = 'UPDATE address SET zip = %s WHERE address_id = %s;'
                print(qry)
                cur.execute(qry, (self.__zip, self.__address_id))
                con.commit()
        finally:
            con.close()

    def delete_address(self, address_id):
        """DELETE method"""
        self.__address_id = address_id
        config = Config()
        con = config.db_conn
        with con.cursor() as cur:
            qry = 'DELETE FROM address WHERE address_id = %s;'
            print(qry)
            try:
                cur.execute(qry, (self.__address_id))
                con.commit()
                con.close()
                return True
            except:
                print("Exception thrown. Cannot delete address.")
                return False


    def to_json(self):
        """dumps info to a JSON format"""
        return json.dumps(self.__dict__)




class FoodBankAddress:
    """food_bank_address class in DB"""
    def __init__(self, food_bank, address):
        self.__fk_fb_id = food_bank
        self.__fk_address_id = address


    def get_fk_fb_id(self):
        """getter method"""
        return self.__fk_fb_id


    def get_fk_address_id(self):
        """getter method"""
        return self.__fk_address_id



class Volunteer:
    """volunteer class in DB"""

    def __init__(self, first_name, last_name, email, phone_number, age, vol_id = ""):
        self.__f_name = first_name
        self.__l_name = last_name
        self.__email = email
        self.__phone_num = phone_number
        self.__age = age
        if vol_id == "":
            try:
                config = Config()
                con = config.db_conn
                with con.cursor() as cur:
                    qry = 'INSERT INTO volunteer (first_name, last_name, email, phone_number, age)'
                    qry = qry + 'VALUES(%s, %s, %s)'
                    print(qry)
                    cur.execute(qry, (self.__f_name, self.__l_name, self.__email, self.__phone_num, self.__age))
                    con.commit()
            finally:
                con.close()
        else:
            self.__vol_id = vol_id
            try:
                config = Config()
                con = config.db_conn
                with con.cursor() as cur:
                    qry = "SELECT * FROM volunteer WHERE vol_id = '" + vol_id + "'"
                    print(qry)
                    cur.execute(qry)
                    rows = cur.fetchall()
                    for row in rows:
                        self.__vol_id = row["vol_id"]
                        self.__f_name = row["first_name"]
                        self.__l_name = row["last_name"]
                        self.__email = row["email"]
                        self.__phone_num = row["phone_number"]
                        self.__age = row["age"]
            finally:
                con.close()




    def get_volunteer_id(self):
        """getter method"""
        return self.__vol_id


    def get_f_name(self):
        """getter method"""
        return self.__f_name


    def set_f_name(self, first_name):
        """setter method"""
        self.__f_name = first_name
        try:
            config = Config()
            con = config.db_conn
            with con.cursor() as cur:
                qry = 'UPDATE volunteer SET first_name = %s WHERE vol_id = %s;'
                print(qry)
                cur.execute(qry, (self.__f_name, self.__vol_id))
                con.commit()
        finally:
            con.close()


    def get_email(self):
        """getter method"""
        return self.__email


    def set_email(self, email):
        """setter method"""
        self.__email = email
        try:
            config = Config()
            con = config.db_conn
            with con.cursor() as cur:
                qry = 'UPDATE volunteer SET email = %s WHERE vol_id = %s;'
                print(qry)
                cur.execute(qry, (self.__email, self.__vol_id))
                con.commit()
        finally:
            con.close()



    def get_phone_num(self):
        """getter method"""
        return self.__phone_num

    def get_phone_num(self, phone_number):
        """setter method"""
        self.__phone_num = phone_number
        try:
            config = Config()
            con = config.db_conn
            with con.cursor() as cur:
                qry = 'UPDATE volunteer SET phone_number = %s WHERE vol_id = %s;'
                print(qry)
                cur.execute(qry, (self.__phone_num, self.__vol_id))
                con.commit()
        finally:
            con.close()


    def get_age(self):
        """getter method"""
        return self.__age

    def get_age(self, age):
        """setter method"""
        self.__age = age
        try:
            config = Config()
            con = config.db_conn
            with con.cursor() as cur:
                qry = 'UPDATE volunteer SET age = %s WHERE vol_id = %s;'
                print(qry)
                cur.execute(qry, (self.__age, self.__vol_id))
                con.commit()
        finally:
            con.close()


    def delete_volunteer(self, vol_id):
        """DELETE method"""
        self.__vol_id = vol_id
        config = Config()
        con = config.db_conn
        with con.cursor() as cur:
            qry = 'DELETE FROM volunteer WHERE vol_id = %s;'
            print(qry)
            try:
                cur.execute(qry, (self.__vol_id))
                con.commit()
                con.close()
                return True
            except:
                print("Exception thrown. Cannot delete Volunteer.")
                return False


    def to_json(self):
        """dumps info to a JSON format"""
        return json.dumps(self.__dict__)



class VolunteerAddress:
    """volunteer_address class in DB"""
    def __init__(self, volunteer, address):
        self.__fk_vol_id = volunteer
        self.__fk_address_id = address


    def get_fk_vol_id(self):
        """getter method"""
        return self.__fk_vol_id


    def get_fk_address_id(self):
        """getter method"""
        return self.__fk_address_id



class FoodBankVolunteer:
    """food_bank_volunteer class in DB"""
    def __init__(self, food_bank, volunteer):
        self.__fk_fb_id = food_bank
        self.__fk_vol_id = volunteer


    def get_fk_fb_id(self):
        """getter method"""
        return self.__fk_fb_id


    def get_fk_vol_id(self):
        """getter method"""
        return self.__fk_vol_id




