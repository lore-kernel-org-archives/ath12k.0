Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1053FC3ABD8
	for <ath12k@archiver.kernel.org>; Sun, 18 May 2025 18:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dF/ctAMDYfMCENy4Tz8VtJvwxn2XwmycroxJEEXN6IY=; b=f7Nxe0zles2PFn
	TnI0Mo1U6kbNmqG7Z+sKiphYLQUE/V7HmYcvuE23jY5wSwVsSo1P4yZvdxbcGvxJbqbRthfwq/cEQ
	mSLew34BtyVTgCppquGXdK05fh0TE7QF9jbxgV+s7HC7WkgiI6gmaGNnwEUDf+EyR32aSCq7eJMMB
	2Hh1A+B0sSOJxNxPRfo2O04R95wVkSqamsNv5XSRZRHQHOMGIN+3IsFVtEQyG9tI9HqY5jvi+qYuv
	BPEDBQI2Mre+SB6M2kqayVLYBCFN5lPmsE4h9wxn7uZ52Bk2V2o9VPgQjttL9Ful1NIG3z1rbMU47
	gc4ZRRQ3tqvP4MBLMa9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGifH-00000007PVd-2xBF;
	Sun, 18 May 2025 18:23:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGifD-00000007PUM-2n8B
	for ath12k@lists.infradead.org;
	Sun, 18 May 2025 18:23:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IDrIIu002565;
	Sun, 18 May 2025 18:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dF/ctAMDYfMCENy4Tz8VtJ
	vwxn2XwmycroxJEEXN6IY=; b=cTQ/0icM87rmV9yi/7/YdC6o3xtxnLBcpp58SM
	xi3goohGDXz2YZ1nTSNCcShNyH7VZP6puhssvinIMG8Ae7u4a2WwPlEZ1Oi6Y1gP
	rDaQolPM7vR0gmwDwnoX1CHIWLhqq3iyW0Ew84CsaO2UccPlZfVU0tbSpAd79w3p
	NYO+ghf3j0ge/T9VXcHQ6RalzqpUCVauNGfA8lIQngvnStBMNt5Gqvbq5yWPvr5/
	zLhfJQzFqFzyAMBMx+Rj7B82CXxNnmvOgfanBHvajcqGCVXADJ9SbrhyDGpDwMGP
	NrtYa9PhZWJ6Pj/6rBhnxwBC19TlXtSkMsJa19c1kUCYQ5jQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjmet9r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 18:22:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54IIMtxY017555
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 18:22:55 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 18 May 2025 11:22:52 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH ath-next v2 0/5] wifi: ath12k: Enable IPQ5424 AHB WiFi
 device
Date: Sun, 18 May 2025 23:52:27 +0530
Message-ID: <20250518-ath12k-ipq5424-v2-0-ef81b833dc97@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGMlKmgC/x2M0QpAQBAAf0X7bIt1i/yKPOgsNnW4k67k310ep
 2bmgSBeJUCXPeDl1qC7S0B5BnYd3SKoU2KggrjgssXxWkvaUI+TDRlsZluLZVMxNZCiw8us8R/
 2kFx0Ei8Y3vcD+CWH4moAAAA=
X-Change-ID: 20250518-ath12k-ipq5424-7fc6ec543527
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>,
        "Raj Kumar
 Bhagat" <quic_rajkbhag@quicinc.com>,
        Saravanakumar Duraisamy
	<quic_saradura@quicinc.com>,
        Sowmiya Sree Elavalagan
	<quic_ssreeela@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=RoDFLDmK c=1 sm=1 tr=0 ts=682a2580 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=_D_0yxj2KpVeXhJRIwAA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XTcwk9AP0K8VJz8bpljJzZKaWeMkLEVy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDE3OSBTYWx0ZWRfX6D8+axKQ2b5e
 iDCI3RZQ3IxZtXkiC7dvfC2IIPj1AqV0B/I2i//go6mXQWKH9ss5JK/SqveNDJU49BCYdCrz8mt
 iIAD1I/vN+9ZBRbqra4OYz8F27wxxBvwugfA4DRl1eoopJTJQPzYEn0j1ebC3D3vUHSRjhSbgxJ
 NgRijitmgCgoZTusNcvfGoYAajRclHTgpFMaLwpfPbGBI9FtB1x6s82rt2urNVwv1ky8NvuU1C0
 m77NDTdHRD11wLyyHOinLJNaMi4isSvSCIIc0LPjouiYeq/EaBnnKt9TtzKHzAjyb/JACBWJoLH
 NEB/FddGylgLdHQl49pzn31yt7bnXQ+H8ubsI/WECw/YUkbewfNlTcNcTbJUIo3s9MTD9d6sH4R
 qhsRp8esWtind4EeqWMxhCUWSDreKLxEQFfUSjQDT9sQt1rcgdqoqFv84jWh1o4uogj0FiPm
X-Proofpoint-GUID: XTcwk9AP0K8VJz8bpljJzZKaWeMkLEVy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_09,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=794
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_112307_839229_9AFBF0EC 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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

---
Changes in v2:
- DT binding: Removed the redundant example for IPQ5424, as it is similar
  to IPQ5332.
- Added driver probe data structure to eliminate the redundant switch-case
  logic in the ath12k_ahb_probe() function.
- Validation completed, hence changed from RFC to PATCH.
- Link to v1: https://lore.kernel.org/all/20250130051838.1924079-1-quic_rajkbhag@quicinc.com/

---
Raj Kumar Bhagat (1):
      dt-bindings: net: wireless: add ath12k wifi device IPQ5424

Saravanakumar Duraisamy (3):
      wifi: ath12k: Add ath12k_hw_params for IPQ5424
      wifi: ath12k: add ath12k_hw_regs for IPQ5424
      wifi: ath12k: Add CE remap hardware parameters for IPQ5424

Sowmiya Sree Elavalagan (1):
      wifi: ath12k: Enable IPQ5424 WiFi device support

 .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |   1 +
 drivers/net/wireless/ath/ath12k/ahb.c              | 116 +++++++------
 drivers/net/wireless/ath/ath12k/ahb.h              |  17 +-
 drivers/net/wireless/ath/ath12k/ce.h               |  13 +-
 drivers/net/wireless/ath/ath12k/core.h             |   1 +
 drivers/net/wireless/ath/ath12k/hal.h              |   3 +
 drivers/net/wireless/ath/ath12k/hw.c               | 180 ++++++++++++++++++++-
 7 files changed, 278 insertions(+), 53 deletions(-)
---
base-commit: 172e1570e1d31260f11f43e828d98aff020726a8
change-id: 20250518-ath12k-ipq5424-7fc6ec543527


