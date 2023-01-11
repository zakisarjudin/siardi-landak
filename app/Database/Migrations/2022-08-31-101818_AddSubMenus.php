<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class AddSubMenus extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'sub_menu_id' => [
                'type'           => 'INT',
                'constraint'     => 5,
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'menu_id' => [
                'type'           => 'INT',
                'unsigned'       => true,
            ],
            'sub_menu_name' => [
                'type'       => 'VARCHAR',
                'constraint' => '200',
            ],
            'sub_menu_route' => [
                'type'       => 'VARCHAR',
                'constraint' => '200',
            ],
        ]);
        $this->forge->addKey('sub_menu_id', true);
        $this->forge->createTable('sub_menus');
    }

    public function down()
    {
        $this->forge->dropTable('sub_menus');
    }
}
