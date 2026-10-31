Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE48D606A325
	for <ath12k@archiver.kernel.org>; Sat, 31 Oct 2026 12:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E4l39MR6;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SgtGk1gB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+l1RRgq+C9AayOmwqqNeY+nzGv5HKvLpPKk8tw/PkoQ=; b=E4l39MR6ksA274G1mcx8XW4mo1
	rh4yEPB3b3AKPfttzEIjbhEOMw1Edwz4rWwrpnv45bgTC5mMZmoDIelwt8GQmis4k2HBWgZeQAaap
	YGyyRqijpCxcXy/Qu4ZPmqX+2e/X0qfM3QTQdFe9s44MXYSq8Cgpxm6hhy0eWpBCyuSl52ePBHiMq
	PYSLnFveOh/6n7uk4a2j28Wxksw48qvxlE8APZWlZWeP40MOb++8OTlGbdTLAvrkxz3s0YyiOxXdt
	GFZRnoxKW6K675Woh1C7YU9KU3yx0WIQGvt1Ut5+z/tJKZoTvhqpUyqjh3Lofqg+1vlbcOJg8sjFx
	n8cZEIYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN7rn-0000000DHi0-2btR;
	Sat, 31 Oct 2026 12:07:23 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN7re-0000000DHdu-0bd0;
	Sat, 31 Oct 2026 12:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793448435; x=1824984435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2NOLA5XLr0F+d2rcxhw0zW65IDgq0qHt9PrC2igHtR4=;
  b=SgtGk1gBONQO5Rc2meITFXCf4GfSEsBQ/wsSntIjNBf5Z6bvQsu4Z9xu
   I5gxnDt2LAWqOeF7eEpxOx/VZmQ+JvbAxONomp/dAS8ysuW6ZcsUob+Jn
   Mr623jv8NM0l10wbXAjEUeZKaflcfRg9Ky0sElJRnYUk6HcLNcXzl3uSn
   dCTkckHQ7U+lseQfeojIL2bmNtHO1VS2M6OBlyDUsNuKaWzqw2Rt6iaaD
   qPegj0Y+QTlEDndCIXPGjY04dAKzrSWpc02VQsd3n6ELez6qxfaT8Z7VP
   kHMgKW9h0r0pBI4mnVguWefW2z+xwkYR0QEkCboK7NCVc8NvDWABDZ7Vl
   g==;
X-CSE-ConnectionGUID: 5491U54CTzatg3/zEq34tg==
X-CSE-MsgGUID: jv209vRfRlK1CRV+BLRLrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2111060"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2111060"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 05:07:13 -0700
X-CSE-ConnectionGUID: aRmGSsk1R1ugqt8b3FW5xQ==
X-CSE-MsgGUID: IYxRFdnZT1CpmNC+dmjNEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="7493584"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 31 Oct 2026 05:07:09 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN7rV-00000000coK-1izy;
	Sat, 31 Oct 2026 12:07:05 +0000
Date: Sat, 31 Oct 2026 20:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jgg@ziepe.ca,
	alex@shazbot.org, pbonzini@redhat.com, seanjc@google.com,
	bhelgaas@google.com, jjohnson@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	johannes@sipsolutions.net, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, vkuznets@redhat.com,
	kevin.tian@intel.com, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: Re: [PATCH v3 2/8] KVM: add PCI MSI hypercall for VFIO passthrough
Message-ID: <202610311919.NWIUCtPb-lkp@intel.com>
References: <20261029163713.1366077-3-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029163713.1366077-3-jtornosm@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_050714_219531_DD67BE98 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jose,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master next-20261030]
[cannot apply to kvm/queue kvm/next ath/ath-next kvm/linux-next v7.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jose-Ignacio-Tornos-Martinez/vfio-add-helper-to-find-PCI-device-by-vendor-device-ID/20261029-173706
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20261029163713.1366077-3-jtornosm%40redhat.com
patch subject: [PATCH v3 2/8] KVM: add PCI MSI hypercall for VFIO passthrough
config: x86_64-randconfig-1011-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311919.NWIUCtPb-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610311919.NWIUCtPb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610311919.NWIUCtPb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: vfio_file_find_pci_device
   >>> referenced by vfio.c:405 (arch/x86/kvm/../../../virt/kvm/vfio.c:405)
   >>>               vmlinux.o:(kvm_vfio_pci_msi_alloc)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

