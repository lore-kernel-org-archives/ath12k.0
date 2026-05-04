Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739E5CD3427
	for <ath12k@archiver.kernel.org>; Mon,  4 May 2026 21:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DNfe4LyUDfJiggUyN3DXLlfWNKgArkCwXQQn83y9ghA=; b=FJRbJLZxARTZrKXP6IEDc04FvL
	kjQ+IYW3gfnvI5h5JrKVmWeZ6AhK7TMgv39KXitx0v/X6MmRC9RY7sY/CZ0r0zl0ZmYRBeS0Xmuvc
	z8KrI/bGsjyMF/0xJdhPGoMWAzy9r00YsZ72MoEmjhNgTJsEv/Yx6Nq4eD6q/sQY3it5iteE1IVNY
	O44DqIqiNMqydLIS5+yyk8fEMi90jG2Z4B70ZC5cHW4ghSL15I+lDHQ6N7JXsXcbTxuZV1npSKqdh
	4Y53jLvKoKxZoNjeguceNWqxGMmmDRyKhSvcR9ml5ybtyyOsvMS2W2U7cGCJswKI/ZfBKGsCwmoku
	LZieIp7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0ZW-0000000EKO2-3268;
	Mon, 04 May 2026 21:11:22 +0000
Received: from gollum.nazgul.ch ([82.197.176.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0ZQ-0000000EKDX-31Ko
	for ath12k@lists.infradead.org;
	Mon, 04 May 2026 21:11:21 +0000
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id 024d991b;
	Mon, 4 May 2026 23:08:54 +0200 (CEST)
Date: Mon, 4 May 2026 23:08:54 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: jjohnson@kernel.org, kvalo@kernel.org, 
	manivannan.sadhasivam@linaro.org, Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: ath12k WCN7850: Q6 Hexagon fault at WLAON region 0x1792000 ~2s
 post-AUTHORIZE on X1E80100
Message-ID: <g7dkeq3uwg7eby57zcuu5eysf4tqomh5civlvkpnlziipn6xis@45eevyzgfmaq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_141117_094546_9BBAAEBC 
X-CRM114-Status: UNSURE (   7.29  )
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

Hi,

We're porting ath12k to OpenBSD as the qwz(4) driver, targeting Samsung
Galaxy Book4 Edge (X1E80100 SoC, WCN7850 hw2.0).  Scan, auth, 4-way
handshake all complete; ~2 seconds after WPA2 AUTHORIZE the WCN7850
firmware crashes deterministically with:

	dlpager_main.c:147 Non Page Fault Exception cause code 0x 23
	at Address: 0x 1792000

Cause code 0x23 isn't a valid arm64 exception -- the fault is on the
WCN7850's on-die Hexagon Q6 DSP, with QURT's generic exception handler
(which happens to live in dlpager_main.c) printing it.  So this is not
a host CPU fault.

Per the RDDM segment table (at the start of the dump), VA 0x01792000
is the start of the chip's WLAON_DUMP region (size 0x820).  The Q6 is
trying to read its own always-on hardware state region and the chip
refuses the access.

(Samsung, Asus, Honor) with multiple FW builds.  Currently testing
with WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
(fw 0x110cffff, 2025-06-25) -- the exact blob a Linux ath12k user
runs successfully on the identical Samsung hardware.  Same board-2.bin,
same compiled DTB (upstream hamoa.dtsi based).

We've field-compared qwz against ath12k and ruled out (byte-level or
wire-level):

  * QMI host_cap, m3_info, wlan_cfg, wlan_ini, bdf_download (all
    fields including ce_config, svc_to_ce_map, shadow_reg_v3,
    feature_list, m3 paddr/size, nm_modem)
  * MHI bringup ordering (BHI -> wait SBL EE -> wait M0 -> BHIE)
  * BHI/BHIE DMA coherency
  * ASPM disable before MHI start
  * WLAON_WARM_SW_ENTRY zeroing + QFPROM_PWR_CTRL VDD4BLOW clear
  * static_window_map=false + window-bank register init
  * Per-chunk vs monolithic respond_mem allocation
  * WMI_PEER_MIMO_PS_STATE = WMI_PEER_SMPS_PS_NONE (added matching
    ath12k_setup_peer_smps; doesn't help)
  * FW image variation (c5 and c7 both fail identically)

Specifically NOT involved (we have evidence either way):

  * Gunyah -- X1E80100 is reportedly run in EL2 without Gunyah by
    users where ath12k works; so Gunyah isn't programming WLAON
    access for the Q6.
  * SMMU / pcie_smmu -- pcie_smmu is status="reserved" upstream,
    pcie4 has no iommus property; PCIe DMA bypasses SMMU.
  * SCM/PAS -- ath12k's PCIe path makes no qcom_scm_* calls.

Question: what subsystem inside the WCN7850 firmware touches the
WLAON region at 0x01792000 around 2 seconds after the host sends
WMI_PEER_AUTHORIZE?  And what host-side configuration (WMI command,
HTT message, MHI state, etc.) primes that path so the access
succeeds on Linux?

Even a pointer at the right Linux code path or the right FW-side
component would unblock us.  We have full RDDM dumps and dmesg
captures available; happy to share off-list or as attachments.

Thanks,
Marcus

-- 

[ -- Marcus Glocker, marcus@nazgul.ch, https://nazgul.ch ------------- ]

