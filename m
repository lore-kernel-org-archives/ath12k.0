Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0AC1061B1E
	for <ath12k@archiver.kernel.org>; Mon, 30 Mar 2026 20:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHWj4m5kp7X9p0xcITcipoqa6X4UhFrBaGVb5fpuBNQ=; b=yOPGycxMUZ+rI9e0q0sayboOKx
	QgGW91S0f5rMlFsGNBHKPuyTKfPR4uabfxqcFOZs93Aq6bMJWum62IKXF/llX+5B7pNcMr2NStwwx
	3hq2ZIr6wq9CaGbSXiV0wQkgT4SvVS8QDokAu6RxyaFKeAqRnobzNeiKml1ITzYCUyA6ZqL1Nhtvm
	eX+msqkuqUSyomMVj298loLOtpNkNAxx3nlCyjUY0icOM1nXMhXyMKtGyBXXWXBrzdRE0K39YkBOT
	vJJAYGENgNwGf5bGPgEadQ24MpaL0kFSAlr2QXrULOffXl0E0KIRnSHoAo8pmq2l+sJUXhAcCmA/D
	KInqR7lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JOO-0000000BqFh-1yRG;
	Mon, 30 Mar 2026 20:39:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JOL-0000000BqF4-42QM
	for ath12k@lists.infradead.org;
	Mon, 30 Mar 2026 20:39:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UGQ3C91402790
	for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 20:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hHWj4m5kp7X9p0xcITcipoqa6X4UhFrBaGVb5fpuBNQ=; b=LkYcWa/LzlP1B607
	QnljtAkg0WxbUKfmzal0zwXu4FG9yrTzXSSI2kNW1zZoPMdDDWQYVRCfpxNDhrL3
	bNzxe4Oxaqev4zLYR52KOd/w46xizFUa5321ZH4Ef2FRSjLj5saWTvEbQYGCtYw/
	9Lg9AXju8PEMgjz+aD6dQQHs/q7TCHUBFEqMoiahEK5XwhD6xrsEgLk3Bgpb1okI
	QxVyYZ8H8y849RoA23uVZ6lUDoPLKZarFA4Uo/GyWcUwFB9dnnzHWBMGTqM/bBcq
	6tXQCIQzWry5QsAQTVlWLHi2/9ArSur1G5iEjiFu4AEE+vl60sHodHtJR2dPcKwb
	Br8B9w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7r4haa2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 20:39:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24a00d12cso21825925ad.1
        for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 13:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774903160; x=1775507960; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHWj4m5kp7X9p0xcITcipoqa6X4UhFrBaGVb5fpuBNQ=;
        b=HtNnGFJ/Vcbvk5kGAskfuJck2Vx06LHO/V1NgKggqas461FPD1Dwnc1hKfkPy64DYJ
         XlaL4eCjZ9ZksIWumhuQP8JUytLjleT3GQnYFX9yoeMYmZo8m25qC8K93ku6576rcD3h
         LifNYB4SiKpg3GdxoJSYuvdextGLX+PsYubDQH5a6OQK+Z/lqebZTdyQyQ8PqwMzd0Ml
         yBmwO213V/E0WvpoHTu2dIlRp9A76eiHyyr/LWdDTkcO3ukb/Wca726kw5D7hdjyJkDN
         wNhYta+6YGVqi9viA8gMSe8rblma/a6NL7ZilZ6g2ZVj9j6zcNPsWiWfbBhlEb0z8vHS
         6Zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774903160; x=1775507960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hHWj4m5kp7X9p0xcITcipoqa6X4UhFrBaGVb5fpuBNQ=;
        b=c59z7Ss1yXTbbkTNVJGs3QfEqGEQdSoxTd5/Huwpf/g95bpUCQhitMQxdD0z0R33Z9
         /yFz9lRC58xJ+EHKD1rzdtVwodvwS0uatJEe75uuCPpRtuOXZy6A2UJjxJYiMJi/QdIB
         +VliT86lUPmrqrBZm+gtxA1u2k9VmdlpLiBlHvpqN31ufLdDk57hnBYlzn1GVn5zwhQr
         qSv0Nn8yeWpz3eBWgXJxivNtKmYmHZLtf9PJIdpy3IRYX8+pDwruPR8TghuE8++XTJUD
         ZoHK3NTEO+d79z0n9zpUgwawvM+qFsvuW9taUzyHYr07fG9avouv2U4gTHN5TfUeFSk1
         PEeg==
