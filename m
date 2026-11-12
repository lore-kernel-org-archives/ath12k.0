Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5532606A323
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 08:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VaxD4UrC;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9Iftrr8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QgZ7uuNj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=; b=VaxD4UrCm65xA9
	xygpdGf6/7aq7DgmrzIMUO4oiH2kyZNPwdojHEQYh8grl4lNKDaR0kEtTXNpaJpVflT7nPVub7Ahm
	8fpICTeKw/j64AFEPVldjvaFH1dXLia95sOMQdyF8ExAPhNXCK5SmwdksJka4qdYSVV9bbO/hoFtI
	+qlBn0c79TDkrpVV9FkmTijIN1CqWmnmfBJyjd68ZmgHyAu/KgPHzEW6aFLZWe0LrJ3zFDPcjQ4Mr
	LCIO/3A9kAK53l8xO2L8eocE7RwJgmKIs+ua/ELR/+QzvEg3wWUQdva2EzTY7IhqHtTUNXmY1zmgn
	hBrtwOrPE1sy92i6tDEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQKa-00000009B1N-187Q;
	Thu, 12 Nov 2026 08:38:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQEQ-0000000986S-3kte
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 08:33:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZUul4149283
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=; b=k9Iftrr8S/3KqYgm
	wmIq9ZLs3f7XOGvc5UgbHulW5ZWkPDV0byyDU+/QSnmBiJKElbdbJqVARzC4zcB3
	HOk/+fVqf4wMB0N5UpLlrbtojhgI1FveXZLeH5YucY/ZyzdzRK709zxm7JnsgTdY
	c9baOQMfRVkFPyfBFWQp3+HO6/4afvBjifCckxY1InLPiet421krTutcCvtVy7ms
	OQrtK8PRrDbjZn46oH+4cT6mHlmr2/5QMRhFcPxXKlXLFOgnm2uozC4aMGyrfQwy
	VlNR+u1F8rsg4Mr7nA4hVXYkQPM/CiH0KfzMFWZ+2KE2jo5iesPrpSb8w53NFaW9
	Qp+9iA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc62hyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:32:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso3646191a91.3
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 00:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472349; x=1795077149; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=QgZ7uuNjsmvlJN0GnC0GNRcjYg714/oLTPK4Oh7F4AJ4wgMvRJMP8uFOdneaiSYdhZ
         6BWgloWA4vfLpLjSOESjL7KPn4zfSxRJ4bBhlmH/E4KigLJXJVIhHh9NGTqdPOY7DFSq
         aRjMZx9xSHfR9rQ6u3W/J2LtacwZx+NCOJ5yukwY0zhwO+1cWRN4qYOJ79r0wrAE0+uq
         Au9zj7zo8YzPx+cduogJcEr2zlyiSG+GpJS6PBk2OZlDY0rRzzNhdaVe7T0+fFE0DkGD
         eZpl2Rz/qz9qeBdG6UnqMrNxNXp6tKEQeysVzERSPUPC6invDPbRY07+BBMAYrQk8rgN
         MdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472349; x=1795077149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=v7jW5Yo/PwYcvFDbcNOKf8xuCHYLq9fqRK2S4HZXcvEXzWGFNFiGOvTqBkfRii9gKj
         3oHmW7AH7sEIutUND5J7d8tImlCFJy64rU+tfLKBs8zwKtboWY7xoMF4WHqtzfK3nGQ3
         WGFUgQDirKmbJsOnEngx+FczPNqQf6C0SqKzpcEke2qh2RncatB947WBu7dWgVUE0K+v
         3NTtidHXRpFVy9YqASWzqv/09MmfMOtAX+tStFBL44VxgKx8cxgApk7EI2qm2mdcGxM1
         DTW8MTGQMygKMoT4ncVSumXNoc9sIqjxBn/bwprQfrQxpyl0U/acbmslLKJa/323LfKJ
         WNoQ==
