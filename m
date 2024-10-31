Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D34D767D9
	for <ath12k@archiver.kernel.org>; Thu, 31 Oct 2024 14:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//++SECxqsxtpHksGcWbvYXexL6zVkDBySo33sGZKzE=; b=J7NPNVKggXuc7mjldzjx+eozc5
	NqO6Z/JaC+2ZV2lYeW9JStUmFGrhOOPTcekelfQ0VM5KIv+z7/U4WpqrpgKN1Z0N40tEC8BLir6Yg
	lL8wnUtWFoAvfT+pykKDG7a/IP/l7dW/6wwrd1jtCRZTvEpiH56niUdE4OGmELa1zeYEiukDZdYQw
	AosNUpmz57BC5mLZIhmaz/HTuyd4LAEKaDuFiULPXMqqIwHyBKu05pvyqGSdU6gC+3UoYiwfDqvk1
	3m2V3aujRms5lYR6qIygQk7aG976lRBCT/RZm/AAJiVxpNKC+5wX5rtX5EHhw/l9lW24iS+OHavFq
	so4LRwfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WDL-00000003ojF-1m46
	for ath12k@archiver.kernel.org;
	Thu, 31 Oct 2024 14:31:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6W4K-00000003nMu-06A0;
	Thu, 31 Oct 2024 14:22:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 887EAA440E8;
	Thu, 31 Oct 2024 14:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E62C4FE06;
	Thu, 31 Oct 2024 14:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730383470;
	bh=qSK9zLPkEa3v95QbOoDFrOjBNIDs7wxUlKiKLDrnIjk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=epE0Ybp6Ihhe90EdoHN57vcY0J+i1crf/uHT/1Z4RtiPS6VjuL9qCZ2lRjCyMBB19
	 oBXw2CMjpaA2IAc4plPbbJIFQtM7MuVh2NbsadZtxDqM3ZD6PlbUvo0I9fh8xSWEeY
	 +3UUcHQfwO7S0+DWqKB1p+U8SLZjiF9iI9mOr2DwR/hI7YyV0d7wMVHfIdoXIeWyR9
	 CF7mS0DF302TUuBJd0N0GUnsr+ZLizyWDheND/ED+ln6/AGJlIzx1g6S77MrGQa9BS
	 yPeQztz9pbjyEtX7Ykcc16fzFaL1uw54C1ATY4Vb4e3E6qZQTYEEqlIMA7ZZSqMAxF
	 qeywjpVRbNNng==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: pull-request: ath-next-20241030
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <dabcbe71-c23d-4207-83bc-f077a7a8dece@quicinc.com>
References: <dabcbe71-c23d-4207-83bc-f077a7a8dece@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 <ath10k@lists.infradead.org>, <ath11k@lists.infradead.org>,
 <ath12k@lists.infradead.org>, <quic_jjohnson@quicinc.com>,
 <quic_kvalo@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <173038346698.539202.6047176272378730385.kvalo@kernel.org>
