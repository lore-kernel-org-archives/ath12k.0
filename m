Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E87CCE7AA8
	for <ath12k@archiver.kernel.org>; Fri, 14 Nov 2025 10:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahWiBjMc2fo3WP8rF99Mw4GcS3iUglJWkT5uYMXPyOs=; b=PCmR9bgRzSAfrphjG8lp3297+l
	+cYihpr70AGpH3duD7Ax9pEZsfegADBHN0uI5+EnkBk2kqsCAQT9lgbhK65CHH1+prpYznSGLjCeD
	DIdc8XZb0rCUSQ02jVQ4DDZ6ayN+g9YVi3DhP1dSQPBq2Wnj3cMzx8+mI/ppRz/w7wPRO8JkYxhHO
	cZ8ERxvSEoPp9RmkFXrUJgEWsUIXZauJ30fBrxU5hSpG5ferTzRbb3IRrgVQdTYngPAlbv+LbaAlu
	3cCYN+I9ga1hg/c+yYeZJyvOkq9UqBWvaCUL97rLN/+/0inGqVGksscvyW8xwf0kmjtYdBzFitvx+
	kHC+sgig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJr7Q-0000000C1Zz-12G7;
	Fri, 14 Nov 2025 10:33:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJr7N-0000000C1Z8-3x4h
	for ath12k@lists.infradead.org;
	Fri, 14 Nov 2025 10:33:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8SZKO1699682
	for <ath12k@lists.infradead.org>; Fri, 14 Nov 2025 10:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahWiBjMc2fo3WP8rF99Mw4GcS3iUglJWkT5uYMXPyOs=; b=HCwPMqUTwUNRWF4E
	u0ZGfTiYpzvQ3tb0ucmstDJkS/3ZNwPz+VVXwUWJGD5eqh3i3lzJgFkajsxvxp6e
	AgrUEDx+GnJsIdq6qaOOdN9FBTQozBsKjAvEzxJ5cXHcsOQWdkm5b2yABIAEkE53
	B0x1FsVnm+8KwWG8k8enKItScKckXKEpP68ij/tadSKMcSvOebc3rIRYXIrlhrPa
	KleZlNPN0g7gVR/hMq+hs6gLoKRyn+yfRD6cK2OGXecBhFGXBW2Jaj95jIy3VVFu
	MyjEovc0ooYtlbfwN3ZIkkNzXdP4lrCsB5CgLmQXk3drwKOHaJrGNdJKLnkKT49j
	nGDolw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9e1upe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 14 Nov 2025 10:33:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-89eb8ee2a79so1089655385a.2
        for <ath12k@lists.infradead.org>; Fri, 14 Nov 2025 02:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763116404; x=1763721204; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahWiBjMc2fo3WP8rF99Mw4GcS3iUglJWkT5uYMXPyOs=;
        b=BXirWPzfXJGl1acVFu5xz+Qpzn4sCTQwMKkV6PVCLx05sOJHFnhPtFp3ciPTYfyOSe
         74r5bxPOhl1riSiR79RNSkpl7j8Fv8ya/6tESl5+xXTYPFhqUBrbjFZc3ULlHcix/jbh
         CsQ4WkcBQQOh1p7bseW0xmFe7/W6XIXRGPxTALZmCt9wUGSPpklTsBTPvoksTqS4N7ZX
         v1F0EdgPphu0G9pVS5dM+c/5NHS0c0Fpp8QpyiGV2qEjAQDFNnE6wJBR1bc4R499Nzl/
         J+os4yGRrgBUSm9r1/cF6FNQCaGZw11jvOrJUsJd8mygLRTUrVARdSy6bVf0VcMVssTs
         Od1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763116404; x=1763721204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ahWiBjMc2fo3WP8rF99Mw4GcS3iUglJWkT5uYMXPyOs=;
        b=KMp7ewCOhj+K4dybsMeX4LVhsMbDVUg0gtduBmaQNwR+nghIjfDPzn7A22BOLVgtuP
         aathKWBi54gGmDVT7yuv1CxTyXDoRtssHEnv4usiNBAQ0JFNNAUkyplwfY/xyhYyzNFY
         i2LWJxNoztS8DgqdDSMrYJgODKGBBq47Zz345KElx/g/bOUO8Oi8K1Ve2NEqicrjGZBE
         q3BGLdQ5yE0sLUaDxRlB/J9aOkUMTgOAK+Gmk5M+/5FGunEM9uLABLZ5t6lSjxHZh4Ci
         6iNjnypRQ4TKEnLZrRjfncxhuBgyTk12Vr7yMOVjnVMGaXXJWK4opxcLsqFMeGn7DFvw
         lRqw==
