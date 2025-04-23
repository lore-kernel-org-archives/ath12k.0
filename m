Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29460C369D7
	for <ath12k@archiver.kernel.org>; Wed, 23 Apr 2025 05:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxw+NfrdMPER0fLgTceGWbFR63MWOrOr6EROBNXigRo=; b=NPC+JZxRywuoivJK6b+pSKgsI6
	x4+afNAW3fxTZUJwA6b9PJieyLM44MogizPxXav6FUQJK9p0fLmdZj2BlS+juZhYG9bfRm5E+GjSR
	aq3Uad41HydrVy0pb3v+bhtZK/kK9w+R2V2c2mDfFEqKiQgk31+DFrb4J7kdXgLPzYLHGShrOsxJp
	8gZv9jXCnhWjtcUEX4VUiFfAvIIqfQvFDoVqYmKh0vLtKXcry1bLtZEPoMLDzkEduTg3oBsOQ0p4B
	leWobjZd9Lrgr/3RMpjwwDpIpN5hJgSc0djtvgpwaGEyGPTDmcpgfg1lnGptxZCIi6ZYOhf1Va2Ow
	AHraHCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7SsG-00000009G7X-3rkR;
	Wed, 23 Apr 2025 05:42:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7SsD-00000009G6K-3qim
	for ath12k@lists.infradead.org;
	Wed, 23 Apr 2025 05:42:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iAdT023892;
	Wed, 23 Apr 2025 05:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rxw+NfrdMPER0fLgTceGWbFR63MWOrOr6EROBNXigRo=; b=P4Dr5os9LED3a8p0
	NZB7jxE7CC5Um1NSDAqZnKlH0QJGnf/R1dgpFUPBjuiJgVDK5Lh54RphclkhsQ7L
	GS8R0XaZOUi0VessUpl7K7SCKoqVtOrQ2K8J0SoaUT831xqC98aObKhgSJ2ObD7t
	7sFx/o/jlNmJXgCQogeqHHedNZWHSr9MFml4CqJPcOdBOpXOHGQbVfKwyJUnyy/5
	aKCnacgaEQyaOvY3o33zBVB5cLqeySXvAP6vkkS72NPZI56HShfBAi2h+npjCo8T
	AQGuAiWWE40fILEegx7UQlJjyxaXjStjI/W6NfW4DHJ+tndWueSrEer7IcrITfql
	I+SfIQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh38yfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 05:42:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N5gGhS012684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 05:42:16 GMT
Received: from localhost.localdomain (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 22:42:14 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <jeff.johnson@oss.qualcomm.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        "Miaoqing
 Pan" <quic_miaoqing@quicinc.com>
Subject: [ath-next 1/2] dt-bindings: net: wireless: ath12k: describe firmware-name property
Date: Wed, 23 Apr 2025 13:41:51 +0800
Message-ID: <20250423054152.2471568-2-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250423054152.2471568-1-quic_miaoqing@quicinc.com>
References: <20250423054152.2471568-1-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 66P2PQkm7bnliq3e4NAEThNSWSZ1lIlE
X-Proofpoint-GUID: 66P2PQkm7bnliq3e4NAEThNSWSZ1lIlE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAzNiBTYWx0ZWRfX44TKDKvSE9j0 +h1bvU8MwYXbb8xilfb1VTt1gemdLBChrsOBhA38V3p8tnRhPla5D1wyuAP57Q3kCq+B0jMEctZ UklnqCWxPtVAxK9eCbkLEmIQ/3gnSPlRTjKR53aTDaEZmOtNeVzmXD6GNZCYTqtwiO2TTlIQukq
 4zSAmJNoZRcKQcGDjCwGjWgzXsTa+ipQCJ3iRTnmh/NjQinaWFxfPVGspIiNddKRod0B9uTBkQg Pp4d3PsF2DKFnUSV8lsLBCdiTiuUSDOH7q8tny3qeb0FwvUUPPKcVDSOJ3uoNFz4O3SpEm6LRxO 8NdSbQ5MAw89SO8327hUQQxTC0fk/vZLKzXJK4PvuMnl6i6pnvCfZzTT0BHvFL8u5xdGA6T60pw
 /UVq38DYTZAI4Z6beInyh//o//9v8Bpt+UYlXJRTSyYfWiG1K38MpRH5IkCmtQrZZBF8gi9C
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=68087db8 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Hda1I3ypr0uxOpTqMjQA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_02,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_224217_963363_77EA94DD 
X-CRM114-Status: GOOD (  10.17  )
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


