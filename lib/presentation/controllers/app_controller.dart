import 'package:assymetri/domain/entities/app_config_entity.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../domain/usecases/get_app_config_usecase.dart';
import '../../core/constants/app_colors.dart';

class AppController extends GetxController with GetTickerProviderStateMixin {
  final GetAppConfigUseCase _getAppConfigUseCase = Get.find();
  
  late AnimationController _animationController;
  late Animation<double> _animation;
  
  final selectedColor = 'Green'.obs;
  final animationSpeed = 0.5.obs;
  final totalItems = 1.obs;
  final itemsInLine = 1.obs;
  final isReversed = false.obs;
  
  // Replace single progressValue with list of progress values
  final RxList<double> progressValues = <double>[].obs;
  final currentAnimatingIndex = (-1).obs;
  
  late TextEditingController totalItemsController;
  late TextEditingController itemsInLineController;
  
  AnimationController get animationController => _animationController;
  Animation<double> get animation => _animation;

  @override
  void onInit() {
    super.onInit();
    totalItemsController = TextEditingController(text: '');
    itemsInLineController = TextEditingController(text: '');
    _initializeAnimation();
    _loadInitialConfig();
    _setupTextControllerListeners();
    _initializeProgressValues();
  }

  void _initializeProgressValues() {
    progressValues.clear();
    for (int i = 0; i < totalItems.value; i++) {
      progressValues.add(0.0);
    }
  }

  void _setupTextControllerListeners() {
    totalItems.listen((value) {
      if (!totalItemsController.selection.isValid &&
          totalItemsController.text != value.toString() &&
          totalItemsController.text.isNotEmpty) {
        totalItemsController.text = value.toString();
      }
      _initializeProgressValues();
    });

    itemsInLine.listen((value) {
      if (!itemsInLineController.selection.isValid &&
          itemsInLineController.text != value.toString() &&
          itemsInLineController.text.isNotEmpty) {
        itemsInLineController.text = value.toString();
      }
    });
  }

  void updateItemsInLineFromText(String value) {
    if (value.isEmpty) {
      itemsInLine.value = 1;
      return;
    }

    final int? intValue = int.tryParse(value);
    if (intValue != null && intValue >= 1 && intValue <= 15) {
      itemsInLine.value = intValue;
    }
  }

  void updateTotalItemsFromText(String value) {
    if (value.isEmpty) {
      totalItems.value = 1;
      return;
    }

    final int? intValue = int.tryParse(value);
    if (intValue != null && intValue >= 1 && intValue <= 15) {
      totalItems.value = intValue;
    }
  }

  void updateTotalItems(int items) {
    if (items >= 1 && items <= 15) {
      totalItems.value = items;
      totalItemsController.text = items.toString();
    }
  }

  void _initializeAnimation() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: (5000 / animationSpeed.value).round()),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.addListener(() {
      _updateSequentialProgress();
    });

    _startSequentialAnimation();
  }

  void _updateSequentialProgress() {
    final totalProgress = _animation.value * totalItems.value;
    
    for (int i = 0; i < totalItems.value; i++) {
      int animationIndex = isReversed.value ? 
          (totalItems.value - 1 - i) : i;
          
      if (totalProgress > animationIndex) {
        double itemProgress = (totalProgress - animationIndex).clamp(0.0, 1.0);
        progressValues[i] = itemProgress;
        currentAnimatingIndex.value = i;
      } else {
        progressValues[i] = 0.0;
      }
    }
    
    progressValues.refresh(); // Trigger UI update
  }

  void _loadInitialConfig() {
    final AppConfigEntity config = _getAppConfigUseCase.call();
    selectedColor.value = config.selectedColor;
    animationSpeed.value = config.animationSpeed;
    isReversed.value = config.isReversed;
  }

  void _startSequentialAnimation() {
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        for (int i = 0; i < progressValues.length; i++) {
          progressValues[i] = 0.0;
        }
        progressValues.refresh();
        currentAnimatingIndex.value = -1;
        _animationController.reset();
        _animationController.forward();
      }
    });

    _animationController.forward();
  }

  void updateColor(String color) {
    selectedColor.value = color;
  }

  void updateAnimationSpeed(double speed) {
    double actualSpeed;
    if (speed <= 0.67) {
      actualSpeed = 0.5;
    } else if (speed <= 1.33) {
      actualSpeed = 1.0;
    } else {
      actualSpeed = 1.5;
    }

    animationSpeed.value = speed;
    _animationController.duration = Duration(
      milliseconds: (2000 / actualSpeed).round(),
    );
  }

  void updateItemsInLine(int items) {
    if (items >= 1 && items <= 15) {
      itemsInLine.value = items;
      itemsInLineController.text = items.toString();
    }
  }

  void toggleReverse(bool reverse) {
    isReversed.value = reverse;
    _restartAnimation();
  }

  void _restartAnimation() {
    _animationController.reset();
    for (int i = 0; i < progressValues.length; i++) {
      progressValues[i] = 0.0;
    }
    progressValues.refresh();
    currentAnimatingIndex.value = -1;
    _animationController.forward();
  }

  Color getSelectedColor() {
    return AppColors.themeColors[selectedColor.value] ??
        AppColors.themeColors['Green']!;
  }

  Color getSelectedLightColor() {
    final baseColor = getSelectedColor();
    return baseColor.withValues(alpha: 0.3);
  }

  @override
  void onClose() {
    totalItemsController.dispose();
    itemsInLineController.dispose();
    _animationController.dispose();
    super.onClose();
  }
}
