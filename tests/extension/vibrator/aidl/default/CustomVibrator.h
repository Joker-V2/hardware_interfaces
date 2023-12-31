/*
 * Copyright (C) 2019 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#pragma once

#include <aidl/android/hardware/tests/extension/vibrator/BnCustomVibrator.h>
#include <aidl/android/hardware/vibrator/IVibratorCallback.h>

namespace aidl::android::hardware::tests::extension::vibrator {

using aidl::android::hardware::vibrator::IVibratorCallback;

class CustomVibrator : public BnCustomVibrator {
    ndk::ScopedAStatus getVendorCapabilities(int32_t* _aidl_return) override;
    ndk::ScopedAStatus setDirectionality(Directionality directionality) override;
    ndk::ScopedAStatus perform(VendorEffect effect,
                               const std::shared_ptr<IVibratorCallback>& callback,
                               int32_t* _aidl_return) override;

  private:
    // override for AIBinder_setInheritRt, AIBinder_setMinSchedulerPolicy, or
    // AIBinder_setRequestingSid calling this in the constructor or elsewhere, the binder would
    // immediately be destroyed.
    ndk::SpAIBinder createBinder() override;
};

}  // namespace aidl::android::hardware::tests::extension::vibrator
