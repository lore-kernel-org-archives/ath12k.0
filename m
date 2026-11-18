Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490DB606A880
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 06:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CCRzjujJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=m9wEiO08;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pPd5xn2l;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fUHcFI10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=; b=CCRzjujJoBk9R3
	lQ1aMMAsEmxI8lOB2Ra+Yj7C6jtjk7cp+0p4vULKEeyIs+kM0K0AnoaK2HlCXpbykRwyWwAeC5z5w
	dLCUw5K5nPPOl54EhOS5Eg8lCsH/liXRyWPun69Og8Y71GXTZZHy5byrgj7bnciekkWsWXB9HK3OK
	iYYBl5DXG0NfYMKo6ZM+TmPuo92R8K9OxtFyCxmpyKz1sGgU4nvkaBJUS1pRzPxUQP8BOQsms7Xkf
	o/WxWgrnWTcvK1tQqvFhNtHHtzOjUr6sPAfsxxjLn/PeVeYNRfl14VD/hJnlbrcUKlL3j4WKBDnEs
	qRhn76vfM45LQXnpcoZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ2E-00000007sIe-49OQ;
	Wed, 18 Nov 2026 06:20:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ2A-00000007sEw-3vYR
	for ath12k@bombadil.infradead.org;
	Wed, 18 Nov 2026 06:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=; b=m9wEiO08M7BKegI5/2tt+g2KSf
	suzWkAYv/sZVmG8oWLl2H//hcHEqlEt+5a30gCRxyjJErf9UosZEE8W5vZ+d0X4CW4OHIl4oVV1lb
	APLig1ou96YNd7XCbq0hUHzBISAmL9e/tVoRqTBy9fHCxnu0ZCPmoZRwUHFfi+cVSOhHLG8yrP0qO
	A2+0dI6mMheGu6zJ5eUKo3rkwEss2U3UJqM8wtQLiK2HO24SUbQVedvOPvtcanSgEDpmO0g22+rOr
	YLPmWtxnSZ08bXpanqcFJuwPiQ2mx/Ewli5a/B2ROsBnyPRdaYmMJGvd3gEXJ+SE4XGkoG7P3zijY
	K/ij9WHA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ1j-0000000ATIJ-35qY
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 06:20:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uxub3121726
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=; b=pPd5xn2lZWyPSzzF
	TikaJfsvltCor137uEgw10cH7SRjWWpJ/5g+4MYzNdqUC3XBNAfU8Tzl/5LBT0Z6
	/tmXoo8Dp3K5SoA+ce7dw4aoREQx//gJYf2Zl9xKKCRf/VWsueIUNBJCEgpCNYVm
	Ub9jpQgEf2K1ENymZ0AX8kCT7qYpVNXvuwOBPQ81+lkLGYNs44abcXZCGOfVZ7lp
	RoXKqrCUxDZ8keq6d8Z7Nf88YQh5e8vCDK9w0WPJJSRV9oz4jaU40NwXNKr0or4B
	mY9KdoDGMagmmja7BitAtRiC3RWW4XcAdVJWqwYonw37+L2oYxm0hQ+WBPH3RrZI
	ys7H2g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hggb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:20:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso463796a91.3
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 22:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982813; x=1795587613; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=fUHcFI10x6vkgrTWYdxv5TZI8JgVHWflqFm4GAlhnUUFUXzbwOAGc+rIWxQg9o/KJw
         iv0R/sXt2pPkK/ob7Zj1aAx0bVacrcqdP5jccU6FqZxQD6rLBv8Pim0BDZjC5sNjMcCD
         0Fn3wZjlt6TWrrGpnJ4i7GPfBsoWKFNE5HPjgiw879G8i+26PkRChUIzE5Mfgfp7hN4g
         DB06UIzyx2osQikSOiR4pGxEZ49RKvNpvZvmQnLfVCUrHhTQhs59NgWH2lkit2YEbN0Y
         fET38bmNY8/x3qulYT3z0wsnP9nxFOi4gTxzxAG+/A1FIVYGqk3TvPt/e0rkeffGYh9C
         BC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982813; x=1795587613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=ztAls3yE9u23AslY2Dw5uAK+l37Lt4MR7t0FQFbWUkMhIM9yoOOR4A78prPH+09n1M
         FwZr2XAMDoTQbCc1+aHldZ4v+p9r5jbnHFUs4CzrMtzP/mkn9yYqIYRD3WFScRh+ncRy
         rc5wKi880SJB97+0zCMsj2paR8omQmAl3i+3Y6JvSnb9G/K16b97P5O2QXvSN3/wa/RC
         uyY4TGu1b0a/mp0GkMcx+a/klZ7ISp1rpsOhEp5544M0wwGdJ3tbKF9sdHGVeGVXt/uX
         86ujkIEKeXCQogqbKVUPsPT6MDxhPvRqGFoDTazIgZ4bGxnFcB2ckccjhgxOpGaw9Bki
         ogTQ==
