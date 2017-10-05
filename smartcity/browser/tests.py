from django.test import TestCase
from .models import *
from django.urls import reverse
# Create your tests here.
from selenium import webdriver
import re
from django.test import LiveServerTestCase
from selenium.webdriver.common.keys import Keys
from django.contrib.auth.models import Group
from django.contrib.auth.models import User

TEST_GROUP_NAMES = ['Student', 'Tourist', 'Businessman']


def create_groups(group_names):
    """
    Create groups for testing purposes
    """
    for name in group_names:
        group = Group(name=name)
        group.save()


def create_user(username, password, email, group, first=None, last=None,
                phone=None, address=None):
    """
    Create a user for testing purposes
    """
    user = User.objects.create_user(username, email, password, first_name=first, last_name=last)
    user.refresh_from_db()
    user.profile.phone = phone
    user.profile.address = address
    user.save()
    g = Group.objects.get(name=group)
    g.user_set.add(user)
    return user

def create_entities():
    test_city = City(name='test city')
    test_city.save()
    test_park = Park(city = test_city, name='test park', address='123 park street', phone = '12345', email='email')
    test_park.save()
    test_park = Library(name='test library', address='123 library street', phone = '12345', email='email')
    test_park.save()
    test_park = College(name='test college', address='123 college street', departments = '12345', email='email')
    test_park.save()
    test_park = Hotel(name='test hotel', address='123 hotel street', phone = '12345', email='email')
    test_park.save()
    test_park = Industry(name='test industry', address='123 industry street', email='email')
    test_park.save()
    return test_city


class CityModelTests(TestCase):
    def test_city_has_foreign_model_methods(self):
        test_city = create_entities()
        self.assertIs(test_city.has_parks(), True)

class AdminUserLoginLogoutTestCase(LiveServerTestCase):
    def setUp(self):
        User.objects.create_superuser(
            username='testsuperuser',
            password='admin123test',
            email='admin@example.com'
        )

        self.selenium = webdriver.Firefox(executable_path=r'C:/geckodriver.exe')
        self.selenium.maximize_window()
        super(AdminUserLoginLogoutTestCase, self).setUp()

    def tearDown(self):
        self.selenium.quit()
        super(AdminUserLoginLogoutTestCase, self).tearDown()

    def test_admin_login(self):
        self.selenium.get(
            '%s%s' % (self.live_server_url,  "/login/")
        )

        username = self.selenium.find_element_by_name("username")
        username.send_keys("testsuperuser")
        password = self.selenium.find_element_by_name("password")
        password.send_keys("admin123test")

        self.selenium.find_element_by_id('login_button').click()
        self.assertEquals(self.selenium.current_url, '%s%s' % (self.live_server_url,  "/admin/"))
        self.selenium.find_element_by_link_text('Log out').click();
        self.assertEquals(self.selenium.current_url, '%s%s' % (self.live_server_url,  "/admin/logout/"))

class StudentTestCases(LiveServerTestCase):
    def setUp(self):
        create_groups(TEST_GROUP_NAMES)
        create_entities()
        user = create_user('studenttests', 'testing1234', 'test@test.com', 'Student', 'FirstName', 'LastName', '1234567',
                           '123 Test St')

        self.selenium = webdriver.Firefox(executable_path=r'C:/geckodriver.exe')
        self.selenium.maximize_window()
        super(StudentTestCases, self).setUp()

    def tearDown(self):
        self.selenium.quit()
        super(StudentTestCases, self).tearDown()

    def test_student_sees_relevant_entities(self):
        self.selenium.get(
            '%s%s' % (self.live_server_url,  "/login/")
        )

        username = self.selenium.find_element_by_name("username")
        username.send_keys("studenttests")
        password = self.selenium.find_element_by_name("password")
        password.send_keys("testing1234")

        self.selenium.find_element_by_id('login_button').click()
        self.assertEquals(self.selenium.current_url, '%s%s' % (self.live_server_url,  "/browser/"))


        self.selenium.find_element_by_link_text('test library').click();
        src = self.selenium.page_source
        text_found = re.search(r'123 library street', src)
        self.assertNotEqual(text_found, None)

        self.selenium.back()
        self.selenium.find_element_by_link_text('test college').click();
        src = self.selenium.page_source
        text_found = re.search(r'123 college street', src)
        self.assertNotEqual(text_found, None)

        self.selenium.back()
        self.selenium.find_element_by_css_selector('.btn3d').click()
        src = self.selenium.page_source
        text_found = re.search(r'123 park street', src)
        self.assertNotEqual(text_found, None)


