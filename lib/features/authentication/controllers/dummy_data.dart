import '../../../routes/routes.dart';
import '../../../utils/constants/image_strings.dart';
import '../../personalization/models/user_model.dart';
import '../../shop/models/banner_model.dart';
import '../../shop/models/brand_model.dart';
import '../../shop/models/product_attribute_model.dart';
import '../../shop/models/product_model.dart';
import '../../shop/models/product_variation_model.dart';
import '../models/category_model.dart';

class TDummyData {
  // Banners
  static final List<BannerModel> Banners = [
    BannerModel(
      imageUrl: TImages.promobanner1,
      targetScreen: TRoutes.order,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.promobanner2,
      targetScreen: TRoutes.cart,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.promobanner3,
      targetScreen: TRoutes.favourites,
      active: true,
    ),
  ];

  // List of all Categories
  static final List<CategoryModel> Categories = [
    CategoryModel(
      id: '1',
      image: TImages.shirt,
      name: 'Tops',
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      image: TImages.pant,
      name: 'Pants',
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      image: TImages.dress,
      name: 'Dresses',
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      image: TImages.jumpsuits,
      name: 'Jumpsuits',
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      image: TImages.shoes,
      name: 'Shoes',
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      image: TImages.purse,
      name: 'Purse',
      isFeatured: true,
    ),
  ];

  // Subcategories
  static final List<CategoryModel> subcategories = [
    CategoryModel(
      id: '9',
      image: TImages.product16,
      name: 'Top',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '10',
      image: TImages.product17,
      name: 'Top',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '11',
      image: TImages.product18,
      name: 'Top',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '12',
      image: TImages.product12,
      name: 'Cord Set',
      parentId: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '13',
      image: TImages.product13,
      name: 'Cord Set',
      parentId: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '14',
      image: TImages.product14,
      name: 'Cord Set',
      parentId: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '15',
      image: TImages.product15,
      name: 'Jumpsuit',
      parentId: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '16',
      image: TImages.product1,
      name: 'Dress',
      parentId: '3',
      isFeatured: false,
    ),
    CategoryModel(
      id: '17',
      image: TImages.product2,
      name: 'Dress',
      parentId: '3',
      isFeatured: false,
    ),
    CategoryModel(
      id: '18',
      image: TImages.product3,
      name: 'Dress',
      parentId: '3',
      isFeatured: false,
    ),
    CategoryModel(
      id: '19',
      image: TImages.product21,
      name: 'Heels',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '20',
      image: TImages.product22,
      name: 'Heels',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '21',
      image: TImages.product23,
      name: 'Sneakers',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '22',
      image: TImages.product24,
      name: 'Sneakers',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '23',
      image: TImages.product25,
      name: 'Clutch',
      parentId: '6',
      isFeatured: false,
    ),
    CategoryModel(
      id: '24',
      image: TImages.product26,
      name: 'Bag',
      parentId: '6',
      isFeatured: false,
    ),
  ];

