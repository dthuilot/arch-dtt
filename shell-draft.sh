# Retrieve login details

until [ "${loginValidation}" == "y" ]||[ "${loginValidation}" == "Y" ]
do
    echo "Creation of a user account"
    read -p "Enter your username : " login
    read -p "Do you want to use ${login} as username [Y/n]: " loginValidation
    loginValidation=${loginValidation:-y}
done

echo "User: ${login} is going to be created"

pwd1="a"
pwd2="b"
until [ "${pwd1}" == "${pwd2}" ]
do
    echo "Creation of the password"
    read -p "Enter your password : " pwd1
    read -p "Confirm your password : " pwd2
    echo "${pwd1}"
    echo "${pwd2}"

    if [ "$pwd1" = "$pwd2" ]; then
    echo "Password has been confirmed"
    else
    echo "Passwords don't match"
    fi
done

# Create user
useradd -m -g users -G wheel david

echo "${pwd1}" | passwd --stdin david
echo "${pwd1}" | passwd --stdin