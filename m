Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AB9C0218F
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 05:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vTmSNMvWa7aHztpCq9QeQ0kAqikAkYF/X4ybEf7jyEI=; b=WEFKmaW6IE65B+iyWfftZojTMC
	NGTH/VjaojvRGTQB0dx5Sisi/dOx3Ei6Ry9uiwsOHu9C9cUEC9Ot8BRLZ58jZHJTbZKwEdnjoPHSo
	XsHeFTCruM2HREhhfvJwNwEV2XYp3UNxAw0lH+eYVBrfIDlAahta3QcOx7FLYRSMTRYb1uxqI73sm
	JIqG1CtbUaH/MN4vMBXfxSbg1Q5Np4rXocsFB66NZ7GiZIa1G4N6SOlm97f0IBigCKYcQNWga1h+m
	ieDfRPp66hckrtYqWgsLTIavFgHc7MEN1feJIHsqpydGCeC1KAwcVuM84q93BJfQMK2yLwJhLfDFd
	POt0Bcyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdMxk-00000008EqI-2PON
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 05:19:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdMxi-00000008Epc-2HOu
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 05:19:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U2o81s014792;
	Thu, 30 Jan 2025 05:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vTmSNMvWa7aHztpCq9QeQ0
	kAqikAkYF/X4ybEf7jyEI=; b=h5UDMz7Na2JlY6EHi1G6Al36+N0rmSkMumX78A
	YKVIwaz0AhJuQHVIybPWGVNqHxaUpF5XRPoVm6PEpoQbCCzg0iHtIONElVj56JQW
	IEV9xQupAkDXWY29Co/unSD/5VQf9YpEgvUtCcSHwZe6DItoMFJnTfBufiXGQS01
	6gxonMN1bDtEZii1fhKF5zV2zww2T/IiwNygQpdzpuHNPQk8R/Xt7GZ43aIKMxlM
	FsDFInxbktj6svv8sPnUE8yMdh9pfteIRPYxQ3qS44m+lynWbisRuftaIKnxhlOB
	2NseZDtzJvJyGzAmXaIABeSFLR5ThOSOt6ZPWcBWN6S8bEBA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fyxnra2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 05:19:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50U5JVmi001535
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 05:19:31 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 Jan 2025 21:19:27 -0800
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
Subject: [RFC PATCH 0/5] wifi: ath12k: Enable IPQ5424 AHB WiFi device
Date: Thu, 30 Jan 2025 10:48:33 +0530
Message-ID: <20250130051838.1924079-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MqrnK7mjmTZiEsQzalPxAJCTaZ_skXz1
X-Proofpoint-GUID: MqrnK7mjmTZiEsQzalPxAJCTaZ_skXz1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=547 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_211934_586867_E872BC1D 
X-CRM114-Status: GOOD (  10.13  )
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

Add support for the new ath12k AHB device IPQ5424, as currently, Ath12k
AHB only supports IPQ5332 WiFi devices.

The IPQ5424 is an IEEE 802.11be 2 GHz WiFi device, supporting 4x4
configurations. To enable the IPQ5424 device:
- Add the necessary hardware parameters for IPQ5424.
- Modify the boot-up sequence for ath12k AHB to accommodate the
  requirements of the IPQ5424 device.

Depends-On: [PATCH v5 00/13] wifi: ath12k: add Ath12k AHB driver support for IPQ5332
Link: https://lore.kernel.org/all/20250130043508.1885026-1-quic_rajkbhag@quicinc.com/

Raj Kumar Bhagat (1):
  dt-bindings: net: wireless: describe the ath12k wifi device IPQ5424

Saravanakumar Duraisamy (3):
  wifi: ath12k: Add ath12k_hw_params for IPQ5424
  wifi: ath12k: add ath12k_hw_regs for IPQ5424
  wifi: ath12k: Add CE remap hardware parameters for IPQ5424

Sowmiya Sree Elavalagan (1):
  wifi: ath12k: Enable IPQ5424 WiFi device support

 .../net/wireless/qcom,ath12k-ahb.yaml         | 119 ++++++++++++
 drivers/net/wireless/ath/ath12k/ahb.c         |  82 +++++---
 drivers/net/wireless/ath/ath12k/ahb.h         |   9 +
 drivers/net/wireless/ath/ath12k/ce.h          |  13 +-
 drivers/net/wireless/ath/ath12k/core.h        |   1 +
 drivers/net/wireless/ath/ath12k/hal.h         |   3 +
 drivers/net/wireless/ath/ath12k/hw.c          | 178 +++++++++++++++++-
 7 files changed, 369 insertions(+), 36 deletions(-)


base-commit: a10b8b584b8bcb7559f068ce247fc27d0c4850ca
prerequisite-patch-id: f80453350a37c9910405b6689cd6d64657186034
prerequisite-patch-id: a505f82268ec8f6502e49a9170b984fb618a6205
prerequisite-patch-id: 4bb8e397fa2a3d0db778a6a59142093b0aa9a93f
prerequisite-patch-id: aa840ba06263db886c7bb245b5a67391f22a4e17
prerequisite-patch-id: 158aa0efa9976ce0fcb42cb469f8397e8346002f
prerequisite-patch-id: 3fe11b0b9b5674d6cabe50b5db567a3ba83455a7
prerequisite-patch-id: 2740fccb97bc936614e99d17b2fc7bf6bb69d466
prerequisite-patch-id: 9b547828dabf6ed0fe18bb3cbb2ccf1fab342f17
prerequisite-patch-id: 8e9198573ddf090cec36adabc22ed9596ecef93e
prerequisite-patch-id: 9b8b2be5bd9496f9d4374d8aacfc0c9cbe94f318
prerequisite-patch-id: 70b7506b99f65b6be7407ebd43198cfda91264fe
prerequisite-patch-id: 7991ff8ab03c0a8287efdb9e54a808b4c6a93c61
prerequisite-patch-id: 90f0ff045d14b9962f94d98f8b6670602fc77b52
-- 
2.34.1


