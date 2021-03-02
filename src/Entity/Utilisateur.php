<?php

namespace App\Entity;

use App\Repository\UtilisateurRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity(repositoryClass=UtilisateurRepository::class)
 */
class Utilisateur implements UserInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=180, unique=true)
     */
    private $email;

    /**
     * @ORM\Column(type="json")
     */
    private $roles = [];

    /**
     * @var string The hashed password
     * @ORM\Column(type="string")
     */
    private $password;



    /**
     * @ORM\Column(type="string", length=255)
     */
    private $nom;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $prenom;

    /**
     * @ORM\OneToMany(targetEntity=Ticket::class, mappedBy="clients")
     */
    private $ticketCLient;

    /**
     * @ORM\OneToMany(targetEntity=Ticket::class, mappedBy="technicien")
     */
    private $ticketTechnicien;

    public function __construct()
    {
        $this->ticketCLient = new ArrayCollection();
        $this->ticketTechnicien = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUsername(): string
    {
        return (string) $this->email;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getPassword(): string
    {
        return (string) $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getSalt()
    {
        // not needed when using the "bcrypt" algorithm in security.yaml
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }



    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getPrenom(): ?string
    {
        return $this->prenom;
    }

    public function setPrenom(string $prenom): self
    {
        $this->prenom = $prenom;

        return $this;
    }

    /**
     * @return Collection|Ticket[]
     */
    public function getTicketCLient(): Collection
    {
        return $this->ticketCLient;
    }

    public function addTicketCLient(Ticket $ticketCLient): self
    {
        if (!$this->ticketCLient->contains($ticketCLient)) {
            $this->ticketCLient[] = $ticketCLient;
            $ticketCLient->setClients($this);
        }

        return $this;
    }

    public function removeTicketCLient(Ticket $ticketCLient): self
    {
        if ($this->ticketCLient->contains($ticketCLient)) {
            $this->ticketCLient->removeElement($ticketCLient);
            // set the owning side to null (unless already changed)
            if ($ticketCLient->getClients() === $this) {
                $ticketCLient->setClients(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Ticket[]
     */
    public function getTicketTechnicien(): Collection
    {
        return $this->ticketTechnicien;
    }

    public function addTicketTechnicien(Ticket $ticketTechnicien): self
    {
        if (!$this->ticketTechnicien->contains($ticketTechnicien)) {
            $this->ticketTechnicien[] = $ticketTechnicien;
            $ticketTechnicien->setTechnicien($this);
        }

        return $this;
    }

    public function removeTicketTechnicien(Ticket $ticketTechnicien): self
    {
        if ($this->ticketTechnicien->contains($ticketTechnicien)) {
            $this->ticketTechnicien->removeElement($ticketTechnicien);
            // set the owning side to null (unless already changed)
            if ($ticketTechnicien->getTechnicien() === $this) {
                $ticketTechnicien->setTechnicien(null);
            }
        }

        return $this;
    }


    public function __toString(): string
    {
        return $this->nom;
    }
}
