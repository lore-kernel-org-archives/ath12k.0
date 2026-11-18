Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423F9606A331
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 08:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YY6Xi1PY;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hsav1JFm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BfRPzw7A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=; b=YY6Xi1PYq69vCl
	E5dL2KLsijnB9CU1ZMwTFXLIxYDIjuwlp2nthucOF4+TZzmNOM0VVvOmRBy7OC0G7fTXzvqRnTfzg
	dPyq3ivCwMzSKEpBDZO1I7BZR/bQq0gJYzd4oElHPWLm/hpu2R5FgCnYzsBfLWohJGJMtG80MAa9q
	3ROtHmRe3yUzrZvRPvVqWYb0winvWen/52lSTvAf5VqWAYBNq+RiYGsvnkk/ElWghyV6ortap5q+d
	NoX9BY2KmXffoZatBJVG1bvg85M3fgVzR7fhF7VdxapXokfXa+9/iPvw1QhBbfClDpH2VJ//rsfTc
	x+0PuPA121KTFMCup+6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTapU-000000087uN-42WV;
	Wed, 18 Nov 2026 08:15:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTapN-000000087sh-4BU7
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 08:15:40 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2De1959902
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=; b=Hsav1JFm+eHuNh9f
	ltj6VIwk0l+z5kUBBl1BWoPUOHlFmLfmwQyiu+IjbCvP3mS8nLsSfApZOi96G2tz
	uXfGsZZxV3ZSS6R8/WRHgGZfRG7g7EodUaFkvRzfLnqY8XpuYgvCXZfUHjUIGuij
	eCCvsrmbjydv1hOStFf86yWFhIlVS3hPgYvoZVilK2Ushp5b0HJJdUPIN0TopjGN
	3a8dFQyS1LXWdSHe7nmEgW2dd9ofSMRVQjeqjRh2H1oz+u3LpMxsdxiBORvNXFyz
	KMaH76bOnpyvZQJxFJqUg78UOBUoOFBia8/CKzqnxohESC3krJAR5cyIecHsrhqH
	aE762w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hykb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:15:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b17b31c3beso751617a91.2
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 00:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989737; x=1795594537; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=BfRPzw7ANz8RCqjopN7FToMGz4aDMK/kudoTUkdH5mSs24Td0NlgSzSgh0E43e4Z3z
         QwGdxNxT0b4Uue1kOnJPIt6m3LOcGOh7VOSMt4TJN9HUChZt9Bt/a1nCGdhNxSuM4kZx
         RF81TcwOcZGoh5B2WsSkM1cQYa+Hcn61voH2a68FUl/ODqhwm0Ah78wCOQWfiaJ/rnYS
         rBNCt7OjDZTDyBt6O40p6K0nLn5knXCV7O8ZrhvWcYbPr3xwzkoTwLrbp5q7fDr9XyU1
         YL37Z2HP/KXq0ly2cJCMmUlDYPNgFBkyic/nLrOZcYMiOq8b6dXaHPJrHGmBDCT4pEiU
         p1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989737; x=1795594537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=aCWaKZEHbZoqB7vaXbJ4IP6gXNC6kqQkW/Xwz/g6ftAdztTMAM6EJIhfvmRkrmmdIp
         mhyN9vh+6WIaOrB454wV3q9F6VqgSjlIcyFvqxqTGNBIofGfkq2AiYR4u1fWhbyluVoP
         VolwtQ5TeOTFegZmAppszqRczdnlWcCPbxrXQt+dEzWk5vgbGPXWCnd44kVpP9jjWqb6
         lxVdW5EK/DJtwNc7hyivQ2GfutIYyZZbGPAxaAwBHRT4+N4sF0IyZ+l6x9en+S8dGw3P
         /grdmRcrxmzZBjxPfME206Y4Ufyb6f/nPQ3u7H/m08raXhuMV21PzaKBjxDlIDL48wqz
         205A==
X-Forwarded-Encrypted: i=1; AL+hErHmnM6/M4VO4f/WZX6O8W+JYKqKqUzv52MFPH09qPGJdhhtxbbS7YPHPSHGDfRTiQSfSaYjJas=@lists.infradead.org
X-Gm-Message-State: APuU4Z/xeBXjvpxTKVhnyZ1tdFwBGtOv8V1Gqw0eYdbOO6Tdc5v2zdJ5
	QrPruAEWwoRjWyjNvbINUbcyAJHXMBy4Kj5KtBAVbJvZsU7XK9XYMj5nTjBIW3WQoW+kLIEso8b
	GBY2wq53p3dDYDJ87CbrCl77VckDm3NMaUAbO1GZfGRIYdRB8Y3TKkx2SLBn2mC5q7wARD2HY
