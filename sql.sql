select sum(bc.count) as book_copy_count
from book_copy bc
	inner join book_publication bp on (bc.publication_id = bp.publication_id)
	inner join book_tome bt on (bt.publication_id = bt.publication_id)
where bp.year < '1980-01-01' and bt.number > 2;


select count(book_id) as books_has_3_authors
from (
	select bp.book_id as book_id, count(b2a.author_id) as authors_count
	from book_publication bp
		inner join publication_to_author b2a on (b2a.publication_id = bp.publication_id)
	group by bp.book_id) tmp_bac
where authors_count > 3;


select bp.year as year, sum(bc.count) as books_copied
from book_publication bp
	inner join book_copy bc on (bc.publication_id = bp.publication_id)
group by bp.year
order by books_copied desc
limit 1;
