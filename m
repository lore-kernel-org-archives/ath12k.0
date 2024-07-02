Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230B9C30658
	for <ath12k@archiver.kernel.org>; Tue,  2 Jul 2024 20:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N8d/iTyV0Es1LzN9dYmgx+3uWEh64MISDrPEC+6ChUE=; b=0Mn3Hy2UHfXq56G6eplpwmXLOy
	eb4kRzyRQwUzuhhINZG1d4p7rXIFXJ6sGTd0wQFO0o54yAYm4eRG5PpLek2TPrSggMTJ6oPKWmDa/
	VyybBHT+wrNoe+uZmXm7DTNuOhS2yTBnTFnPLWMJ2xeTogrBYuCmbw7FFDqCw5/duYeGqTsfoxaSz
	jRmdTj13/YCC4j058ymJgDSZSWtVgX8j0lQEWG58WfqE7TICuo4/Y3ix4PojBg14e9MqBh0AuyHn2
	WkgI5TDeQXzKkrkTrllEFfqHii1MGVWgT8kO2I7N2aT/WFRLmMSZUb1DFjEt+3l637qQSQw7mHse4
	MFWddBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOkND-00000007uvW-3bVw
	for ath12k@archiver.kernel.org;
	Tue, 02 Jul 2024 20:45:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOkN9-00000007uun-2rDR;
	Tue, 02 Jul 2024 20:45:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462HEkUB004294;
	Tue, 2 Jul 2024 20:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N8d/iTyV0Es1LzN9dYmgx+
	3uWEh64MISDrPEC+6ChUE=; b=Tt7JCyLDPQeNkkCPxJCvFjx8wLX75na3tgaVMD
	2imnDPcocowp0ztUxuWPoQ3jabT/Xoe1tRKYskacv/K1bviZeghWP5TfCT70E+Ne
	q1jaqeUmvBBnbpBiVjgacPoW2mAgsH8rf8+sxvNW263UHnaXcWrrtc3RYj9Audag
	dKo28a86+UndcvtyhyWuKDUD9ivbQzv+Hi0xR+A8pGOlVKDWXo5HUEOytoHpPo6a
	bbT4c05SHO0KTH0e7LFD+zp8IRWxphEsWEGIwhad97rrJ9gSL+vg8fHr92rf6IjC
	hiGHl+QW980nxDpmx7zPpkFTNwmtFKHNnBaHsTawU3N5KyBg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4029uxexdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 20:45:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 462Kj47a016615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Jul 2024 20:45:04 GMT
Received: from [10.48.245.148] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 2 Jul 2024
 13:44:57 -0700
Message-ID: <812acd8a-fc26-4611-8a7a-c3a1d6197d00@quicinc.com>
Date: Tue, 2 Jul 2024 13:44:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <linux-wireless@vger.kernel.org>
CC: <ath10k@lists.infradead.org>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>, <quic_jjohnson@quicinc.com>,
        <quic_kvalo@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
Subject: pull-request: ath-next-20240702
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mq9efbWP1t1fwfhfPMEj4MGAAmxg_5Tj
X-Proofpoint-ORIG-GUID: mq9efbWP1t1fwfhfPMEj4MGAAmxg_5Tj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_16,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0
 clxscore=1011 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407020152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_134507_877982_897EFE59 
X-CRM114-Status: GOOD (  13.94  )
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

