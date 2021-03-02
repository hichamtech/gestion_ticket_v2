<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200623230859 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE ticket ADD clients_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE ticket ADD CONSTRAINT FK_97A0ADA3AB014612 FOREIGN KEY (clients_id) REFERENCES utilisateur (id)');
        $this->addSql('CREATE INDEX IDX_97A0ADA3AB014612 ON ticket (clients_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE ticket DROP FOREIGN KEY FK_97A0ADA3AB014612');
        $this->addSql('DROP INDEX IDX_97A0ADA3AB014612 ON ticket');
        $this->addSql('ALTER TABLE ticket DROP clients_id');
    }
}