class BusinessmanTestCases(LiveServerTestCase):
    def setUp(self):
        create_groups(TEST_GROUP_NAMES)
        create_entities()
        user = create_user('businesstests', 'testing1234', 'test@test.com', 'Businessman', 'FirstName', 'LastName', '1234567',
                           '123 Test St')

        self.selenium = webdriver.Firefox(executable_path=r'C:/geckodriver.exe')
        self.selenium.maximize_window()
        super(BusinessmanTestCases, self).setUp()

    def tearDown(self):
        self.selenium.quit()
        super(BusinessmanTestCases, self).tearDown()

    def test_businessman_sees_relevant_entities(self):
        self.selenium.get(
            '%s%s' % (self.live_server_url,  "/login/")
        )

        username = self.selenium.find_element_by_name("username")
        username.send_keys("businesstests")
        password = self.selenium.find_element_by_name("password")
        password.send_keys("testing1234")

        self.selenium.find_element_by_id('login_button').click()
        self.assertEquals(self.selenium.current_url, '%s%s' % (self.live_server_url,  "/browser/"))

        self.selenium.find_element_by_link_text('test hotel').click();
        src = self.selenium.page_source
        text_found = re.search(r'123 hotel street', src)
        self.assertNotEqual(text_found, None)

        self.selenium.back()
        self.selenium.find_element_by_link_text('test industry').click();
        src = self.selenium.page_source
        text_found = re.search(r'123 industry street', src)
        self.assertNotEqual(text_found, None)

        self.selenium.back()
        self.selenium.find_element_by_css_selector('.btn3d').click()
        src = self.selenium.page_source
        text_found = re.search(r'123 park street', src)
        self.assertNotEqual(text_found, None)

class TouristTestCases(LiveServerTestCase):
    def setUp(self):
        create_groups(TEST_GROUP_NAMES)
        create_entities()
        user = create_user('touristtests', 'testing1234', 'test@test.com', 'Tourist', 'FirstName', 'LastName', '1234567',
                           '123 Test St')

        self.selenium = webdriver.Firefox(executable_path=r'C:/geckodriver.exe')
        self.selenium.maximize_window()
        super(TouristTestCases, self).setUp()

    def tearDown(self):
        self.selenium.quit()
        super(TouristTestCases, self).tearDown()

    def test_tourist_sees_relevant_entities(self):
        self.selenium.get(
            '%s%s' % (self.live_server_url,  "/login/")
        )

        username = self.selenium.find_element_by_name("username")
        username.send_keys("touristtests")
        password = self.selenium.find_element_by_name("password")
        password.send_keys("testing1234")

        self.selenium.find_element_by_id('login_button').click()
        self.assertEquals(self.selenium.current_url, '%s%s' % (self.live_server_url,  "/browser/"))

        self.selenium.find_element_by_link_text('test hotel').click();
        src = self.selenium.page_source
        text_found = re.search(r'123 hotel street', src)
        self.assertNotEqual(text_found, None)

        self.selenium.back()
        self.selenium.find_element_by_css_selector('.btn3d').click()
        src = self.selenium.page_source
        text_found = re.search(r'123 park street', src)
        self.assertNotEqual(text_found, None)
