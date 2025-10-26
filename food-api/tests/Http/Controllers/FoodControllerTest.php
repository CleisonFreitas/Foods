<?php

namespace Tests\Http\Controllers;

use App\Enums\FoodCategoryEnum;
use App\Models\Client;
use App\Models\Food;
use App\Models\Restaurant;
use App\Support\Helper;
use Laravel\Sanctum\Sanctum;
use PHPUnit\Framework\Attributes\Test;
use Tests\TestCase;

final class FoodControllerTest extends TestCase
{
    #[Test]
    public function index(): void
    {
        Sanctum::actingAs(
            Client::factory()->create()
        );
        $food = Food::factory()->create();
        $payload = [
            'filters' => [
                ['column' => 'id', 'value' => $food->id],
                ['column' => 'nome', 'value' => $food->nome],
            ],
            'orders' => [['column' => 'id', 'order' => 'asc']],
        ];
        $response = $this->getJson('api/food?'.http_build_query($payload));
        $response->assertOk();
        $response->assertJsonStructure([
            'data' => [
                0 => ['id', 'nome', 'categoria', 'image']
            ]
            ]);
    }

    #[Test]
    public function store(): void
    {
        $restaurant = Restaurant::factory()->create();
        $food = $this->faker->randomElement(Helper::FoodFactory());
        $dataMapped = [
            'nome' => $food['nome'],
            'valor' => $food['valor'],
            'categoria' => FoodCategoryEnum::getFromName($food['categoria']),
            'estabelecimento_id' => $restaurant->id,
            'image' => $food['image'],
        ];
        $response = $this->postJson('api/food', $dataMapped);
        $response->assertCreated();
    }

    #[Test]
    public function show(): void
    {
        $food = Food::factory()->create();
        $response = $this->getJson("api/food/$food->id");
        $response->assertOk();
    }

    #[Test]
    public function update(): void
    {
        $restaurant = Restaurant::factory()->create();
        $foodModel = Food::factory()->for($restaurant, 'estabelecimento')->create();
        $food = $this->faker->randomElement(Helper::FoodFactory());
        $dataMapped = [
            'nome' => $food['nome'],
            'valor' => $food['valor'],
            'categoria' => FoodCategoryEnum::getFromName($food['categoria']),
            'estabelecimento_id' => $restaurant->id,
            'image' => $food['image'],
        ];
        $response = $this->putJson("api/food/$foodModel->id", $dataMapped);
        $response->assertOk();
    }

    #[Test]
    public function destroy(): void
    {
        $food = Food::factory()->create();
        $response = $this->deleteJson("api/food/$food->id");
        $response->assertOk();
        $this->assertNotNull($food->refresh()->deleted_at);
    }
}