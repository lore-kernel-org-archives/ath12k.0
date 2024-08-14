Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E73AC3DA4A
	for <ath12k@archiver.kernel.org>; Wed, 14 Aug 2024 09:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f2ZukGABYXU+YZF2cvy5V6Gbqu04XveWtelZ1jhfnq0=; b=VYw8tCcRXgNqj8+2+KVWAjTBpB
	6jpz/FKoZwqaSj5yGJH/X8am1R5CKEaUFBaDIHe6cRY7gz6N8VThLQcJ3w8yGAVeXExk4d8hpcS4S
	QuHcb1Cydlc7P3q+0Bypd1msMEe774pbhsUfPmrE9g6Dd8Rilr28MWZoGbTKRl9nhRZ8Ntu3C1ctu
	VaeuYJIthsRWko76WO+zEkmdHbNZ12vXkHq82Fap5pOLG0WTagGtpA1cJiw+AAYX96Cd62jSPKP2f
	WPYJ8NWCNkIjO6QFofnyMxle/fba0Jc4AbiE2WLkLOmc9h6BglNXCXTo6whQNUgsjrzG7dqtqreh6
	aEdtdJyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seAYL-00000006RSj-3VmB
	for ath12k@archiver.kernel.org;
	Wed, 14 Aug 2024 09:44:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seAYI-00000006RRp-3SHI
	for ath12k@lists.infradead.org;
	Wed, 14 Aug 2024 09:44:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DNAT0J009054;
	Wed, 14 Aug 2024 09:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f2ZukGABYXU+YZF2cvy5V6
	Gbqu04XveWtelZ1jhfnq0=; b=OClIq9ZKKo9x4APXKwZn1Ae1QBqg8SpZ5zN0pD
	rGJMKzTXJbw9TUDf5hURJ7zBew+PF2EFuHOQeFinVTrceITBbEtdGmI4cWslv/Ys
	oMkDVJJQ6WjN5yzAfQATTf0ubYLNbCwYhkcLlXGOCaKj/I4WeJZJwsSuDUA8aV+Z
	4+nnhmh9i49W7b/qaK2bAlmQ9jW3BB1oUPZGJ2jeBbqR+0CTLw2yyh6EuOYpaUAo
	few1YxHOQ3X5VP87pwcbL63A3EjraaSZvJchLsCSW1RR6MNAqRqJoXF/M+TVbwgR
	dGaRA0pTieFCZLc89aD/wixVveUIMPBWeYq1Ig6OKUPiOeBQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4108bc2vre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 09:44:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47E9iJlH021204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 09:44:19 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 14 Aug 2024 02:44:17 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [RFC PATCH 00/18] wifi: ath12k: add Ath12k AHB driver support for IPQ5332
Date: Wed, 14 Aug 2024 15:13:05 +0530
Message-ID: <20240814094323.3927603-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: i5CSvSrGrOA9Lrzg_MqGJ-CerNV2JgRg
X-Proofpoint-GUID: i5CSvSrGrOA9Lrzg_MqGJ-CerNV2JgRg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_07,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=724 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_024423_026292_E5FE0980 
X-CRM114-Status: GOOD (  16.25  )
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

Currently, Ath12k driver only supports WiFi devices that are based on
PCI bus. New Ath12k device IPQ5332 is based on AHB bus. Hence, add
Ath12k AHB support for IPQ5332.

IPQ5332 is IEEE802.11be 2 GHz 2x2 Wifi device. To bring-up IPQ5332
device:
- Add hardware parameters for IPQ5332.
- CE and CMEM register address space in IPQ5332 is separate from WCSS
  register space. Hence, add logic to remap CE and CMEM register
  address.
- Add support for fixed QMI firmware memory for IPQ5332.
- Add ath12k AHB support.

Depends-On: [v6] Add multipd remoteproc support
Link: https://lore.kernel.org/all/20231110091939.3025413-1-quic_mmanikan@quicinc.com/

Note that the dependency patch series - [v6,00/11] Add multipd
remoteproc support, has the below issues:

1. The remoteproc maintainers don't want any userpd code in remoteproc.
   As a result of this, the approach being taken by this series may
   change.

2. Due to latest changes in linux-next/ath ToT, [v6,00/11] Add multipd
   remoteproc support is unable to compile. Below compilation fixes are
   required in the file "drivers/remoteproc/qcom_q6v5_mpd.c":
   - Add "#include <linux/of_platform.h>"
   - Change "static int q6_wcss_remove" to "static void q6_wcss_remove"
     and remove "return 0".