Date: Thu, 31 Oct 2024 14:04:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_072236_277192_A006B738 
X-CRM114-Status: GOOD (  21.20  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> The following changes since commit 34c44eb31de9cb7202ff070900463d6c706392c4:
> 
>   Merge branch 'net-ibm-emac-modernize-a-bit' (2024-09-13 21:49:00 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20241030
> 
> for you to fetch changes up to cdad737160571a98cc4933a62c9f2728e965ab27:
> 
>   wifi: ath12k: convert tasklet to BH workqueue for CE interrupts (2024-10-25 12:22:03 -0700)
> 
> ----------------------------------------------------------------
> ath.git patches for v6.13
> 
> This development cycle featured phase 1 of patches to ath12k to
> support the new 802.11be MLO feature, along with other ath12k feature
> patches.  In older drivers, support for some additional devices were
> added. And there was the usual set of bug fixes and cleanups across
> most drivers.
> 
> Per-driver highlights:
> 
> ath12k
> * Switch to using wiphy_lock() and remove ar->conf_mutex
> * Convert struct ath12k_sta::update_wk to use struct wiphy_work
> * Add phase 1 of 802.11be MLO support
> * Add firmware coredump collection support
> * Add debugfs support for a multitude of statistics
> * Fix host representation of multiple hal_rx structs
> * Fix use-after-free in ath12k_dp_cc_cleanup()
> * Skip Rx TID cleanup for self peer
> * Fix warning and crash when unloading in a VM
> * Convert CE interrupt handling from tasklet to BH workqueue
> * Fix A-MSDU indication in monitor mode
> 
> ath11k
> * Fix double free issue during SRNG deinit
> * Enable firmware diagnostic events for WCN6750
> * Fix CE offset address calculation for WCN6750 during SSR
> * Fix stack frame size warning in ath11k_vif_wow_set_wakeups()
> * Document the inputs for ath11k on WCN6855
> 
> ath10k
> * Fix multiple stack frame size warnings
> * Fix invalid VHT parameters in supported_vht_mcs_rate_nss* structs
> * Avoid NULL pointer error during SDIO remove
> 
> ath5k
> * Add support for Arcadyan ARV45XX AR2417 & Gigaset SX76[23] AR241[34]A
> 
> ----------------------------------------------------------------
> Andrew Kreimer (2):
>       wifi: wcn36xx: fix a typo in struct wcn36xx_sta documentation
>       wifi: ath6kl: fix typos in struct wmi_rssi_threshold_params_cmd and wmi_snr_threshold_params_cmd comments
> 
> Arnd Bergmann (1):
>       wifi: ath12k: fix one more memcpy size error
> 
> Balaji Pothunoori (2):
>       wifi: ath11k: enable fw_wmi_diag_event hw param for WCN6750
>       wifi: ath11k: Fix CE offset address calculation for WCN6750 in SSR
> 
> Baochen Qiang (2):
>       wifi: ath10k: fix invalid VHT parameters in supported_vht_mcs_rate_nss1
>       wifi: ath10k: fix invalid VHT parameters in supported_vht_mcs_rate_nss2
> 
> Bartosz Golaszewski (1):
>       dt-bindings: net: ath11k: document the inputs of the ath11k on WCN6855
> 
> Caleb Connolly (1):
>       wifi: ath11k: allow missing memory-regions
> 
> Colin Ian King (1):
>       wifi: ath12k: make read-only array svc_id static const
> 
> Dinesh Karthikeyan (5):
>       wifi: ath12k: Support Self-Generated Transmit stats
>       wifi: ath12k: Support Ring and SFM stats
>       wifi: ath12k: Support pdev Transmit Multi-user stats
>       wifi: ath12k: Support pdev CCA Stats
>       wifi: ath12k: Support Pdev OBSS Stats
> 
> Jeongjun Park (1):
>       wifi: ath9k: add range check for conn_rsp_epid in htc_connect_service()
> 
> Jose Ignacio Tornos Martinez (2):
>       wifi: ath12k: fix crash when unbinding
>       wifi: ath12k: fix warning when unbinding
> 
> Kalle Valo (7):
>       wifi: ath12k: fix atomic calls in ath12k_mac_op_set_bitrate_mask()
>       wifi: ath12k: convert struct ath12k_sta::update_wk to use struct wiphy_work
>       wifi: ath12k: switch to using wiphy_lock() and remove ar->conf_mutex
>       wifi: ath12k: cleanup unneeded labels
>       wifi: ath12k: ath12k_mac_set_key(): remove exit label
>       wifi: ath12k: ath12k_mac_op_sta_state(): clean up update_wk cancellation
>       wifi: ath12k: add missing lockdep_assert_wiphy() for ath12k_mac_op_ functions
> 
> Kang Yang (9):
>       wifi: ath10k: avoid NULL pointer error during sdio remove
>       wifi: ath12k: remove unused variable monitor_present
>       wifi: ath12k: fix struct hal_rx_ppdu_end_user_stats
>       wifi: ath12k: fix struct hal_rx_ppdu_start
>       wifi: ath12k: fix struct hal_rx_phyrx_rssi_legacy_info
>       wifi: ath12k: fix struct hal_rx_mpdu_start
>       wifi: ath12k: delete NSS and TX power setting for monitor vdev
>       wifi: ath12k: use tail MSDU to get MSDU information
>       wifi: ath12k: fix A-MSDU indication in monitor mode
> 
> Li Zetao (1):
>       wifi: ath9k: use clamp() in ar9003_aic_cal_post_process()
> 
> Lingbo Kong (1):
>       wifi: ath12k: remove msdu_end structure for WCN7850
> 
> Manikanta Pubbisetty (1):
>       wifi: ath11k: Fix double free issue during SRNG deinit
> 
> Miaoqing Pan (3):
>       wifi: ath10k: fix the stack frame size warning in ath10k_remain_on_channel
>       wifi: ath10k: fix the stack frame size warning in ath10k_hw_scan
>       wifi: ath11k: fix the stack frame size warning in ath11k_vif_wow_set_wakeups
> 
> Nicolas Escande (1):
>       wifi: ath12k: move txbaddr/rxbaddr into struct ath12k_dp
> 
> Pradeep Kumar Chitrapu (1):
>       wifi: ath12k: Support BE OFDMA Pdev Rate Stats
> 
> Raj Kumar Bhagat (1):
>       wifi: ath12k: convert tasklet to BH workqueue for CE interrupts
> 
> Rajat Soni (1):
>       wifi: ath12k: Support DMAC Reset Stats
> 
> Rameshkumar Sundaram (5):
>       wifi: ath12k: fix use-after-free in ath12k_dp_cc_cleanup()
>       wifi: ath12k: prepare vif config caching for MLO
>       wifi: ath12k: modify ath12k_mac_vif_chan() for MLO
>       wifi: ath12k: modify ath12k_get_arvif_iter() for MLO
>       wifi: ath12k: modify ath12k_mac_op_set_key() for MLO
> 
> Ramya Gnanasekar (1):
>       wifi: ath12k: Skip Rx TID cleanup for self peer
> 
> Roopni Devanathan (1):
>       wifi: ath12k: Modify print_array_to_buf() to support arrays with 1-based semantics
> 
> Rosen Penev (5):
>       wifi: ath9k: eeprom: remove platform data
>       wifi: ath9k: btcoex: remove platform_data
>       wifi: ath9k: remove ath9k_platform_data
>       wifi: ath5k: add PCI ID for SX76X
>       wifi: ath5k: add PCI ID for Arcadyan devices
> 
> Sidhanta Sahu (1):
>       wifi: ath12k: Support Pdev Scheduled Algorithm Stats
> 
> Sowmiya Sree Elavalagan (1):
>       wifi: ath12k: Add firmware coredump collection support
> 
> Sriram R (7):
>       wifi: ath12k: prepare vif data structure for MLO handling
>       wifi: ath12k: pass ath12k_link_vif instead of vif/ahvif
>       wifi: ath12k: prepare sta data structure for MLO handling
>       wifi: ath12k: modify ath12k_mac_op_bss_info_changed() for MLO
>       wifi: ath12k: update ath12k_mac_op_conf_tx() for MLO
>       wifi: ath12k: update ath12k_mac_op_update_vif_offload() for MLO
>       wifi: ath12k: modify link arvif creation and removal for MLO
> 
>  .../bindings/net/wireless/qcom,ath11k-pci.yaml     |   29 +
>  drivers/net/wireless/ath/ath10k/mac.c              |  100 +-
>  drivers/net/wireless/ath/ath10k/sdio.c             |    6 +-
>  drivers/net/wireless/ath/ath11k/ahb.c              |   12 +-
>  drivers/net/wireless/ath/ath11k/core.c             |    2 +-
>  drivers/net/wireless/ath/ath11k/hal.c              |    1 +
>  drivers/net/wireless/ath/ath11k/qmi.c              |    3 +
>  drivers/net/wireless/ath/ath11k/wow.c              |   39 +-
>  drivers/net/wireless/ath/ath12k/Kconfig            |   10 +
>  drivers/net/wireless/ath/ath12k/Makefile           |    1 +
>  drivers/net/wireless/ath/ath12k/ce.h               |    2 +-
>  drivers/net/wireless/ath/ath12k/core.c             |    9 +-
>  drivers/net/wireless/ath/ath12k/core.h             |  110 +-
>  drivers/net/wireless/ath/ath12k/coredump.c         |   51 +
>  drivers/net/wireless/ath/ath12k/coredump.h         |   80 +
>  drivers/net/wireless/ath/ath12k/debugfs.c          |    4 +-
>  .../net/wireless/ath/ath12k/debugfs_htt_stats.c    | 1358 +++++++++++++-
>  .../net/wireless/ath/ath12k/debugfs_htt_stats.h    |  444 ++++-
>  drivers/net/wireless/ath/ath12k/dp.c               |   58 +-
>  drivers/net/wireless/ath/ath12k/dp.h               |    7 +-
>  drivers/net/wireless/ath/ath12k/dp_mon.c           |  122 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.c            |   16 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.h            |    2 +-
>  drivers/net/wireless/ath/ath12k/dp_tx.c            |    9 +-
>  drivers/net/wireless/ath/ath12k/dp_tx.h            |    2 +-
>  drivers/net/wireless/ath/ath12k/hal.c              |   12 +-
>  drivers/net/wireless/ath/ath12k/hal_rx.h           |   53 +-
>  drivers/net/wireless/ath/ath12k/hif.h              |    6 +
>  drivers/net/wireless/ath/ath12k/hw.c               |    4 +-
>  drivers/net/wireless/ath/ath12k/mac.c              | 1845 ++++++++++++--------
>  drivers/net/wireless/ath/ath12k/mac.h              |   11 +-
>  drivers/net/wireless/ath/ath12k/mhi.c              |    5 +
>  drivers/net/wireless/ath/ath12k/mhi.h              |    2 +-
>  drivers/net/wireless/ath/ath12k/p2p.c              |   17 +-
>  drivers/net/wireless/ath/ath12k/p2p.h              |    2 +-
>  drivers/net/wireless/ath/ath12k/pci.c              |  200 ++-
>  drivers/net/wireless/ath/ath12k/peer.c             |   13 +-
>  drivers/net/wireless/ath/ath12k/peer.h             |    4 +-
>  drivers/net/wireless/ath/ath12k/rx_desc.h          |   88 +-
>  drivers/net/wireless/ath/ath12k/wmi.c              |   30 +-
>  drivers/net/wireless/ath/ath12k/wmi.h              |    8 +-
>  drivers/net/wireless/ath/ath12k/wow.c              |   87 +-
>  drivers/net/wireless/ath/ath5k/pci.c               |    2 +
>  drivers/net/wireless/ath/ath6kl/wmi.h              |    8 +-
>  drivers/net/wireless/ath/ath9k/ar9003_aic.c        |   10 +-
>  .../net/wireless/ath/ath9k/ath9k_pci_owl_loader.c  |    1 -
>  drivers/net/wireless/ath/ath9k/btcoex.c            |   16 +-
>  drivers/net/wireless/ath/ath9k/eeprom.c            |   12 -
>  drivers/net/wireless/ath/ath9k/htc_hst.c           |    3 +
>  drivers/net/wireless/ath/ath9k/hw.c                |    2 +-
>  drivers/net/wireless/ath/ath9k/init.c              |   52 +-
>  drivers/net/wireless/ath/wcn36xx/wcn36xx.h         |    2 +-
>  include/linux/ath9k_platform.h                     |   51 -
>  53 files changed, 3782 insertions(+), 1241 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/coredump.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/coredump.h
>  delete mode 100644 include/linux/ath9k_platform.h

Pulled, thanks.

3c1f19ab3d59 Merge tag 'ath-next-20241030' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/dabcbe71-c23d-4207-83bc-f077a7a8dece@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