X-Gm-Gg: AZFdTZeFXHwwfL4qo+JY7oIKYY2adZc/M3v+O9UBhNSI5G0AT8wQ+8bVJIGwDCINFrV
	B0nCp24zDlCfa+YH+heT964k15z/GxMJctOyN2y6sMfe1SEqDdquiiJkN3MN9Wtts2KOIwvMYpK
	3Xbl+2jCtNH6A4lTlMLIrGM2hbEenEhyZLQAwfkg1jsXTX43g4cLG3nmLG84SiBMDZ+exL+Iwlx
	oA9uq9PPjEL4dDZKos/6lPwgR1F4R94ikaIFiRDj4umoxMV03cGDBDnI3CN1a9wBNh3eChzBjmf
	fnmM6F7nmwjeaWGna5LwxsL1IQ/nb1iVMzND2Es4F5foJZpJ5QJ/AAqPGilYGdSNryJZHJPYQOW
	khbujnmKHTjYU1rfoxmNR54yS+DCUZ0M87LhFYO0qzS8dG8YdGFsCUEMUhEKjPLBMhLHjm9+2zm
	O9hyYNWHAmFMFSmpsWCzHcDV/desY1NStoSJ7pFLnLvccH1Uh8qu+4X/tt17++8sCxPiaSZvWU5
	Q==
X-Received: by 2002:a17:90b:1a8a:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b3d07a2098mr1995829a91.10.1794989736705;
        Wed, 18 Nov 2026 00:15:36 -0800 (PST)
X-Received: by 2002:a17:90b:1a8a:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b3d07a2098mr1995795a91.10.1794989736199;
        Wed, 18 Nov 2026 00:15:36 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:15:35 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:24 +0530
Subject: [PATCH ath-next v3 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-1-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd5ea9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cIo56A7EWjM9ht75lhUA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: zX9VtHu880Wn7UC6erzGtwNUfJzklLg4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX9C7jfTnuMEkR
 uHtnUhTudLZ+GKWBXjUMtG/fy8e6Vvx6YDkFvwJLnfH2XFtAj0uk/4QYi/HqZ5RLvI6Q177ioY4
 0ciG2T8H/Nw4u58VTDykjwt5X5v2xpNzpBV7Jvl6fOwe4OheAk6+nTRwZ/YzJuapZ3ZnIV2RMOj
 76mqd0y1FOtVpl1ixTPcoKxtxZmck5o5HuRFfmvhnxIoay09mebWh/ep1mbwShw3mfs+I8jKMIC
 jgZ8m5q/cUWP7Akxvo1gxWVzR2x/ZSqEJZkbvkHVw0hUSrfaw6JQZ33av+NqjwgbI8/AEZrsZqK
 uwFu4ep1uH6Wye/T20MpsnJgPujDTMJpZZLZ3VN+aum+oFcM0VEe4CMtzdZ3Ej1SGSDLWZXEmAi
 yaaOOWgPsPSLg1O8Hu+BtHlS7BB6+ehfRJRpzZMyt2RrzthoOlJwtUPqc/6jZ00MqvK7cSof1dG
 7AokTpsZlEJ/9CD5UVw==
X-Proofpoint-GUID: zX9VtHu880Wn7UC6erzGtwNUfJzklLg4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX9pPy1u5yWYzK
 HuLqufPIrQNS8fjntmn0RGppyPAhbMxNynYszvjxVZlBqvdsnSFKTCTCtXjSq4DTlX+3d0U6m4O
 0YX672bmmMz74mhTaTQY0/Moje36gOA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_001538_059596_3D8BA724 
X-CRM114-Status: GOOD (  12.16  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the device-tree bindings for the ATH12K IEEE 802.11bn wifi device
QCN9575.

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml        | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
index fa64c8aa56f5..dcb846258e47 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k-wsi.yaml#
@@ -11,10 +11,10 @@ maintainers:
   - Jeff Johnson <jjohnson@kernel.org>
 
 description: |
-  Qualcomm Technologies IEEE 802.11be PCIe devices with WSI interface.
+  Qualcomm Technologies IEEE 802.11 PCIe devices with WSI interface.
 
-  The ath12k devices (QCN9274) feature WSI support. WSI stands for
-  WLAN Serial Interface. It is used for the exchange of specific
+  Some ath12k devices (QCN9274 and QCN9575) feature WSI support. WSI stands
+  for WLAN Serial Interface. It is used for the exchange of specific
   control information across radios based on the doorbell mechanism.
   This WSI connection is essential to exchange control information
   among these devices.
@@ -48,6 +48,7 @@ properties:
   compatible:
     enum:
       - pci17cb,1109  # QCN9274
+      - pci17cb,1113  # QCN9575
 
   reg:
     maxItems: 1

-- 
2.34.1


