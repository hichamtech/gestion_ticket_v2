<?php

namespace App\Entity;

use App\Repository\TicketRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=TicketRepository::class)
 */
class Ticket
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $titre;

    /**
     * @ORM\Column(type="boolean",nullable=true)
     */
    private $status;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $priorite;

    /**
     * @ORM\Column(type="datetime")
     */
    private $date;


    /**
     * @ORM\ManyToOne(targetEntity=Utilisateur::class, inversedBy="ticketCLient")
     */
    private $clients;

    /**
     * @ORM\ManyToOne(targetEntity=Utilisateur::class, inversedBy="ticketTechnicien")
     */
    private $technicien;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $lieu;

    /**
     * @ORM\Column(type="boolean",nullable=true)
     */
    private $etat;

 

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitre(): ?string
    {
        return $this->titre;
    }

    public function setTitre(string $titre): self
    {
        $this->titre = $titre;

        return $this;
    }

    public function getStatus(): ?bool
    {
        return $this->status;
    }

    public function setStatus(bool $status): self
    {
        $this->status = $status;

        return $this;
    }

    public function getPriorite(): ?string
    {
        return $this->priorite;
    }

    public function setPriorite(string $priorite): self
    {
        $this->priorite = $priorite;

        return $this;
    }

    public function getDate(): ?\DateTimeInterface
    {
        return $this->date;
    }

    public function setDate(\DateTimeInterface $date): self
    {
        $this->date = $date;

        return $this;
    }


    public function getClients(): ?Utilisateur
    {
        return $this->clients;
    }

    public function setClients(?Utilisateur $clients): self
    {
        $this->clients = $clients;

        return $this;
    }

    public function getTechnicien(): ?Utilisateur
    {
        return $this->technicien;
    }

    public function setTechnicien(?Utilisateur $technicien): self
    {
        $this->technicien = $technicien;

        return $this;
    }

    public function getLieu(): ?string
    {
        return $this->lieu;
    }

    public function setLieu(string $lieu): self
    {
        $this->lieu = $lieu;

        return $this;
    }

    public function getEtat(): ?bool
    {
        return $this->etat;
    }

    public function setEtat(bool $etat): self
    {
        $this->etat = $etat;

        return $this;
    }

  
}
