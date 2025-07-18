Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984B4C83F17
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 08:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJqOFe2CgaH2ecQ8zz1AuLsic5CxaqyXX/GfZpNicYk=; b=dKCUGmJsFKHpNqKGRqCBF0YDEB
	9nBvsVm0RAlx79HQLSZoSS+jnpYNvjT6sWRAmXIadv4X22kblDc1eHAacZgaAtNjNiMnpqQfB3j6V
	7emH5yEvf2uymBdbyx4skZPbGD7tIIgIKbury+yRuhfEZmIO1VoBlVHhtKTj5wjMT0JOJnhGCrd7P
	uCMolNRefQdbTZBqj+6pj9+alBM+D7PTS/qjEGbc83djilnqsqyUCwvIoCXwAJ5pe7tHC2/Jf/0GA
	gpU8Ih6nQO8mEPibqe4yl6XgXigrOxZqrGS/HPfI9YU1GEldn0J+wYG5jBdTwUkP6z6EbAqwiUP3s
	lT9SgVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgVU-0000000C35Z-1TPD;
	Fri, 18 Jul 2025 08:31:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgMl-0000000C16z-1KVd;
	Fri, 18 Jul 2025 08:22:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6202F601D3;
	Fri, 18 Jul 2025 08:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932EDC4CEEB;
	Fri, 18 Jul 2025 08:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752826970;
	bh=z5KNAGaRerNRfrRdPCcQhDWkKsZXPm2DXDaxH9H3vvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1LiG4EtgUquwegtaP21V96JiM91EimYonVpNyZ68vf61y50YazEGAe0Uk6MLz2jv
	 rNb3dk0D9LdJvlJkU1Tdz98CprGT8Lhp5CLdiGhGIp4/YjqIIpUJOnlfoSqmjEh38b
	 /feyqSI9foeASF24oeyqSWcW6SCPzlE/UVzx9vZQURHRgKPbGKjHfHJ805uVmQsc/J
	 w9om6bk8ZPfmx6DSOhtYPeIo0BwBUCII9TM80Et2dwB3232G5vSlPbGrskRqoRIZNO
	 xGWt9xlVtNvx8nLn8aRjngVk4i4828tYfnJBPMb2nmmb3O7kzoc58bOV2I4Uig89LI
	 PunDn+ZGp24ZA==
Date: Fri, 18 Jul 2025 13:52:38 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <helgaas@kernel.org>, Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Jonathan Derrick <jonathan.derrick@linux.dev>, oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ath12k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath10k@lists.infradead.org, ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org, 
	linux-pci@vger.kernel.org, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
Message-ID: <2jf772wl5qz65verutcpogvs6a7jmxbuvrhgdbpfestf5qxqqt@z223vpbn262p>
References: <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
 <202507171411.xOxUslAs-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202507171411.xOxUslAs-lkp@intel.com>
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

On Thu, Jul 17, 2025 at 02:59:26PM GMT, kernel test robot wrote:
> Hi Manivannan,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Manivannan-Sadhasivam-via-B4-Relay/PCI-ASPM-Fix-the-behavior-of-pci_enable_link_state-APIs/20250716-205857
> base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> patch link:    https://lore.kernel.org/r/20250716-ath-aspm-fix-v1-4-dd3e62c1b692%40oss.qualcomm.com
> patch subject: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state() APIs to enable/disable ASPM states
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250717/202507171411.xOxUslAs-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171411.xOxUslAs-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507171411.xOxUslAs-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/net/wireless/ath/main.c:22:
>    drivers/net/wireless/ath/ath.h: In function 'ath_pci_aspm_state':
> >> drivers/net/wireless/ath/ath.h:346:26: error: 'PCIE_LINK_STATE_L0S' undeclared (first use in this function)
>      346 |                 state |= PCIE_LINK_STATE_L0S;
>          |                          ^~~~~~~~~~~~~~~~~~~

Ok, this is an issue in the PCI header. The CONFIG_PCI symbol wraps the ASPM
definitions also. In this config, CONFIG_PCI is unset, so it triggered the
undeclared definition error.

I will add a patch to move all definitions out of the CONFIG_PCI guard. It is
supposed to wrap only the function definitions/declarations.

- Mani