3. The IPQ5332 firmware patch is pointing to ath11k firmware path, but
   IPQ5332 is Ath12k chipset.
   In patch [v6,10/11] arm64: dts: qcom: ipq5332: Add nodes to bringup
   multipd, firmware path should be: ath12k/IPQ5332/hw1.0/

Balamurugan S (9):
  wifi: ath12k: add ath12k_hw_params for IPQ5332
  wifi: ath12k: add ath12k_hw_hal_params for IPQ5332
  wifi: ath12k: avoid m3 firmware download in AHB device IPQ5332
  wifi: ath12k: add new CMEM read-write ath12k_hif_ops
  wifi: ath12k: remap CMEM register space for IPQ5332
  wifi: ath12k: fix incorrect CE addresses
  wifi: ath12k: remap CE register space for IPQ5332
  wifi: ath12k: add AHB driver support for IPQ5332
  wifi: ath12k: enable ath12k AHB support

P Praneesh (4):
  wifi: ath12k: refactor ath12k_hw_regs structure
  wifi: ath12k: add ath12k_hw_regs for IPQ5332
  wifi: ath12k: add ath12k_hw_ring_mask for IPQ5332
  wifi: ath12k: add CE configurations for IPQ5332

Raj Kumar Bhagat (5):
  dt-bindings: net: wireless: describe the ath12k AHB module
  arm64: dts: qcom: add wifi node for IPQ5332 based RDP441
  wifi: ath12k: add support for fixed QMI firmware memory
  wifi: ath12k: add support to read board_id from device-tree
  wifi: ath12k: convert tasklet to BH workqueue for CE interrupts

 .../net/wireless/qcom,ath12k-ahb.yaml         |  325 ++++++
 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts   |   56 +-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  131 ++-
 drivers/net/wireless/ath/ath12k/Kconfig       |    6 +
 drivers/net/wireless/ath/ath12k/Makefile      |    1 +
 drivers/net/wireless/ath/ath12k/ahb.c         | 1028 +++++++++++++++++
 drivers/net/wireless/ath/ath12k/ahb.h         |   50 +
 drivers/net/wireless/ath/ath12k/ce.c          |   90 ++
 drivers/net/wireless/ath/ath12k/ce.h          |   18 +-
 drivers/net/wireless/ath/ath12k/core.c        |   35 +-
 drivers/net/wireless/ath/ath12k/core.h        |   19 +-
 drivers/net/wireless/ath/ath12k/dp.c          |   10 +-
 drivers/net/wireless/ath/ath12k/hal.c         |   82 +-
 drivers/net/wireless/ath/ath12k/hal.h         |   69 +-
 drivers/net/wireless/ath/ath12k/hif.h         |   13 +
 drivers/net/wireless/ath/ath12k/hw.c          |  478 ++++++++
 drivers/net/wireless/ath/ath12k/hw.h          |   14 +
 drivers/net/wireless/ath/ath12k/pci.c         |   28 +-
 drivers/net/wireless/ath/ath12k/pci.h         |    2 +
 drivers/net/wireless/ath/ath12k/qmi.c         |  188 ++-
 drivers/net/wireless/ath/ath12k/qmi.h         |    1 +
 21 files changed, 2525 insertions(+), 119 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
 create mode 100644 drivers/net/wireless/ath/ath12k/ahb.c
 create mode 100644 drivers/net/wireless/ath/ath12k/ahb.h


base-commit: 1462e8e1c93ecb96b5820ec28f7cbbb8a5aeb732
prerequisite-patch-id: 0c516eb530339e5398eaaf8ece5e72dfac419f93
prerequisite-patch-id: bfefff55ba6a3fdf8930b3b4d48746bc9cd5a0a0
prerequisite-patch-id: 9e143f9cd10add55d2fd52bac0e538b904d6dee5
prerequisite-patch-id: cb987ee3dbc145fee1135307badb61c0e21f0ccd
prerequisite-patch-id: 14b990ceacec658b924c78d91ce33b45f70ca112
prerequisite-patch-id: b1f6cc6ae066f3e10b5626ff0af3267449d613d3
prerequisite-patch-id: 06bbcd43424f4ee2f116372855665f7dc932158d
prerequisite-patch-id: 73a4b0a87c136697874bb120a3bf0a7ec6e54a32
prerequisite-patch-id: 6cab6a588aa5479276228e60693ea6d472e2f844
prerequisite-patch-id: df1119a31756da103188d8880077ce0bcec3d352
prerequisite-patch-id: cf47f0a66dbe5f11d50ce2e62682b0f48dfc4e76
-- 
2.34.1


