Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4868F606A31A
	for <ath12k@archiver.kernel.org>; Sat, 31 Oct 2026 03:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0gbnlv2H;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iZj+Gxle
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ot9ndK0ejKVXddWQEZ2xSPgFjOHt7YNnn7ck0sFqpGc=; b=0gbnlv2HpZ9CiVMC/Kc4QzBuUM
	2OMz1x6X5jrKZsgWlh8pzM0ozbuJEwwfd+1SgF6d3tCOGcS13srcUH6qgwl1iU1wkzEDTbTmhP39a
	glT4J7j8HigaYRpy+Fc7xFwo8YLuyKNYTgCEP9reItbibMVQmAZIqobWpLwCNGZdGahQTB5faAjuR
	UwCed7oNO4lprOPf7x4/hPlwBOuJl6xU/hrH7sRdNiXu75vfyZ26dblaUGBXlvhqAM07couRSq01J
	Tu/gK+KV3mdIu6lWnK7gzyeQ9dlbqOY4qmSncGVqnIMv4dIWX0NTRaz0TaAmEGdJ/NcvafS4chrOT
	BiFwK7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMzzD-0000000CujX-4Awi;
	Sat, 31 Oct 2026 03:42:32 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMzzB-0000000Cuip-1yrz;
	Sat, 31 Oct 2026 03:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793418149; x=1824954149;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aGlr3qfr6AZBSiPKZMalF/26FFfN/4Og7QmWbsUKYaY=;
  b=iZj+GxleJQ/t80kZlt4Py+Sv9WKRZgrBIQZTZvQp368KbHLta9HgaBUY
   j2S1aCYYYlOmjY4luHoZZR6M86rcbJw1g+a5ySg6MdhaI2gB1FcTZmYV+
   iJdGLitSqKYm5c7BGKHvvuez7VOrtLKsmHW9Q8KAVaJklfiALgJdYZxB2
   YfmFc159/+mlUb18WU/hnTzuPJATQy7+K0/atGWwa+b6YsHuDKF+ORzkb
   LDUYnCN7+VmHhcUPs/A0TCe/uF89IZD2IRCGnkWGhw0HyPdjT30rD9fmQ
   c0ldRKRzlS4Pma2eccemsWgylHSViKViE8Gqi1KWmUdwsBSFROCHTZk4e
   w==;
X-CSE-ConnectionGUID: CY/9+QWXSLmT4xIF+vAQCw==
X-CSE-MsgGUID: hNXWytG1SUu/H5jvdYPRHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2188813"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2188813"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 20:42:29 -0700
X-CSE-ConnectionGUID: 1aS14UP0T/aO54Frxa2Eug==
X-CSE-MsgGUID: GHsu/r0hSAa7KZcwxpde2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5568194"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Oct 2026 20:42:25 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMzz3-00000000cVO-2SRY;
	Sat, 31 Oct 2026 03:42:21 +0000
Date: Sat, 31 Oct 2026 11:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jgg@ziepe.ca,
	alex@shazbot.org, pbonzini@redhat.com, seanjc@google.com,
	bhelgaas@google.com, jjohnson@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, johannes@sipsolutions.net,
	mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
	robh@kernel.org, vkuznets@redhat.com, kevin.tian@intel.com,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: Re: [PATCH v3 2/8] KVM: add PCI MSI hypercall for VFIO passthrough
