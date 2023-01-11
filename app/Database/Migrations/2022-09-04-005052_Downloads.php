<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Downloads extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'download_id' => [
                'type'           => 'INT',
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'user_id' => [
                'type'           => 'INT',
                'unsigned'       => true,
            ],
            'file_id' => [
                'type'           => 'INT',
                'unsigned'       => true,
            ],
            'history_file_name' => [
                'type'       => 'VARCHAR',
                'constraint' => '200',
            ],
            'history_file_size' => [
                'type'       => 'VARCHAR',
                'constraint' => '200',
                'null'       => true,
            ],
            'history_file_extension' => [
                'type'       => 'VARCHAR',
                'constraint' => '200',
                'null'       => true,
            ],
            'history_folder_name' => [
                'type'       => 'VARCHAR',
                'constraint' => '200',
                'null'       => true,
            ],
            'history_uploader_username' => [
                'type'       => 'VARCHAR',
                'constraint' => '200',
                'null'       => true,
            ],
            'created_at' => [
                'type'           => 'DATETIME',
            ],
        ]);
        $this->forge->addKey('download_id', true);
        $this->forge->createTable('downloads');
    }

    public function down()
    {
        $this->forge->dropTable('downloads');
    }
}
