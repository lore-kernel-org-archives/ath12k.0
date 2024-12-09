Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84BAE77181
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 18:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKluJuNX+BDc6OfBUNMI/MO63VJGx50/v47JY+F/IWg=; b=N9I/cguP9Mc1fwD2uzWERsMTZA
	3S1ZqsdRtFsW4pZOYrkSIhWmjzA+N3kG0HVr8eQ0v8RunMxTHHI2H+1EnJusx+jVyDXnGdqNftsAv
	ufcCt45DYkSZOSQY6XbTnBc42oymuGiGNL7wwO8lZq1bNuFIz6NaFOWzIXpkugXFnprsMrG5IpHPv
	Pxiyz4djBVQd22Y4VfHYxfobXAUN5rodMZVXtFl0bMpPD4zbyFdyYxTJv/+kKGllkFR94K8EEt+55
	czzjWz0NRu2ifjFQy3XCyHKUvq99NC8/GD268WLSVd5QR9ES8OqePMLFls+Nl9ez6fdXRJeqepds3
	rOHsDN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKiiA-00000008uTz-1y5V
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 18:42:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKii6-00000008uT7-3o5I;
	Mon, 09 Dec 2024 18:42:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B11245C5C73;
	Mon,  9 Dec 2024 18:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF36C4CED1;
	Mon,  9 Dec 2024 18:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733769742;
	bh=F/HSU2BYTDz8trksjoa/V+FrgF4MM9/MBGwtQDsbwhA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Vqc3wKfAVOaXZBpYmdlhOr78itfPAB4qc/xqw+fUnNzRu28fazkIAC8AeHMPov2z5
	 N8ZovavjZVVvH5tN7MmMNzM07db6FivpwR0zOz9iakLJpbJJSPcUV/ma0BDxPCypUa
	 ZwQZCkdSYPqmBpSeG28rjApdqtB4QfPm+sHtgfEgHvf92sWTA6Ip5judPirEt4CC1R
	 uUD5fSaqv/KoCpxXG7Rovwl+mnTsKy41be9w6tnNoXNreal/n51PYsQPw1ZExBWPFq
	 1yPcVJme96/Ymf789/5Axqa7pGuLrm57ivna/YOnswBYJmAZtzRViG28VQKIzo3Kw5
	 MNCEegwdE7ODQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: pull-request: ath-next-20241209
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1bcdaf98-6078-4f79-a989-2e5db9400585@oss.qualcomm.com>
References: <1bcdaf98-6078-4f79-a989-2e5db9400585@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, jjohnson@kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <173376973868.347288.14583872593159043067.kvalo@kernel.org>
Date: Mon,  9 Dec 2024 18:42:20 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_104223_041058_A1E579C1 
X-CRM114-Status: GOOD (  17.46  )
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