Message-ID: <202610311038.ydvb3F1w-lkp@intel.com>
References: <20261029163713.1366077-3-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029163713.1366077-3-jtornosm@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_204229_560987_A3D350AA 
X-CRM114-Status: GOOD (  12.87  )
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
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
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
config: s390-randconfig-1000-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311038.ydvb3F1w-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610311038.ydvb3F1w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610311038.ydvb3F1w-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/kvm/arm64/../../../../virt/kvm/vfio.c: In function 'kvm_vfio_pci_msi_alloc':
>> arch/s390/kvm/arm64/../../../../virt/kvm/vfio.c:438:48: error: 'struct irq_data' has no member named 'parent_data'
     438 |                 for (pos = irqd; pos; pos = pos->parent_data) {
         |                                                ^~
--
   arch/s390/kvm/s390/../../../../virt/kvm/vfio.c: In function 'kvm_vfio_pci_msi_alloc':
>> arch/s390/kvm/s390/../../../../virt/kvm/vfio.c:438:48: error: 'struct irq_data' has no member named 'parent_data'
     438 |                 for (pos = irqd; pos; pos = pos->parent_data) {
         |                                                ^~


vim +438 arch/s390/kvm/arm64/../../../../virt/kvm/vfio.c

   361	
   362	/**
   363	 * kvm_vfio_pci_msi_alloc - Get physical MSI address/data for a VFIO device
   364	 * @kvm: the VM instance
   365	 * @devid: PCI vendor:device packed as (vendor << 16 | device)
   366	 * @vector: MSI vector index
   367	 * @msg: output MSI message (address + data)
   368	 *
   369	 * Walks VFIO files attached to this VM, uses vfio_file_find_pci_device()
   370	 * to find the PCI device matching the given vendor:device ID, and returns
   371	 * the host's physical MSI address/data for the requested vector.
   372	 *
   373	 * Returns 0 on success, negative errno on failure.
   374	 */
   375	int kvm_vfio_pci_msi_alloc(struct kvm *kvm, u32 devid,
   376				     unsigned int vector, struct msi_msg *msg)
   377	{
   378		struct kvm_vfio_file *kvf;
   379		struct kvm_vfio *kv = NULL;
   380		struct vfio_device *vdev;
   381		struct kvm_device *dev;
   382		struct msi_desc *desc;
   383		struct irq_data *irqd;
   384		struct pci_dev *pdev;
   385		u16 vendor = devid >> 16;
   386		u16 device = devid & 0xffff;
   387		int irq;
   388	
   389		scoped_guard(mutex, &kvm->lock) {
   390			list_for_each_entry(dev, &kvm->devices, vm_node) {
   391				if (dev->ops == &kvm_vfio_ops) {
   392					kv = dev->private;
   393					break;
   394				}
   395			}
   396		}
   397	
   398		if (!kv)
   399			return -ENODEV;
   400	
   401		guard(mutex)(&kv->lock);
   402	
   403		vdev = NULL;
   404		list_for_each_entry(kvf, &kv->file_list, node) {
   405			vdev = vfio_file_find_pci_device(kvf->file, vendor, device);
   406			if (vdev)
   407				break;
   408		}
   409	
   410		if (!vdev)
   411			return -ENODEV;
   412	
   413		pdev = to_pci_dev(vdev->dev);
   414	
   415		if (!pdev->msi_enabled && !pdev->msix_enabled) {
   416			memset(msg, 0, sizeof(*msg));
   417			return 0;
   418		}
   419	
   420		irq = pci_irq_vector(pdev, vector);
   421		if (irq <= 0) {
   422			memset(msg, 0, sizeof(*msg));
   423			return 0;
   424		}
   425	
   426		irqd = irq_get_irq_data(irq);
   427		if (!irqd) {
   428			memset(msg, 0, sizeof(*msg));
   429			return 0;
   430		}
   431	
   432		desc = irq_get_msi_desc(irq);
   433		if (desc) {
   434			*msg = desc->msg;
   435		} else {
   436			struct irq_data *pos;
   437	
 > 438			for (pos = irqd; pos; pos = pos->parent_data) {
   439				if (pos->chip && pos->chip->irq_compose_msi_msg) {
   440					pos->chip->irq_compose_msi_msg(pos, msg);
   441					break;
   442				}
   443			}
   444			if (!pos) {
   445				memset(msg, 0, sizeof(*msg));
   446				return 0;
   447			}
   448		}
   449	
   450		return 0;
   451	}
   452	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

