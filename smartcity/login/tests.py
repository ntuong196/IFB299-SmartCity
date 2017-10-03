from django.test import TestCase
from django.urls import reverse
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


class LoginTests(TestCase):
    def test_login_view_url(self):
        """
        Test that the login page is loaded correctly
        """
        response = self.client.get(reverse('login'))
        self.assertEqual(response.status_code, 200)
        
    def test_register_view_url(self):
        """
        Test that the register page is loaded correctly
        """
        response = self.client.get(reverse('register'))
        self.assertEqual(response.status_code, 200)

    def test_user_creation(self):
        """
        Test that a user can be created with no issues
        """
        create_groups(TEST_GROUP_NAMES)
        user = create_user('logintests', 'testing1234', 'test@test.com', 'Student', 'FirstName', 'LastName', '1234567',
                           '123 Test St')
        self.assertIsNotNone(User.objects.all())
        self.assertEqual(User.objects.count(), 1)

    def test_multiple_users_creation(self):
        """
        Test that multiple users can be created without error
        """
        create_groups(TEST_GROUP_NAMES)
        user = create_user('logintests', 'testing1234', 'test@test.com', 'Student', 'FirstName', 'LastName', '1234567',
                           '123 Test St')
        user2 = create_user('logintests2', '2testing1234', 'test2@test.com', 'Tourist', 'FirstNameTwo', 'LastNameTwo',
                            '2234567', '223 Test St')
        self.assertEqual(User.objects.count(), 2)
        
    def test_password_hash(self):
        """
        Test that the password is properly obscured in the database
        """
        create_groups(TEST_GROUP_NAMES)
        user = create_user('logintests', 'testing1234', 'test@test.com', 'Student', 'FirstName', 'LastName', '1234567',
                           '123 Test St')
        self.assertNotEqual(user.password, 'testing1234')
        self.assertTrue("pbkdf2_sha256" in user.password)
        
    def test_single_user_details(self):
        """
        Test that the details of a single user are accurately retrieved
        """
        create_groups(TEST_GROUP_NAMES)
        user = create_user('logintests', 'testing1234', 'test@test.com', 'Student', 'FirstName', 'LastName', '1234567',
                           '123 Test St')
        self.assertEqual(user.get_username(), 'logintests')
        self.assertEqual(user.email, 'test@test.com')
        self.assertEqual(user.get_short_name(), 'FirstName')
        self.assertEqual(user.get_full_name(), 'FirstName LastName')
        self.assertEqual(user.profile.phone, '1234567')
        self.assertEqual(user.profile.address, '123 Test St')

    def test_multiple_user_details(self):
        """
        Test that the details of a single user are accurately retrieved, when
        a different user already exists
        """
        create_groups(TEST_GROUP_NAMES)
        user_other = create_user('logintests', 'testing1234', 'test@test.com', 'Student', 'FirstName', 'LastName',
                                 '1234567', '123 Test St')
        user = create_user('logintests2', '2testing1234', 'test2@test.com', 'Tourist', 'FirstNameTwo', 'LastNameTwo',
                           '2234567', '223 Test St')
        self.assertEqual(user.get_username(), 'logintests2')
        self.assertEqual(user.email, 'test2@test.com')
        self.assertEqual(user.get_short_name(), 'FirstNameTwo')
        self.assertEqual(user.get_full_name(), 'FirstNameTwo LastNameTwo')
        self.assertEqual(user.profile.phone, '2234567')
        self.assertEqual(user.profile.address, '223 Test St')
        
    def test_incorrect_group(self):
        """
        Test that an exception is raised when a non-existent group name is used
        """
        create_groups(TEST_GROUP_NAMES)
        self.assertRaises(Exception, create_user, group="Scholar")

    def test_password_change(self):
        create_groups(TEST_GROUP_NAMES)
        user = create_user('logintests', 'testing1234', 'test@test.com', 'Student', 'FirstName', 'LastName', '1234567',
                           '123 Test St')
        old_password = user.password
        user.set_password("newpassword1234")
        user.save()
        self.assertNotEqual(user.password, old_password) 