> The following changes since commit 2b94751626a6d49bbe42a19cc1503bd391016bd5:
> 
>   wifi: cw1200: Fix potential NULL dereference (2024-10-31 16:20:02 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20241209
> 
> for you to fetch changes up to da8656797ae10b524a7a0c3d5eeb6237fa3ddd70:
> 
>   wifi: ath12k: introduce mlo_capable flag for device group (2024-12-05 14:34:10 -0800)
> 
> ----------------------------------------------------------------
> ath.git patches for v6.14
> 
> This development cycle featured multiple patchsets to ath12k to
> support the new 802.11be MLO feature, although the feature is still
> incomplete. Also in ath12k, there were other feature patches.  In
> ath11k, support was added for QCA6698AQ. And there was the usual set
> of bug fixes and cleanups across most drivers, notable being the
> addition of "noinline_for_stack" to some functions to avoid "stack
> frame size" warnings when compiling with clang.
> 
> ----------------------------------------------------------------
> Aditya Kumar Singh (2):
>       wifi: ath12k: ath12k_bss_assoc(): MLO support
>       wifi: ath12k: rename mlo_capable_flags to single_chip_mlo_supp
> 
> Balaji Pothunoori (2):
>       wifi: ath11k: Suspend hardware before firmware mode off for WCN6750
>       wifi: ath11k: Fix unexpected return buffer manager error for WCN6750/WCN6855
> 
> Barnabás Czémán (1):
>       wifi: wcn36xx: fix channel survey memory allocation size
> 
> Dinesh Karthikeyan (4):
>       wifi: ath12k: Support Downlink Pager Stats
>       wifi: ath12k: Support phy counter and TPC stats
>       wifi: ath12k: Support SoC Common Stats
>       wifi: ath12k: Support Transmit PER Rate Stats
> 
> Dmitry Antipov (5):
>       wifi: ath9k: miscellaneous spelling fixes
>       wifi: ath11k: cleanup struct ath11k_vif
>       wifi: ath11k: cleanup struct ath11k_reg_tpc_power_info
>       wifi: ath11k: cleanup struct ath11k_mon_data
>       wifi: ath11k: miscellaneous spelling fixes
> 
> Jeff Johnson (4):
>       wifi: ath12k: mark QMI driver event helpers as noinline
>       wifi: ath11k: mark some QMI driver event helpers as noinline
>       wifi: ath11k: mark ath11k_dp_rx_mon_mpdu_pop() as noinline
>       wifi: ath11k: mark ath11k_wow_convert_8023_to_80211() as noinline
> 
> Kalle Valo (5):
>       wifi: ath12k: ath12k_mac_vdev_create(): use goto for error handling
>       wifi: ath12k: introduce ath12k_hw_warn()
>       wifi: ath12k: convert struct ath12k::wmi_mgmt_tx_work to struct wiphy_work
>       wifi: ath12k: ath12k_mac_op_set_key(): fix uninitialized symbol 'ret'
>       wifi: ath12k: ath12k_mac_op_sta_rc_update(): use mac80211 provided link id
> 
> Karol Przybylski (1):
>       wifi: ath12k: Fix for out-of bound access error
> 
> Karthikeyan Periyasamy (10):
>       wifi: ath12k: Refactor core startup
>       wifi: ath12k: add ath12k_ab_to_ah() and ath12k_ab_set_ah()
>       wifi: ath12k: add ath12k_get_num_hw()
>       wifi: ath12k: introduce QMI firmware ready flag
>       wifi: ath12k: move ATH12K_FLAG_REGISTERED handling to ath12k_mac_register()
>       wifi: ath12k: introduce device group abstraction
>       wifi: ath12k: refactor core start based on hardware group
>       wifi: ath12k: move struct ath12k_hw from per device to group
>       wifi: ath12k: send QMI host capability after device group is ready
>       wifi: ath12k: introduce mlo_capable flag for device group
> 
> Miaoqing Pan (1):
>       wifi: ath11k: add support for QCA6698AQ
> 
> P Praneesh (1):
>       wifi: ath12k: Fix endianness issue in struct hal_tlv_64_hdr
> 
> Rameshkumar Sundaram (4):
>       wifi: ath12k: add reo queue lookup table for ML peers
>       wifi: ath12k: modify chanctx iterators for MLO
>       wifi: ath12k: ath12k_mac_station_add(): fix potential rx_stats leak
>       wifi: ath12k: defer vdev creation for MLO
> 
> Roopni Devanathan (1):
>       wifi: ath12k: Fix inappropriate use of print_array_to_buf_index()
> 
> Sidhanta Sahu (1):
>       wifi: ath12k: Support MBSSID Control Frame Stats
> 
> Sriram R (16):
>       wifi: ath12k: MLO vdev bringup changes
>       wifi: ath12k: Refactor sta state machine
>       wifi: ath12k: Add helpers for multi link peer creation and deletion
>       wifi: ath12k: add multi-link flag in peer create command
>       wifi: ath12k: add helper to find multi-link station
>       wifi: ath12k: Add MLO peer assoc command support
>       wifi: ath12k: Add MLO station state change handling
>       wifi: ath12k: support change_sta_links() mac80211 op
>       wifi: ath12k: add primary link for data path operations
>       wifi: ath12k: use arsta instead of sta
>       wifi: ath12k: Use mac80211 vif's link_conf instead of bss_conf
>       wifi: ath12k: Use mac80211 sta's link_sta instead of deflink
>       wifi: ath12k: ath12k_mac_op_tx(): MLO support
>       wifi: ath12k: ath12k_mac_op_flush(): MLO support
>       wifi: ath12k: ath12k_mac_op_ampdu_action(): MLO support
>       wifi: ath12k: do not return invalid link id for scan link
> 
> Toke Høiland-Jørgensen (1):
>       wifi: ath9k: Add RX inactivity detection and reset chip when it occurs
> 
>  drivers/net/wireless/ath/ath11k/core.c             |  132 ++
>  drivers/net/wireless/ath/ath11k/core.h             |    4 +-
>  drivers/net/wireless/ath/ath11k/dp.h               |    1 -
>  drivers/net/wireless/ath/ath11k/dp_rx.c            |   14 +-
>  drivers/net/wireless/ath/ath11k/hal.h              |    6 +-
>  drivers/net/wireless/ath/ath11k/hal_rx.c           |    3 +-
>  drivers/net/wireless/ath/ath11k/hw.h               |    1 +
>  drivers/net/wireless/ath/ath11k/mac.c              |    6 +-
>  drivers/net/wireless/ath/ath11k/mhi.c              |    1 +
>  drivers/net/wireless/ath/ath11k/pci.c              |    3 +
>  drivers/net/wireless/ath/ath11k/pcic.c             |   13 +-
>  drivers/net/wireless/ath/ath11k/qmi.c              |    8 +-
>  drivers/net/wireless/ath/ath11k/wow.c              |    6 +-
>  drivers/net/wireless/ath/ath12k/core.c             |  482 ++++-
>  drivers/net/wireless/ath/ath12k/core.h             |  134 +-
>  drivers/net/wireless/ath/ath12k/debug.c            |    6 +-
>  drivers/net/wireless/ath/ath12k/debug.h            |    5 +-
>  .../net/wireless/ath/ath12k/debugfs_htt_stats.c    |  681 ++++++-
>  .../net/wireless/ath/ath12k/debugfs_htt_stats.h    |  218 ++-
>  drivers/net/wireless/ath/ath12k/dp.c               |   70 +-
>  drivers/net/wireless/ath/ath12k/dp.h               |    3 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.c            |   96 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.h            |    6 +-
>  drivers/net/wireless/ath/ath12k/hal_desc.h         |    2 +-
>  drivers/net/wireless/ath/ath12k/hal_rx.c           |   12 +-
>  drivers/net/wireless/ath/ath12k/mac.c              | 2003 +++++++++++++++-----
>  drivers/net/wireless/ath/ath12k/mac.h              |   16 +-
>  drivers/net/wireless/ath/ath12k/pci.c              |   10 +
>  drivers/net/wireless/ath/ath12k/peer.c             |  223 ++-
>  drivers/net/wireless/ath/ath12k/peer.h             |   23 +-
>  drivers/net/wireless/ath/ath12k/qmi.c              |  167 +-
>  drivers/net/wireless/ath/ath12k/qmi.h              |   20 +
>  drivers/net/wireless/ath/ath12k/wmi.c              |  207 +-
>  drivers/net/wireless/ath/ath12k/wmi.h              |  115 ++
>  drivers/net/wireless/ath/ath9k/antenna.c           |    2 +-
>  drivers/net/wireless/ath/ath9k/ar9002_hw.c         |    2 +-
>  drivers/net/wireless/ath/ath9k/ar9003_hw.c         |    2 +-
>  drivers/net/wireless/ath/ath9k/ar9003_mci.c        |    4 +-
>  drivers/net/wireless/ath/ath9k/ar9003_phy.h        |    2 +-
>  drivers/net/wireless/ath/ath9k/ath9k.h             |    2 +
>  drivers/net/wireless/ath/ath9k/channel.c           |    2 +-
>  drivers/net/wireless/ath/ath9k/common-spectral.c   |    2 +-
>  drivers/net/wireless/ath/ath9k/debug.c             |    1 +
>  drivers/net/wireless/ath/ath9k/debug.h             |    1 +
>  drivers/net/wireless/ath/ath9k/dfs.c               |    2 +-
>  drivers/net/wireless/ath/ath9k/hif_usb.c           |    2 +-
>  drivers/net/wireless/ath/ath9k/hw.c                |    4 +-
>  drivers/net/wireless/ath/ath9k/hw.h                |    2 +-
>  drivers/net/wireless/ath/ath9k/link.c              |   33 +-
>  drivers/net/wireless/ath/ath9k/mac.h               |    2 +-
>  drivers/net/wireless/ath/ath9k/main.c              |    3 +-
>  drivers/net/wireless/ath/ath9k/wow.c               |    6 +-
>  drivers/net/wireless/ath/ath9k/xmit.c              |    2 +-
>  drivers/net/wireless/ath/wcn36xx/main.c            |    5 +-
>  54 files changed, 4042 insertions(+), 736 deletions(-)

Pulled, thanks.

b20821248e26 Merge tag 'ath-next-20241209' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1bcdaf98-6078-4f79-a989-2e5db9400585@oss.qualcomm.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


