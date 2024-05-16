## ADR-XXX : Outil de traitement de documents.

## Résumé Exécutif

L'Agence canadienne d'inspection des aliments (ACIA) a choisi la plateforme Document Intelligence pour le développement de l'application FertiScan. Cette plateforme offre une reconnaissance optique de caractères (OCR) et des modèles capables d'extraire avec précision du texte à partir d'images et de le classifier.

## Contexte

FertiScan, développée par le Laboratoire d'IA de l'ACIA, vise à rationaliser le processus d'inspection des étiquettes de fertilisation. Les inspecteurs capturent des images de ces étiquettes, et l'application remplit automatiquement le formulaire d'inspection. Pour ce faire, le système doit lire et interpréter avec précision les informations affichées sur l'emballage.

Les outils existants au sein du laboratoire de l'ACIA, tels que Gemini, GPT-4 et Llama, peuvent partiellement comprendre le contenu des images. Cependant, ils "hallucinent" parfois des informations, générant du texte qui n'est pas réellement présent dans l'image. Cela pose un risque de réponses erronées dans le formulaire.

De plus, les modèles linguistiques traditionnels (LLM) ont du mal à comprendre le contexte de certains fragments de texte. Par exemple, lorsqu'ils sont présentés avec une image d'un paquet d'engrais, GPT-4 pourrait identifier le texte mais le classer de manière incorrecte (par exemple, en étiquetant une adresse comme un nom).

Pour relever ces défis, nous avons exploré des solutions OCR. Nos priorités étaient les suivantes :

1. **Intégration transparente** : La solution choisie doit s'intégrer parfaitement à notre infrastructure cloud, soit en s'exécutant sur l'appareil de l'inspecteur, soit hébergée sur Azure.

2. **Open Source** : Idéalement, la solution devrait s'aligner sur les Normes Numériques du Gouvernement du Canada, prônant des standards et des solutions ouverts.

3. **Précision** : La reconnaissance et l'extraction précises du texte des étiquettes sont essentielles pour fournir des informations fiables aux utilisateurs.

## Décision

Le Laboratoire d'IA a choisi Document Intelligence comme plateforme de traitement de documents pour FertiScan. Voici pourquoi :

1. **Processeur de mise en page** : Document Intelligence excelle dans l'identification des tableaux, figures, titres, sections et rubriques. Cette fonctionnalité facilite la capacité du modèle à répondre aux questions sur le contenu des étiquettes ou à le classer davantage.

2. **Intégration Azure** : Document Intelligence s'intègre parfaitement à notre infrastructure Azure existante, assurant un flux de travail fluide.

D'autre part, nous avons exploré Tesseract, une solution open source. Bien que son exécution locale sans connexion Internet soit attrayante, sa vitesse et sa précision sont insuffisantes. Tesseract manque souvent du texte que d'autres solutions reconnaissent avec succès et est nettement plus lent.

En résumé, Document Intelligence combine précision, analyse de mise en page et compatibilité Azure, en faisant le choix optimal pour FertiScan.

## Alternatives Considérées

