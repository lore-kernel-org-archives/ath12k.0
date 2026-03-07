Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED5CFC9EDA
	for <ath12k@archiver.kernel.org>; Sat,  7 Mar 2026 10:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/jOwRONgGewJlkKdZlENq+Ozz07g4IVyJmhQ+y01eMI=; b=nUBvngvNZYyU471q2JPcX52LXg
	vmrCCXvyopms1HU3r5YCB4/FIPIuodkqZAZ23gdzq5iSLBAJN8JCWyIuuYOXSP+nb4J20P98HB1y+
	MoRFYUDmhmfM5rBjxQiiB+6hM9+QR3EzJlSXbhJPm2pDlz13+PcmlJtIaI2Eni0T8NbKqTAvG9nCE
	528omMv0AwxDgxhj/RuXAjpU/CmCBn2Sx6qEoFcvmDVf6cycVSA9z8/lithqlYo2K3H5d+t3pUho6
	Alq3fP3FAwLZIriFDfCrjznC4W+ouO5SMjDaHzTTdqoMfbfRWIIdT+JFxB3E8hrAMJZBVEh9Q0JsR
	WkcOdCYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyobt-0000000548x-38gR;
	Sat, 07 Mar 2026 10:10:13 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyobp-00000005487-2la6
	for ath12k@lists.infradead.org;
	Sat, 07 Mar 2026 10:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772878209; x=1804414209;
  h=date:from:to:cc:subject:message-id;
  bh=psUEuaoRdi+fM+BnJKCjS6GIKW45GPXlS3q5VB2ekHY=;
  b=OZk99CjnTCZ7fIetEmYFWm2HMgGOJqSVdgyCyfGtWqpIAfG+SuEGqhUD
   DZeIeN+CyavmthumV4OEKIlV2hADHzsQCx6Rdr1I0zdENqsegKoxp5Rxp
   TFRMKgC/+qMGaZ0DtIh376YziMfqNm22o11uOOoF03/43rO9c0A6phWnb
   WOHdJxHXbgX1JE+Gf9CRXedkfLGpHqGelN0Ulpwbalv/wKvwdQ8Twl0IR
   0sGvkKgs0oBt9k9QatXYN6crkpCja7PcVSv1xYIyAo3/umZXez3olv8b3
   SJXLuZerAY9uOEjHHhdwYJ62s9sdGKLDQuQdzNRA4vVeBv3KvG7ji+Jj5
   g==;
X-CSE-ConnectionGUID: OEG5Iq3RTVa4nMGi/2dWUA==
X-CSE-MsgGUID: aoXv3xEeTOGWUBLB4N/riw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84611044"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="84611044"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 02:10:04 -0800
X-CSE-ConnectionGUID: r2ApRnkTTEmnnHwyZYlGHA==
X-CSE-MsgGUID: VcwByHwzQmG8dNhiTgjLzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="223731072"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Mar 2026 02:10:04 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyobg-000000001s1-32oH;
	Sat, 07 Mar 2026 10:10:00 +0000
Date: Sat, 07 Mar 2026 18:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [ath:pending] BUILD SUCCESS
 8e0ab5b9adb7fec3149441621df1cf15325b7215
Message-ID: <202603071811.Jdk0h7Ag-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_021009_739352_6393599F 
X-CRM114-Status: UNSURE (   3.69  )
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
branch HEAD: 8e0ab5b9adb7fec3149441621df1cf15325b7215  wifi: ath6kl: wmi: Avoid -Wflex-array-member-not-at-end warning

elapsed time: 749m

configs tested: 69
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arm                     allnoconfig    clang-23
arm                    allyesconfig    gcc-15.2.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc      randconfig-001-20260307    gcc-12.5.0
parisc      randconfig-002-20260307    gcc-8.5.0
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    gcc-15.2.0
powerpc     randconfig-001-20260307    gcc-8.5.0
powerpc     randconfig-002-20260307    gcc-11.5.0
powerpc64   randconfig-001-20260307    gcc-8.5.0
powerpc64   randconfig-002-20260307    gcc-12.5.0
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sparc                   allnoconfig    gcc-15.2.0
sparc       randconfig-001-20260307    gcc-15.2.0
sparc       randconfig-002-20260307    gcc-11.5.0
sparc64                allmodconfig    clang-23
sparc64     randconfig-001-20260307    clang-23
sparc64     randconfig-002-20260307    gcc-8.5.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
um          randconfig-001-20260307    gcc-14
um          randconfig-002-20260307    clang-23
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.2.0
xtensa                 allyesconfig    gcc-15.2.0
xtensa      randconfig-001-20260307    gcc-8.5.0
xtensa      randconfig-002-20260307    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

