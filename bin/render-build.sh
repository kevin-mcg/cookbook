#!/usr/bin/env bash
# Arrête le script immédiatement en cas d'erreur
set -o errexit

echo "--- Étape 1 : Installation des dépendances de production ---"
bundle install

echo "--- Étape 2 : Compilation et compression des Assets (CSS/JS) ---"
bundle exec rails assets:precompile

echo "--- Étape 3 : Nettoyage des anciens fichiers assets ---"
bundle exec rails assets:clean

echo "--- Étape 4 : Exécution automatique des migrations SQL ---"
bundle exec rails db:migrate

echo "--- Déploiement terminé avec succès ! ---"
