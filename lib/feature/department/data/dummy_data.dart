import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/feature/home/models/product_model.dart';
import '../models/department_model.dart';

final List<DepartmentModel> departmentCategories = [
  DepartmentModel(
    id: '1',
    name: 'الأدوية',
    icon: AppAssets.pill,
  ),
  DepartmentModel(
    id: '2',
    name: 'تجميل',
    icon: AppAssets.makeUp,
  ),
  DepartmentModel(
    id: '3',
    name: 'أطفال',
    icon: AppAssets.child,
  ),
  DepartmentModel(
    id: '4',
    name: 'أجهزة طبية',
    icon: AppAssets.department,
  ),
  DepartmentModel(
    id: '5',
    name: 'فيتامينات ومكملات',
    icon: AppAssets.healthy,
  ),
  DepartmentModel(
    id: '6',
    name: 'عناية بالب البشرة',
    icon: AppAssets.skinCare,
  ),
];

final List<ProductModel> departmentProducts = [
  ProductModel(
    id: 'panadol',
    name: 'بنادول',
    image: AppAssets.test1,
    description: 'مسكن ألم وخافض حرارة فعال يستخدم لتسكين الآلام المختلفة',
    price: '80 ر.س',
    requiresPrescription: false,
    usage: 'يستخدم لتخفيف الصداع وآلام العضلات والمفاصل وآلام الدورة الشهرية وخفض درجة الحرارة والحمى.',
    dosage: 'للبالغين: 500-1000 ملغ كل 4-6 ساعات حسب الحاجة. يجب عدم تجاوز 4000 ملغ في اليوم الواحد.',
    sideEffects: 'قد تحدث آثار جانبية نادرة مثل الغثيان أو الدوار. استشر الطبيب إذا استمرت الأعراض.',
    warnings: 'لا تستخدمه بجرعات أكبر من الموصى بها. استشر الطبيب إذا كنت تعاني من أمراض الكبد.',
  ),
  ProductModel(
    id: 'paracetamol',
    name: 'باراسيتامول 500 ملغ',
    image: AppAssets.test3,
    description: 'مسكن ألم وخافض حرارة للبالغين والأطفال',
    price: '75 ر.س',
    requiresPrescription: false,
    usage: 'يستخدم لتخفيف الصداع وآلام الظهر والأسنان وخفض الحمى والحرارة.',
    dosage: 'الجرعة المعتادة: 500-1000 ملغ بمعدل 4 مرات يومياً حسب الحاجة.',
    sideEffects: 'عموماً آمن جداً. قد يحدث غثيان في حالات نادرة عند تجاوز الجرعات الموصى بها.',
    warnings: 'لا تتجاوز 4000 ملغ يومياً. لا تستخدمه إذا كنت تعاني من أمراض الكبد الحادة.',
  ),
  ProductModel(
    id: 'amoxicillin',
    name: 'أموكسيسيلين 500 ملغ',
    image: AppAssets.test4,
    description: 'مضاد حيوي واسع المجال لعلاج العدوى البكتيرية',
    price: '120 ر.س',
    requiresPrescription: true,
    usage: 'يستخدم لعلاج العدوى البكتيرية مثل التهاب الحلق والتهاب الأذن والتهاب المسالك البولية.',
    dosage: 'الجرعة المعتادة: 500 ملغ كل 8 ساعات. اتبع توجيهات الطبيب بدقة.',
    sideEffects: 'قد يحدث إسهال أو غثيان. قد تحدث حساسية جلدية في حالات نادرة.',
    warnings: 'يجب إكمال مسار العلاج كاملاً حتى لو شعرت بتحسن. قد يسبب حساسية لدى الأشخاص الحساسين للبنسلين.',
  ),
  ProductModel(
    id: 'azithromycin',
    name: 'أزيثروميسين 500 ملغ',
    image: AppAssets.test1,
    description: 'مضاد حيوي فعال واسع الطيف',
    price: '110 ر.س',
    requiresPrescription: true,
    usage: 'يستخدم لعلاج التهابات الجهاز التنفسي والعدوى البكتيرية المختلفة.',
    dosage: 'الجرعة: 500 ملغ اليوم الأول، ثم 250 ملغ يومياً لمدة 4 أيام. اتبع وصفة الطبيب.',
    sideEffects: 'قد يسبب غثيان أو إسهال أو ألم في المعدة. توقف عن الاستخدام إذا حدثت أعراض حادة.',
    warnings: 'قد يتفاعل مع أدوية أخرى. أخبر طبيبك عن جميع الأدوية التي تتناولها.',
  ),
  ProductModel(
    id: 'skinserum',
    name: 'سيروم عناية بالبشرة المتقدم',
    image: AppAssets.test2,
    description: 'سيروم ترطيب وحماية متقدم للبشرة',
    price: '150 ر.س',
    requiresPrescription: false,
    usage: 'يستخدم يومياً للعناية بالبشرة والحفاظ على ترطيبها وحمايتها من العوامل البيئية.',
    dosage: 'ضع كمية قليلة على الوجه والرقبة صباحاً ومساءً بعد تنظيف البشرة.',
    sideEffects: 'آمن للاستخدام اليومي. قد يسبب احمرار طفيف عند الاستخدام الأول لدى الجلد الحساس.',
    warnings: 'تجنب ملامسة العينين. قد يزيد من حساسية البشرة للشمس، استخدم واقي الشمس.',
  ),
  ProductModel(
    id: 'babycream',
    name: 'كريم حماية أطفال ناعم',
    image: AppAssets.test3,
    description: 'كريم عناية لطيف وآمن لبشرة الأطفال',
    price: '90 ر.س',
    requiresPrescription: false,
    usage: 'يستخدم للعناية اليومية ببشرة الأطفال الحساسة والوقاية من الطفح الجلدي.',
    dosage: 'ضع كمية مناسبة على الجلد حسب الحاجة. آمن للاستخدام المتكرر.',
    sideEffects: 'آمن جداً للأطفال. نادراً ما تحدث حساسية في حالة الحساسية من أحد مكوناته.',
    warnings: 'تجنب ملامسة العينين. اختبر على جزء صغير من الجلد أولاً للتأكد من عدم وجود حساسية.',
  ),
];

List<ProductModel> getProductsForCategory(String categoryName) {
  switch (categoryName) {
    case 'الأدوية':
      return departmentProducts.where((product) => product.id == 'panadol' || product.id == 'paracetamol' || product.id == 'amoxicillin' || product.id == 'azithromycin').toList();
    case 'تجميل':
      return departmentProducts.where((product) => product.id == 'skinserum').toList();
    case 'أطفال':
      return departmentProducts.where((product) => product.id == 'babycream').toList();
    case 'أجهزة طبية':
      return departmentProducts.where((product) => product.id == 'amoxicillin' || product.id == 'azithromycin').toList();
    case 'فيتامينات ومكملات':
      return departmentProducts.where((product) => product.id == 'panadol' || product.id == 'paracetamol').toList();
    case 'عناية بالب البشرة':
      return departmentProducts.where((product) => product.id == 'skinserum').toList();
    default:
      return departmentProducts;
  }
}
