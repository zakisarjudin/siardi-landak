<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Files extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'file_id' => [
                'type'           => 'INT',
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'uuid' => [
                'type'       => 'VARCHAR',
                'constraint' => '255',
                'unique'     => true,
                'null'       => true,
            ],
            'user_id' => [
                'type'           => 'INT',
                'unsigned'       => true,
            ],
            'folder_id' => [
                'type'           => 'INT',
                'unsigned'       => true,
            ],
            'file_name' => [
                'type'       => 'VARCHAR',
                'constraint' => '200',
            ],
            'file_path' => [
                'type'       => 'VARCHAR',
                'constraint' => '255',
            ],
            'file_size' => [
                'type'       => 'VARCHAR',
                'constraint' => '255',
            ],
            'file_extension' => [
                'type'       => 'VARCHAR',
                'constraint' => '100',
            ],
            'access_modifier' => [
                'type'       => 'ENUM',
                'constraint' => ['public', 'private'],
            ],
            'created_at' => [
                'type'       => 'DATETIME',
            ],
        ]);
        $this->forge->addKey('file_id', true);
        $this->forge->createTable('files');
    }

    public function down()
    {
        $this->forge->dropTable('files');
    }
}
