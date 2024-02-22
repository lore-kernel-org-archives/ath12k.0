Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAA9C48BEB
	for <ath12k@archiver.kernel.org>; Thu, 22 Feb 2024 08:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MnOGdMh0iyMca94aHByyq2RLP1AvWyGMT/MDG+67vwc=; b=mQGiY9KX9LWwNwVByL2gBRFrRD
	6b7e5oxFWDgbxbeJx03935OZc0jYixXI/jtyfD26AcPh+byQ2liDsec7Lta86wDFtM4chbXrEujIy
	IGQ8/7CJraE5flmBVM2OXACu/wiRp9s35Lal4YSdgZPMOZcMV9mDhByxjdygZ6qT/F7GztJyStPgD
	0jwneTM1bU3RF3Sdytfn1zA3MP9AS+Ef8IUdnol9lpIXG0yTbfriJT85WRUTRLL9nW/fUbK0Uqq+T
	lhNpaFPAJcSuITL5SixSoj21SwFxqGZshMTEcn00bGsS7mvE+UMa5TixK5f6dr7/HSX49PEDN4ihf
	uTS4xKyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4U0-000000042aK-1RZw
	for ath12k@archiver.kernel.org;
	Thu, 22 Feb 2024 08:31:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4Tw-000000042Xh-3sf8;
	Thu, 22 Feb 2024 08:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BE54616D6;
	Thu, 22 Feb 2024 08:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646F3C433F1;
	Thu, 22 Feb 2024 08:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708590663;
	bh=k0DEzDQSLa5M/GLDTtBEZ67yVwcDnrxRQUYOAgzB1Ug=;
	h=From:To:Cc:Subject:Date:From;
	b=FXs0MxblGlWpyZkACaFxHffYijg8Ly2azPuFldNHW4UMoAF59GNmxQGUPsMtrFtug
	 XFRPmmLobQklBcC54D6h2RqQCXNLc2NrpiTH9q4o1svWp/2LP7vkvt7Nv962Lu0U4K
	 AqgvUsgAiUGPfyspjFpDA6os1OYQyQznJ5yU2ZNS/JX+2lPotFJ31+4MGXSedHNM8x
	 e1m5zj/MFXRLvDZvS17/X2Gspcz0iBgayp2gZFLtlGkYBj8ow8xqAWDYFmNMTIu0ZE
	 7Gyt6NyIqWr95qIc8dmJR4vilFi2f46KSFsNNfsmYmJmGLVru2O7arJVuT4WQK3shJ
	 CwtcKR/Nlnrhw==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, quic_jjohnson@quicinc.com
Subject: pull-request: ath-next-20240222
Date: Thu, 22 Feb 2024 10:31:00 +0200
Message-ID: <87plwolx2z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_003105_069665_92D97851 
X-CRM114-Status: GOOD (  13.65  )
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

Here's an ath-next pull request to wireless-next. More info below.

Kalle