  // Products
  static final List<ProductModel> Products = [
    ProductModel(
      id: '001',
      title: 'Green Nike Sports Shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.product1,
      description: 'Green Nike sports shoe with a comfortable fit.',
      brand: BrandModel(
        id: '1',
        image: TImages.product3,  // Assuming you have a logo image for Nike
        name: 'Nike',
        productsCount: 265,
        isFeatured: true,
      ),
      images: [
        TImages.product1,
        TImages.product23,
        TImages.product2,
        TImages.product9,
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Green', 'Black', 'Red'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['EU 30', 'EU 32', 'EU 34'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: TImages.product21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: TImages.product21,  // Assuming this is the correct image
          attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
      ],
      productType: 'variable',
    ),
    ProductModel(
      id: '002',
      title: 'Blue T-Shirt for All Ages',
      stock: 50,
      price: 35,
      isFeatured: true,
      thumbnail: TImages.product6,
      description: 'Comfortable blue t-shirt suitable for all ages.',
      brand: BrandModel(
        id: '2',
        image: TImages.product3,  // Assuming you have a logo image for Zara
        name: 'ZARA',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        TImages.product8,
        TImages.product9,
        TImages.product5,
      ],
      salePrice: 30,
      sku: 'TSHIRT002',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Blue', 'Black'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['S', 'M', 'L', 'XL'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '7',
          stock: 20,
          price: 35,
          image: TImages.product18,
          attributeValues: {'Color': 'Blue', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 30,
          price: 35,
          image: TImages.product19,
          attributeValues: {'Color': 'Blue', 'Size': 'L'},
        ),
      ],
      productType: 'variable',
    ),
    ProductModel(
      id: '003',
      title: 'Blue T-Shirt for All Ages',
      stock: 50,
      price: 35,
      isFeatured: true,
      thumbnail: TImages.product6,
      description: 'Comfortable blue t-shirt suitable for all ages.',
      brand: BrandModel(
        id: '2',
        image: TImages.product3,  // Assuming you have a logo image for Zara
        name: 'ZARA',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        TImages.product8,
        TImages.product9,
        TImages.product5,
      ],
      salePrice: 30,
      sku: 'TSHIRT002',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Blue', 'Black'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['S', 'M', 'L', 'XL'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '7',
          stock: 20,
          price: 35,
          image: TImages.product18,
          attributeValues: {'Color': 'Blue', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 30,
          price: 35,
          image: TImages.product19,
          attributeValues: {'Color': 'Blue', 'Size': 'L'},
        ),
      ],
      productType: 'variable',
    ),
    ProductModel(
      id: '004',
      title: 'Blue T-Shirt for All Ages',
      stock: 50,
      price: 35,
      isFeatured: true,
      thumbnail: TImages.product6,
      description: 'Comfortable blue t-shirt suitable for all ages.',
      brand: BrandModel(
        id: '2',
        image: TImages.product3,  // Assuming you have a logo image for Zara
        name: 'ZARA',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        TImages.product8,
        TImages.product9,
        TImages.product5,
      ],
      salePrice: 30,
      sku: 'TSHIRT002',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Blue', 'Black'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['S', 'M', 'L', 'XL'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '7',
          stock: 20,
          price: 35,
          image: TImages.product18,
          attributeValues: {'Color': 'Blue', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 30,
          price: 35,
          image: TImages.product19,
          attributeValues: {'Color': 'Blue', 'Size': 'L'},
        ),
      ],
      productType: 'variable',
    ),
    ProductModel(
      id: '004',
      title: 'Blue T-Shirt for All Ages',
      stock: 50,
      price: 35,
      isFeatured: true,
      thumbnail: TImages.product6,
      description: 'Comfortable blue t-shirt suitable for all ages.',
      brand: BrandModel(
        id: '2',
        image: TImages.product3,  // Assuming you have a logo image for Zara
        name: 'ZARA',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        TImages.product8,
        TImages.product9,
        TImages.product5,
      ],
      salePrice: 30,
      sku: 'TSHIRT002',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Blue', 'Black'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['S', 'M', 'L', 'XL'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '7',
          stock: 20,
          price: 35,
          image: TImages.product18,
          attributeValues: {'Color': 'Blue', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 30,
          price: 35,
          image: TImages.product19,
          attributeValues: {'Color': 'Blue', 'Size': 'L'},
        ),
      ],
      productType: 'variable',
    ),
    ProductModel(
      id: '005',
      title: 'Blue T-Shirt for All Ages',
      stock: 50,
      price: 35,
      isFeatured: true,
      thumbnail: TImages.product6,
      description: 'Comfortable blue t-shirt suitable for all ages.',
      brand: BrandModel(
        id: '2',
        image: TImages.product3,  // Assuming you have a logo image for Zara
        name: 'ZARA',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        TImages.product8,
        TImages.product9,
        TImages.product5,
      ],
      salePrice: 30,
      sku: 'TSHIRT002',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Blue', 'Black'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['S', 'M', 'L', 'XL'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '7',
          stock: 20,
          price: 35,
          image: TImages.product18,
          attributeValues: {'Color': 'Blue', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 30,
          price: 35,
          image: TImages.product19,
          attributeValues: {'Color': 'Blue', 'Size': 'L'},
        ),
      ],
      productType: 'variable',
    ),
    ProductModel(
      id: '006',
      title: 'Blue T-Shirt for All Ages',
      stock: 50,
      price: 35,
      isFeatured: true,
      thumbnail: TImages.product6,
      description: 'Comfortable blue t-shirt suitable for all ages.',
      brand: BrandModel(
        id: '2',
        image: TImages.product3,  // Assuming you have a logo image for Zara
        name: 'ZARA',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        TImages.product8,
        TImages.product9,
        TImages.product5,
      ],
      salePrice: 30,
      sku: 'TSHIRT002',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Blue', 'Black'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['S', 'M', 'L', 'XL'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '7',
          stock: 20,
          price: 35,
          image: TImages.product18,
          attributeValues: {'Color': 'Blue', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 30,
          price: 35,
          image: TImages.product19,
          attributeValues: {'Color': 'Blue', 'Size': 'L'},
        ),
      ],
      productType: 'variable',
    ),
    ProductModel(
      id: '007',
      title: 'Blue T-Shirt for All Ages',
      stock: 50,
      price: 35,
      isFeatured: true,
      thumbnail: TImages.product6,
      description: 'Comfortable blue t-shirt suitable for all ages.',
      brand: BrandModel(
        id: '2',
        image: TImages.product3,  // Assuming you have a logo image for Zara
        name: 'ZARA',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        TImages.product8,
        TImages.product9,
        TImages.product5,
      ],
      salePrice: 30,
      sku: 'TSHIRT002',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Blue', 'Black'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['S', 'M', 'L', 'XL'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '7',
          stock: 20,
          price: 35,
          image: TImages.product18,
          attributeValues: {'Color': 'Blue', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 30,
          price: 35,
          image: TImages.product19,
          attributeValues: {'Color': 'Blue', 'Size': 'L'},
        ),
      ],
      productType: 'variable',
    ),
    ProductModel(
      id: '005',
      title: 'Blue T-Shirt for All Ages',
      stock: 50,
      price: 35,
      isFeatured: true,
      thumbnail: TImages.product6,
      description: 'Comfortable blue t-shirt suitable for all ages.',
      brand: BrandModel(
        id: '2',
        image: TImages.product3,  // Assuming you have a logo image for Zara
        name: 'ZARA',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        TImages.product8,
        TImages.product9,
        TImages.product5,
      ],
      salePrice: 30,
      sku: 'TSHIRT002',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Blue', 'Black'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['S', 'M', 'L', 'XL'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '7',
          stock: 20,
          price: 35,
          image: TImages.product18,
          attributeValues: {'Color': 'Blue', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 30,
          price: 35,
          image: TImages.product19,
          attributeValues: {'Color': 'Blue', 'Size': 'L'},
        ),
      ],
      productType: 'variable',
    ),
    ProductModel(
      id: '006',
      title: 'Blue T-Shirt for All Ages',
      stock: 50,
      price: 35,
      isFeatured: true,
      thumbnail: TImages.product6,
      description: 'Comfortable blue t-shirt suitable for all ages.',
      brand: BrandModel(
        id: '2',
        image: TImages.product3,  // Assuming you have a logo image for Zara
        name: 'ZARA',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        TImages.product8,
        TImages.product9,
        TImages.product5,
      ],
      salePrice: 30,
      sku: 'TSHIRT002',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Blue', 'Black'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['S', 'M', 'L', 'XL'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '7',
          stock: 20,
          price: 35,
          image: TImages.product18,
          attributeValues: {'Color': 'Blue', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 30,
          price: 35,
          image: TImages.product19,
          attributeValues: {'Color': 'Blue', 'Size': 'L'},
        ),
      ],
      productType: 'variable',
    ),
    ProductModel(
      id: '007',
      title: 'Blue T-Shirt for All Ages',
      stock: 50,
      price: 35,
      isFeatured: true,
      thumbnail: TImages.product6,
      description: 'Comfortable blue t-shirt suitable for all ages.',
      brand: BrandModel(
        id: '2',
        image: TImages.product3,  // Assuming you have a logo image for Zara
        name: 'ZARA',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        TImages.product8,
        TImages.product9,
        TImages.product5,
      ],
      salePrice: 30,
      sku: 'TSHIRT002',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Blue', 'Black'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['S', 'M', 'L', 'XL'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '7',
          stock: 20,
          price: 35,
          image: TImages.product18,
          attributeValues: {'Color': 'Blue', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 30,
          price: 35,
          image: TImages.product19,
          attributeValues: {'Color': 'Blue', 'Size': 'L'},
        ),
      ],
      productType: 'variable',
    ),
  ];
}
