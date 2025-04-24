Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47E6C369CB
	for <ath12k@archiver.kernel.org>; Thu, 24 Apr 2025 01:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxw+NfrdMPER0fLgTceGWbFR63MWOrOr6EROBNXigRo=; b=4x583sv5HaoTg/FQkAXaAMtN0Z
	m88zmRpUhHzoOg7fjEig0NJHQd0SEjHT7BpLY6rtqyx/HjEnKhrBs1gwdM8iAkMVH+W/FQ0EyWbGY
	+0wiWIZiQoJkAXf3Zc6bEl/fZC2Xg3pN+b99p9CPoYcpEGa65SHWj2SrkxbOgwkdh+79XHC7aJVTt
	46ZTzN7E5qaKqsCzE20b1JZUFyVnjesVIrhqiLujw7oZvttXZs0k+L34GRoUtR7nvF1Y0X/1soHur
	U/vujjoWkV1Y82UeRdLrbXB60YgT8AU/CbCFLN5/7Xc43XUMlEgQivF73ZZsgmbNsCiWCKS8SKX/2
	rCpZDWFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7l8y-0000000CUZU-2rq0;
	Thu, 24 Apr 2025 01:12:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kuG-0000000CSDy-1nhC
	for ath12k@lists.infradead.org;
	Thu, 24 Apr 2025 00:57:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FHOF010443;
	Thu, 24 Apr 2025 00:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rxw+NfrdMPER0fLgTceGWbFR63MWOrOr6EROBNXigRo=; b=FVnaROU9FUJqrRn9
	6m33bnNCIGqUfnRfYLuJgmBtf1qj3P7rll6QsLmFT97WHTZ/92TD/TZO0OTL6TmQ
	rr+nnS7b9vZfdIBsOFipa34mIlpPkakcOumQQOvenEJLUX3yJI7nsPaMhiAwmFpC
	ecPjhMjPrzcTHww8HI8LRTGeKKt2UFkzC/f6pvaEXTfH7M9zokoF5s+9ue5miAZd
	kAladg4Wip0DKYPfuj3LUVt2pG0ZjrTAJmlBqYXWKMrHc4kjaLOA251BqNa5nWqL
	9C72prXVgp2yx/tyl2Oe+elEJKq8gQ/SMZInbMgRt9wLWvOISYg0gZKuGe/WrGNl
	t7F40Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3ksa9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 00:57:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O0vVIt014691
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 00:57:31 GMT
Received: from localhost.localdomain (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 17:57:28 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <jjohnson@kernel.org>, <johannes@sipsolutions.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Miaoqing Pan
	<quic_miaoqing@quicinc.com>
Subject: [RESEND ath-next 1/2] dt-bindings: net: wireless: ath12k: describe firmware-name property
Date: Thu, 24 Apr 2025 08:57:02 +0800
Message-ID: <20250424005703.2479907-2-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424005703.2479907-1-quic_miaoqing@quicinc.com>
References: <20250424005703.2479907-1-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: m-52EevU8MlSSyt468fHo5aR28Sz8YrS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAwMiBTYWx0ZWRfX3xqsIDnHw40M iuw4PtkoEqyM+vnvkYbQrd8lD+qGBHjwdfzDeh9ks/x9HmyS6eSbyJ8pmBvJepsz4DlZgOs/Qzu Qkj0nllMwLkC1bPcpQCPQav+ltWBxB6inPgeDMbHrp/19I/97E5BCIHkWQMXPKUe+1teBWXWytF
 7sC5UqSVo2CECFjZp2LVUQwIv3jvpZ3AtdskOWlq3kSRVoUjWvxu+5dv6z0Uu9q9hMj2cjuFdFz FRzL2wWMktPkA9ZleZNO6AQxjWpYzmn1zNXS8sRgeC5dKtWjRoI1kbkoBm0iAs4ldZl4Q545uUT cQXZpZi4vQt5Hg4ZUZ4oW2SMeeO/FCEoPN7gjHHAVCEg3uGXltyw1x/HhvCu/oQQyrko1fbtyOP
 bUZy8nOaTPz4oFfjVmBiHWzzxwXedyT6Ofjg/bMP6/aZEea01+x4ePNJ27GQ8giqT8Ep7SjW
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=68098c7d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Hda1I3ypr0uxOpTqMjQA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: m-52EevU8MlSSyt468fHo5aR28Sz8YrS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_01,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1011 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_175736_639699_090626E7 
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

Introduce 'firmware-name' property to allow end-users and/or integrators
to decide which usecase-specific firmware to run on the WCN7850 platform.
This is necessary due to resource limitations such as memory capacity and
CPU capability, or performance and power optimization for different
application scenarios.

Two firmwares are supported: 'WCN7850/hw2.0' and 'WCN7850/hw2.0/ncm825'.
The former is the default firmware, suitable for most WiFi 7 STA
functions. The latter adds support for commercial-quality SAP and
optimizes power consumption for IoT applications.

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath12k.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
index 9e557cb838c7..dc68dd59988f 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -21,6 +21,12 @@ properties:
   reg:
     maxItems: 1
 
+  firmware-name:
+    maxItems: 1
+    description:
+      If present, a board or platform specific string used to lookup
+      usecase-specific firmware files for the device.
+
   vddaon-supply:
     description: VDD_AON supply regulator handle
 
-- 
2.25.1


