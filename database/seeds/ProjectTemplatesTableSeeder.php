<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class ProjectTemplatesTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('project_templates')->delete();
        
        \DB::table('project_templates')->insert(array (
            0 => 
            array (
                'created_at' => '2021-10-13 09:44:24',
                'id' => 1,
                'name' => 'ToDo',
                'status' => 1,
                'updated_at' => '2021-11-22 05:56:47',
            ),
            1 => 
            array (
                'created_at' => '2021-10-13 09:48:16',
                'id' => 2,
                'name' => 'News',
                'status' => 1,
                'updated_at' => '2021-11-12 06:48:37',
            ),
            2 => 
            array (
                'created_at' => '2021-11-12 15:35:41',
                'id' => 3,
                'name' => 'ToDoApp',
                'status' => 1,
                'updated_at' => '2022-06-17 12:27:21',
            ),
        ));
        
        
    }
}