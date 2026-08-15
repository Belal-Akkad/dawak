import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/feature/department/models/department_model.dart';
import '../models/product_model.dart';

final List<DepartmentModel> dummyCategories = [
  DepartmentModel(id: '1', name: 'الأدوية', icon: AppAssets.pill),
  DepartmentModel(id: '2', name: 'أطفال', icon: AppAssets.child),
  DepartmentModel(id: '3', name: 'تجميل', icon: AppAssets.makeUp),
  DepartmentModel(id: '4', name: 'عناية بالبشرة', icon: AppAssets.skinCare),
  DepartmentModel(id: '5', name: 'فيتامينات ومكملات', icon: AppAssets.healthy),
  DepartmentModel(id: '6', name: 'أكثر', icon: AppAssets.department),
];

// create shared products instances so the same object can appear in multiple sections
final ProductModel panadol = ProductModel(
  id: 'panadol',
  name: 'بنادول',
  image: AppAssets.test1,
  description: 'مسكن ألم, منخفض حرارة',
  price: '80 ر.س',
  requiresPrescription: false,
);

final ProductModel paracetamol = ProductModel(
  id: 'paracet',
  name: 'باراسيتامول',
  image: AppAssets.test3,
  description: 'مسكن ألم, خافض حرارة',
  price: '80 ر.س',
  requiresPrescription: false,
);

final ProductModel amoxicillin = ProductModel(
  id: 'amoxi',
  name: 'أموكسيسيلين',
  image: AppAssets.test4,
  description: 'مضاد حيوي واسع المجال',
  price: '80 ر.س',
  requiresPrescription: true,
);

final List<ProductModel> bestSelling = [
  panadol,
  paracetamol,
  amoxicillin,
  ProductModel(
    id: 'p4',
    name: 'أزيتروميسين',
    image: AppAssets.test1,
    description: 'مضاد حيوي فعال',
    price: '80 ر.س',
    requiresPrescription: true,
  ),
  ProductModel(
    id: 'p5',
    name: 'أومكس',
    image: AppAssets.test2,
    description: 'مضاد حيوي',
    price: '80 ر.س',
  ),
];

final List<ProductModel> needsPrescription = [
  amoxicillin,
  ProductModel(
    id: 'p6',
    name: 'دواء وصفة',
    image: AppAssets.test3,
    description: 'يتطلب وصفة طبية',
    price: '120 ر.س',
    requiresPrescription: true,
  ),
  ProductModel(
    id: 'p7',
    name: 'دواء 2',
    image: AppAssets.test4,
    description: 'يتطلب وصفة طبية',
    price: '90 ر.س',
    requiresPrescription: true,
  ),
  panadol,
  paracetamol,
];

final List<ProductModel> weSavedForYou = [
  amoxicillin,
  panadol,
  paracetamol,
  ProductModel(
    id: 'p8',
    name: 'مكملات',
    image: AppAssets.test2,
    description: 'فيتامينات ومكملات',
    price: '50 ر.س',
  ),
  ProductModel(
    id: 'p9',
    name: 'مراهم',
    image: AppAssets.test3,
    description: 'عناية',
    price: '30 ر.س',
  ),
];

final List<String> bannerImages = [
  AppAssets.bannar1,
  AppAssets.bannar2,
  AppAssets.bannar3,
];
