/* ■ [回答]と記載のある箇所へ、1〜8の各課題内容に沿ったSQL文を記述しなさい。 */

-- 1. Staffテーブルから「経理部」に所属する社員の情報をすべて抽出してください。
SELECT * FROM Staff WHERE section = '経理部';

-- 2. 在庫(Stocksテーブル)の在庫数(Quantity)が10以上25未満のものを抽出して下さい。
ELECT * FROM Stocks WHERE quantity >= 10 AND quantity < 25;

-- 3. INTERSECT演算子を使用して、Order_Headerテーブルで合計値(Total)が5000以上10000未満のものを抽出して下さい。
SELECT * FROM Order_Header WHERE total >= 5000
INTERSECT
SELECT * FROM Order_Header WHERE total < 10000;

-- 4. 「関東」エリアの全店舗情報を抽出して下さい。

SELECT S.*
FROM Shop S
JOIN Area A ON S.areacode = A.areacode
WHERE areaname = '関東'
-- 5. 在庫(Stocksテーブル)内の各商品の合計数量を抽出して下さい。
SELECT goodscode, SUM(quantity) AS total_quantity
FROM Stocks
GROUP BY goodscode;

-- 6. 商品（Gods）テーブルから単価（UnitPrice)が5000円より高い商品の情報を全て抽出して下さい。
SELECT *
FROM Goods
WHERE unitprice > 5000;

-- 7. Shopテーブルの全ての店舗コード（Shopcode）、店舗名（Shopname）を、所在地（areaname）とあわせて抽出してください。
SELECT S.shopcode, S.shopname, A.areaname
FROM Shop S
JOIN Area A ON S.areacode = A.areacode;

-- 8. 「新宿」店の在庫数が10以上の商品の商品コード（GoodsCode）、商品名（GoodsName）、在庫数（quantity）を抽出して下さい。
SELECT G.goodscode, G.goodsname, S.quantity
FROM Stocks S
JOIN Goods G ON S.goodscode = G.goodscode
JOIN Shop SH ON S.shopcode = SH.shopcode
WHERE SH.shopname = '新宿' AND S.quantity >= 10;