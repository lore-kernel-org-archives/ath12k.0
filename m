Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3811FC46CD2
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y0Ztx+TEl4oYQ8hrUYWG5QXCw5icAgY8J3zjGFbgd/I=; b=45oerYM+TEqT6k5pKkzd4AI83q
	qwi4MALEcSHIom01e3UN50XUXwrXelWuS9xa9NNpK4oT9qRDThshbApt0yoX+OkxjYRRFhMSBI1xg
	N0sL5su36/OLHUQ2UJ5dW4jbEKpp7PJNcVDDKRGoX+Sxi2QH2dJ9XH3j5VGcxNGGMHr+Da9S3kExD
	/P8qHxsYTQNT5nlqssl73S3axS6m/AhnxuQUJS8ovdnUCNOBu7aJ8O9lcIHO1nrSjolJmnloQS3zH
	nhmuKlhhV7WDN3THNO5L1S8IVleA+XhAgPhFHMnfrbBOHavVzxS2T1UUpbaM2ogPd7vUPnm/GG941
	Y8K895gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUo35-0000000GpgO-3qvn
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 13:21:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUo31-0000000GpfR-3iiW;
	Tue, 30 Jan 2024 13:21:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 17E75CE18E3;
	Tue, 30 Jan 2024 13:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15ED0C433F1;
	Tue, 30 Jan 2024 13:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706620864;
	bh=E6opCYNDJ0WPrN3PjCl83P29TptoonpsG80tHmzXzc8=;
	h=From:To:Cc:Subject:Date:From;
	b=UYfv+YHczPjxd0MZeKo7/GG4vh3wDbofag3qtTUsOrM1s/V6M6PgyHsUfcMv4YpIM
	 iZntHJDOXOeEZl6OY0ahmZ8PXpJXdBydoXIdGXelBFR2LpOE50i8llaf6TxzapEA8a
	 s67VoSM0ofqIQqsQ+38RE/PKYdk73moz9ZCMu/mbQRSU3abcxPicw42XARzwg01n9g
	 S2cEHTMrFhdrXrtTcyuVrPG+tirVAmp/xiQemM/FzJPgQBPmw2SUc3kjCoAY7gTs4l
	 +juenl/jxaimQA8Y3l5F9wN8F6+u1Cq1rPA8G7hG3rtuDI8iUcojT/nSEfI75xj+xr
	 n0Dxt7ZNaOHFA==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, quic_jjohnson@quicinc.com
Subject: pull-request: ath-next-20240130
Date: Tue, 30 Jan 2024 15:21:00 +0200
Message-ID: <87bk93vtxf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_052108_303980_DCEB59E0 
X-CRM114-Status: GOOD (  12.66  )
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

Our ath-next pull request for wireless-next.

Kalle

The following changes since commit c5a3f56fcdb0a48a20772e4c9b8adc6c7256a461:

  Merge tag 'ath-next-20231215' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/kvalo/ath (2023-12-17 13:20:18 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git tags/ath-next=
-20240130

for you to fetch changes up to 9d5f28c1366f48efae7b1df0f622285519e74dce:

  wifi: ath11k: fix connection failure due to unexpected peer delete (2024-=
01-25 18:44:02 +0200)

----------------------------------------------------------------
ath.git patches for v6.9

We have new features for both ath11k and ath12k. ath12k is now under
heavy refactoring in preparation for MLO support.

Major changes:

ath12k

* refactoring in preparation for Multi-Link Operation (MLO) support

* 1024 Block Ack window size support

* provide firmware wmi logs via a trace event

ath11k

* 36 bit DMA mask support

* support 6 GHz station power modes: Low Power Indoor (LPI), Standard
  Power) SP and Very Low Power (VLP)

----------------------------------------------------------------
Baochen Qiang (11):
      wifi: ath12k: support default regdb while searching board-2.bin for W=
CN7850
      wifi: ath11k: fix a possible dead lock caused by ab->base_lock
      wifi: ath12k: fix wrong definitions of hal_reo_update_rx_queue
      wifi: ath12k: add support for BA1024
      wifi: ath12k: change MAC buffer ring size to 2048
      wifi: ath12k: add support for collecting firmware log
      wifi: ath11k: enable 36 bit mask for stream DMA
      wifi: ath11k: remove invalid peer create logic
      wifi: ath11k: rename ath11k_start_vdev_delay()
      wifi: ath11k: avoid forward declaration of ath11k_mac_start_vdev_dela=
