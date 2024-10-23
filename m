Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9272D2E016
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 06:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rs3dR3lIk9LXliUg7JlV/IabmOYVvaAGYWji+hb3VLU=; b=4/zguR8E53IqOREBzetgN2nuoF
	VHzMA5tvZqDOZfxAcwJM+dFVTOccXP8Gw334Xy2hP1Q87BnmNsuC/oJDT6eOOi6Jooo2qfgklcrj7
	HO7aPX1EOJL2dlh6C7dH3vs9fcV1DbvN6Xt8uy5Ksa8qC9ieYC70q84qf7AvQbTBs3NIk+vX6IC8u
	NhsWJ9sXHfQwnrLZYjN+cuPJ0p5zKu37GYDEzzx63WmoXUxxEo0mByFv3zlSa5C9qwZTstRVjaLQK
	PZHiaTgnYii9NG1kr62U/xNvlUBVTjx+zzoxGOlpBlOI8KDjM49GfaXga+VGLYNc71B26jfzY+Kox
	QvA5m4fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3UTv-0000000D8Lf-25Dg
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 06:04:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3UTs-0000000D8Ke-38Re
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 06:04:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLaFPI016699;
	Wed, 23 Oct 2024 06:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rs3dR3lIk9LXliUg7JlV/IabmOYVvaAGYWji+hb3VLU=; b=g2UDNZgHklG8+79d
	ZDJAfilKlPk74U5KsbX/jTOuemg+e0CRxPF5rcTGgAdtksEDUfE8ZCQljTOqdAEf
	ILB9Fb0pVrHTyZ1FXeG+odZnYTdK4uLv4PwlTxTPehrilVvyt8n24QSth58PJ743
	POa7bMcLIQMAgG4Q3ZCAh/+U/MIvy1TsZSkulXo/Cee0OGbP49gdTIh+bhF6Vqxk
	rMJ7Kood6sFbD1BqyFzkFMVZUEGpqKGcMLKJ2atRHL9HY2by6g01fUdDodW9YLUU
	6h1by5RUKsGSmbvWdbiSjqUjJY0czprumYMB60/nuEpiTbPpvkVzBAxxrBx6dAeK
	JeMDgA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3xh115-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 06:04:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N64Phl019400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 06:04:25 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 23:04:21 -0700
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
Subject: [RFC PATCH 2/6] dt-bindings: net: wireless: ath12k: describe WSI property for QCN9274
Date: Wed, 23 Oct 2024 11:33:48 +0530
Message-ID: <20241023060352.605019-3-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023060352.605019-1-quic_rajkbhag@quicinc.com>
References: <20241023060352.605019-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QUhtInOjT1dhVnFOagTK6imMalmgsB9W
X-Proofpoint-ORIG-GUID: QUhtInOjT1dhVnFOagTK6imMalmgsB9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_230428_819239_8A5A26E6 
X-CRM114-Status: GOOD (  13.69  )
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

QCN9274 device has WSI support. WSI stands for WLAN Serial Interface.
It is used for the exchange of specific control information across
radios based on the doorbell mechanism. This WSI connection is
essential to exchange control information among these devices

Hence, describe WSI interface supported in QCN9274 with the following
properties:

 - qcom,wsi-group-id: It represents the identifier assigned to the WSI
   connection. All the ath12k devices connected to same WSI connection
   have the same wsi-group-id.

 - qcom,wsi-index: It represents the identifier assigned to ath12k
   device in the order of the WSI connection.

 - qcom,wsi-num-devices: Number of devices connected through WSI in
   the same group ID.

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 .../bindings/net/wireless/qcom,ath12k.yaml    | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
index ecf38af747f7..6c8f97865075 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - pci17cb,1107  # WCN7850
+      - pci17cb,1109  # QCN9274
 
   reg:
     maxItems: 1
@@ -50,6 +51,41 @@ properties:
   vddpcie1p8-supply:
     description: VDD_PCIE_1P8 supply regulator handle
 
+  wsi:
+    type: object
+    description:
+      The ath12k devices (QCN9274) feature WSI support. WSI stands for
+      WLAN Serial Interface. It is used for the exchange of specific
+      control information across radios based on the doorbell mechanism.
+      This WSI connection is essential to exchange control information
+      among these devices.
+
+    properties:
+      qcom,wsi-group-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          It represents the identifier assigned to the WSI connection. All
+          the ath12k devices connected to same WSI connection have the
+          same wsi-group-id.
+
+      qcom,wsi-index:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          It represents the identifier assigned to ath12k device in the
+          order of the WSI connection.
+
+      qcom,wsi-num-devices:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Number of devices connected through WSI in the same group ID.
+
+    required:
+      - qcom,wsi-group-id
+      - qcom,wsi-index
+      - qcom,wsi-num-devices
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -108,3 +144,28 @@ examples:
             };
         };
     };
+
+  - |
+    pcie {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        pcie@0 {
+            device_type = "pci";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            ranges;
+
+            wifi@0 {
+                compatible = "pci17cb,1109";
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+
+                wsi {
+                    qcom,wsi-group-id = <0>;
+                    qcom,wsi-index = <0>;
+                    qcom,wsi-num-devices = <3>;
+                };
+            };
+        };
+    };
-- 
2.34.1


