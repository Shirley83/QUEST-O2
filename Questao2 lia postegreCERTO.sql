SELECT
    d.nome AS departamento,
    COUNT(e.matr) AS quantidade_empregados,
    ROUND(AVG(v.valor), 2) AS media_salarial,
    ROUND(MAX(v.valor), 2) AS maior_salario,
    ROUND(MIN(v.valor), 2) AS menor_salario
FROM
    departamento d
JOIN
    divisao div ON div.cod_dep = d.cod_dep
JOIN
    empregado e ON e.lotacao_div = div.cod_divisao
JOIN
    emp_venc ev ON ev.matr = e.matr
JOIN
    vencimento v ON v.cod_venc = ev.cod_venc
GROUP BY
    d.cod_dep,
	d.nome
ORDER BY
    media_salarial DESC;