X-Forwarded-Encrypted: i=1; AL+hErHypXbIIWa/cvOS0pB8pnbQ3a2uE8mKI17zgGGCAZYcxNWl9AGWiWo1MClKJe9xThAynvo7iHA=@lists.infradead.org
X-Gm-Message-State: APuU4Z9SzLmfquprvTUUoKk8Io+HdzxW/9ZKJX5o9ESMgjYdViw4x4RE
	dU1orD0uebJ22AGeNCD5lF/+fAo1xUBE0Ck10KChmAM2ERN+ste5yUXhXbSPdZlahtuTPlyXQ9X
	R5UUyce6dvvB8CLXHs+pUKPcND8GqESRHqOriLriIWtcFlEO/ljVUlxb7MBFTELic
X-Gm-Gg: AZFdTZfBitwv2IQ9cVQ0ApPhcrefLJS5KZ5fOpGL6xIAH5l+A2qlO/lzPf1mAT6treB
	u+P3JATSitOH0neUwbkGoV37CiT+mGXSbO0baNzZc50akDpU+LOFt3Cyhsbco+mq+LyGtmbDNqG
	laBY8ULYW4jBjf64Pg0y8ODgB2TNMlXBOxPhdJ0kWmFeXx4vHi09rksayxlzMCtCtWKdneSK0uE
	qnLOfe3/e8oj7knAH5446fm3/p6Nsd1yrMinU9qICeDUMscSVnEkHxFp9dlnBMlUJGo/Cw7DmhY
	Mytq16JivT5P8p1v1YzPIHbFOLh245y5timvA59uSgClieD7llhi8BDF7UQ6LKFdEfkPOdjzcbO
	jjgLWLxQ4KGr9q/KzJ85mG9aRWsC7CNKifBZT0FL0wzA4jmJ2/g0uJ2GQRENFtqizy9rLB0DP1y
	uiWUlAhxIxVi9/BoFjoFX6QkHR5vBwwQ3+9GhWXpwClu4wA0EJ/b1htYIPCZyylQGS59METHCYP
	48=
X-Received: by 2002:a17:90b:17ca:b0:3b0:91ce:6726 with SMTP id 98e67ed59e1d1-3b3d07649d1mr1743255a91.21.1794982813015;
        Tue, 17 Nov 2026 22:20:13 -0800 (PST)
X-Received: by 2002:a17:90b:17ca:b0:3b0:91ce:6726 with SMTP id 98e67ed59e1d1-3b3d07649d1mr1743240a91.21.1794982812539;
        Tue, 17 Nov 2026 22:20:12 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:12 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:15 +0530
Subject: [PATCH ath-next v2 12/15] wifi: ath12k: add Wi-Fi 8 WMI init for
 QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-12-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-GUID: 14wXHfbAhiyQl-fBU9aCvByBBbQj80xp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXwL+XwRq6H8Ml
 GBkd38xHBQr7ykzfZQ6FSBCN+ghoaaOOGyZhBMVu1JUWK0OwTlj9Ix3uSYVaI+y2rEQL3CUD8Yq
 WYEzw1w+7TIG2SPF0VlGCBGaEbtDoBg=
X-Proofpoint-ORIG-GUID: 14wXHfbAhiyQl-fBU9aCvByBBbQj80xp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX5lZfnnIkVPfz
 uHLGF13/gpG9Z7MbhuJ168n0c4Ocer/w6+DZlEWUusLRglW6GibbdKwXl67btyVY6CqjNSJWXqE
 NpFEs2uUsDs0/l3dXPEv05+lw7twhPPC0sMcNRPp6AwtkKdhSoj0Tj2aJbfdyt9pMJGmSQfIEGN
 ZmPXwTFehtxVWkRIp9RkLrbPX0D4ibkt/mijwAfbBGHGvCRG7avME9ZcUfbwskHZUSCqko+9qun
 TJoL5mtX32/2nNHv8WklM8yEoeYUEiyWNeSUur/CXebqFzgRUBHWWzp4CVlKmmDDwA1uGZsL7e7
 D8/3gHpbbmaVTUHfUV8vLE8c5UF79FRo565X671OZ4PSlUf+EGuCb6cdKjwBYbUnA58bN0By6eA
 2tO46KKgQdSmZywcUh+YQVN9kcvjNslvalzAfThqie4awzpYDfPEe6V457yiYB9n/7NQc6KEN+/
 MtJNRktIT0Lm35GGYvQ==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd439e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Fa-mINMYIZ2DnWK0-L0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_062017_620162_3FF42940 
X-CRM114-Status: GOOD (  17.15  )
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

Implement the WMI resource configuration for QCN9575.

Add ath12k_wifi8_wmi_init_qcn9575() in wifi8/wmi.c to populate the WMI
resource configuration struct used during firmware initialization, setting
vdev and peer counts, RF TX/RX chain masks, scan and power-save limits, EMA
and TWT parameters, and peer metadata version. Set the QCN9575 hw params
wmi_init pointer to ath12k_wifi8_wmi_init_qcn9575 and build wifi8/wmi.c
from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h           |  2 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/wmi.c    | 57 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/wmi.h    | 13 ++++++
 5 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 96776c6e2050..b8045b33ca0d 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -77,6 +77,8 @@
 #define TARGET_DMA_BURST_SIZE		1
 #define TARGET_RX_BATCHMODE		1
 #define TARGET_EMA_MAX_PROFILE_PERIOD	8