X-Forwarded-Encrypted: i=1; AJvYcCXUhporWX3pNAjDU9v0+8zF0xtSEaMj+T1m0ebG1Tt7ulThAj72xI5rXGsmBV/3KEV/dHkj03I=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm40GJAt9tiySn+g+Tmm2MTXfzdiB6PKAtTl3+TeC88P5sfE+m
	7mYTegf64ZJxApoeT0/mCvSEJ+m+whiFvah0KDip6l7iciuonhmlK7HihJz1Bo2aTKhF5cS98aD
	JyIg05WLHyGvVBrlg1k6eVH75RkJio+L5QLMKWwfuWBf0soY+qDoRNrEERZDKgzhm
X-Gm-Gg: ASbGncuL/kPOW85ZMHiFnGbM6KsD5ALqp040uT2bZH8Lr1KsjQDYvnkudffXUUUifQG
	fTFVu7O99onCXUXgBFrMmqq2JIEePHYccNVLgxtHIWbl7MtM8uvuGvgpa/9PO+NWG4DF663CcV4
	LBPkz+9yQBetfNW290dQ8Fij4ENl/M1yH3587D0q+ml6wEDDn8eQEKRrc+Q3X8cRMMF4ZbUvnty
	rPpoL8Z3NjGNcXgYKIeXhLMMmqJvBx07rUUe82lHDkGcWuiz54uun4lHs7cCjuJwt2loJAvp5CG
	9tMbmtI5haWOtCSV6vFMhP+6+5mDOYOsdbM2y+eraI3FuFfYT8MHAkZDv/6w4bB8MFWqNdE/yBG
	BWz/BTiLXOwu3J+sDkddmdoLM8Tfz
X-Received: by 2002:a17:902:f54a:b0:294:9699:74f6 with SMTP id d9443c01a7336-2986a755558mr27623735ad.43.1763115768537;
        Fri, 14 Nov 2025 02:22:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAYL4yAe6yDVMwggNZYuI710G44ZijcHgePARCZdvnUFPU4HcL5StexME9kyo5opZ3RwNdRQ==
X-Received: by 2002:a17:902:f54a:b0:294:9699:74f6 with SMTP id d9443c01a7336-2986a755558mr27623385ad.43.1763115767997;
        Fri, 14 Nov 2025 02:22:47 -0800 (PST)
