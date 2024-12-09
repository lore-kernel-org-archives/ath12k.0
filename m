Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDADFE7717D
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 16:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cjDpgIH8fj70T83+YQthxk75hzq900MWphzKgsCJSSc=; b=QeLWKeKtLUls0M9zyKTKa9aMTt
	WMCnwkPTZqeXqz35FJbSOLQ7Bjt8vLImJv+USNrUI5lV7128yf8f9Lt0QiC0WEhtuWAyMXC3oZxRU
	E3zdwH9kQgbIQHqJ/JBXGltdCPbPZ4tihLQx9EHq0OH1QWhU32ft30xgkNgGIYNc4Qf9Ptg+/amAA
	6KhzpQHI7TgYtqtOvWdZyi3diopmQ7ZFcYziuxhq7cNACnlu9F8EJm/Yor1oZ4QETnmF/hsiZkYwh
	lkykqKi+5BWHWrf9qRr9iSA70NpOZzj+aNQiUYgjyr6CNUhgyFWz8ndBwQxhhlGvElQY+UOwny9fq
	XC6Cvv4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKh4Q-00000008caV-2nnC
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 16:57:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKh4N-00000008cYo-1PJh
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 16:57:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9FKuSU019489;
	Mon, 9 Dec 2024 16:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cjDpgIH8fj70T83+YQthxk
	75hzq900MWphzKgsCJSSc=; b=PqZA7s3k5pqz454OxLyJVFj1XlGkva40IheCUR
	iYXZo6kRXTumEqB+PYgOHUyqJh5vDyERPbR/vUoIwzN2xUSOGfGx4MkNHmvWUUUf
	OxYoySA/Lq5/hBVS+epJibNoOZXZDUHhEoPKV85dL0yMqvbR7QLztUH6NiSbO70l
	Pp3Z6BfYlyAHaNt7RUhXrQZnyiH+mvaISY/6hckfkApS5b4sn7OOQ5GIGXwHEMzi
	IZUVveJotSfo4mxw6uYVzLhJLxylotbiwFn7/YCn4oUz9FK2MjzWk44cbeMNVILF
	mlmPJ6Wy8AB6yJ6bLYenbpvlrDTZIm2ymRfeIHvQ1HlJzPLw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e3418a86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 16:57:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9Gv5TA003773
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 16:57:05 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 08:57:02 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, <linux-kernel@vger.kernel.org>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH v3 00/13] wifi: ath12k: add Ath12k AHB driver support for IPQ5332
Date: Mon, 9 Dec 2024 22:26:31 +0530
Message-ID: <20241209165644.1680167-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zhFC6i1OvMdIQx8cMPZsUzCiYBDhUVU8
X-Proofpoint-ORIG-GUID: zhFC6i1OvMdIQx8cMPZsUzCiYBDhUVU8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_085715_376833_8A6B9226 
X-CRM114-Status: GOOD (  17.07  )
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

v3:
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

 .../net/wireless/qcom,ath12k-ahb.yaml         |  301 ++++
 drivers/net/wireless/ath/ath12k/Kconfig       |    6 +
 drivers/net/wireless/ath/ath12k/Makefile      |    1 +
 drivers/net/wireless/ath/ath12k/ahb.c         | 1254 +++++++++++++++++
 drivers/net/wireless/ath/ath12k/ahb.h         |   80 ++
 drivers/net/wireless/ath/ath12k/ce.c          |   92 +-
 drivers/net/wireless/ath/ath12k/ce.h          |   16 +-
 drivers/net/wireless/ath/ath12k/core.c        |   35 +-
 drivers/net/wireless/ath/ath12k/core.h        |   12 +-
 drivers/net/wireless/ath/ath12k/hal.c         |   82 +-
 drivers/net/wireless/ath/ath12k/hal.h         |   66 +-
 drivers/net/wireless/ath/ath12k/hw.c          |  477 +++++++
 drivers/net/wireless/ath/ath12k/hw.h          |   15 +
 drivers/net/wireless/ath/ath12k/pci.c         |   12 +-
 drivers/net/wireless/ath/ath12k/pci.h         |    2 +
 drivers/net/wireless/ath/ath12k/qmi.c         |  169 ++-
 drivers/net/wireless/ath/ath12k/qmi.h         |    1 +
 17 files changed, 2520 insertions(+), 101 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
 create mode 100644 drivers/net/wireless/ath/ath12k/ahb.c
 create mode 100644 drivers/net/wireless/ath/ath12k/ahb.h


base-commit: 400568fb3b022247c1603fdbdd6444b3ef14ffce
-- 
2.34.1