+/* host supports peer map v3 and unmap v2 */
+#define TARGET_PEER_MAP_UNMAP_VERSION	0x32
 
 #define ATH12K_HW_DEFAULT_QUEUE		0
 #define ATH12K_HW_MAX_QUEUES		4
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index 3717b00741fd..989e640c7b41 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -6,4 +6,5 @@ ath12k_wifi8-y += ce.o \
 		  hal_qcn9575.o \
 		  hw.o \
 		  mhi.o \
-		  pci.o
+		  pci.o \
+		  wmi.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index fa64b865b931..74873fc5f3f3 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -16,6 +16,7 @@
 #include "hal.h"
 #include "hw.h"
 #include "mhi.h"
+#include "wmi.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
@@ -70,7 +71,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 
 		.mhi_config = &ath12k_wifi8_mhi_config_qcn9575,
 
-		.wmi_init = NULL,
+		.wmi_init = ath12k_wifi8_wmi_init_qcn9575,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/wmi.c b/drivers/net/wireless/ath/ath12k/wifi8/wmi.c
new file mode 100644
index 000000000000..c575cae2582d
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/wmi.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "../core.h"
+#include "wmi.h"
+
+void ath12k_wifi8_wmi_init_qcn9575(struct ath12k_base *ab,
+				   struct ath12k_wmi_resource_config_arg *config)
+{
+	config->num_vdevs = ab->num_radios * TARGET_NUM_VDEVS(ab);
+	config->num_peers = ab->num_radios *
+		ath12k_core_get_max_peers_per_radio(ab);
+	config->num_offload_peers = TARGET_NUM_OFFLD_PEERS;
+	config->num_offload_reorder_buffs = TARGET_NUM_OFFLD_REORDER_BUFFS;
+	config->num_peer_keys = TARGET_NUM_PEER_KEYS;
+	config->ast_skid_limit = TARGET_AST_SKID_LIMIT;
+	config->tx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_timeout_pri[0] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[1] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[2] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[3] = TARGET_RX_TIMEOUT_HI_PRI;
+
+	if (test_bit(ATH12K_FLAG_RAW_MODE, &ab->dev_flags))
+		config->rx_decap_mode = TARGET_DECAP_MODE_RAW;
+	else
+		config->rx_decap_mode = TARGET_DECAP_MODE_NATIVE_WIFI;
+
+	config->scan_max_pending_req = TARGET_SCAN_MAX_PENDING_REQS;
+	config->bmiss_offload_max_vdev = TARGET_BMISS_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_vdev = TARGET_ROAM_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_ap_profiles = TARGET_ROAM_OFFLOAD_MAX_AP_PROFILES;
+	config->num_mcast_groups = TARGET_NUM_MCAST_GROUPS;
+	config->num_mcast_table_elems = TARGET_NUM_MCAST_TABLE_ELEMS;
+	config->mcast2ucast_mode = TARGET_MCAST2UCAST_MODE;
+	config->tx_dbg_log_size = TARGET_TX_DBG_LOG_SIZE;
+	config->num_wds_entries = TARGET_NUM_WDS_ENTRIES;
+	config->dma_burst_size = TARGET_DMA_BURST_SIZE;
+	config->rx_skip_defrag_timeout_dup_detection_check =
+		TARGET_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK;
+	config->vow_config = TARGET_VOW_CONFIG;
+	config->gtk_offload_max_vdev = TARGET_GTK_OFFLOAD_MAX_VDEV;
+	config->num_msdu_desc = TARGET_NUM_MSDU_DESC;
+	config->beacon_tx_offload_max_vdev = ab->num_radios * TARGET_MAX_BCN_OFFLD;
+	config->rx_batchmode = TARGET_RX_BATCHMODE;
+	config->peer_map_unmap_version = TARGET_PEER_MAP_UNMAP_VERSION;
+	config->twt_ap_pdev_count = ab->num_radios;
+	config->twt_ap_sta_count = 1000;
+	config->ema_max_vap_cnt = ab->num_radios;
+	config->ema_max_profile_period = TARGET_EMA_MAX_PROFILE_PERIOD;
+	config->beacon_tx_offload_max_vdev += config->ema_max_vap_cnt;
+
+	if (test_bit(WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT, ab->wmi_ab.svc_map))
+		config->peer_metadata_ver = ATH12K_PEER_METADATA_V1B;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/wmi.h b/drivers/net/wireless/ath/ath12k/wifi8/wmi.h
new file mode 100644
index 000000000000..a66ede369ba3
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/wmi.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_WMI_H
+#define ATH12K_WIFI8_WMI_H
+
+#include "../core.h"
+
+void ath12k_wifi8_wmi_init_qcn9575(struct ath12k_base *ab,
+				   struct ath12k_wmi_resource_config_arg *config);
+#endif

-- 
2.34.1


