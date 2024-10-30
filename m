Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07430D2AB15
	for <ath12k@archiver.kernel.org>; Wed, 30 Oct 2024 15:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wAKt/4iLHWlvpVgnx6ZfolV1srfOvFdIA8MX09y0DN4=; b=v3kjlQpmdW29vcrALQheL9cRpP
	6BpBbcMxpDr0jqtWyTCUxRHdGHpkfEWYMyo+AS6YAzS+FniiAVv42Cetf1f+QbGK91caH3yO8ABg+
	pNUOjoEjho/J/U1iIXRZC6nkDOF2zVex4IQtq6+Q6iL7NtBFh9tYlANPIOAErhtNE9EzZHhEybIdh
	NCgnNf3fERnjLPpPffYPsL+bWhqKT9jaN4+/3AiAp1oTIAvh8GPPALTc2pwiksVwdl0p3m+6Dozxk
	kgAhSdAHFoUZO7/xT5DoNJhajOpSXtcgHhx4peiqTf5rsDnlyCaj9u7mkZgmPXBWNBMXZQK8vrS04
	VYx+xZFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Aju-00000000tst-2cyZ
	for ath12k@archiver.kernel.org;
	Wed, 30 Oct 2024 15:36:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Ajp-00000000trR-2JKp;
	Wed, 30 Oct 2024 15:36:03 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U8tM2x007117;
	Wed, 30 Oct 2024 15:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wAKt/4iLHWlvpVgnx6Zfol
	V1srfOvFdIA8MX09y0DN4=; b=hMEjy/BD4wnmL/gOHw5VpFD+VjAdSJ1yg/d8fp
	Cbz90HM5Ey9XY29LlkcUoIt1KM8Svk9b2wq2iniIXxPed6pz8iYUd0KFfsC5MDcr
	1Y0U/C7n05WHiJbK1VKG6PWxVvdonfZasUXGuYQx3cX/a1BktzyP/UoH8v/59fXY
	VWuK0sf9l/MfsmteQNRlMuV7Y0p7OYmEy+wuhbaDPndWZbcNF7yCl4Z5lGJsC/2e
	L85aEiiE4qsJroSKfnLaT5pzchp7/O1j1yJJgYuI8UCGSzRy/iJDNyngjEQJin6Y
	x6hmflRCSN9TOGBb56+IT3h5Q94Z4bhud9l+g/cZykmCXZ/g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42khqbs59p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 15:35:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UFZvBl029914
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 15:35:57 GMT
Received: from [10.48.242.156] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 08:35:56 -0700
Message-ID: <dabcbe71-c23d-4207-83bc-f077a7a8dece@quicinc.com>
Date: Wed, 30 Oct 2024 08:35:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: <ath10k@lists.infradead.org>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>, <quic_jjohnson@quicinc.com>,
        <quic_kvalo@quicinc.com>
Subject: pull-request: ath-next-20241030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lD14wZx9xzcTSlv_SdxAC3UQNY9JLz9k
X-Proofpoint-ORIG-GUID: lD14wZx9xzcTSlv_SdxAC3UQNY9JLz9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_083601_759786_20EA9580 
X-CRM114-Status: GOOD (  17.53  )
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