|   | Document AI (Google) | Document Intelligence (Microsoft) | Tesseract | Textract (Amazon) |
|---|---|---|---|---|
| **Tarification** | OCR : 1,50 $ par 1000 pages<br>Extraction d'entités : 30 $ par 1000 pages | OCR : 1,50 $ par 1000 pages<br>Mise en page : 10 $ par 1000 pages | Gratuit | OCR : 1,50 $ par 1000 pages<br>Tableaux et requêtes : 20 $ par 1000 pages |
| **Performance** | Rapide | Rapide | Lent | Rapide |
| **Précision** | Élevée | Élevée | Modérée (avec ScribeOCR) | Élevée |
| **Fonctionnalités Supplémentaires** | Extraction de paires clé-valeur<br>Modèles personnalisés d'extraction de texte<br>Traitement par lots | Reconnaissance de texte manuscrit<br>Détection de figures<br>Extraction de paires clé-valeur<br>Traitement par lots | Exécution locale (hors ligne) | Extraction de données à partir de tableaux, formulaires et paires clé-valeur |
| **Plateforme Cloud** | Google Cloud | Azure | N/A | Amazon Web Service |
| **Formation** | Le coût de l'affinage est de 46,39 $ par heure | Modèles personnalisés | N/A | N/A |
| **Confidentialité** | [Avis de confidentialité](https://cloud.google.com/terms/cloud-privacy-notice?hl=fr) | [Avis de confidentialité](https://azure.microsoft.com/en-us/explore/trusted-cloud/privacy/) | N/A | [Avis de confidentialité](https://aws.amazon.com/fr/privacy/) |
| **Licence** | Code fermé | Code fermé | Version Apache 2.0 | Code fermé |

### Document AI (Google)

**Avantages :**

- Haute précision dans l'extraction d'informations à partir de documents.
- Capacités avancées d'analyse de données et d'automatisation.
- Extraction de paires clé-valeur dans des formulaires structurés et des tableaux simples.
- Modèles personnalisés pour l'extraction de texte.
- Traitement par lots de documents.

**Inconvénients :**

- Ne s'intègre pas dans l'infrastructure Azure existante.
- L'affinage des modèles coûte 46,39 $ par heure.
- Nécessite une connexion Internet pour accéder au service.
- Difficultés avec les textes manuscrits ou complexes, car il est principalement conçu pour le contenu structuré.

### Document Intelligence (Microsoft)

**Avantages :**

- Haute précision dans l'extraction d'informations à partir de documents.
- Reconnaissance du texte manuscrit.
- Intégration transparente avec l'infrastructure Azure.
- Modèles personnalisables pour l'extraction de texte.
- Extraction rapide de textes imprimés et manuscrits à partir d'images et de documents.
- Modèles de classification personnalisés pour diviser et classer les documents.
- Extraction de paires clé-valeur et de données structurées à partir de tableaux et de formulaires.
- Traitement par lots de documents.

**Inconvénients :**

- Disponible uniquement dans la région Est des États-Unis.
- Les modèles personnalisés coûtent 1000 $ par 20 000 pages.
- Limité à 15 transactions par seconde.
- Service à la demande avec des coûts augmentant avec l'utilisation.
- Nécessite une connexion Internet pour le traitement.
- Les données d'entrée et les résultats sont conservés jusqu'à 24 heures.

### Tesseract

**Avantages :**

- Gratuit et open source.
- Prend en charge divers formats d'image, y compris PNG, JPEG et TIFF.
- Plusieurs clients disponibles pour différents cas d'utilisation.
- Fonctionne localement sur l'appareil, permettant la reconnaissance de texte hors ligne.

**Inconvénients :**

- Difficultés avec les mises en page de documents complexes, l'écriture manuscrite ou la mauvaise qualité d'image.
- Limité à l'utilisation du CPU, ce qui affecte les performances.
- Nécessite un prétraitement manuel des images pour améliorer la lisibilité.
- Temps de traitement plus longs par rapport aux solutions cloud.
- Performances réduites avec des textes moins structurés.
- Manque de classification des paires clé-valeur pour faciliter le tri des données.

### Textract (Amazon)

**Avantages :**

- Haute précision dans l'extraction de données à partir de documents.
- Prend en charge divers formats de documents, y compris les PDF scannés et les images.
- Service basé sur le cloud capable de gérer de gros volumes de documents.
- Extraction de données à partir de tableaux, formulaires et paires clé-valeur.
- Intégration transparente avec d'autres services AWS pour une analyse et un traitement supplémentaires.

**Inconvénients :**

- Le service à la demande peut être coûteux pour le traitement de gros volumes de documents.
- Options de personnalisation limitées avec des modèles pré-entraînés.
- Le téléchargement de documents sensibles dans le cloud peut soulever des préoccupations en matière de sécurité.
- Difficultés avec les mises en page de documents complexes, l'écriture manuscrite ou la mauvaise qualité d'image.
- Dépendance à un seul fournisseur (AWS) pouvant limiter la flexibilité future.

---

## Conséquences

### Impacts Positifs

1. **Efficacité Améliorée** : L'intégration de Document Intelligence rationalisera considérablement le processus d'inspection. Les inspecteurs pourront rapidement capturer et traiter les informations des étiquettes d'engrais, réduisant ainsi le temps consacré à la saisie manuelle des données et augmentant l'efficacité globale.

2. **Précision Accrue** : En exploitant les capacités avancées de l'OCR et de l'analyse de mise en page, Document Intelligence garantit une extraction et une classification plus précises du texte. Cela minimisera les erreurs dans les formulaires d'inspection, conduisant à une collecte de données plus fiable.

3. **Intégration Transparente avec Azure** : La compatibilité avec Azure permet un flux de travail fluide au sein de l'infrastructure existante de l'ACIA. Cela réduit la nécessité d'une

 reconfiguration ou d'une formation supplémentaire pour le personnel, facilitant une mise en œuvre plus rapide.

4. **Évolutivité et Personnalisation** : La capacité de créer des modèles personnalisés pour l'extraction et la classification de texte signifie que le système peut être adapté pour répondre à des besoins spécifiques.

### Impacts Négatifs

1. **Implications Financières** : Le modèle à la demande de Document Intelligence, associé aux coûts des modèles personnalisés, peut entraîner des dépenses plus élevées par rapport à l'utilisation de solutions gratuites comme Tesseract.

2. **Dépendance à la Connectivité Internet** : Étant donné que Document Intelligence nécessite une connexion Internet pour le traitement, tout problème de connectivité pourrait perturber le flux de travail d'inspection. Cette dépendance pourrait poser des défis dans les zones éloignées ou moins connectées.

3. **Préoccupations en Matière de Confidentialité des Données** : Le stockage temporaire des données d'entrée et des résultats pendant 24 heures peut soulever des préoccupations en matière de confidentialité. Il est crucial de s'assurer que la gestion des données soit conforme aux politiques de confidentialité de l'ACIA et aux réglementations gouvernementales pour maintenir la confiance des parties prenantes.

## Références

> Toute documentation, recherche ou donnée soutenant la décision peut être citée ici. Cela peut inclure des articles académiques, des articles de blog ou des documents internes.

#### **HaluEval : Un Large-Scale Hallucination Evaluation Benchmark for Large Language Models**:

   - Li, J., Cheng, X., Zhao, W. X., Nie, J. Y., & Wen, J. R. (2023). HaluEval : Un Large-Scale Hallucination Evaluation Benchmark for Large Language Models. *Proceedings of the 2023 Conference on Empirical Methods in Natural Language Processing*, 6449–6464. ¹²

#### **Document AI**:

   - Google Cloud. Document AI. https://cloud.google.com/document-ai?hl=fr

#### **Document Intelligence**:

   - Microsoft Azure. Document Intelligence Studio. https://documentintelligence.ai.azure.com

#### **Amazon Textract**:

   - Amazon Web Services (AWS). Amazon Textract. https://aws.amazon.com/fr/textract/

#### **Tesseract OCR Engine**:

   - Dépôt GitHub : tesseract. https://github.com/tesseract-ocr/tesseract
