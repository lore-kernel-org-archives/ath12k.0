Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53EFC5AD7B
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 19:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgajvSGIEs6UxN62o3yRmb3UpZn4o7uMaWnX+4bt62M=; b=EBKHr0/NU2h+ZLSv2nWo5v0gEB
	foK5Nt4Ng8eAtyOx4PWmDycVn6tg8EIR9REjmiduzr2nikhAjq+felbMEIWZywX80N5OjEpEECJnp
	X8oLt/Lf4pwTQDvmmhMxpgIi3+e5zdiEs5hoAEID0yi7UkN6HbQZKHTwEOent5eiyJrWYedzesKaA
	vOR7vXzjJVpAsS8MUNCx1SSrc4g1OreB22oGS4b3e6htZD6IRwmR7YE6/46uR/Un+vejJURV04U8s
	ytq/AlHKE6UdcPHO3PYgiCAfetvnyLexDB8hvQYHNNScoM848qpUX2QaWWzFhgqkAtfZuqLyh9ZAJ
	hWTg8OQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVdi-0000000Ck8I-1UYW;
	Mon, 10 Aug 2026 19:26:26 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVdf-0000000Ck7T-0HE9;
	Mon, 10 Aug 2026 19:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786389983; x=1817925983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GCKXdOc28NC5OnXa1/mzOFkq4JmD7AhEVOgj5N6tN5k=;
  b=jyCeUZqYnb2cxEsHIx40ac4s+ZeeOAPB7kF+urR7p1I6D/ZfCWL35Uy6
   ASK0gTCIpz9m0PjfPMQzM30xBoiF8eAW6x4r2ndQdKfoMTiz6Oug65yEp
   VzZD9vMgFpiQpPU+4rBxQfRzbG70vprpOtSb07/oMvTbqfHIJ9IyJtwc+
   Xoqtq3zBl7OjuDog7KZRolSjyrFnyW1Y59yuVnWlktqI9srxYjnRbOXeq
   O/+gnWQUavabfH2mhj0K0SjFZPUo0Z/wvDamdkhfCczfIVnXJij1x61HL
   WzFnk0G6Kr+1ABrgmejeFM6k0tm516vpUcu0q03b+PirHGreLTxFBE1lQ
   w==;
X-CSE-ConnectionGUID: m4x+G5QeTsmFjZQJgeKkIg==
X-CSE-MsgGUID: Py/u5cfXSomHs+nbuwJE8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86793157"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="86793157"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 12:26:22 -0700
X-CSE-ConnectionGUID: k/JuUWB9RUahXHf7zbkVEg==
X-CSE-MsgGUID: oCH/whz2SUKhdpn+p+oIQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="259819073"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Aug 2026 12:26:19 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtVdZ-00000000Neo-0AdI;
	Mon, 10 Aug 2026 19:26:17 +0000
Date: Tue, 11 Aug 2026 03:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, bhelgaas@google.com,
	alex@shazbot.org, mani@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, jjohnson@kernel.org,
	linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	mhi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: Re: [PATCH v11] PCI: Add device-specific reset for Qualcomm devices
Message-ID: <202608110204.wb17Qqit-lkp@intel.com>
References: <20260626055023.197470-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626055023.197470-1-jtornosm@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_122623_148506_89ABF9B2 
X-CRM114-Status: UNSURE (   9.64  )
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

Hi Jose,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v7.2-rc6 next-20260807]
[cannot apply to linux-review/Jose-Ignacio-Tornos-Martinez/Add-device-specific-reset-for-Qualcomm-devices/20260804-001013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jose-Ignacio-Tornos-Martinez/PCI-Add-device-specific-reset-for-Qualcomm-devices/20260810-131417
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20260626055023.197470-1-jtornosm%40redhat.com
patch subject: [PATCH v11] PCI: Add device-specific reset for Qualcomm devices
config: um-randconfig-r073-20260810 (https://download.01.org/0day-ci/archive/20260811/202608110204.wb17Qqit-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608110204.wb17Qqit-lkp@intel.com/

smatch warnings:
drivers/pci/quirks.c:4278 reset_qualcomm_wifi() warn: always true condition '(val != (~0)) => (0-u32max != u64max)'

vim +4278 drivers/pci/quirks.c

  4234	
  4235	/*
  4236	 * Qualcomm WiFi device-specific reset using SoC global reset via BAR0
  4237	 * registers.
  4238	 */
  4239	static int reset_qualcomm_wifi(struct pci_dev *pdev, bool probe)
  4240	{
  4241		bool link_recovered = false;
  4242		unsigned long timeout;
  4243		void __iomem *bar;
  4244		u32 val;
  4245		u16 cmd;
  4246	
  4247		if (probe)
  4248			return 0;
  4249	
  4250		if (pdev->current_state != PCI_D0)
  4251			return -EINVAL;
  4252	
  4253		pci_read_config_word(pdev, PCI_COMMAND, &cmd);
  4254		pci_write_config_word(pdev, PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
  4255	
  4256		bar = pci_iomap(pdev, 0, 0);
  4257		if (!bar) {
  4258			pci_write_config_word(pdev, PCI_COMMAND, cmd);
  4259			return -ENODEV;
  4260		}
  4261	
  4262		val = ioread32(bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
  4263		val |= QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET_V;
  4264		iowrite32(val, bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
  4265		ioread32(bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
  4266	
  4267		msleep(10);
  4268	
  4269		val &= ~QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET_V;
  4270		iowrite32(val, bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
  4271		ioread32(bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
  4272	
  4273		msleep(10);
  4274	
  4275		timeout = jiffies + msecs_to_jiffies(5000);
  4276		while (time_before(jiffies, timeout)) {
  4277			val = ioread32(bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
> 4278			if (val != PCI_ERROR_RESPONSE) {
  4279				link_recovered = true;
  4280				break;
  4281			}
  4282			msleep(20);
  4283		}
  4284	
  4285		if (!link_recovered) {
  4286			pci_err(pdev, "PCIe link failed to recover after reset\n");
  4287			goto out_restore;
  4288		}
  4289	
  4290		/* After SOC_GLOBAL_RESET, MHISTATUS may still have SYSERR bit set
  4291		 * and thus need to set MHICTRL_RESET to clear SYSERR.
  4292		 */
  4293		iowrite32(QUALCOMM_WIFI_MHICTRL_RESET_MASK, bar + QUALCOMM_WIFI_MHICTRL);
  4294		ioread32(bar + QUALCOMM_WIFI_MHICTRL);
  4295	
  4296		msleep(10);
  4297	
  4298	out_restore:
  4299		pci_iounmap(pdev, bar);
  4300		pci_write_config_word(pdev, PCI_COMMAND, cmd);
  4301	
  4302		return link_recovered ? 0 : -ETIMEDOUT;
  4303	}
  4304	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

