<?php

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

function AuthMiddleware() {
    // Citanje authorization header

    $authHeader = Flight::request()->getHeader("Authorization");
    error_log("Authorization Header: " . $authHeader);

    // Provjera da li je header prisutan
    if (!$authHeader) {
        Flight::halt(401, json_encode(["message" => "Token is missing."]));
    } else {
        // Razdvajanje headera kako bi se dobio token
        list($type, $token) = explode(" ", $authHeader, 2);
        error_log("Token Type: " . $type);
        error_log("Token: " . $token);

        // Validate the token type
        if (strcasecmp($type, 'Bearer') != 0 || !$token) {
            Flight::halt(401, json_encode(["message" => "Token format is invalid."]));
        }

        // Dekodiranje tokena
        try {
            $decoded = JWT::decode($token, new Key(JWT_SECRET, "HS256"));
        // Ako je token validan, postavlja se korisnik (user) u Flight promjenljivu <3

            Flight::set('user', $decoded);
        } catch (Exception $e) {
        // Ako je token nije dobar, vraca se greska 401

            Flight::halt(401, json_encode(["message" => "Token invalid."]));
        }
    }
}