The following changes since commit bb678f01804ccaa861b012b2b9426d69673d8a84:

  Merge branch 'intel-wired-lan-driver-updates-2024-06-03' (2024-06-10 19:52:50 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20240702

for you to fetch changes up to 5344fc76f8944249026884157f846f88489edfc0:

  wifi: ath12k: Support TQM stats (2024-07-01 21:57:28 +0300)

----------------------------------------------------------------
ath.git patches for v6.11

We have moved to a new group-managed repo, and this is the first pull
request from that repo, and from me. Fingers crossed...

We have some new features in ath12k along with some cleanups in ath11k
and ath12k. Also notable are some device-tree changes to allow certain
ath11k and ath12k devices to work with a new power sequencing
subsystem.

Major changes:

ath12k

* DebugFS support for datapath statistics
* WCN7850: support for WoW (Wake on WLAN)
* WCN7850: device-tree bindings

ath11k

* QCA6390: device-tree bindings

----------------------------------------------------------------
Aaradhana Sahu (3):
      wifi: ath12k: Fix WARN_ON during firmware crash in split-phy
      wifi: ath12k: fix NULL pointer access in ath12k_mac_op_get_survey()
      wifi: ath12k: fix uninitialize symbol error on ath12k_peer_assoc_h_he()

Aditya Kumar Singh (3):
      wifi: ath12k: fix per pdev debugfs registration
      wifi: ath12k: unregister per pdev debugfs
      wifi: ath12k: handle symlink cleanup for per pdev debugfs dentry

Ajith C (1):
      wifi: ath12k: fix firmware crash due to invalid peer nss

Baochen Qiang (11):
      wifi: ath12k: fix ACPI warning when resume
      wifi: ath11k: fix RCU documentation in ath11k_mac_op_ipv6_changed()
      wifi: ath11k: fix wrong handling of CCMP256 and GCMP ciphers
      wifi: ath12k: add ATH12K_DBG_WOW log level
      wifi: ath12k: implement WoW enable and wakeup commands
      wifi: ath12k: add basic WoW functionalities
      wifi: ath12k: add WoW net-detect functionality
      wifi: ath12k: implement hardware data filter
      wifi: ath12k: support ARP and NS offload
      wifi: ath12k: support GTK rekey offload
      wifi: ath12k: handle keepalive during WoWLAN suspend and resume

Bartosz Golaszewski (2):
      dt-bindings: net: wireless: qcom,ath11k: describe the ath11k on QCA6390
      dt-bindings: net: wireless: describe the ath12k PCI module

Dinesh Karthikeyan (6):
      wifi: ath12k: Add support to enable debugfs_htt_stats
      wifi: ath12k: Add htt_stats_dump file ops support
      wifi: ath12k: Add support to parse requested stats_type
      wifi: ath12k: Support Transmit Scheduler stats
      wifi: ath12k: Support pdev error stats
      wifi: ath12k: Support TQM stats

Harshitha Prem (1):
      wifi: ath12k: Remove unused ath12k_base from ath12k_hw

Karthikeyan Periyasamy (3):
      wifi: ath12k: avoid unnecessary MSDU drop in the Rx error process
      wifi: ath12k: fix mbssid max interface advertisement
      wifi: ath12k: fix peer metadata parsing

Lingbo Kong (3):
      wifi: ath11k: fix ack signal strength calculation
      wifi: ath11k: modify the calculation of the average signal strength in station mode
      wifi: ath12k: Fix pdev id sent to firmware for single phy devices

Pradeep Kumar Chitrapu (1):
      wifi: ath12k: fix legacy peer association due to missing HT or 6 GHz capabilities

Rameshkumar Sundaram (2):
      wifi: ath12k: modify remain on channel for single wiphy
      wifi: ath12k: fix driver initialization for WoW unsupported devices

Ramya Gnanasekar (1):
      wifi: ath12k: Dump additional Tx PDEV HTT stats

Wolfram Sang (1):
      wifi: ath11k: use 'time_left' variable with wait_event_timeout()

 .../bindings/net/wireless/qcom,ath11k-pci.yaml     |   46 +
 .../bindings/net/wireless/qcom,ath12k.yaml         |   99 ++
 drivers/net/wireless/ath/ath11k/dp_rx.c            |    3 +-
 drivers/net/wireless/ath/ath11k/dp_rx.h            |    3 +
 drivers/net/wireless/ath/ath11k/dp_tx.c            |   16 +-
 drivers/net/wireless/ath/ath11k/dp_tx.h            |    4 +-
 drivers/net/wireless/ath/ath11k/hal_tx.h           |    4 +-
 drivers/net/wireless/ath/ath11k/mac.c              |   29 +-
 drivers/net/wireless/ath/ath11k/qmi.c              |   20 +-
 drivers/net/wireless/ath/ath12k/Makefile           |    3 +-
 drivers/net/wireless/ath/ath12k/acpi.c             |    2 +
 drivers/net/wireless/ath/ath12k/core.c             |   71 +-
 drivers/net/wireless/ath/ath12k/core.h             |   34 +-
 drivers/net/wireless/ath/ath12k/debug.h            |    3 +-
 drivers/net/wireless/ath/ath12k/debugfs.c          |   19 +-
 drivers/net/wireless/ath/ath12k/debugfs.h          |    6 +-
 .../net/wireless/ath/ath12k/debugfs_htt_stats.c    | 1540 ++++++++++++++++++++
 .../net/wireless/ath/ath12k/debugfs_htt_stats.h    |  567 +++++++
 drivers/net/wireless/ath/ath12k/dp.h               |    1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c            |   54 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h            |    4 +
 drivers/net/wireless/ath/ath12k/dp_tx.c            |    4 +-
 drivers/net/wireless/ath/ath12k/hal_desc.h         |   26 +-
 drivers/net/wireless/ath/ath12k/htc.c              |    6 +
 drivers/net/wireless/ath/ath12k/hw.h               |    2 -
 drivers/net/wireless/ath/ath12k/mac.c              |  302 +++-
 drivers/net/wireless/ath/ath12k/mac.h              |    5 +
 drivers/net/wireless/ath/ath12k/wmi.c              |  728 ++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h              |  586 +++++++-
 drivers/net/wireless/ath/ath12k/wow.c              | 1026 +++++++++++++
 drivers/net/wireless/ath/ath12k/wow.h              |   62 +
 31 files changed, 5156 insertions(+), 119 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
 create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
 create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
 create mode 100644 drivers/net/wireless/ath/ath12k/wow.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wow.h

