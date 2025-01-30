Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A093C0218A
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 04:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q7/vEGAuLDhSxnP3F3UQD6e9FqcSA1x9aJgigmNRgdM=; b=mMICa4cxQQHGSiJ7Yix6DnjXmn
	fhtqjg0W1119m2mMIC14XhZWGan6QqdeGs2ImHCk4I7ck3frh2zKZSQmaxDQzR0OpXWW1zXtQYXKE
	nkYxoYXc9lQrErRk0XWXeKoz1oDJ17Edy5865+a9VZmRr8hzN+UEPfjWA1rgEWn8tGiB+OIhNJfO9
	+7ZTV9kk0mWPg7atmqGc5+uA6dd6lyQ0uXvWzceGPn0iQH9Bkb92g1c1xQx2pfbyPFbqA0A8ayv8N
	Ke7B5jjZ2lFYwg/jCx50Lsk9DYB8cRak6yCCygXI4nQNs0kiabmqUvDcy6qVPVCvZKv+NLAfhuNni
	IjDOZKMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdMHK-00000008BFC-1Tdj
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 04:35:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdMHH-00000008BEr-363T
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 04:35:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U1cb9r022955;
	Thu, 30 Jan 2025 04:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q7/vEGAuLDhSxnP3F3UQD6
	e9FqcSA1x9aJgigmNRgdM=; b=jQpDc38m1Ojc+yUjVEpTM1CNSfoc/DWvyBGjq7
	mEJJ+pG0xPP0s+wdbT9Ra5miFd6WYfnfDNPktbg1R4+IOAIZx2cfuhJHYAZba8LA
	/WYrjsmr814hlQUrTw1UReXPZLP/crHyFg228DpMpx3ol+P+FzU6q6SLAUdk82Fk
	7IaYQpoF8LEkK+zRjzInF7jvrM4ja7rxWZRyTxVcAihznYLa4YE83efpTrDtwjB9
	FjUoArg26jZuWVOhSePIsev5AdK6/RnGRhVq8U/w63/ToUODdBz8y5N1I+wtE/4n
	Wy/TAX8KLsZvMjKOjpK7cY/0n+OjUxBsWdfHlM+8isc4p63w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fyxnr7ey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 04:35:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50U4ZdVX031712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 04:35:39 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 Jan 2025 20:35:36 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Raj Kumar
 Bhagat" <quic_rajkbhag@quicinc.com>
Subject: [PATCH v5 00/13] wifi: ath12k: add Ath12k AHB driver support for IPQ5332
Date: Thu, 30 Jan 2025 10:04:55 +0530
Message-ID: <20250130043508.1885026-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zr8duBZl6lJwf2VYW_nqeJTpJI-Z5vDE
X-Proofpoint-GUID: zr8duBZl6lJwf2VYW_nqeJTpJI-Z5vDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_203543_794078_E7C793BC 
X-CRM114-Status: GOOD (  21.54  )
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
- CE register address space in IPQ5332 is separate from WCSS register
  space. Hence, add logic to remap CE register address.
- Add support for fixed QMI firmware memory for IPQ5332.
- Support userPD handling for WCSS secure PIL driver to enable ath12k
  AHB support.

NOTE:
The working upstream DTS changes for this series have been posted as a
separate series.
[PATCH v2] arm64: dts: qcom: add wifi node for IPQ5332 based RDP441

v5:
- DT binding: Added `memory-region-names` property to address undocumented
  ABIs.
- DT binding: Added four complete items to `memory-region`, required by
  ath12k firmware.
- All calls to `of_find_node_by_name()` are removed. Introduced helper
  function `ath12k_core_get_reserved_mem_by_name()` to get the reserved
  memory by name.
- Removed unused include headers.
- Removed error prints for impossible scenarios.
- Used proper phandle API `of_parse_phandle()` to read `qcom,rproc`.
- Used `dev_err_probe()` API for logging errors wherever applicable.
- Changed hardware parameter `needs_m3_fw` to `enum ath12k_m3_fw_loaders`.
- Changed hardware parameter `bdf_addr` to `bdf_addr_offset` to store the
  offset for BDF memory from the q6-memory as base.

v4: https://lore.kernel.org/all/20241210074159.2637933-1-quic_rajkbhag@quicinc.com/
- Missed to include some review list in v3. Hence sending v4 with
  all review list as per - scripts/get_maintainers.pl

