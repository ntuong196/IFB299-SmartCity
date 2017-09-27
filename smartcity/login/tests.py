from django.test import TestCase
from django.urls import reverse
from django.contrib.auth.models import Group
from django.contrib.auth.models import User

GROUP_NAMES = ['Student', 'Tourist', 'Businessman']

def create_groups(group_names):
    for name in group_names:
        group = Group(name = name)
        group.save()
    

def create_user(username, password, email, group, first=None, last=None, 
                phone=None, address=None):
    """
    Create a user for testing purposes
    """
    
    user = User.objects.create_user(username, email, password, 
                                    first_name = first, last_name = last)
    user.refresh_from_db()
    user.profile.phone = phone
    user.profile.address = address
    user.save()
    create_groups(GROUP_NAMES)
    g = Group.objects.get(name = group)
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
        
    def test_password_hash(self):
        """
        Test that the password is properly obscured in the database
        """
        user = create_user('logintests', 'testing1234', 'test@test.com', 
                           'Student', 'FirstName', 'LastName', '1234567', 
                           '123 Test St')
        self.assertNotEqual(user.password, 'testing1234')
        self.assertTrue("pbkdf2_sha256" in user.password)
        
    def test_single_user_details(self):
        user = create_user('logintests', 'testing1234', 'test@test.com', 
                           'Student', 'FirstName', 'LastName', '1234567', 
                           '123 Test St')
        self.assertEqual(user.get_username(), 'logintests')
        self.assertEqual(user.email, 'test@test.com')
        self.assertEqual(user.get_short_name(), 'FirstName')
        self.assertEqual(user.get_full_name(), 'FirstName LastName')
        self.assertEqual(user.profile.phone, '1234567')
        self.assertEqual(user.profile.address, '123 Test St')
        
        
    
        
    