The following changes since commit 2a71528427c635f0a8bff704b2e62ce81c641d6f:

  wifi: brcmfmac: fix copyright year mentioned in platform_data header (202=
4-01-31 18:48:06 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git tags/ath-next=
-20240222

for you to fetch changes up to 3ab6aff5793c3c7bdf6535d9b0024544a4abbdd5:

  wifi: ath11k: remove unused scan_events from struct scan_req_params (2024=
-02-15 13:24:18 +0200)

----------------------------------------------------------------
ath.git patches for v6.9

We have support for QCA2066 now and also several new features in ath12k.

Major changes:

ath12k

* firmware-2.bin support

* support having multiple identical PCI devices (firmware needs to
  have ATH12K_FW_FEATURE_MULTI_QRTR_ID)

* QCN9274: support split-PHY devices

* WCN7850: enable Power Save Mode in station mode

* WCN7850: P2P support

ath11k:

* QCA6390 & WCN6855: support 2 concurrent station interfaces

* QCA2066 support

----------------------------------------------------------------
Aaradhana Sahu (1):
      wifi: ath12k: fix firmware assert during insmod in memory segment mode

Baochen Qiang (5):
      wifi: ath12k: enable 802.11 power save mode in station mode
      wifi: ath11k: initialize rx_mcs_80 and rx_mcs_160 before use
      wifi: ath11k: initialize eirp_power before use
      wifi: ath11k: move pci.ops registration ahead
      wifi: ath11k: add support for QCA2066

Carl Huang (2):
      wifi: ath11k: support 2 station interfaces
      wifi: ath11k: provide address list if chip supports 2 stations

Colin Ian King (2):
      wifi: ath9k:  remove redundant assignment to variable ret
      wifi: carl9170: Remove redundant assignment to pointer super

Ganesh Babu Jothiram (1):
      wifi: ath12k: Read board id to support split-PHY QCN9274

Harshitha Prem (1):
      wifi: ath12k: add support for peer meta data version

Jeff Johnson (1):
      wifi: ath11k: Really consistently use ath11k_vif_to_arvif()

Kang Yang (11):
      wifi: ath12k: fix broken structure wmi_vdev_create_cmd
      wifi: ath12k: fix incorrect logic of calculating vdev_stats_id
      wifi: ath12k: change interface combination for P2P mode
      wifi: ath12k: add P2P IE in beacon template
      wifi: ath12k: implement handling of P2P NoA event
      wifi: ath12k: implement remain on channel for P2P mode
      wifi: ath12k: change WLAN_SCAN_PARAMS_MAX_IE_LEN from 256 to 512
      wifi: ath12k: allow specific mgmt frame tx while vdev is not up
      wifi: ath12k: move peer delete after vdev stop of station for WCN7850
      wifi: ath12k: designating channel frequency for ROC scan
      wifi: ath12k: advertise P2P dev support for WCN7850

Karthikeyan Kathirvel (1):
      wifi: ath12k: subscribe required word mask from rx tlv

Karthikeyan Periyasamy (2):
      wifi: ath12k: add MAC id support in WBM error path
      wifi: ath12k: refactor the rfkill worker

Lingbo Kong (2):
      wifi: ath12k: add processing for TWT enable event
      wifi: ath12k: add processing for TWT disable event

Nathan Chancellor (1):
      wifi: ath12k: Fix uninitialized use of ret in ath12k_mac_allocate()

Nicolas Escande (6):
      wifi: ath11k: Do not directly use scan_flags in struct scan_req_params
      wifi: ath11k: Remove scan_flags union from struct scan_req_params
      wifi: ath12k: Do not use scan_flags from struct ath12k_wmi_scan_req_a=
rg
      wifi: ath12k: Remove unused scan_flags from struct ath12k_wmi_scan_re=
q_arg
      wifi: ath12k: remove the unused scan_events from ath12k_wmi_scan_req_=
arg
      wifi: ath11k: remove unused scan_events from struct scan_req_params

P Praneesh (2):
      wifi: ath12k: Add logic to write QRTR node id to scratch
      wifi: ath12k: fix PCI read and write

Raj Kumar Bhagat (5):
      wifi: ath12k: add firmware-2.bin support
      wifi: ath12k: fix fetching MCBC flag for QCN9274
      wifi: ath12k: split hal_ops to support RX TLVs word mask compaction
      wifi: ath12k: remove hal_desc_sz from hw params
      wifi: ath12k: disable QMI PHY capability learn in split-phy QCN9274

Sowmiya Sree Elavalagan (1):
      wifi: ath12k: fetch correct pdev id from WMI_SERVICE_READY_EXT_EVENTID

Sriram R (1):
      wifi: ath12k: indicate NON MBSSID vdev by default during vdev start

Toke H=C3=B8iland-J=C3=B8rgensen (1):
      wifi: ath9k: delay all of ath9k_wmi_event_tasklet() until init is com=
plete

Wen Gong (1):
      wifi: ath11k: change to move WMI_VDEV_PARAM_SET_HEMU_MODE before WMI_=
PEER_ASSOC_CMDID

 drivers/net/wireless/ath/ath11k/core.c        | 100 +++++-
 drivers/net/wireless/ath/ath11k/core.h        |   1 +
 drivers/net/wireless/ath/ath11k/hw.c          |   2 +-
 drivers/net/wireless/ath/ath11k/hw.h          |   1 +
 drivers/net/wireless/ath/ath11k/mac.c         | 116 +++++--
 drivers/net/wireless/ath/ath11k/mhi.c         |   1 +
 drivers/net/wireless/ath/ath11k/pci.c         |  43 ++-
 drivers/net/wireless/ath/ath11k/pcic.c        |  11 +
 drivers/net/wireless/ath/ath11k/wmi.c         |   2 +-
 drivers/net/wireless/ath/ath11k/wmi.h         |  86 +++--
 drivers/net/wireless/ath/ath12k/Makefile      |   4 +-
 drivers/net/wireless/ath/ath12k/core.c        |  55 +++-
 drivers/net/wireless/ath/ath12k/core.h        |  27 ++
 drivers/net/wireless/ath/ath12k/dp.c          |  25 +-
 drivers/net/wireless/ath/ath12k/dp.h          |  17 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c      |   5 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c       | 158 ++++-----
 drivers/net/wireless/ath/ath12k/dp_tx.c       |  20 ++
 drivers/net/wireless/ath/ath12k/fw.c          | 171 ++++++++++
 drivers/net/wireless/ath/ath12k/fw.h          |  33 ++
 drivers/net/wireless/ath/ath12k/hal.c         | 415 ++++++++++++++++++++++=
+-
 drivers/net/wireless/ath/ath12k/hal.h         |  20 +-
 drivers/net/wireless/ath/ath12k/hw.c          |  24 +-
 drivers/net/wireless/ath/ath12k/hw.h          |  32 +-
 drivers/net/wireless/ath/ath12k/mac.c         | 443 ++++++++++++++++++++++=
----
 drivers/net/wireless/ath/ath12k/mhi.c         |  52 ++-
 drivers/net/wireless/ath/ath12k/p2p.c         | 142 +++++++++
 drivers/net/wireless/ath/ath12k/p2p.h         |  23 ++
 drivers/net/wireless/ath/ath12k/pci.c         |  84 +++--
 drivers/net/wireless/ath/ath12k/pci.h         |   6 +-
 drivers/net/wireless/ath/ath12k/qmi.c         |  52 ++-
 drivers/net/wireless/ath/ath12k/qmi.h         |   1 -
 drivers/net/wireless/ath/ath12k/rx_desc.h     | 116 ++++++-
 drivers/net/wireless/ath/ath12k/wmi.c         | 230 +++++++++++--
 drivers/net/wireless/ath/ath12k/wmi.h         | 202 ++++++++----
 drivers/net/wireless/ath/ath9k/htc.h          |   2 +-
 drivers/net/wireless/ath/ath9k/htc_drv_init.c |   4 +
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c |   4 -
 drivers/net/wireless/ath/ath9k/wmi.c          |  10 +-
 drivers/net/wireless/ath/ath9k/xmit.c         |   3 +-
 drivers/net/wireless/ath/carl9170/tx.c        |   2 +-
 41 files changed, 2334 insertions(+), 411 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/fw.c
 create mode 100644 drivers/net/wireless/ath/ath12k/fw.h
 create mode 100644 drivers/net/wireless/ath/ath12k/p2p.c
 create mode 100644 drivers/net/wireless/ath/ath12k/p2p.h