The following changes since commit 34c44eb31de9cb7202ff070900463d6c706392c4:

  Merge branch 'net-ibm-emac-modernize-a-bit' (2024-09-13 21:49:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20241030

for you to fetch changes up to cdad737160571a98cc4933a62c9f2728e965ab27:

  wifi: ath12k: convert tasklet to BH workqueue for CE interrupts (2024-10-25 12:22:03 -0700)

----------------------------------------------------------------
ath.git patches for v6.13

This development cycle featured phase 1 of patches to ath12k to
support the new 802.11be MLO feature, along with other ath12k feature
patches.  In older drivers, support for some additional devices were
added. And there was the usual set of bug fixes and cleanups across
most drivers.

Per-driver highlights:

ath12k
* Switch to using wiphy_lock() and remove ar->conf_mutex
* Convert struct ath12k_sta::update_wk to use struct wiphy_work
* Add phase 1 of 802.11be MLO support
* Add firmware coredump collection support
* Add debugfs support for a multitude of statistics
* Fix host representation of multiple hal_rx structs
* Fix use-after-free in ath12k_dp_cc_cleanup()
* Skip Rx TID cleanup for self peer
* Fix warning and crash when unloading in a VM
* Convert CE interrupt handling from tasklet to BH workqueue
* Fix A-MSDU indication in monitor mode

ath11k
* Fix double free issue during SRNG deinit
* Enable firmware diagnostic events for WCN6750
* Fix CE offset address calculation for WCN6750 during SSR
* Fix stack frame size warning in ath11k_vif_wow_set_wakeups()
* Document the inputs for ath11k on WCN6855

ath10k
* Fix multiple stack frame size warnings
* Fix invalid VHT parameters in supported_vht_mcs_rate_nss* structs
* Avoid NULL pointer error during SDIO remove

ath5k
* Add support for Arcadyan ARV45XX AR2417 & Gigaset SX76[23] AR241[34]A

----------------------------------------------------------------
Andrew Kreimer (2):
      wifi: wcn36xx: fix a typo in struct wcn36xx_sta documentation
      wifi: ath6kl: fix typos in struct wmi_rssi_threshold_params_cmd and wmi_snr_threshold_params_cmd comments

Arnd Bergmann (1):
      wifi: ath12k: fix one more memcpy size error

Balaji Pothunoori (2):
      wifi: ath11k: enable fw_wmi_diag_event hw param for WCN6750
      wifi: ath11k: Fix CE offset address calculation for WCN6750 in SSR

Baochen Qiang (2):
      wifi: ath10k: fix invalid VHT parameters in supported_vht_mcs_rate_nss1
      wifi: ath10k: fix invalid VHT parameters in supported_vht_mcs_rate_nss2

Bartosz Golaszewski (1):
      dt-bindings: net: ath11k: document the inputs of the ath11k on WCN6855

Caleb Connolly (1):
      wifi: ath11k: allow missing memory-regions

Colin Ian King (1):
      wifi: ath12k: make read-only array svc_id static const

Dinesh Karthikeyan (5):
      wifi: ath12k: Support Self-Generated Transmit stats
      wifi: ath12k: Support Ring and SFM stats
      wifi: ath12k: Support pdev Transmit Multi-user stats
      wifi: ath12k: Support pdev CCA Stats
      wifi: ath12k: Support Pdev OBSS Stats

Jeongjun Park (1):
      wifi: ath9k: add range check for conn_rsp_epid in htc_connect_service()

Jose Ignacio Tornos Martinez (2):
      wifi: ath12k: fix crash when unbinding
      wifi: ath12k: fix warning when unbinding

Kalle Valo (7):
      wifi: ath12k: fix atomic calls in ath12k_mac_op_set_bitrate_mask()
      wifi: ath12k: convert struct ath12k_sta::update_wk to use struct wiphy_work
      wifi: ath12k: switch to using wiphy_lock() and remove ar->conf_mutex
      wifi: ath12k: cleanup unneeded labels
      wifi: ath12k: ath12k_mac_set_key(): remove exit label
      wifi: ath12k: ath12k_mac_op_sta_state(): clean up update_wk cancellation
      wifi: ath12k: add missing lockdep_assert_wiphy() for ath12k_mac_op_ functions

Kang Yang (9):
      wifi: ath10k: avoid NULL pointer error during sdio remove
      wifi: ath12k: remove unused variable monitor_present
      wifi: ath12k: fix struct hal_rx_ppdu_end_user_stats
      wifi: ath12k: fix struct hal_rx_ppdu_start
      wifi: ath12k: fix struct hal_rx_phyrx_rssi_legacy_info
      wifi: ath12k: fix struct hal_rx_mpdu_start
      wifi: ath12k: delete NSS and TX power setting for monitor vdev
      wifi: ath12k: use tail MSDU to get MSDU information
      wifi: ath12k: fix A-MSDU indication in monitor mode

Li Zetao (1):
      wifi: ath9k: use clamp() in ar9003_aic_cal_post_process()

Lingbo Kong (1):
      wifi: ath12k: remove msdu_end structure for WCN7850

Manikanta Pubbisetty (1):
      wifi: ath11k: Fix double free issue during SRNG deinit

Miaoqing Pan (3):
      wifi: ath10k: fix the stack frame size warning in ath10k_remain_on_channel
      wifi: ath10k: fix the stack frame size warning in ath10k_hw_scan
      wifi: ath11k: fix the stack frame size warning in ath11k_vif_wow_set_wakeups

Nicolas Escande (1):
      wifi: ath12k: move txbaddr/rxbaddr into struct ath12k_dp

Pradeep Kumar Chitrapu (1):
      wifi: ath12k: Support BE OFDMA Pdev Rate Stats

Raj Kumar Bhagat (1):
      wifi: ath12k: convert tasklet to BH workqueue for CE interrupts

Rajat Soni (1):
      wifi: ath12k: Support DMAC Reset Stats

Rameshkumar Sundaram (5):
      wifi: ath12k: fix use-after-free in ath12k_dp_cc_cleanup()
      wifi: ath12k: prepare vif config caching for MLO
      wifi: ath12k: modify ath12k_mac_vif_chan() for MLO
      wifi: ath12k: modify ath12k_get_arvif_iter() for MLO
      wifi: ath12k: modify ath12k_mac_op_set_key() for MLO

Ramya Gnanasekar (1):
      wifi: ath12k: Skip Rx TID cleanup for self peer

Roopni Devanathan (1):
      wifi: ath12k: Modify print_array_to_buf() to support arrays with 1-based semantics

Rosen Penev (5):
      wifi: ath9k: eeprom: remove platform data
      wifi: ath9k: btcoex: remove platform_data
      wifi: ath9k: remove ath9k_platform_data
      wifi: ath5k: add PCI ID for SX76X
      wifi: ath5k: add PCI ID for Arcadyan devices

Sidhanta Sahu (1):
      wifi: ath12k: Support Pdev Scheduled Algorithm Stats

Sowmiya Sree Elavalagan (1):
      wifi: ath12k: Add firmware coredump collection support

Sriram R (7):
      wifi: ath12k: prepare vif data structure for MLO handling
      wifi: ath12k: pass ath12k_link_vif instead of vif/ahvif
      wifi: ath12k: prepare sta data structure for MLO handling
      wifi: ath12k: modify ath12k_mac_op_bss_info_changed() for MLO
      wifi: ath12k: update ath12k_mac_op_conf_tx() for MLO
      wifi: ath12k: update ath12k_mac_op_update_vif_offload() for MLO
      wifi: ath12k: modify link arvif creation and removal for MLO

 .../bindings/net/wireless/qcom,ath11k-pci.yaml     |   29 +
 drivers/net/wireless/ath/ath10k/mac.c              |  100 +-
 drivers/net/wireless/ath/ath10k/sdio.c             |    6 +-
 drivers/net/wireless/ath/ath11k/ahb.c              |   12 +-
 drivers/net/wireless/ath/ath11k/core.c             |    2 +-
 drivers/net/wireless/ath/ath11k/hal.c              |    1 +
 drivers/net/wireless/ath/ath11k/qmi.c              |    3 +
 drivers/net/wireless/ath/ath11k/wow.c              |   39 +-
 drivers/net/wireless/ath/ath12k/Kconfig            |   10 +
 drivers/net/wireless/ath/ath12k/Makefile           |    1 +
 drivers/net/wireless/ath/ath12k/ce.h               |    2 +-
 drivers/net/wireless/ath/ath12k/core.c             |    9 +-
 drivers/net/wireless/ath/ath12k/core.h             |  110 +-
 drivers/net/wireless/ath/ath12k/coredump.c         |   51 +
 drivers/net/wireless/ath/ath12k/coredump.h         |   80 +
 drivers/net/wireless/ath/ath12k/debugfs.c          |    4 +-
 .../net/wireless/ath/ath12k/debugfs_htt_stats.c    | 1358 +++++++++++++-
 .../net/wireless/ath/ath12k/debugfs_htt_stats.h    |  444 ++++-
 drivers/net/wireless/ath/ath12k/dp.c               |   58 +-
 drivers/net/wireless/ath/ath12k/dp.h               |    7 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c           |  122 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c            |   16 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h            |    2 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c            |    9 +-
 drivers/net/wireless/ath/ath12k/dp_tx.h            |    2 +-
 drivers/net/wireless/ath/ath12k/hal.c              |   12 +-
 drivers/net/wireless/ath/ath12k/hal_rx.h           |   53 +-
 drivers/net/wireless/ath/ath12k/hif.h              |    6 +
 drivers/net/wireless/ath/ath12k/hw.c               |    4 +-
 drivers/net/wireless/ath/ath12k/mac.c              | 1845 ++++++++++++--------
 drivers/net/wireless/ath/ath12k/mac.h              |   11 +-
 drivers/net/wireless/ath/ath12k/mhi.c              |    5 +
 drivers/net/wireless/ath/ath12k/mhi.h              |    2 +-
 drivers/net/wireless/ath/ath12k/p2p.c              |   17 +-
 drivers/net/wireless/ath/ath12k/p2p.h              |    2 +-
 drivers/net/wireless/ath/ath12k/pci.c              |  200 ++-
 drivers/net/wireless/ath/ath12k/peer.c             |   13 +-
 drivers/net/wireless/ath/ath12k/peer.h             |    4 +-
 drivers/net/wireless/ath/ath12k/rx_desc.h          |   88 +-
 drivers/net/wireless/ath/ath12k/wmi.c              |   30 +-
 drivers/net/wireless/ath/ath12k/wmi.h              |    8 +-
 drivers/net/wireless/ath/ath12k/wow.c              |   87 +-
 drivers/net/wireless/ath/ath5k/pci.c               |    2 +
 drivers/net/wireless/ath/ath6kl/wmi.h              |    8 +-
 drivers/net/wireless/ath/ath9k/ar9003_aic.c        |   10 +-
 .../net/wireless/ath/ath9k/ath9k_pci_owl_loader.c  |    1 -
 drivers/net/wireless/ath/ath9k/btcoex.c            |   16 +-
 drivers/net/wireless/ath/ath9k/eeprom.c            |   12 -
 drivers/net/wireless/ath/ath9k/htc_hst.c           |    3 +
 drivers/net/wireless/ath/ath9k/hw.c                |    2 +-
 drivers/net/wireless/ath/ath9k/init.c              |   52 +-
 drivers/net/wireless/ath/wcn36xx/wcn36xx.h         |    2 +-
 include/linux/ath9k_platform.h                     |   51 -
 53 files changed, 3782 insertions(+), 1241 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/coredump.c
 create mode 100644 drivers/net/wireless/ath/ath12k/coredump.h
 delete mode 100644 include/linux/ath9k_platform.h

