Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C964C5B572
	for <ath12k@archiver.kernel.org>; Fri, 14 Aug 2026 21:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D6bhjDQKoW8NSSMuXHy7NuAxnB2wRTa8tiWxvp2xIfs=; b=T0h1PeMWmZwXOS0A/hcVxwSUWs
	gR6WPutM3E2HIkilWNmgGNiDqut4ORAYTb+tXllfGeDNt6+1Jx5cx7GDok+1h8jXIyX4BcneDNqfI
	DY6SsgxlTf+zn5U74r7fBWPw1KWnD9EHXrYJc9nViN/mlzw5vocJUry3VGvwqdw/IDUK1eau3BnpQ
	WWInae/uomTYTQliEJxTONFx2W1jw5N6Bszxu5K1OjvJ6hBQDWN61Fc6tLXElSHksLTfGUm2THM6d
	KDU23NiuPs4pPqUBdzIf4UgN2UBUu0Lz66EwrG/N6Y4EwgXFqCaM5i7VS8Lwkezljxcqs/j4+Opf9
	pMvHDq2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuzjD-00000003Ebv-0YeI;
	Fri, 14 Aug 2026 21:46:15 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuzjA-00000003EbH-2Glg
	for ath12k@lists.infradead.org;
	Fri, 14 Aug 2026 21:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786743972; x=1818279972;
  h=date:from:to:cc:subject:message-id;
  bh=eRRwKLHm14XlZPNcLHXJlhPjZer5p0Dli4OXPxDnXOo=;
  b=R1eukXRXtZHiyCpt3M2/UmWUAsCIeQ1tc4HwgxM0AgAmcyzWDkPRZk4D
   a6WxWSOMd16iLL/DUAjUGyWI3knakxn9j07dGeDJoQOSllAoBoxL7hqz0
   xQbqxBU0cjhWurtMnMS6muuIL+UGkJHLwi2Ht0ojTwnmSIyLQdn0wT84e
   IL/8OqiKF5tIEjb/zMit6sFE71YhdxWQGz1UH0a4/J6z7WWl+J74aoLLL
   5eAGBBhXFJ+StuAo/iOuP7fNe48L7vAOFs2M1BFNAgXciZx/MmODwJ1ic
   y6UHVuJsu76o3YJxZpbf2/+VLV9T1f+CY8zXJqEmUIyK+vvnZpV244GYe
   A==;
X-CSE-ConnectionGUID: A/ZHS4J9T0CbSkHKTZvHUg==
X-CSE-MsgGUID: EVXCMseBRL60BW6nWJLQuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="112869889"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="112869889"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 14:46:12 -0700
X-CSE-ConnectionGUID: Mg6NhmGxQNmN23X8sHf+0g==
X-CSE-MsgGUID: 70aNR4c7RhyZi58TjxEb4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="263889468"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Aug 2026 14:46:11 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuzj6-00000000aIJ-3EF3;
	Fri, 14 Aug 2026 21:46:08 +0000
Date: Sat, 15 Aug 2026 05:45:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 4cb7635b8abba6f359dc7f675501ffd59475e932
Message-ID: <202608150559.k6grpboU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_144612_589994_E0B57C45 
X-CRM114-Status: UNSURE (   3.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
branch HEAD: 4cb7635b8abba6f359dc7f675501ffd59475e932  .mailmap: add entries for Aaradhana Sahu

elapsed time: 795m

configs tested: 49
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  allnoconfig    gcc-16.1.0
alpha                 allyesconfig    gcc-16.1.0
alpha                    defconfig    gcc-16.1.0
arc                   allmodconfig    gcc-16.1.0
arc                   allyesconfig    gcc-16.1.0
arc                 randconfig-001    gcc-8.5.0
arc        randconfig-001-20260814    gcc-10.5.0
arc        randconfig-002-20260814    gcc-12.5.0
arm           footbridge_defconfig    clang-24
arm        randconfig-001-20260814    gcc-16.1.0
arm        randconfig-002-20260814    gcc-10.5.0
arm        randconfig-003-20260814    gcc-16.1.0
arm        randconfig-004-20260814    clang-17
arm64      randconfig-001-20260815    clang-24
arm64      randconfig-002-20260815    gcc-8.5.0
arm64      randconfig-003-20260815    clang-17
arm64      randconfig-004-20260815    clang-24
csky                  allmodconfig    gcc-16.1.0
csky       randconfig-001-20260815    gcc-13.4.0
csky       randconfig-002-20260815    gcc-15.2.0
i386                  allmodconfig    gcc-14
loongarch                defconfig    clang-24
loongarch  randconfig-001-20260815    clang-18
nios2                 allmodconfig    gcc-11.5.0
nios2                  allnoconfig    gcc-11.5.0
parisc                allmodconfig    gcc-16.1.0
parisc                allyesconfig    gcc-16.1.0
parisc                   defconfig    gcc-16.1.0
riscv      randconfig-001-20260814    gcc-14.3.0
riscv      randconfig-002-20260814    clang-24
s390       randconfig-001-20260814    gcc-11.5.0
s390       randconfig-002-20260814    gcc-13.4.0
sh                       defconfig    gcc-16.1.0
sh         randconfig-001-20260814    gcc-16.1.0
sh         randconfig-002-20260814    gcc-16.1.0
sparc      randconfig-001-20260814    gcc-16.1.0
sparc      randconfig-002-20260814    gcc-15.2.0
sparc64    randconfig-001-20260814    gcc-8.5.0
sparc64    randconfig-002-20260814    clang-24
um         randconfig-001-20260814    gcc-14
um         randconfig-002-20260814    clang-22
x86_64     randconfig-001-20260814    gcc-14
x86_64     randconfig-002-20260814    clang-22
x86_64     randconfig-003-20260814    clang-22
x86_64     randconfig-004-20260814    clang-22
x86_64     randconfig-005-20260814    gcc-14
x86_64     randconfig-006-20260814    gcc-14
xtensa     randconfig-001-20260814    gcc-9.5.0
xtensa     randconfig-002-20260814    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

