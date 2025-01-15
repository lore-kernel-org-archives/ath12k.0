Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E32C02183
	for <ath12k@archiver.kernel.org>; Wed, 15 Jan 2025 16:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+nMIrx7GI6Wq/enFH6h0cY3PgemW8qoQlpnO11YKD0=; b=gyFnT+PFa8hxEs5KqdDVX9OiMg
	WOQebc5LzjPx3q2zSp1S9ld/eVKsFziXOkK5SHpzB9N2HnGdslcnPyrKPkJYGetkB08+6sV6PgUO9
	VNQhp8/SuATfUl+l75bJIiQJT6MwcSf+er1b5BKTxLeJ7aRt5sFZ99nLs95cExO2DaXkoimogsDgj
	FaZk6k21qUoRrkWMBSt4EvsNHJk+ngkUHlMbSOtsIEV6IA1jMfS3XvpNReBL/6/FsDd40b+B5Ew9+
	UIic1rA47NfNJy7LQNkOLC1ur3y9uhfrfPlBrxDnWbybPJoBZZLZkO+V7TRmi4ynFrurkM2NqZ0uR
	KVBPHqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6eM-0000000CVdq-1IMd
	for ath12k@archiver.kernel.org;
	Wed, 15 Jan 2025 16:53:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6dk-0000000CVYm-2YlU;
	Wed, 15 Jan 2025 16:53:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C6025C54EB;
	Wed, 15 Jan 2025 16:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679DFC4CED1;
	Wed, 15 Jan 2025 16:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736959991;
	bh=rsK0TYLVfCwP4ZECsZmPRCQlRRo1EHuSBWdx4ZFPdak=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=SotcUx15Orfo7zB3Ib8U4pRYFhpiRRl/NuSo0qsIdVWIY7wBlbtkhgdfpBxWcCjRi
	 71QIQOS5BnQsq5TuyrNADEMpRlSFkzr1FiRRYauMIVdX+SYtNCo/q1ucMB8t6EDA8c
	 57s1Mp4ADJaPeUf9oAfiwZ65pWO/h0U+XRrkj5YI++HkBn8CqZh2Y6RDktS42gnIl9
	 68CgeTYTXoirtGv2VHUe7+l89bhOU550lJ66VF91v9b6j1Brw99CfEYYq8OfDT8THu
	 I7XGnJ0QTdJqKEy0pcOk8PL18ShvMyTgGQN2Yg6lxNZjYbFg4GSshXnzC4C++FXWXU
	 Hw3xuL+3C7fNA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: pull-request: ath-next-20250114
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <b03d2e2c-3f11-427d-a156-eaa0be48078c@oss.qualcomm.com>
References: <b03d2e2c-3f11-427d-a156-eaa0be48078c@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, jjohnson@kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <173695998878.529858.9751725465026344775.kvalo@kernel.org>
Date: Wed, 15 Jan 2025 16:53:10 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_085312_740928_AB9566E6 
X-CRM114-Status: GOOD (  19.14  )
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

Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:

