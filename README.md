# - Instructions de déploiement

Le processus d'installation doit être effectué dans l'ordre indiqué dans les lignes suivantes.

#### **1\. Installez les dépendances nécessaires sur le serveur :**

Assurez-vous que les éléments suivants sont installés sur le serveur :

* **PHP**    
* **Composer** 
* **MySQL**  
* **Serveur web**  
* **Symfony CLI**

#### 

#### **2\. Clonage du Répertoire Git**

Clonez le dépôt Git sur le serveur 

| bash |
| :---- |
| `git clone https://github.com/Fadil1007/e_commerce.git ` |


Installez les dépendances PHP nécessaires en exécutant la commande suivante dans le répertoire du projet :

| bash |
| :---- |
| `composer install` |

#### 

#### **Note :** Cette étape :

* #### Configure automatiquement la base de données.

* #### Charge les données de test via les fixtures.

Deux utilisateurs seront créés par défaut :

* **Admin User**  
  * Email : `superuser@mail.com`  
  * Mot de passe : `#SuperUser_123`  
* **Utilisateur Standard**  
  * Email : `jonhdoe@mail.com`  
  * Mot de passe : `#JohnDoe_123`

#### **5\. Démarrer le serveur**

Lancez le serveur Symfony pour tester le projet :

| bash |
| :---- |
| `composer start` |

Cette commande : symfony server:start

* Démarre le serveur Symfony.  
* Exécute les tests fonctionnels, affichant leurs résultats dans la console.
