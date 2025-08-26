Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51993CA0FE7
	for <ath12k@archiver.kernel.org>; Tue, 26 Aug 2025 16:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzGDa6JN/Py3yhmfqZ2WRCAgnMPNUd2n8J8bvILSl0Q=; b=qTUqUS03LuYxZs/zCmB1Wy+kTm
	leHUvyAh6CvPikkkLO8tqPXc3AmsH0nMc0SYnh4njpe/CB+1muPRmqGyuwC/OWCLPeAetooZlAKUf
	AmC5Tl59JsnBs0jFiBeTGB4tUjuanxUUDbjBjTEiRUAUiTQXX5DBxr4w4Dv8rV2Cwq6UdHoOBxjFV
	EYoL0MMuCyR4KcA2awd18se7bgTRcjgWIjP5OelNnStYS72VMrNCXeeSTUtgYmt2JVxwM7bTCAi9p
	LStcc0iQam6UJnvzADSdu5Y2IJvYgLJY0/b78zfI5VXknRUE7ZwOFc2EMIE5Yeciy4oL2Ml84WYxa
	KnalSd9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqw6M-0000000CZKG-0KvL;
	Tue, 26 Aug 2025 16:00:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqw6L-0000000CZJw-3Fsp;
	Tue, 26 Aug 2025 16:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:Date:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xzGDa6JN/Py3yhmfqZ2WRCAgnMPNUd2n8J8bvILSl0Q=; b=eCoRQ1sFuBsCJbmlL7o5Cldjwq
	gadMhGfq1hJjEsp9TCAcIfXB9nufMXzXKxHf75laLQ8G2nb0j0VCqfYi3dxv/hmw50ClVh/85YRBT
	ZTKRK0f1LH/MZ5imUghd4s8heUdeVX4+8oq7COxiWdztXTCHCO1eVZh1e+FIH5hBU65+biyCKvfih
	rnHiY1IIl2dcTEFPbHm6nkPq9KMB9DFSB/iPjDlHYrr5oCbgA80e3tp7KcQtbRgEIm8qjzOOmFptv
	KeysNExWkG0+pIuPCPu5bT7XTXraI1TzYfHY/K6hpTWYEq0+29/P51KNNHbVv8Jh5gpxI0wwzdei8
	rKgjbCVw==;
Received: from mgamail.intel.com ([192.198.163.13])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqw6I-00000002FsA-1yPv;
	Tue, 26 Aug 2025 16:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756224046; x=1787760046;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=MvazfRK55Y+YfphRl006UAxhYW9WAxvC/vVYPiYdSR4=;
  b=hH5GTFdAthchlbncAU6C76f2itDwA4YtxJL2yyfmRo+/pkhgfzQNRfMh
   vU6IzjKoX73zx3mlumFye6lfXnH2V1Gsr0PYMfI+cLm6YwJXzftYM1p50
   9r1M4/JsmoRTR//6Df4QCT0axMEd00u17lK5aAJ5PBXevS3+vK1Y5twMW
   2B4YfpR50fyFpo7s4kk1Ls+okbHICBuw6PU6xHzVrcbx+mEJlzjWCW+ud
   iTeEPSU9onglk/hRD7YJLwJE6kJrKsff+auUVZ4du+R1IQk6iN63PP5fJ
   h9ywgu0TeiU9cdzffccTZuAsuiacpJsj4mgEvkm2t3KqM8/W3/77MqfHX
   A==;
X-CSE-ConnectionGUID: 7gcwXnkBQEShHn95/cYxGg==
X-CSE-MsgGUID: IQM9cxf3Rd+p6AOHsFkbfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="61099301"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="61099301"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 09:00:41 -0700
X-CSE-ConnectionGUID: zv1x8OSWQXeJW9G/Mr2ptw==
X-CSE-MsgGUID: saIygWOLRJWUlK7H39/AOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169519770"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.4])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 09:00:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 26 Aug 2025 19:00:25 +0300 (EEST)
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
cc: manivannan.sadhasivam@oss.qualcomm.com, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    Manivannan Sadhasivam <mani@kernel.org>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, 
    Rob Herring <robh@kernel.org>, Nirmal Patel <nirmal.patel@linux.intel.com>, 
    Jonathan Derrick <jonathan.derrick@linux.dev>, 
    Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, 
    linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
    ath11k@lists.infradead.org, ath10k@lists.infradead.org, 
    =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, 
    Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [PATCH v2 6/8] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
In-Reply-To: <2fab10a7-8758-4a5c-95ff-2bb9a6dea6bf@oss.qualcomm.com>
Message-ID: <705a4fe5-658e-25ac-9e4d-6b8089abca46@linux.intel.com>
References: <20250825-ath-aspm-fix-v2-0-61b2f2db7d89@oss.qualcomm.com> <20250825-ath-aspm-fix-v2-6-61b2f2db7d89@oss.qualcomm.com> <2fab10a7-8758-4a5c-95ff-2bb9a6dea6bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_170046_982367_606FD3CB 
X-CRM114-Status: GOOD (  13.42  )
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

On Tue, 26 Aug 2025, Jeff Johnson wrote:

> On 8/25/2025 10:44 AM, Manivannan Sadhasivam via B4 Relay wrote:
> > --- a/drivers/net/wireless/ath/ath12k/Kconfig
> > +++ b/drivers/net/wireless/ath/ath12k/Kconfig
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: BSD-3-Clause-Clear
> >  config ATH12K
> >  	tristate "Qualcomm Technologies Wi-Fi 7 support (ath12k)"
> > -	depends on MAC80211 && HAS_DMA && PCI
> > +	depends on MAC80211 && HAS_DMA && PCI && PCIEASPM
> 
> As you point out in patch 1/8, PCIEASPM is protected by EXPERT.
> 
> Won't this prevent the driver from being built (or even showing up in
> menuconfig) if EXPERT is not enabled?

It doesn't work that way, PCIEASPM defaults to y:

$ sed -i -e 's|CONFIG_PCIEASPM=y|CONFIG_PCIEASPM=n|g' .config && make oldconfig && grep -e 'CONFIG_EXPERT ' -e 'CONFIG_PCIEASPM=' .config
#
# configuration written to .config
#
# CONFIG_EXPERT is not set
CONFIG_PCIEASPM=y

> Should we consider having a separate CONFIG item that is used to protect just
> the PCI ASPM interfaces? And then we could split out the ath12k_pci_aspm
> functions into a separate file that is conditionally built based upon that
> config item?
> 
> Or am I too paranoid since everyone enables EXPERT?

One just cannot control PCIEASPM value if EXPERT is not set. ASPM is 
expected to be enabled, or "experts" get to keep the pieces.

-- 
 i.