> The following changes since commit b20821248e262a7d16882137419460030c1aead6:
> 
>   Merge tag 'ath-next-20241209' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath (2024-12-09 20:41:20 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20250114
> 
> for you to fetch changes up to 336097d74c284a7c928b723ce8690f28912da03d:
> 
>   wifi: ath12k: fix key cache handling (2025-01-14 12:53:01 -0800)
> 
> ----------------------------------------------------------------
> ath.git patches for v6.14
> 
> This development cycle again featured multiple patchsets to ath12k to
> support the new 802.11be MLO feature, this time including the device
> grouping infrastructure, and the advertisement of MLO support to the
> wireless core. However the MLO feature is still considered to be
> incomplete.
> 
> In addition, there was the usual set of bug fixes and cleanups, mostly
> in ath12k, but also in ath9k.
> 
> ----------------------------------------------------------------
> Aditya Kumar Singh (14):
>       wifi: ath12k: fix read pointer after free in ath12k_mac_assign_vif_to_vdev()
>       wifi: ath12k: fix ath12k_qmi_alloc_chunk() to handle too large allocations
>       wifi: ath12k: fix ar->supports_6ghz usage during hw register
>       wifi: ath12k: pass link ID during MLO while delivering skb
>       wifi: ath12k: symmetrize scan vdev creation and deletion during HW scan
>       wifi: ath12k: add can_activate_links mac operation
>       wifi: ath12k: add no-op without debug print in WMI Rx event
>       wifi: ath12k: remove warning print in htt mlo offset event message
>       wifi: ath12k: add ATH12K_FW_FEATURE_MLO capability firmware feature
>       wifi: ath12k: assign unique hardware link IDs during QMI host cap
>       wifi: ath12k: rename CAC_RUNNING flag
>       wifi: ath12k: fix CAC running state during virtual interface start
>       wifi: ath12k: handle radar detection with MLO
>       wifi: ath12k: fix key cache handling
> 
> Baochen Qiang (1):
>       wifi: ath12k: fix leaking michael_mic for non-primary links
> 
> Bhagavathi Perumal S (1):
>       wifi: ath12k: Add MLO WMI setup and teardown functions
> 
> Colin Ian King (1):
>       wifi: ath12k: Fix spelling mistake "requestted" -> "requested"
> 
> Dan Carpenter (1):
>       wifi: ath12k: Off by one in ath12k_wmi_process_csa_switch_count_event()
> 
> Dmitry Antipov (4):
>       wifi: ath9k: cleanup ath_txq_skb_done()
>       wifi: ath9k: cleanup a few (mostly) TX-related routines
>       wifi: ath9k: simplify internal time management
>       wifi: ath9k: cleanup ath9k_hw_get_nf_hist_mid()
> 
> Jeff Johnson (4):
>       wifi: ath12k: Decrease ath12k_mac_op_remain_on_channel() stack usage
>       wifi: ath12k: Decrease ath12k_bss_assoc() stack usage
>       wifi: ath12k: Decrease ath12k_sta_rc_update_wk() stack usage
>       wifi: ath12k: Decrease ath12k_mac_station_assoc() stack usage
> 
> Karthikeyan Periyasamy (23):
>       wifi: ath12k: send partner device details in QMI MLO capability
>       wifi: ath12k: refactor ath12k_qmi_alloc_target_mem_chunk()
>       wifi: ath12k: add support to allocate MLO global memory region
>       wifi: ath12k: enable MLO setup and teardown from core
>       wifi: ath12k: avoid redundant code in DP Rx error process
>       wifi: ath12k: move to HW link id based receive handling
>       wifi: ath12k: add partner device buffer support in receive data path
>       wifi: ath12k: add helper function to init partner cmem configuration
>       wifi: ath12k: introduce interface combination cleanup helper
>       wifi: ath12k: Refactor radio frequency information
>       wifi: ath12k: advertise multi device interface combination
>       wifi: ath12k: Add documentation HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG
>       wifi: ath12k: Refactor monitor status TLV structure
>       wifi: ath12k: cleanup Rx peer statistics structure
>       wifi: ath12k: Fix the misspelled of hal TLV tag HAL_PHYRX_GENERICHT_SIG
>       wifi: ath12k: fix incorrect TID updation in DP monitor status path
>       wifi: ath12k: Remove unused HAL Rx mask in DP monitor path
>       wifi: ath12k: Change the Tx monitor SRNG ring ID
>       wifi: ath12k: Avoid explicit type cast in monitor status parse handler
>       wifi: ath12k: Refactor ath12k_hw set helper function argument
>       wifi: ath12k: Refactor the ath12k_hw get helper function argument
>       wifi: ath12k: Remove ath12k_get_num_hw() helper function
>       wifi: ath12k: Fix uninitialized variable access in ath12k_mac_allocate() function
> 
> P Praneesh (1):
>       wifi: ath12k: Add support for parsing 64-bit TLVs
> 
> Pradeep Kumar Chitrapu (2):
>       wifi: ath12k: Support Transmit Rate Buffer Stats
>       wifi: ath12k: Support Transmit Buffer OFDMA Stats
> 
> Raj Kumar Bhagat (3):
>       dt-bindings: net: wireless: Describe ath12k PCI module with WSI
>       wifi: ath12k: parse multiple device information from Device Tree
>       wifi: ath12k: Include MLO memory in firmware coredump collection
> 
> Rajat Soni (1):
>       wifi: ath12k: Support pdev Puncture Stats
> 
> Rameshkumar Sundaram (1):
>       wifi: ath12k: advertise MLO support and capabilities
> 
> Ramya Gnanasekar (1):
>       wifi: ath12k: set flag for mgmt no-ack frames in Tx completion
> 
> Roopni Devanathan (1):
>       wifi: ath12k: Support AST Entry Stats
> 
> Sathishkumar Muruganandam (1):
>       wifi: ath12k: fix tx power, max reg power update to firmware
> 
>  .../bindings/net/wireless/qcom,ath12k-wsi.yaml     | 204 ++++++
>  drivers/net/wireless/ath/ath12k/core.c             | 315 +++++++-
>  drivers/net/wireless/ath/ath12k/core.h             |  63 +-
>  drivers/net/wireless/ath/ath12k/coredump.c         |   3 +
>  drivers/net/wireless/ath/ath12k/coredump.h         |   1 +
>  .../net/wireless/ath/ath12k/debugfs_htt_stats.c    | 502 +++++++++++++
>  .../net/wireless/ath/ath12k/debugfs_htt_stats.h    | 155 ++++
>  drivers/net/wireless/ath/ath12k/dp.c               |  14 +
>  drivers/net/wireless/ath/ath12k/dp.h               |  30 +-
>  drivers/net/wireless/ath/ath12k/dp_mon.c           | 156 ++--
>  drivers/net/wireless/ath/ath12k/dp_rx.c            | 231 ++++--
>  drivers/net/wireless/ath/ath12k/fw.h               |   3 +
>  drivers/net/wireless/ath/ath12k/hal.c              |   2 +-
>  drivers/net/wireless/ath/ath12k/hal.h              |   2 +-
>  drivers/net/wireless/ath/ath12k/hal_desc.h         |   4 +-
>  drivers/net/wireless/ath/ath12k/hal_rx.h           |  14 +-
>  drivers/net/wireless/ath/ath12k/mac.c              | 794 ++++++++++++++++-----
>  drivers/net/wireless/ath/ath12k/mac.h              |  11 +
>  drivers/net/wireless/ath/ath12k/peer.c             |   2 +
>  drivers/net/wireless/ath/ath12k/peer.h             |   3 +
>  drivers/net/wireless/ath/ath12k/qmi.c              | 324 +++++++--
>  drivers/net/wireless/ath/ath12k/qmi.h              |   1 +
>  drivers/net/wireless/ath/ath12k/wmi.c              | 225 +++++-
>  drivers/net/wireless/ath/ath12k/wmi.h              |  56 ++
>  drivers/net/wireless/ath/ath9k/ath9k.h             |   8 +-
>  drivers/net/wireless/ath/ath9k/beacon.c            |   2 +-
>  drivers/net/wireless/ath/ath9k/calib.c             |  24 +-
>  drivers/net/wireless/ath/ath9k/channel.c           |  29 +-
>  drivers/net/wireless/ath/ath9k/hw.c                |  25 +-
>  drivers/net/wireless/ath/ath9k/hw.h                |   2 +-
>  drivers/net/wireless/ath/ath9k/main.c              |   9 +-
>  drivers/net/wireless/ath/ath9k/recv.c              |   4 +-
>  drivers/net/wireless/ath/ath9k/xmit.c              |  52 +-
>  33 files changed, 2723 insertions(+), 547 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml

Pulled, thanks.

89d62bcd2501 Merge tag 'ath-next-20250114' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/b03d2e2c-3f11-427d-a156-eaa0be48078c@oss.qualcomm.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


