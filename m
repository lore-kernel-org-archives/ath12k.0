Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD26DE77182
	for <ath12k@archiver.kernel.org>; Thu, 12 Dec 2024 14:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oCLhjMrczaxPnRnk5Pz0BpsYGHKQehAQmsikZfKUZb0=; b=Frhe238/McmEU39PEx9iM0wCR7
	yzzVw60flNM41m0B1ix3ws1iFGveKwrJodaj74asUFZxHhVa9BSTwqSgxrmZIHmQXN3zbX5I6YJVd
	qktY6Nb9NLUOgXqQxrP8dWYsSCeOvFStYsevxbY40olUARUz6gxgNMmhAjifsSr0gIOxJrWgQwLJj
	eIJHZ+MqQMFAK4S/okP+pr/jeBT60aZS9J+vk7yzYNO6JtQDgSBwBGGja85iJ+IE3r8kb3zO9vaQP
	WO4zENUYpnaAW/nuRIhQGQ3ES4WB4oruBnNruvpPtHQ4etBtdZaUagUH72YUJtrnYyCKvqEfvN2KO
	sEemsI7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkNx-00000000e9C-1wQm
	for ath12k@archiver.kernel.org;
	Thu, 12 Dec 2024 14:41:49 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkNv-00000000e8L-2F8z
	for ath12k@lists.infradead.org;
	Thu, 12 Dec 2024 14:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734014508; x=1765550508;
  h=date:from:to:cc:subject:message-id;
  bh=bHmsHhan71+aSj4iNSHsGe1iJZ0WQd/AiaQYCF/3A8Q=;
  b=mZzBro60PH23ptz176Tur+HkAehdCqrr/ud40Z8GvtYMf5vA//4zMR+r
   OwyWYQnfKrxHv5o+vU7XYo+hzVS2Y5NusN1p8A7Z081ulMI2dMe1xAQ7O
   tEFCkcEBZI6rVn8jyAIBh5ssNlpfPf/HFpt7nxPXvQyhKjjdaY0rN7dU/
   sEUFyGp1EN/VxX+dJrtFXmG5Dkj4BQeoe1nhDxnXJocMkOuKnTbgORPXt
   kgs/GEontBF0BCHeSyrJugEd1LuvAZ3Qp/8UQ13h0XxirEf8vLxdFjtOE
   dEf/aAKkpSseTSO5cvJksECZpi9FFnzoOvS352L5h7PcrxPYZYrZz/v+Q
   w==;
X-CSE-ConnectionGUID: wwed78ylTfCZdI3xL1FtuA==
X-CSE-MsgGUID: Z6SEHB2fQMW87UuFE9KUrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="45115760"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="45115760"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 06:41:47 -0800
X-CSE-ConnectionGUID: Wh5Q0EoHRga+AR8kb62bxQ==
X-CSE-MsgGUID: Ae9LkdtkTuiRJlJWHXmMaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101195473"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Dec 2024 06:41:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLkNq-0007wX-3C;
	Thu, 12 Dec 2024 14:41:42 +0000
Date: Thu, 12 Dec 2024 22:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath12k-mlo-qcn9274] BUILD SUCCESS
 2fda13452ff0c4b0e4ffe57558c6731609fec36f
Message-ID: <202412122233.71b4xoff-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_064147_586726_949E1BB5 
X-CRM114-Status: UNSURE (   3.56  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
branch HEAD: 2fda13452ff0c4b0e4ffe57558c6731609fec36f  wifi: ath12k: Decrease ath12k_mac_station_assoc() stack usage

elapsed time: 1452m

configs tested: 67
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                   randconfig-001-20241212    gcc-13.2.0
arc                   randconfig-002-20241212    gcc-13.2.0
arm                   randconfig-001-20241212    gcc-14.2.0
arm                   randconfig-002-20241212    clang-20
arm                   randconfig-003-20241212    clang-19
arm                   randconfig-004-20241212    clang-20
arm64                 randconfig-001-20241212    clang-20
arm64                 randconfig-002-20241212    clang-15
arm64                 randconfig-003-20241212    clang-20
arm64                 randconfig-004-20241212    gcc-14.2.0
csky                  randconfig-001-20241212    gcc-14.2.0
csky                  randconfig-002-20241212    gcc-14.2.0
hexagon               randconfig-001-20241212    clang-14
hexagon               randconfig-002-20241212    clang-16
i386        buildonly-randconfig-001-20241212    clang-19
i386        buildonly-randconfig-002-20241212    clang-19
i386        buildonly-randconfig-003-20241212    clang-19
i386        buildonly-randconfig-004-20241212    clang-19
i386        buildonly-randconfig-005-20241212    clang-19
i386        buildonly-randconfig-006-20241212    gcc-12
loongarch             randconfig-001-20241212    gcc-14.2.0
loongarch             randconfig-002-20241212    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241212    gcc-14.2.0
nios2                 randconfig-002-20241212    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20241212    gcc-14.2.0
parisc                randconfig-002-20241212    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20241212    gcc-14.2.0
powerpc               randconfig-002-20241212    clang-20
powerpc               randconfig-003-20241212    clang-15
powerpc64             randconfig-001-20241212    clang-20
powerpc64             randconfig-002-20241212    gcc-14.2.0
powerpc64             randconfig-003-20241212    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20241212    clang-17
riscv                 randconfig-002-20241212    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241212    clang-18
s390                  randconfig-002-20241212    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241212    gcc-14.2.0
sh                    randconfig-002-20241212    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20241212    gcc-14.2.0
sparc                 randconfig-002-20241212    gcc-14.2.0
sparc64               randconfig-001-20241212    gcc-14.2.0
sparc64               randconfig-002-20241212    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20241212    gcc-12
um                    randconfig-002-20241212    clang-20
x86_64      buildonly-randconfig-001-20241212    clang-19
x86_64      buildonly-randconfig-002-20241212    gcc-12
x86_64      buildonly-randconfig-003-20241212    clang-19
x86_64      buildonly-randconfig-004-20241212    clang-19
x86_64      buildonly-randconfig-005-20241212    gcc-11
x86_64      buildonly-randconfig-006-20241212    clang-19
xtensa                randconfig-001-20241212    gcc-14.2.0
xtensa                randconfig-002-20241212    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

