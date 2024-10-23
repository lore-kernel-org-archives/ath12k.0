Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACD9D2E015
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 06:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UaioJ0eVyiCTzLLnBGtidDZNDYJqhP4CKzB3Elszs1M=; b=fSZJ4z+E8bABgZqT+yE8hEsLKT
	giG44lfBU/lqJIXwNOMwXn3+Vvzd7tEsQRtx66icrCqz1AOOcZiRTGQ3Y3pOk3GcOCOoBEFy3c+rP
	aabP0C2/8j96CLlPsQ82JgsaMkILwc4DBgrB7k6APHyDlB+heOUeUOCWbjpA0Dot13QJyPBGkN6AC
	KLVnFxQ1zqqlvJBYnXZzJZifaYceubye4bpnKxj9WDbs4xxjR7/fLN3XwNzKuNHXeiy5GCKwqwc3+
	YIdj6RJVn5puJZImTGiCnyi0am+mK0KPLuy9F4HhtUNjiDNG9QMHzBZrreFYIM3GOxYhuGiSC32W8
	trYm+vWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3UTr-0000000D8Jy-0Qo2
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 06:04:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3UTn-0000000D8JA-2I8S
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 06:04:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLZk30023371;
	Wed, 23 Oct 2024 06:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UaioJ0eVyiCTzLLnBGtidD
	ZNDYJqhP4CKzB3Elszs1M=; b=LC8nnm22KXQFxhsaIausQP2I6Uggge/iHeQHqS
	iaAmnUZX7isCXSPDpLqC5k+4+krAxJ8lel9m1YJ/iOeq7FpcIg1mxpbRJ68y4zIq
	80geLh1VCKjHhYmNwKQdJJCT+fCmzppNMgT16zmmthqq0L1td72m7PGaxQOBLuj4
	wzv9+XT0XvOovLyJOOLZpFsSpsS6BMj017aBrddBNQARcrk7cOd6CzKDQ0QFI9aE
	1DvRhbP888D9JRtyIXTSHcI7kWL3OSyK9VHxyEEOCkIvey2ZVQMMG3ReJvgcgTOG
	LRXdIKzmOYPOi3sjzRVktzxOR4yyvB2WdINKLNxIjsMiUqhA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3uh110-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 06:04:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N64HBE019296
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 06:04:17 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 23:04:12 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [RFC PATCH 0/6] wifi: ath12k: Add WSI node for QCN9274 in RDP433 for MLO
Date: Wed, 23 Oct 2024 11:33:46 +0530
Message-ID: <20241023060352.605019-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9x18enGXEG3xKUqG5yFVdx8wNvnIt8lU
X-Proofpoint-ORIG-GUID: 9x18enGXEG3xKUqG5yFVdx8wNvnIt8lU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_230423_613518_C85E0261 
X-CRM114-Status: GOOD (  12.93  )
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

The RDP433 is a Qualcomm Reference Design Platform based on the
IPQ9574. It features three QCN9274 WiFi devices connected to PCIe1,
PCIe2, and PCIe3. These devices are also interconnected via a WLAN
Serial Interface (WSI) connection. This WSI connection is essential
to exchange control information among these devices.

This patch series describes the WSI interface found in QCN9274 and
uses this device-tree node in the Ath12k driver to provide details
of adjacent devices in Multi Link Operation (MLO) among multiple
QCN9274 devices.

NOTES:
1. As ath12k MLO patches are not ready yet, this patchset does not apply
   to the ath.git ath-next branch and that's why the patchset is marked
   as RFC. These are the work-in-progress patches we have at the moment.
   The full set of MLO patches is available at:
   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/log/?h=ath12k-mlo-qcn9274

2. The dependency marked below applies only to the DTS patch. The
   dt-bindings patches do not have this dependency.

Depends-On: [PATCH V7 0/4] Add PCIe support for IPQ9574
Link: https://lore.kernel.org/linux-pci/20240801054803.3015572-1-quic_srichara@quicinc.com/

Aditya Kumar Singh (1):
  wifi: ath12k: assign unique hardware link IDs during QMI host cap

Harshitha Prem (1):
  wifi: ath12k: parse multiple device information from device tree

Karthikeyan Periyasamy (1):
  wifi: ath12k: Send partner device details in QMI MLO capability

Raj Kumar Bhagat (3):
  dt-bindings: net: wireless: update required properties for ath12k PCI
    module
  dt-bindings: net: wireless: ath12k: describe WSI property for QCN9274
  arm64: dts: qcom: ipq9574: Add WiFi nodes for RDP433

 .../bindings/net/wireless/qcom,ath12k.yaml    |  90 +++++++++++++--
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts   |  62 +++++++++-
 drivers/net/wireless/ath/ath12k/core.c        | 106 ++++++++++++++++--
 drivers/net/wireless/ath/ath12k/core.h        |   2 +
 drivers/net/wireless/ath/ath12k/qmi.c         |  98 +++++++++++++---
 5 files changed, 322 insertions(+), 36 deletions(-)


base-commit: 7603a9349b2fc64152a734f253cf8d8e5befb6db
prerequisite-patch-id: d1334693a2e8da65ae7b458ee4adb459850ad2e7
prerequisite-patch-id: 87f73b342f67c2636390a7da1294cee90f1fff48
prerequisite-patch-id: 46d8302766527d16cdd90c59ded6cbae0ec4ad70
prerequisite-patch-id: b17db6783b1c35f3e8812f621730fe0a1a57a14e
-- 
2.34.1


