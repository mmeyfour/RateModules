//
//  State.swift
//  RateModule1
//
//  Created by Adrian Tineo on 26.01.20.
//  Copyright © 2020 adriantineo. All rights reserved.
//

import Foundation

enum Module: String {
    case module2A = "Module 2A"
    case module2B = "Module 2B"
    case module3A = "Module 3A"
    case module3B = "Module 3B"
}

struct State {
    var designQuestions: [Question]? = nil
    var requirementsQuestions: [Question]
    var codeStructureQuestions: [Question]
    var cleanCodeQuestions: [Question]
    
    var hasDesignSection: Bool {
        return designQuestions != nil
    }
    
    init(module: Module) {
        switch module {
        case .module3B:
            designQuestions = [
                Question(title: "¿Han presentado los compañeros un documento de diseño?", description: "Uno de los entregables de este proyecto era el documento de diseño. Puede ser un simple diagrama en papel o algo más elaborado"),
                Question(title: "¿Se especifica en el documento de diseño la navegación básica de la mini-app?", description: "Deben especificarse las pantallas principales y la navegación (flat, hierarchical, modal)."),
                Question(title: "¿Existe coherencia con las fuentes utilizadas?", description: "Debe existir coherencia sobre las fuentes usadas según su contexto (título, comentario, etc), en el tipo de fuente, color y peso"),
                Question(title: "¿Existe coherencia con las imágenes utilizadas?", description: "Debe existir coherencia con las imágenes utilizadas (mismo estilo)."),
                Question(title: "¿Existe coherencia con los colores utilizados?", description: "Debe existir coherencia con los colores utilizados según contexto (título, botones, comentarios, etc)"),
                Question(title: "¿Es la navegación coherente?", description: "La navegación debe ir en función a su uso según las HIG de Apple"),
                Question(title: "¿Es el contenido fácilmente apreciable y distinguible   (principio \"clarity\")?", description: "El contenido es lo principal y debe ser claro y auto explicativo, incluídos los controles (por ejemplo botones)."),
                Question(title: "¿Compite el diseño con el contenido (principio \"deference\")?", description: "El estilo visual de la app no debe dominar sobre el contenido."),
                Question(title: "¿Hay un buen uso de la jerarquía en elementos gráficos y navegación para proporcionar separación de contenidos (principio \"depth\")?", description: "La agrupación de contenido y la progresión de pantallas debe aportar sensación de orden y utilidad.")
            ]
            requirementsQuestions = [
                Question(title: "¿Compila el proyecto sin errores?",
                         description: "Existe un proyecto de Xcode que puede compilarse sin errores (sin triángulos rojos tras el proceso de \"Build\")."),
                Question(title: "¿Ejecuta la aplicación en el simulador y aparece la pantalla?",
                         description: "Al darle al botón de \"Play\" la aplicación comienza y no hay crashes (cuelgues)."),
                Question(title: "¿Hay al menos 3 pantallas diferentes?", description: "Debe haber al menos 3 pantallas diferentes, según los requisitos"),
                Question(title: "¿Es posible elegir los signos de los nacidos entre 1990 y 2000?", description: "Al menos ese periodo debe estar contemplado?"),
                Question(title: "¿Están los 12 animales del zodiaco chino representados?", description: "Deben estar los 12 animales."),
                Question(title: "¿Están todas las pantallas adaptadas al formato apaisado y vertical?", description: "Todas las pantallas deben incorporar constraints de Auto Layout para verse correctamente en ambas orientaciones.")
            ]
            codeStructureQuestions = [
                Question(title: "¿Está la UI definida en IB?", description: "La UI debe estar definida en un storyboard"),
                Question(title: "¿Existen segues en storyboard o código para navegar entre las distintas pantallas?", description: "La navegación debe hacerse por segue en storyboard o por código, instanciando el view controller desde un objeto de tipo UIStoryboard"),
                Question(title: "¿Existe una clase, struct o enum para definir a los animales del zodiaco chino?", description: "Debe existir un elemento en la capa del modelo para representar a los 12 animales"),
                Question(title: "¿Existe asociación de características para cada animal en la capa del modelo?", description: "En la capa del modelo debe existir una relación entre los diferentes elementos del modelo"),
                Question(title: "¿Se actualiza la información de la pantalla en viewDidLoad() o viewWillAppear()?", description: "La información debe cargarse desde el modelo y estar lista para presentarse al usuario antes de salir por pantalla"),
                Question(title: "¿Se pasa la información necesaria de una pantalla a otra mediante el método prepare for segue o al instanciar en código?", description: "La información debe inyectarse a la pantalla siguiente en la navegación para presentársela al usuario")
            ]
            cleanCodeQuestions = [
                Question(title: "¿Compila el proyecto sin warnings?",
                         description: "El proyecto no tiene warnings (triángulos amarillos tras el proceso de \"Build\")."),
                Question(title: "¿Está el código indentado?",
                         description: "Para ser legible el código debe estar bien indentado."),
                Question(title: "¿Existe un enum para los 12 animales del zodiaco chino?", description: "Un enum nos permite elegir entre un número limitado de opciones para un tipo y es la abstracción más adecuada en este caso"),
                Question(title: "¿Se ha utilizado el tipo Date de Foundation para trabajar con las fechas?", description: "Es el tipo adecuado ofrecido por la librería estándar"),
                Question(title: "¿Existe un método tipo updateUI() para sincronizar la UI desde el modelo a los view controller?", description: "Una función, o un grupo de ellas, debe encapsular esta funcionalidad de modo que sean reutilizables."),
                Question(title: "¿Son los nombres consistentes en su estilo?", description: "No debe haber inconsistencias del tipo Spanglish o variables con mayúscula"),
                Question(title: "¿Existe al menos un commit en el repositorio más allá del commit inicial creado por Xcode?", description: "El uso del control de versiones nos facilita la gestión del código."),
                Question(title: "¿Están los últimos cambios consolidados en un commit? ", description: "No deben existir cambios pendientes de consolidar (visto como M en Xcode o en la \"commit view\" de GitUp).")
            ]
            
        case .module3A:
            requirementsQuestions = [
                Question(title: "¿Compila el proyecto sin errores?",
                         description: "Existe un proyecto de Xcode que puede compilarse sin errores (sin triángulos rojos tras el proceso de \"Build\")."),
                Question(title: "¿Ejecuta la aplicación en el simulador y aparece la pantalla?",
                         description: "Al darle al botón de \"Play\" la aplicación comienza y no hay crashes (cuelgues)."),
                Question(title: "¿Aparece una UI con un tabBarController con 3 items?", description: "Deben aparecer los items de \"Feed\", \"Profile\" y \"Albums\" "),
                Question(title: "¿Están los iconos de los items del tabBarController de acuerdo al diseño especificado?", description: "Las imágenes de los iconos deben coincidir con el diseño. Se permite que la galería de \"Profile\" no esté bien enlazada."),
                Question(title: "¿Está cada pantalla bien asociada a su item del tabBarController?", description: "El elemento raiz de cada tabBarItem debe ser del tipo adecuado según el diseño."),
                Question(title: "¿Está cada pantalla accesible desde un tabBarItem embebida en un navigationController?", description: "Para posibilitar navegación jerárquica, cada viewController raiz debe estar embebido en un navigationController"),
                Question(title: "¿Es accesible la pantalla de comentarios desde el icono del bocadillo en la pantalla raíz de \"Feed\" con navegación jerárquica (push)?", description: "La pantalla de comentarios debe mostrarse desde la derecha y mostrar un botón de volver hacia atrás"),
                Question(title: "¿Es accesible la pantalla de detalle de la foto desde la foto del \"Feed\" como modal?", description: "La pantalla del detalle de la foto debe mostrarse como modal al tocar la celda"),
                Question(title: "¿Se puede descartar el modal del detalle de la foto al tocar la cruz en la esquina superior derecha?", description: "El botón de cerrar el modal debe funcionar y volver al viewController precedente."),
                Question(title: "¿Se muestra la página de comentarios como modal desde el bocadillo en la pantalla de detalle de la foto?", description: "La página de comentarios es también accesible desde el modal del detalle de la foto y se descarta con swipe hacia abajo"),
                Question(title: "¿Se accede por navegación jerárquica (push) al perfil desde la pantalla de \"Feed\" al tocar sobre el autor?", description: "Se debe poder acceder al perfil desde la página de \"Feed\" y volver hacia atrás mediante botón en la navigationBar"),
                Question(title: "¿Se ve el conjunto de imágenes bajo el encabezado del autor en la página de \"Profile\"?", description: "El conjunto de imágenes de stock scrollable se debe ver bajo en encabezado."),
                Question(title: "¿Se abre modalmente el detalle de la foto desde la galería en la pantalla de \"Profile\"?", description: "Se debe poder abrir el detalle de la foto modalmente al tocar en la primera o primeras fotos de la galería"),
                Question(title: "¿Se puede pasar a la pantalla de perfil con galería desde la lista en \"Albums\" con navegación jerárquica (push)?", description: "Se debe poder navegar jerárquicamente a la pantalla de perfil con galería desde la primera opción de la lista en \"Albums\"."),
                Question(title: "¿Es visible la galería en la pantalla de perfil accedida desde \"Albums\", incluída el modal del detalle de la foto?", description: "La galería debe estar bien enlazada"),
                Question(title: "¿Es accesible por navegación jerárquica (push) la pantalla de perfil más galería desde el texto \"By: Chritopher Campbell\" en la pantalla de \"Albums\"?", description: "Esta navegación jerárquica de segundo nivel debe ser posible.")
            ]
            
            codeStructureQuestions = [
                Question(title:"¿Existe un tabBarController como punto de entrada a la aplicación?", description: "El punto de entrada debe estar asociado a un tabBarController"),
                Question(title: "¿Existe un navigationController como primer controller desde cada tabBarItem?", description: "El navigationController nos permite la navegación jerárquica"),
                Question(title: "¿Existe embed segue para la galería (UITableViewController) desde la escena de perfil (ProfileViewController) y de albums (AlbumsViewController)?", description: "El tipo de segue adecuado es el embed segue")
            ]
            
            cleanCodeQuestions = [
                Question(title:"¿Está estructurado el tabBarController y los navigationController en el canvas del storyboard?", description: "Las pantallas al mismo nivel (flat hierarchy) se deben ordenar verticalmente en el canvas"),
                Question(title:"¿Están estructuradas las escenas jerárquicas en el canvas del storyboard?", description: "Las diferentes escenas deben estar organizados como una cuadrícula")
            ]
            
        case .module2A:
            requirementsQuestions = [
                Question(title: "¿Compila el proyecto sin errores?",
                         description: "Existe un proyecto de Xcode que puede compilarse sin errores (sin triángulos rojos tras el proceso de \"Build\")."),
                Question(title: "¿Ejecuta la aplicación en el simulador y aparece la pantalla?",
                         description: "Al darle al botón de \"Play\" la aplicación comienza y no hay crashes (cuelgues)."),
                Question(title: "¿Aparece una UI con 1) un título, 2) una imagen, 3) un switch, 4) un slider, y 5) un texto descriptivo de más de una línea?",
                         description: "Comprueba si todos los elementos están visibles en la pantalla."),
                Question(title: "¿Cambia 1) el título, 2) la imagen, y 3) el texto descriptivo cuando activas/desactivas el switch?",
                         description: "El estado de la pantalla debe cambiar cuando se activa/desactiva el switch."),
                Question(title: "¿Cambia 1) el título, 2) la imagen, y 3) el texto descriptivo cuando mueves el sliders de un extremo al otro?",
                         description: "La funcionalidad del slider en los extemos debe ser equivalente a activar/desactivar el switch."),
                Question(title: "¿Se actualiza el slider a un extremo y al otro cuando se activa/desactiva el switch?", description: "El slider debe estar sincronizado con el switch"),
                Question(title: "¿Se actualiza el switch cuando mueves el slider de un extremo al otro?", description: "El slider debe estar sincronizado con el switch"),
                Question(title: "¿Cuando posicionas el slider a una posición intermedia se observa un cambio progresivo (fading/blending) en la imagen?", description: "El slider debe producir un fundido de una imagen en la otra."),
                Question(title: "¿Permanecen inalterados 1) el título, 2) el switch y 3) el texto descriptivo mientras el slider no alcanza uno de los extremos?", description: "Estos elementos solo deben cambiar en los extremos del slider."),
                Question(title: "¿Es el fundido de la imagen perfectamente suave en conjunción con la posición del slider?", description: "La experiencia del usuario debe ser fluida cuando opera sobre el slider."),
                Question(title: "¿Se mantiene la proporción de los objetos en la UI cuando colocamos el simulador en modo apaisado?", description: "Las reglas de la UI deben hacer que se vea de modo adecuado en portrait/landscape."),
                Question(title: "¿Son estáticos todos los textos?", description: "Tanto el título como la descripción deben ser estáticos, no interactivos.")
            ]
            
            codeStructureQuestions = [
                Question(title: "¿Está la UI diseñada en IB?",
                         description: "Los elementos gráficos deben estar diseñados en \"Main.storyboard\"."),
                Question(title: "¿Existen IBOutlets para los elementos gráficos que cambian?",
                         description: "Deben existir IBOutlets en ViewController.swift para 1) el título, 2) la imagen, 3) el switch, 4) el slider y 5) el texto descriptivo."),
                Question(title: "¿Existen IBActions para los elementos gráficos interactivos?",
                         description: "Deben existir IBActions en ViewController.swift para 1) el switch y 2) el slider."),
                Question(title: "¿Existen variables de estado que reflejen la opción de mostrar un contenido u otro?",
                         description: "Deben existir variables dentro del view controller que definan en qué estado estamos, si en un contenido o en otro de los dos posibles."),
                Question(title: "¿Existen constraints de Auto Layout para todos los elementos gráficos?",
                         description: "Deben existir al menos dos constraints para cada elemento de la UI"),
                Question(title: "¿Está el diseño de Auto Layout libre de ambiguedades y errores?",
                         description: "No deben existir errores de Auto Layout (flecha amarilla o roja en el Document Outline)")
            ]
            cleanCodeQuestions = [
                Question(title: "¿Compila el proyecto sin warnings?",
                         description: "El proyecto no tiene warnings (triángulos amarillos tras el proceso de \"Build\")."),
                Question(title: "¿Está el código indentado?",
                         description: "Para ser legible el código debe estar bien indentado."),
                Question(title: "¿Existe una función \"updateUI()\" para actualizar el estado de la UI?",
                         description: "El código que actualiza la UI está extraído en una función, para su reuso y para mejor organización."),
                Question(title: "¿Tienen los elementos de la UI nombres descriptivos?",
                         description: "Los elementos de la UI deben tener nombres descriptivos como \"titleLabel\" o \"stateSwitch\" o \"blendingSlider\" en lugar de nombres genéricos como \"label1\""),
                Question(title: "¿Esta el código organizado en bloques?", description: "El uso de pragma MARK nos permite organizar el código en bloques para más fácil lectura.")
            ]
            
        case .module2B:
            requirementsQuestions = [
                Question(title: "¿Compila el proyecto sin errores?",
                         description: "Existe un proyecto de Xcode que puede compilarse sin errores (sin triángulos rojos tras el proceso de \"Build\")."),
                Question(title: "¿Ejecuta la aplicación en el simulador y aparece la pantalla?",
                         description: "Al darle al botón de \"Play\" la aplicación comienza y no hay crashes (cuelgues)."),
                Question(title: "¿Aparece una UI con todos los elementos especificados en el estado inicial del diseño?",
                         description: "El estado inicial debe tener todos los elementos (por ejemplo, 3 corazones y contadores L/W a 0."),
                Question(title: "¿Están desactivadas las teclas de abajo y derecha desde la posición inicial?",
                         description: "Al pulsar estos botones el jugador no se mueve."),
                Question(title: "¿Están visualmente desactivados los botones de abajo y derecha desde la posición inicial?",
                         description: "El aspecto es de botones desactivados."),
                Question(title: "¿Están oscuras todas las casillas que no están contiguas al jugador desde la posición inicial?", description: "Solo la casilla de la izquierda y de arriba deben estar visibles."),
                Question(title: "¿Se mueve el jugador con las flechas de dirección?", description: "El jugador debe moverse en todas direcciones"),
                Question(title: "¿Están los botones de dirección desactivados en la dirección en la que no debe moverse el jugador conforme se desplaza por la cuadrícula?", description: "El estado de los botones de activado/desactivado debe actualizarse con cada movimiento."),
                Question(title: "¿Se van revelando u ocultando las posiciones conforme el jugador se desplaza por la cuadrícula?", description: "El estado de las casillas debe actualizarse en cada paso."),
                Question(title: "¿Existen zombies ocultos en el juego que se revelan al acercase?", description: "Deben existir dos zombies ocultos, es suficiente con que aparezca uno."),
                Question(title: "¿Finaliza la ronda cuando el jugador descubre un zombie?", description: "La ronda debe terminar cuando el jugador descubre un zombie."),
                Question(title: "¿Pierde el jugador una vida cuando descubre un zombie?", description: "El jugador debe perder un corazón cuando descubre un zombie."),
                Question(title: "¿Se muestra el mensaje \"Try again\" cuando el jugador descubre un zombie y todavía tiene vidas?", description: "El mensaje debe ser correcto"),
                Question(title: "¿Es posible comenzar una nueva ronda tras ver el mensaje resumen al tocar en la pantalla?", description: "Debe ser posible empezar una nueva ronda al finalizar la actual."),
                Question(title: "¿Se muestra el mensaje \"You lost\" cuando el jugador encuentra un zombie  y no tiene más vidas?", description: "El mensaje debe ser correcto"),
                Question(title: "¿Se muestra el mensaje \"You won\" cuando el jugador alcanza el signo de SOS?", description: "El mensaje debe ser correcto"),
                Question(title: "¿Se actualizan los contadores L/W cuando el jugador pierde o gana una partida?", description: "Los contadores deben actualizarse según el resultado de la partida"),
                Question(title: "¿Se mantienen los contadores L/W cuando el jugador descubre un zombie y aún tiene vidas?", description: "No debe confundirse una nueva ronda con una nueva partida"),
                Question(title: "¿Se resetean las vidas a 3 en una nueva partida?", description: "El número de vidas debe resetearse adecuadamente")
            ]
            
            codeStructureQuestions = [
                
                Question(title: "FIXME 1: ¿Existe un gesture recognizer asociado a didTapOverlayView? ",
                         description: "Debe existir un gesture recognizer."),
                Question(title: "FIXME 2: ¿Es correcta la fórmula en updateSquare() en ViewController.swift?", description: "La fórmula para traducir de coordenadas (x,y) a casillas debe ser correcta."),
                Question(title: "FIXME 3: ¿Existe una comprobación de índices de array en updateSquare() en Game.swift?", description: "Debe haber una comprobación de índices de array"),
                Question(title: "FIXME 4: ¿Está arreglada la función canPlayerMove() en Game.swift?", description: "Esta función debe ser correcta para indicar la posición posible de movimiento en cada dirección"),
                Question(title: "FIXME 5: ¿Está corregida la lógica para ganar el juego en hasWon en Game.swift?", description: "Esta lógica debe estar corregida"),
                Question(title: "¿Se colocan los dos zombies en posiciones aleatorias permitidas?", description: "Los zombies deben estar en posiciones aleatorias dentro de las permitidas")
            ]
            cleanCodeQuestions = [
                Question(title: "¿Compila el proyecto sin warnings?",
                         description: "El proyecto no tiene warnings (triángulos amarillos tras el proceso de \"Build\")."),
                Question(title: "¿Está el código indentado?",
                         description: "Para ser legible el código debe estar bien indentado."),
                Question(title: "¿Está el código del juego en Game.swift y el de la actualización de la UI en ViewController.swift?", description: "Cada archivo debe contener su código correspondiente."),
                Question(title: "¿Son los nombres consistentes en su estilo?", description: "No debe haber inconsistencias del tipo Spanglish o variables con mayúscula"),
                Question(title: "¿Está el código extraído en funciones pequeñas?", description: "No debe existir código corta-pega.")
            ]
        }
    }
}