X-Forwarded-Encrypted: i=1; AL+hErHu2yfTHADEmnhnQ0mnBDW8gc48tGk4KogjxjEvKcbayZcMsFPMhkhAln46L4F6orwLLNuqr00=@lists.infradead.org
X-Gm-Message-State: APuU4Z8F/04Hmp+9FdM+12NS8zI/17dCDAObIOASbKYgSG+Lp7GmQ9bq
	INWpLJb6qNILFB3wtXAg4IdaJJRY3mrdtveCi2YKkYu6dT6M1t0UUlOip2rXGwzhzKw5rq4fUvx
	CydX2sF34BMc9sBB0SgG1uBaAt86uSrHzRiItjdiDly3Ve8D8E3ITa4WM5yjLIikE
X-Gm-Gg: AYBFou3IS1MgMf1ZxFlosq8wU+O8sdemhn0H/r5nQrowg0RJo/HJHAxlT0WpctaJFIM
	li8k7tam+9yGkHIdGI0JxUGPtr3HuoeyhF30vGzj1iIO+Wl6zkqRY8Uj/kz0LDSls1g7RZZvT/n
	9rwgzf7ibtAVXDFGHuCTLOLlqlRICO6UEjSwhzDRnvWSsWjap6daVuw+2w2DdiY/LnaHXktfHsj
	APYZPEsJfRhclKSfsBVPFkz9c3hzgcLw01o60YrNNMYXqHniFq3rxM4zp+/IvlCYp+VGiKERx9b
	VjeKp8WoSB0wiwFjub+n5kgRh4DN//N1hHR7xwo/iE9cuZMdPiybYNVSwPNL143t/prUw//V95T
	EK6yDnOVR3Io2cKDnfMfVIyXnUf66H1VCZz75CFlqbv3QlpJ+YwHbbWqIpIg+lf0LBa/bp04I6p
	LG/A8nY20u4NT1nqo2nr8WTb5s8t5Omv3874qrIZ5ROugrsyMyhp11juT8yrOEofhVyqNa0eMxf
	w==
X-Received: by 2002:a17:90b:17c8:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3b182f8ba81mr4532458a91.65.1794472348641;
        Thu, 12 Nov 2026 00:32:28 -0800 (PST)
X-Received: by 2002:a17:90b:17c8:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3b182f8ba81mr4532415a91.65.1794472348126;
        Thu, 12 Nov 2026 00:32:28 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:27 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:15 +0530
Subject: [PATCH ath-next 01/15] dt-bindings: net: wireless: add ath12k wifi
 device QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-1-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: c4RzKlis_L1jjdpXSonfkg8DO636OwIb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX3zldT5c2pZ6s
 qNIO3QS4kPJztVFQQjfGFBm6pRZLmsuXJTwUXFRGt5DHjB6a7zUf59ZFMvSQkZD8oU04qYTTzmD
 /NOBh27AWQduildYCI1UxcGdA8UR4usSJiInqCSjFUcds01EfUQ/IrK56oic1Lh0W/dwghdBNrX
 3na45q41hxM36bkuzZa0UyFopF1E6GfvsnLX/VhEV0wcTUTEU9boFON9BCMpIW4bfmW5nxBI7AU
 wj7UE8wNONc58m4V2SkBZW1eoQw2UprgEChPogH0z8mDwB0KVs9Q26f2ASd+u+E5G/BlTzJOJu5
 OVsiKSLkLMVVCcyLzwoTfgsbWa5mRyLBYvWWrx0AsnXayyKpj8BE6KFETQIyVi8YWqwILr6UAXM
 n28GK6y8CXxtM2LvK2iDSb+/4JNYTiMMNJpRu5gVhsrmyeJ7VKq7zL1p7cRKnhWQArW/rJB4OUq
 psHkyg3cHE2i33dkTEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXz09jYQgLOJts
 nhqDI/2T/dlp5uZXad251qdbD1nFnIEM1SxjgKGZ/VZqVpC864P0myA7pLAo5ra3mq24a+jLGTc
 six7he+O7iyDj2Ie8cpm4n7x0FlsUQY=
X-Proofpoint-GUID: c4RzKlis_L1jjdpXSonfkg8DO636OwIb
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5799d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cIo56A7EWjM9ht75lhUA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_003232_101175_3819A4AB 
X-CRM114-Status: GOOD (  12.48  )
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