>    drivers/net/wireless/ath/ath.h:346:26: note: each undeclared identifier is reported only once for each function it appears in
> >> drivers/net/wireless/ath/ath.h:348:26: error: 'PCIE_LINK_STATE_L1' undeclared (first use in this function)
>      348 |                 state |= PCIE_LINK_STATE_L1;
>          |                          ^~~~~~~~~~~~~~~~~~
> --
>    In file included from drivers/net/wireless/ath/ath9k/common.h:19,
>                     from drivers/net/wireless/ath/ath9k/ath9k.h:29,
>                     from drivers/net/wireless/ath/ath9k/beacon.c:18:
>    drivers/net/wireless/ath/ath9k/../ath.h: In function 'ath_pci_aspm_state':
> >> drivers/net/wireless/ath/ath9k/../ath.h:346:26: error: 'PCIE_LINK_STATE_L0S' undeclared (first use in this function)
>      346 |                 state |= PCIE_LINK_STATE_L0S;
>          |                          ^~~~~~~~~~~~~~~~~~~
>    drivers/net/wireless/ath/ath9k/../ath.h:346:26: note: each undeclared identifier is reported only once for each function it appears in
> >> drivers/net/wireless/ath/ath9k/../ath.h:348:26: error: 'PCIE_LINK_STATE_L1' undeclared (first use in this function)
>      348 |                 state |= PCIE_LINK_STATE_L1;
>          |                          ^~~~~~~~~~~~~~~~~~
> --
>    In file included from drivers/net/wireless/ath/carl9170/../regd.h:23,
>                     from drivers/net/wireless/ath/carl9170/carl9170.h:61,
>                     from drivers/net/wireless/ath/carl9170/main.c:47:
>    drivers/net/wireless/ath/carl9170/../ath.h: In function 'ath_pci_aspm_state':
> >> drivers/net/wireless/ath/carl9170/../ath.h:346:26: error: 'PCIE_LINK_STATE_L0S' undeclared (first use in this function)
>      346 |                 state |= PCIE_LINK_STATE_L0S;
>          |                          ^~~~~~~~~~~~~~~~~~~
>    drivers/net/wireless/ath/carl9170/../ath.h:346:26: note: each undeclared identifier is reported only once for each function it appears in
> >> drivers/net/wireless/ath/carl9170/../ath.h:348:26: error: 'PCIE_LINK_STATE_L1' undeclared (first use in this function)
>      348 |                 state |= PCIE_LINK_STATE_L1;
>          |                          ^~~~~~~~~~~~~~~~~~
> --
>    In file included from drivers/net/wireless/ath/ath6kl/../regd.h:23,
>                     from drivers/net/wireless/ath/ath6kl/wmi.c:24:
>    drivers/net/wireless/ath/ath6kl/../ath.h: In function 'ath_pci_aspm_state':
> >> drivers/net/wireless/ath/ath6kl/../ath.h:346:26: error: 'PCIE_LINK_STATE_L0S' undeclared (first use in this function)
>      346 |                 state |= PCIE_LINK_STATE_L0S;
>          |                          ^~~~~~~~~~~~~~~~~~~
>    drivers/net/wireless/ath/ath6kl/../ath.h:346:26: note: each undeclared identifier is reported only once for each function it appears in
> >> drivers/net/wireless/ath/ath6kl/../ath.h:348:26: error: 'PCIE_LINK_STATE_L1' undeclared (first use in this function)
>      348 |                 state |= PCIE_LINK_STATE_L1;
>          |                          ^~~~~~~~~~~~~~~~~~
> --
>    In file included from drivers/net/wireless/ath/ath10k/core.h:25,
>                     from drivers/net/wireless/ath/ath10k/mac.h:11,
>                     from drivers/net/wireless/ath/ath10k/mac.c:9:
>    drivers/net/wireless/ath/ath10k/../ath.h: In function 'ath_pci_aspm_state':
> >> drivers/net/wireless/ath/ath10k/../ath.h:346:26: error: 'PCIE_LINK_STATE_L0S' undeclared (first use in this function)
>      346 |                 state |= PCIE_LINK_STATE_L0S;
>          |                          ^~~~~~~~~~~~~~~~~~~
>    drivers/net/wireless/ath/ath10k/../ath.h:346:26: note: each undeclared identifier is reported only once for each function it appears in
> >> drivers/net/wireless/ath/ath10k/../ath.h:348:26: error: 'PCIE_LINK_STATE_L1' undeclared (first use in this function)
>      348 |                 state |= PCIE_LINK_STATE_L1;
>          |                          ^~~~~~~~~~~~~~~~~~
> 
> 
> vim +/PCIE_LINK_STATE_L0S +346 drivers/net/wireless/ath/ath.h
> 
>    340	
>    341	static inline int ath_pci_aspm_state(u16 lnkctl)
>    342	{
>    343		int state = 0;
>    344	
>    345		if (lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
>  > 346			state |= PCIE_LINK_STATE_L0S;
>    347		if (lnkctl & PCI_EXP_LNKCTL_ASPM_L1)
>  > 348			state |= PCIE_LINK_STATE_L1;
>    349	
>    350		return state;
>    351	}
>    352	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
மணிவண்ணன் சதாசிவம்

