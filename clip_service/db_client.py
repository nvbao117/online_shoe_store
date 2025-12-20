"""
MySQL Database Client - Fetch product information
"""
import mysql.connector
from mysql.connector import Error
from typing import Optional, Dict, List
import logging

from config import DB_HOST, DB_PORT, DB_NAME, DB_USER, DB_PASSWORD

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class ProductDatabase:
    def __init__(self):
        self.connection = None
        self._connect()
    
    def _connect(self):
        try:
            self.connection = mysql.connector.connect(
                host     = DB_HOST,
                port     = DB_PORT,
                database = DB_NAME,
                user     = DB_USER,
                password = DB_PASSWORD
            )
            if self.connection.is_connected():
                logger.info(f"Connected to MySQL database: {DB_NAME}")
        except Error as e:
            logger.error(f"MySQL connection failed: {e}")
            self.connection = None
    
    def get_product(self, product_id: str) -> Optional[Dict]:
        """
        Get product info by ID
        Returns: {id, name, description, brand_name, category_name, price, image_url}
        """
        if not self.connection or not self.connection.is_connected():
            self._connect()
        
        if not self.connection:
            return None
        
        try:
            cursor = self.connection.cursor(dictionary=True)
            query = """
                SELECT 
                    p.product_id as id,
                    p.name,
                    p.description,
                    p.price,
                    p.image_url,
                    b.name as brand_name,
                    c.name as category_name
                FROM products p
                LEFT JOIN brands b ON p.brand_id = b.brand_id
                LEFT JOIN categories c ON p.category_id = c.category_id
                WHERE p.product_id = %s
            """
            cursor.execute(query, (product_id,))
            result = cursor.fetchone()
            cursor.close()
            return result
        except Error as e:
            logger.error(f"Query error: {e}")
            return None
    
    def get_all_products(self) -> List[Dict]:
        if not self.connection or not self.connection.is_connected():
            self._connect()
        
        if not self.connection:
            return []
        
        try:
            cursor = self.connection.cursor(dictionary=True)
            query = """
                SELECT 
                    p.product_id as id,
                    p.name,
                    p.description,
                    p.price,
                    p.image_url,
                    b.name as brand_name,
                    c.name as category_name
                FROM products p
                LEFT JOIN brands b ON p.brand_id = b.brand_id
                LEFT JOIN categories c ON p.category_id = c.category_id
            """
            cursor.execute(query)
            results = cursor.fetchall()
            cursor.close()
            return results
        except Error as e:
            logger.error(f"Query error: {e}")
            return []
    
    def get_all_products_for_embedding(self) -> List[Dict]:
        """
        Get all products with one color from first variant for embedding
        Metadata: product_id, description, image_url, product_name, price, status, brand_name, category_name, color
        """
        if not self.connection or not self.connection.is_connected():
            self._connect()
        
        if not self.connection:
            return []
        
        try:
            cursor = self.connection.cursor(dictionary=True)
            query = """
                SELECT 
                    p.product_id,
                    p.name as product_name,
                    p.description,
                    p.price,
                    p.status,
                    p.image_url,
                    b.name as brand_name,
                    c.name as category_name,
                    (SELECT pv.color FROM product_variants pv 
                     WHERE pv.product_id = p.product_id LIMIT 1) as color
                FROM products p
                LEFT JOIN brands b ON p.brand_id = b.brand_id
                LEFT JOIN categories c ON p.category_id = c.category_id
                WHERE p.status = 'ACTIVE'
            """
            cursor.execute(query)
            results = cursor.fetchall()
            cursor.close()
            logger.info(f"Found {len(results)} active products")
            return results
        except Error as e:
            logger.error(f"Query error: {e}")
            return []
    
    def close(self):
        if self.connection and self.connection.is_connected():
            self.connection.close()
            logger.info("MySQL connection closed")


# Singleton
_db = None

def get_database() -> ProductDatabase:
    global _db
    if _db is None:
        _db = ProductDatabase()
    return _db
