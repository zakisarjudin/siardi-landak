<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Folders extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'folder_id' => [
                'type'           => 'INT',
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'parent_folder_id' => [
                'type'           => 'INT',
                'unsigned'       => true,
                'null'           => true,
            ],
            'folder_name' => [
                'type'       => 'VARCHAR',
                'constraint' => '200',
            ],
            'folder_description' => [
                'type'       => 'VARCHAR',
                'constraint' => '200',
                'null'       => true,
            ],
            'folder_icon' => [
                'type'       => 'VARCHAR',
                'constraint' => '200',
                'null'       => true,
            ],
            'folder_slug' => [
                'type'       => 'VARCHAR',
                'constraint' => '100',
                'null'       => true,
            ],
            'created_at' => [
                'type'           => 'DATETIME',
            ],
        ]);
        $this->forge->addKey('folder_id', true);
        $this->forge->createTable('folders');
    }

    public function down()
    {
        $this->forge->dropTable('folders');
    }
}
