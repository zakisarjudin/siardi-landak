<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class AddMenus extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'menu_id' => [
                'type'           => 'INT',
                'constraint'     => 5,
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'menu_name' => [
                'type'       => 'VARCHAR',
                'constraint' => '200',
            ],
            'menu_route' => [
                'type'       => 'VARCHAR',
                'constraint' => '200',
            ],
            'menu_description' => [
                'type'       => 'VARCHAR',
                'constraint' => '255',
            ],
            'menu_icon' => [
                'type'       => 'VARCHAR',
                'constraint' => '200',
            ],
        ]);
        $this->forge->addKey('menu_id', true);
        $this->forge->createTable('menus');
    }

    public function down()
    {
        $this->forge->dropTable('menus');
    }
}
