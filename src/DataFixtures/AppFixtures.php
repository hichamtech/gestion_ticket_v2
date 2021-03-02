<?php

namespace App\DataFixtures;

use App\Entity\Utilisateur;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;


use Faker\Factory;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class AppFixtures extends Fixture

{
    public $faker;
    private $passwordEncoder;

    public function __construct(UserPasswordEncoderInterface $passwordEncoder)
    {
        $this->faker = Factory::create();
        $this->passwordEncoder = $passwordEncoder;
    }
    public function load(ObjectManager $manager)
    {
        // $product = new Product();
        // $manager->persist($product);
        $this->loadUser($manager);
        $manager->flush();
    }

    public function loadUser(ObjectManager $manager)
    {

        for ($i = 0; $i < 50; $i++) {

            $myUser = new Utilisateur();
            $myUser->setNom($this->faker->lastName);
            $myUser->setPrenom($this->faker->firstName);
            $myUser->setEmail($this->faker->email);

            $roles = ['ROLE_CLIENT', 'ROLE_CHEF_PROJET', 'ROLE_TECHNICIEN'];

            $myUser->setRoles([$roles[rand(0, 2)]]);
            $myUser->setPassword($this->passwordEncoder->encodePassword(
                $myUser,
                'secret'
            ));

            $manager->persist($myUser);

            $this->addReference("user_$i", $myUser);
        }


        $manager->flush();
    }
}