y()
      wifi: ath11k: fix connection failure due to unexpected peer delete

Dmitry Antipov (3):
      wifi: ath11k: refactor ath11k_wmi_tlv_parse_alloc()
      wifi: ath9k: fix LNA selection in ath_ant_try_scan()
      wifi: ath12k: refactor ath12k_wmi_tlv_parse_alloc()

Jeff Johnson (16):
      wifi: ath10k: use flexible array in struct wmi_host_mem_chunks
      wifi: ath10k: use flexible arrays for WMI start scan TLVs
      wifi: ath10k: remove struct wmi_pdev_chanlist_update_event
      wifi: ath10k: remove unused template structs
      wifi: ath10k: use flexible array in struct wmi_tdls_peer_capabilities
      wifi: ath10k: remove duplicate memset() in 10.4 TDLS peer update
      wifi: ath12k: Make QMI message rules const
      wifi: ath12k: Remove unnecessary struct qmi_txn initializers
      wifi: ath12k: Add missing qmi_txn_cancel() calls
      wifi: ath12k: Use initializers for QMI message buffers
      wifi: ath11k: document HAL_RX_BUF_RBM_SW4_BM
      wifi: ath10k: add missing wmi_10_4_feature_mask documentation
      wifi: ath10k: correctly document enum wmi_tlv_tx_pause_id
      wifi: ath10k: fix htt_q_state_conf & htt_q_state kernel-doc
      wifi: ath10k: Fix htt_data_tx_completion kernel-doc warning
      wifi: ath10k: Fix enum ath10k_fw_crash_dump_type kernel-doc

Karthikeyan Periyasamy (21):
      wifi: ath12k: relocate ath12k_dp_pdev_pre_alloc() call
      wifi: ath12k: refactor ath12k_mac_allocate() and ath12k_mac_destroy()
      wifi: ath12k: refactor ath12k_mac_setup_channels_rates()
      wifi: ath12k: refactor ath12k_mac_register() and ath12k_mac_unregiste=
r()
      wifi: ath12k: refactor ath12k_mac_op_config()
      wifi: ath12k: refactor ath12k_bss_assoc()
      wifi: ath12k: refactor ath12k_mac_op_conf_tx()
      wifi: ath12k: refactor ath12k_mac_op_start()
      wifi: ath12k: refactor ath12k_mac_op_stop()
      wifi: ath12k: refactor ath12k_mac_op_update_vif_offload()
      wifi: ath12k: refactor ath12k_mac_op_configure_filter()
      wifi: ath12k: refactor ath12k_mac_op_ampdu_action()
      wifi: ath12k: refactor ath12k_mac_op_flush()
      wifi: ath12k: ath12k_start_vdev_delay(): convert to use ar
      wifi: ath12k: refactor QMI MLO host capability helper function
      wifi: ath12k: add QMI PHY capability learn support
      wifi: ath12k: replace ENOTSUPP with EOPNOTSUPP
      wifi: ath11k: replace ENOTSUPP with EOPNOTSUPP
      wifi: ath10k: replace ENOTSUPP with EOPNOTSUPP
      wifi: ath12k: Refactor the mac80211 hw access from link/radio
      wifi: ath12k: Introduce the container for mac80211 hw

Sriram R (1):
      wifi: ath12k: Fix issues in channel list update

Uwe Kleine-K=C3=B6nig (1):
      wifi: ath9k: Convert to platform remove callback returning void

Wen Gong (15):
      wifi: ath12k: add string type to search board data in board-2.bin for=
 WCN7850
      wifi: ath12k: add fallback board name without variant while searching=
 board-2.bin
      wifi: ath12k: remove unused ATH12K_BD_IE_BOARD_EXT
      wifi: ath12k: add support to search regdb data in board-2.bin for WCN=
7850
      wifi: ath11k: add support to select 6 GHz regulatory type
      wifi: ath11k: store cur_regulatory_info for each radio
      wifi: ath11k: update regulatory rules when interface added
      wifi: ath11k: update regulatory rules when connect to AP on 6 GHz ban=
d for station
      wifi: ath11k: save power spectral density(PSD) of regulatory rule
      wifi: ath11k: add parse of transmit power envelope element
      wifi: ath11k: save max transmit power in vdev start response event fr=
