Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDFEC19F32
	for <ath12k@archiver.kernel.org>; Wed,  5 Mar 2025 18:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9IyvEM6/6G9eM6U104p737xMSJTdDyrVmrBZ0qReOIc=; b=sW/74HB2gWDp7vt1WlRXI5jS07
	miEOoDud++0Cgiu4uLKqyFmAJshmicJugXVqmyVvC7DQK2ITMkmFDF98qUq9Z1BfT3lT5K2IHRgPu
	ehbYYsnNvKO+7Fy6mEgmKK4kjop4bulDbRkFSL1qExfXLQZ5aekl/1DyqM2qCYiSZlpJkQaopiCCO
	6pLfvKRoJxlkWWMSHtz91z43tGfX2Z/jti20QlphG7EWfn6t5LwoythBcLOnb9zMebqrG3T2KuqEf
	sCvgLtes1uciMFqwu33UOErckqlKwVXVx2JHNAXD5FZk1Lv8E4p78XQYBgjsetNd1YjsRucK3tCi7
	G92AAv/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tptxY-00000008zak-2VSw
	for ath12k@archiver.kernel.org;
	Wed, 05 Mar 2025 18:59:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptty-00000008yx9-0fNo
	for ath12k@lists.infradead.org;
	Wed, 05 Mar 2025 18:55:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525APb5r008881;
	Wed, 5 Mar 2025 18:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9IyvEM6/6G9eM6U104p737
	xMSJTdDyrVmrBZ0qReOIc=; b=mnaSlqiOsXIIB4U16SIJammNnFeSQXJIc7K2gj
	M7+F5LZj8pIvo3fRBhcRWjcojqOcXX6h0+t2uiWCe+JyBcfUUg4QDFrNlVBIVmlz
	NZBhN9yQrfOaFfTEhYTtZFf8CGMAYrqlzUnEdm3Ue3nL2pcBv0gm7k1PY3NQ0U15
	xbW8VzJgluOUmz389hC7EPXldKyQszrsFzai4sgAHvc6Fx2ZLTN5NblLSabfHGEW
	dWhyNqZEl+QC5aA+3v6kGTUvI7ESVy0S/xP8tdMZaX4sXCoDooHrKOS2jA0hJ093
	xTyPU2eMAEt9CjVUUostOa9y+czKrOtaok3sjspU0D/SM/Tw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6v6e0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 18:55:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525ItOMk009886
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 18:55:24 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 10:55:21 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Raj Kumar
 Bhagat" <quic_rajkbhag@quicinc.com>
Subject: [PATCH ath-next v9 00/13] wifi: ath12k: add Ath12k AHB driver support for IPQ5332
Date: Thu, 6 Mar 2025 00:24:48 +0530
Message-ID: <20250305185501.2400888-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LkMfXS094zdW68chdNmUGt-p22_yQpkb
X-Proofpoint-ORIG-GUID: LkMfXS094zdW68chdNmUGt-p22_yQpkb
X-Authority-Analysis: v=2.4 cv=fatXy1QF c=1 sm=1 tr=0 ts=67c89e1d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=cGRcoztS1dbot-ufV6AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_07,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_105530_324397_DB737FEB 
X-CRM114-Status: GOOD (  22.08  )
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

v9:
- Fixed memory leak in ath12k_ahb_probe().
- Removed tag "Reviewed-by: Vasanthakumar Thiagarajan", in the updated
  patch [08/13] wifi: ath12k: add AHB driver support for IPQ5332

v8: https://lore.kernel.org/all/20250228184214.337119-1-quic_rajkbhag@quicinc.com/
- Fixed format specifiers warning reported by kernel test robot in patch
  [PATCH v6 07/13] wifi: ath12k: add support for fixed QMI firmware memory

v7: https://lore.kernel.org/all/20250227191034.1949954-1-quic_rajkbhag@quicinc.com/
- DT binding: DT property 'qcom,ath12k-calibration-variant' renamed to
  'qcom,calibration-variant'.

v6: https://lore.kernel.org/all/20250225064834.2002499-1-quic_rajkbhag@quicinc.com/
- DT binding: binding doc renamed from qcom,ath12k-ahb.yaml to
  qcom,ipq5332-wifi.yaml.
- DT binding: rephrased memory-region description.
- DT binding: dropped description for memory-region-names.
- DT binding: updated maintainers in binding doc.
- The API ath12k_core_get_reserved_mem_by_name() has been simplified and
  renamed to ath12k_core_get_reserved_mem()
- Removed unnecessary NULL check in devm_clk_get() error handling.
- Dropped all ath12k_ahb_clock_* wrappers for single clock.
- Removed shutdown callback for the ath12k AHB driver.
- Reference count leak handled for rproc and rproc phandle.

v5: https://lore.kernel.org/all/20250130043508.1885026-1-quic_rajkbhag@quicinc.com/
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
  dt-bindings: net: wireless: describe the ath12k AHB module for IPQ5332
  wifi: ath12k: add support for fixed QMI firmware memory

Sowmiya Sree Elavalagan (4):
  wifi: ath12k: Power up root PD
  wifi: ath12k: Register various userPD interrupts and save SMEM entries
  wifi: ath12k: Power up userPD
  wifi: ath12k: Power down userPD

 .../net/wireless/qcom,ipq5332-wifi.yaml       |  315 +++++
 drivers/net/wireless/ath/ath12k/Kconfig       |    6 +
 drivers/net/wireless/ath/ath12k/Makefile      |    1 +
 drivers/net/wireless/ath/ath12k/ahb.c         | 1156 +++++++++++++++++
 drivers/net/wireless/ath/ath12k/ahb.h         |   80 ++
 drivers/net/wireless/ath/ath12k/ce.c          |   92 +-
 drivers/net/wireless/ath/ath12k/ce.h          |   18 +-
 drivers/net/wireless/ath/ath12k/core.c        |   60 +-
 drivers/net/wireless/ath/ath12k/core.h        |   14 +-
 drivers/net/wireless/ath/ath12k/hal.c         |   84 +-
 drivers/net/wireless/ath/ath12k/hal.h         |   68 +-
 drivers/net/wireless/ath/ath12k/hw.c          |  479 ++++++-
 drivers/net/wireless/ath/ath12k/hw.h          |   22 +-
 drivers/net/wireless/ath/ath12k/pci.c         |   10 +-
 drivers/net/wireless/ath/ath12k/pci.h         |    4 +-
 drivers/net/wireless/ath/ath12k/qmi.c         |  210 ++-
 drivers/net/wireless/ath/ath12k/qmi.h         |    3 +-
 17 files changed, 2505 insertions(+), 117 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
 create mode 100644 drivers/net/wireless/ath/ath12k/ahb.c
 create mode 100644 drivers/net/wireless/ath/ath12k/ahb.h


base-commit: 3148fc3cf193dbbd2e14eee59468a510a38bf604
-- 
2.34.1