Received: from [192.168.1.102] ([120.60.77.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245edasm50883705ad.27.2025.11.14.02.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:22:47 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 15:52:20 +0530
Subject: [PATCH 2/2] dt-bindings: wireless: ath: Deprecate
 'qcom,calibration-variant' property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-ath-variant-tbl-v1-2-a9adfc49e3f3@oss.qualcomm.com>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
In-Reply-To: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        devicetree@vger.kernel.org, ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6347;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=k3nnJASyGzjwvyMuUxQFV6JFb1OmNF6MwYd2U70py9w=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpFwLfhfLZG7hwNQalZFkaKtKe3vWWu+Xk75X+w
 3YQ7r9LW1+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaRcC3wAKCRBVnxHm/pHO
 9RzaB/97wv8NzPTBqYcKzOK7mewrlHPXfc4PuQvOcHEq+C6zeuGwE/6GKb6es/Yu62eOuhB6Hie
 GO8peTK4ZSKZ+2ofnCcGa8ySrZ5V3I9QFVvdNi+kRBn6R5FEj5NwSC8iH4o8Z+7NSjycB3mMJ/Y
 DqtNHur05DpfSrHGw4JBJr5X59dTQ68J7Dulq02j/28f1Ee1zsYMYh65CHoHBj26cDYDf2tbwLs
 ONi3hrlOjc39Dd1qKMRvvYwKR3gi3Tm9PJSvBNOWdQ8EVF1JXnBTVTLg6Jaa2ruxKdvZyXVgh6T
 07ZlWPoJTAtwEjRrKRJOG2LdsVTYfG3gny5Nm8dY1HWW/+zl
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-ORIG-GUID: HQAHwF0rkmE45sPzZ0yaPougoAOO8bgv
X-Authority-Analysis: v=2.4 cv=SvidKfO0 c=1 sm=1 tr=0 ts=69170575 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=9R49FEQIXN7mQozuOwW6cA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SpmQgKv4x172yhoqWS8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: HQAHwF0rkmE45sPzZ0yaPougoAOO8bgv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4MyBTYWx0ZWRfXyc9f5FhVBCjb
 PhI94umAMuyklXdNZjbMA/zKjUDgWtoAcDlbc15PIL1bp7cc1cGEi+kJ5RAu+eCdb+hPshJy9yb
 AcHLksUc4rL5wSqEAwN7WDW3IW9TTHhQfvF07TXgN5lUjzcU3hMSN9+y8ZQim5emPyt2VKvDk6e
 0uFmaUe/HhiCmjRoK7VQYCLHNSBZLSFkBZtO0jZGGLkaW3JwUqStdY4JkjT4cMqDyWZxRGdnB4/
 qtIso7ZTH79GDqtSHxCmUrMoPRYM/JQlHpQT9uXxfdaGTkp1aETEAcRedzzLk6eTnSULPYgMFtJ
 8c2YT9nEjRcQN9Zx/1vkH7Fb/8dg51/gMqxtbJj1tJ3mKS1uryryzwFGhZW9YBsnCgCYgGQTa0r
 JRiw+DsSpHoisgLlcNQhlddFfevemw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_023326_006207_38AB4391 
X-CRM114-Status: GOOD (  16.35  )
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

On devicetree platforms, ath{10k/11k} drivers rely on the presence of the
'qcom,calibration-variant' property to select the correct calibration data
for device variants with colliding IDs.

But this property based selection has its own downside that it needs to be
added to the devicetree node of the WLAN device, especially for PCI based
devices. Currently, the users/vendors are forced to hardcode this property
in the PCI device node. If a different device need to be attached to the
slot, then the devicetree node also has to be changed. This approach is not
scalable and creates a bad user experience.

So deprecate this property from WLAN devicetree nodes and let the drivers
do the devicetree model based calibration variant lookup using a static
table.

This also warrants removing the property from examples in the binding.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml     | 1 +
 Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml | 3 +--
 Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml     | 1 +
 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml | 6 +-----
 .../devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml         | 2 +-
 5 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index f2440d39b7ebcda77db592de85573bec902fb334..efe11bdec30dcdb6d48185b68093ea8c247b8c3d 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -107,6 +107,7 @@ properties:
 
   qcom,calibration-variant:
     $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
     description:
       Unique variant identifier of the calibration data in board-2.bin
       for designs with colliding bus and device specific ids
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
index e34d42a30192b80311a4c6bb41bd3c8ffc66375f..df7d7aae3343168ffa92bcce16a0b429a6d7bfef 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
@@ -24,6 +24,7 @@ properties:
 
   qcom,calibration-variant:
     $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
     description: |
       string to uniquely identify variant of the calibration data for designs
       with colliding bus and device ids
@@ -139,8 +140,6 @@ examples:
                 vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
                 vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
                 vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
-
-                qcom,calibration-variant = "LE_X13S";
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index c089677702cf17f3016b054d21494d2a7706ce5d..45ae5d3ca73b75b0755466f4dd92df1625dcb4c1 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -43,6 +43,7 @@ properties:
 
   qcom,calibration-variant:
     $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
     description:
       string to uniquely identify variant of the calibration data in the
       board-2.bin for designs with colliding bus and device specific ids
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
index 589960144fe1d56eb6f15f63a2d594210e045d27..cd6604eab5f3608811805d204a4c59ce1dcc060a 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
@@ -54,6 +54,7 @@ properties:
 
   qcom,calibration-variant:
     $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
     description:
       String to uniquely identify variant of the calibration data for designs
       with colliding bus and device ids
@@ -110,8 +111,6 @@ examples:
                 compatible = "pci17cb,1109";
                 reg = <0x0 0x0 0x0 0x0 0x0>;
 
-                qcom,calibration-variant = "RDP433_1";
-
                 ports {
                     #address-cells = <1>;
                     #size-cells = <0>;
@@ -146,7 +145,6 @@ examples:
                 compatible = "pci17cb,1109";
                 reg = <0x0 0x0 0x0 0x0 0x0>;
 
-                qcom,calibration-variant = "RDP433_2";
                 qcom,wsi-controller;
 
                 ports {
@@ -183,8 +181,6 @@ examples:
                 compatible = "pci17cb,1109";
                 reg = <0x0 0x0 0x0 0x0 0x0>;
 
-                qcom,calibration-variant = "RDP433_3";
-
                 ports {
                     #address-cells = <1>;
                     #size-cells = <0>;
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
index 363a0ecb6ad97c3dce72881ff552d238d08a2c12..1e6ff8e7a6c20cbe4abe31cacd8b25a78af05f4c 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
@@ -151,6 +151,7 @@ properties:
 
   qcom,calibration-variant:
     $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
     description:
       String to uniquely identify variant of the calibration data for designs
       with colliding bus and device ids
@@ -304,7 +305,6 @@ examples:
 
         memory-region = <&q6_region>, <&m3_dump>, <&q6_caldb>, <&mlo_mem>;
         memory-region-names = "q6-region", "m3-dump", "q6-caldb", "mlo-global-mem";
-        qcom,calibration-variant = "RDP441_1";
         qcom,rproc = <&q6v5_wcss>;
         qcom,smem-states = <&wcss_smp2p_out 8>,
                            <&wcss_smp2p_out 9>,

-- 
2.48.1


