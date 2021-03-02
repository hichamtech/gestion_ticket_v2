<?php

namespace App\Form;

use App\Entity\Ticket;
use App\Entity\Utilisateur;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;


use App\Repository\TicketRepository;
use App\Repository\UtilisateurRepository;
use Doctrine\ORM\Mapping\Entity;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\FileType;

class AssignerTechnicienType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder

            ->add('technicien')
            ->add('technicien', EntityType::class, [
                'class' => Utilisateur::class,
                'query_builder' => function (UtilisateurRepository $er) use ($options) {
                    return $er->createQueryBuilder('u')
                        ->andWhere('u.roles = :val')
                        ->setParameter('val', $options['technicien'])
                        ->orderBy('u.nom', 'ASC');
                },

            ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {

        $resolver->setDefaults([
            'data_class' => Ticket::class,
            'technicien' => "[\"ROLE_TECHNICIEN\"]"
        ]);
    }
}
