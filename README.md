# Fatecanos App

## A flutter app built for fatec students consult your grades, absences and organize "paredões".

O objetivo deste projeto é disponibilizar de maneira faciltada a consulta de notas e médias do alunos em suas respectivas disciplinas e organizar uma votação em tempo real para uma decisão de um possível “paredão” que caso venha a acontecer notifica os professores.

---

## Fatecanos - Dados Consumidos da API ([fatec-api](https://github.com/filipemeneses/fatec-api))
---

#### Geral

```js
conta.getProfile().then(perfil => perfil)
```

    - email
    - unit

---

#### User Info

```js
conta.getProfile().then(perfil => perfil)
```

    - picture
    - name
    - unit
    - period

#### Course Info

```js
conta.getEnrolledDisciplines().then(discipline => discipline)
```

    - name
    - presenses
    - absenses
    - teacherName

```js
conta.getPartialGrades().then(grade => grade)
```

    - grade (nota atual)
    - maxGrade (temos que fazer) exemplo de query abaixo necessario fazer logico com os pesos
        - grades.score
        - weight

```js
conta.getPartialGrades().then(courses => {
  const newObj = courses.map(course => {
    return {
      course: course.discipline.name,
      evaluations: couse.evaluations
    };
  });
})
```

    