X-Forwarded-Encrypted: i=1; AJvYcCWiPmNnIq28z/LsXibi5kbY7MlRgNrPTHmMMu7htmQsEB7w1Sj7JqPaFMEyi+inq+ETpYa5YDs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNh116+orUqBFK3Y4HCX+D7JbSDt7+HpQqF4PEvNQ/g1vCWp5x
	EjF1QsRmbXuS4ZvNySSI09i5ec+y2FrmoyhQXTxK6eI/0Hw/SYLrR8kIHFeheJ0hDD3uVFWVKL3
	uwF8/Ld3uskPhXvTV2wY63GY+jlxY2ut5/sgxeZRdVjm1gyeauAGVmz5Ihs8WYAPm
X-Gm-Gg: ATEYQzwslee/EQx7FEOrQmcG22jCvXsMlkim8Naopm59GUG5FRBI8iXnXrvWgM6Uph/
	ig6jjxVtMeKJjJzD9B1ucArgLtLAy9sKYHQZlO8wpKfrNYGUpAMoOpbrrjeM3/RDhUTBIOzA/gt
	REtWbBd6v7TYfAPBVamA0UO5L2wc5VjEZsfqSAeNAjJinvsB5uDIP/NVptXmFmn7oTpPD/1CocT
	XLeIRlzIZWMxN5b+4gSaIg4XHx20pCgPLqonL7jpxT0quEdRgFocQSZbsOY9a58BMimfIyKodr2
	Xs5kocO5y07TIyAFZknor+812o3urkbVNGKyNfFIVUOamzOv2IPvWhdSO4RRwH4UicVRSMsNguC
	jMyIbXw2ed5GcQ3kfLkpkyp/tit3limZcAC6EM/xfZeTqoKRoSpeRY9G+EWP4mqgsOZlOfmCOyZ
	SAbrAtVcKy9wxXZHjVaFbKPEbcMYd0vgerLCrV1D0=
X-Received: by 2002:a17:903:98f:b0:2b0:9a61:9e9 with SMTP id d9443c01a7336-2b0cdcb7d56mr153261185ad.32.1774903160003;
        Mon, 30 Mar 2026 13:39:20 -0700 (PDT)
X-Received: by 2002:a17:903:98f:b0:2b0:9a61:9e9 with SMTP id d9443c01a7336-2b0cdcb7d56mr153260995ad.32.1774903159492;
        Mon, 30 Mar 2026 13:39:19 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c3a4esm113517195ad.78.2026.03.30.13.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:39:19 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 02:09:06 +0530
Subject: [PATCH ath-next v3 1/6] dt-bindings: net: wireless: add ath12k
 wifi device IPQ5424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-ath12k-ipq5424-v3-1-1455b9cae29c@oss.qualcomm.com>
References: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
In-Reply-To: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3NCBTYWx0ZWRfX8Sa4hyqzMiSE
 bATvW+LySrwjjG03LKuDkyPBxOtX9JHGkA/bzDTo5YBbfn8KRK6uePEdl6yfdWLIMpd8rKJoqf0
 YVzilSUkptM3LLldUXygGY0dhhcALKBKxUwufiOgam1wkXEvBGZdDSFcMEEuzJEtDR4WxSRVOee
 TNztt3jX1u7oD0Cvo6E5OaJHQVhSMAyqp5UTEEYWXibY8hC5/8ldE5jpnTLF9KKCMia5gq2kGY5
 NrFlOaRVROuopPr2N6+02RN0QF3jYG7amOCqQMiFs33//shyq7qedOU+J35EDkdBEfnd4vDNR+Y
 UFUprrs+u/nquInkE0EQG/l2eYb4CwEA7yhCMGLUKBO+XemrYWWQKYRJ+lT1fsZy4cneGZ0KfxS
 xKPm57nN20ex3NeNDH6xVbA3SZ9dNCn/s0PMntutZRl0/uW3YrlhR+pv5fZ2TlP/UjKGdHtEtW0
 CYsTj+2paFi0wIJH38A==
X-Proofpoint-ORIG-GUID: 1ibRSAP6iI7D8RwOzo8SUHiJaqPosR_D
X-Authority-Analysis: v=2.4 cv=PI0COPqC c=1 sm=1 tr=0 ts=69cadf78 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=D60P_gS81Jvdon0wwAAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 1ibRSAP6iI7D8RwOzo8SUHiJaqPosR_D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_133922_130551_A1F51770 
X-CRM114-Status: GOOD (  12.78  )
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

Add the device-tree bindings for the ATH12K AHB wifi device IPQ5424.

Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
index 363a0ecb6ad9..b30f639b4c91 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/net/wireless/qcom,ipq5332-wifi.yaml#
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5332-wifi
+      - qcom,ipq5424-wifi
 
   reg:
     maxItems: 1

-- 
2.34.1


