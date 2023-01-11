<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class AddMenuAccesses extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'menu_access_id' => [
                'type'           => 'INT',
                'constraint'     => 5,
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'group' => [
                'type'       => 'VARCHAR',
                'constraint' => '200',
            ],
            'menu_id' => [
                'type'           => 'INT',
                'unsigned'       => true,
            ],
        ]);
        $this->forge->addKey('menu_access_id', true);
        $this->forge->createTable('menu_accesses');
    }

    public function down()
    {
        $this->forge->dropTable('menu_accesses');
    }
}