om firmware
      wifi: ath11k: fill parameters for vdev set tpc power WMI command
      wifi: ath11k: add WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT service bit
      wifi: ath11k: add handler for WMI_VDEV_SET_TPC_POWER_CMDID
      wifi: ath11k: use WMI_VDEV_SET_TPC_POWER_CMDID when EXT_TPC_REG_SUPPO=
RT for 6 GHz

Wenli Looi (1):
      wifi: ath9k: delete some unused/duplicate macros

Xingyuan Mo (1):
      wifi: ath10k: fix NULL pointer dereference in ath10k_wmi_tlv_op_pull_=
mgmt_tx_compl_ev()

Zhenghao Gu (1):
      wifi: ath11k: fix IOMMU errors on buffer rings

 drivers/net/wireless/ath/ath10k/core.c      |    4 +-
 drivers/net/wireless/ath/ath10k/coredump.h  |    8 +-
 drivers/net/wireless/ath/ath10k/htt.c       |    3 +-
 drivers/net/wireless/ath/ath10k/htt.h       |   12 +-
 drivers/net/wireless/ath/ath10k/mac.c       |    6 +-
 drivers/net/wireless/ath/ath10k/pci.c       |   10 +-
 drivers/net/wireless/ath/ath10k/wmi-tlv.c   |   11 +-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h   |    4 +-
 drivers/net/wireless/ath/ath10k/wmi.c       |   22 +-
 drivers/net/wireless/ath/ath10k/wmi.h       |   62 +-
 drivers/net/wireless/ath/ath11k/core.h      |   41 +
 drivers/net/wireless/ath/ath11k/dp.c        |   20 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c     |    6 +-
 drivers/net/wireless/ath/ath11k/hal.c       |   19 +-
 drivers/net/wireless/ath/ath11k/hal.h       |    3 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c    |    4 +-
 drivers/net/wireless/ath/ath11k/mac.c       | 1086 ++++++++++++++++++++---=
----
 drivers/net/wireless/ath/ath11k/mac.h       |    5 +-
 drivers/net/wireless/ath/ath11k/mhi.c       |    4 +-
 drivers/net/wireless/ath/ath11k/pci.c       |   19 +-
 drivers/net/wireless/ath/ath11k/pci.h       |    3 +-
 drivers/net/wireless/ath/ath11k/reg.c       |  267 ++++++-
 drivers/net/wireless/ath/ath11k/reg.h       |   11 +-
 drivers/net/wireless/ath/ath11k/testmode.c  |    2 +-
 drivers/net/wireless/ath/ath11k/wmi.c       |  293 ++++----
 drivers/net/wireless/ath/ath11k/wmi.h       |   65 +-
 drivers/net/wireless/ath/ath12k/core.c      |  217 ++++--
 drivers/net/wireless/ath/ath12k/core.h      |   57 +-
 drivers/net/wireless/ath/ath12k/dp.h        |    3 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c    |    4 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c     |    8 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c     |   10 +-
 drivers/net/wireless/ath/ath12k/hal_desc.h  |   20 +-
 drivers/net/wireless/ath/ath12k/hal_rx.c    |   15 +-
 drivers/net/wireless/ath/ath12k/hw.c        |    9 +
 drivers/net/wireless/ath/ath12k/hw.h        |   23 +-
 drivers/net/wireless/ath/ath12k/mac.c       |  860 ++++++++++++++-------
 drivers/net/wireless/ath/ath12k/mac.h       |    4 +-
 drivers/net/wireless/ath/ath12k/pci.c       |   10 +
 drivers/net/wireless/ath/ath12k/qmi.c       |  377 ++++++++--
 drivers/net/wireless/ath/ath12k/qmi.h       |   34 +-
 drivers/net/wireless/ath/ath12k/reg.c       |   13 +-
 drivers/net/wireless/ath/ath12k/trace.h     |   29 +-
 drivers/net/wireless/ath/ath12k/wmi.c       |   95 +--
 drivers/net/wireless/ath/ath9k/ahb.c        |    6 +-
 drivers/net/wireless/ath/ath9k/antenna.c    |    2 +-
 drivers/net/wireless/ath/ath9k/ar9003_phy.h |    9 -
 drivers/net/wireless/ath/ath9k/reg_aic.h    |    4 -
 48 files changed, 2739 insertions(+), 1060 deletions(-)