v3: https://lore.kernel.org/all/20241209165644.1680167-1-quic_rajkbhag@quicinc.com/
- DT binding: clock name changed from gcc_xo_clk to xo.
- DT binding: Upper constraint added for memory-region property.
- DT binding: The description for "qcom,rproc" phandle updated to represent
  the hardware aspect.
- DT binding: Added property qcom,ath12k-calibration-variant.
- Squashed patch[2/22] to patch[8/22] of v2 into a single patch.
- Patch reordering is done.
- The hardware parameter "m3_fw_support" renamed to "needs_m3_fw".
- CMEM remap and CMEM register handling are dropped. CMEM registers are
  accessed within WCSS register space (ab->mem).
- The devm APIs are used for interrupts handling.
- Logic updated in ath12k_ahb_map_service_to_pipe().
- Dependency path series from other subsystem are dropped.

v2: https://lore.kernel.org/all/20241015182637.955753-1-quic_rajkbhag@quicinc.com/
- "qcom,board_id" property is dropped. This is not the direct dependency
  for Ath12k AHB support, hence it can be taken up separately.
- "qcom,bdf-addr" property is dropped in device-tree and moved to ath12k
  driver.
- Currently we have only one compatible enum (qcom,ipq5332-wifi), hence
  conditional if() check for defining the binding is removed.
- "reserved-memory" node is dropped from example DTS.
- "status" property is dropped in wifi node of example DTS.
- Integrated the “Support userPD handling for WCSS secure PIL driver”
  patch series with the Ath12k AHB bring-up patch.
- Removed the RFC tag as all dependency patch series are now compilable.

v1: https://lore.kernel.org/all/20240814094323.3927603-1-quic_rajkbhag@quicinc.com/

Balamurugan S (6):
  wifi: ath12k: fix incorrect CE addresses
  wifi: ath12k: add ath12k_hw_params for IPQ5332
  wifi: ath12k: avoid m3 firmware download in AHB device IPQ5332
  wifi: ath12k: Add hw_params to remap CE register space for IPQ5332
  wifi: ath12k: add AHB driver support for IPQ5332
  wifi: ath12k: enable ath12k AHB support

P Praneesh (1):
  wifi: ath12k: refactor ath12k_hw_regs structure

Raj Kumar Bhagat (2):
  dt-bindings: net: wireless: describe the ath12k AHB module
  wifi: ath12k: add support for fixed QMI firmware memory

Sowmiya Sree Elavalagan (4):
  wifi: ath12k: Power up root PD
  wifi: ath12k: Register various userPD interrupts and save SMEM entries
  wifi: ath12k: Power up userPD
  wifi: ath12k: Power down userPD

 .../net/wireless/qcom,ath12k-ahb.yaml         |  319 +++++
 drivers/net/wireless/ath/ath12k/Kconfig       |    6 +
 drivers/net/wireless/ath/ath12k/Makefile      |    1 +
 drivers/net/wireless/ath/ath12k/ahb.c         | 1234 +++++++++++++++++
 drivers/net/wireless/ath/ath12k/ahb.h         |   80 ++
 drivers/net/wireless/ath/ath12k/ce.c          |   92 +-
 drivers/net/wireless/ath/ath12k/ce.h          |   18 +-
 drivers/net/wireless/ath/ath12k/core.c        |   59 +-
 drivers/net/wireless/ath/ath12k/core.h        |   14 +-
 drivers/net/wireless/ath/ath12k/hal.c         |   84 +-
 drivers/net/wireless/ath/ath12k/hal.h         |   68 +-
 drivers/net/wireless/ath/ath12k/hw.c          |  479 ++++++-
 drivers/net/wireless/ath/ath12k/hw.h          |   22 +-
 drivers/net/wireless/ath/ath12k/pci.c         |   10 +-
 drivers/net/wireless/ath/ath12k/pci.h         |    4 +-
 drivers/net/wireless/ath/ath12k/qmi.c         |  218 ++-
 drivers/net/wireless/ath/ath12k/qmi.h         |    3 +-
 17 files changed, 2593 insertions(+), 118 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
 create mode 100644 drivers/net/wireless/ath/ath12k/ahb.c
 create mode 100644 drivers/net/wireless/ath/ath12k/ahb.h


base-commit: a10b8b584b8bcb7559f068ce247fc27d0c4850ca
-- 
2.34.1


