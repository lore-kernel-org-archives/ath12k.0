Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCB8606A8B9
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 08:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g/2IEt0m;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=daEvmGbZ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DbYQWdY2;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkUMMcxE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=; b=g/2IEt0mZWZX7L
	ACjm/v2Xdhw5nA0HDYtvPGNGTAlt16prObfQByiCg98vE5moxG5iIH6RnFn+YETyCip7nWs3MVp3B
	6gdskXXvNXZD3H4LJkQrXxzD8FX2qZ7HS6TuAFf73L9nktp8RMgQrtuXxPcXRd5lyhMDT0zO1Nwz1
	Sw37Zv7gX+jtlHDSxvqgPXvM/CnhANzz0YX79ZzWyyfVvpYZnf1sy989xjVIXHu0GlmCe/VDje/LN
	BQIdBfxDxmBC5FFvmDRdrBvRWuu9ds/hj5AUcbGIa9Ser8B87Qu5efTfpoRNBYl7Q7DIdHM6Uk/sH
	6QSGCcFmKZw+S073NVgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQKy-00000009BDU-1MXr;
	Thu, 12 Nov 2026 08:39:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQFi-000000098iC-2X3q
	for ath12k@bombadil.infradead.org;
	Thu, 12 Nov 2026 08:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=; b=daEvmGbZWb/V+ToUA4pQw7dybI
	mqETVGio1tFiqG86NZdetEN5amQKmpaiGLkL96QHBUM5okoljypNS2fT72V37T/MpQhBaEMDW8z3m
	fJ2kPHdtIra49pWn4aDQu16FDASRofk/O2/6jQqL1PfmLrdpmfm5lMY0rkfrDlQ64mfnb1uVMmuL+
	wyb/m3E0rhQlXXlf6Gndr8b0gzDiiFaO6SFaEpnMUBt5Jj4dhYbUJJFClYxUEqeVOrshl4sb9KO1m
	aZmwZHRjJHu12dFMqcQ2o+z4Ipm9zVKf5+TAgfKiZRDokgnEimBV7R4HWXKSdrTkoqprsSH5NvdDV
	jzC52Hsg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQFf-0000000A3Zr-3fhu
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 08:33:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZVsX4149298
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=; b=DbYQWdY2G08fGYKn
	rD8BCQaeHv7WnPY8FaHdOiPcwGrAOD9cpcknX+mJX/c2qpdABeOSySnBzXeOxw15
	yxSQ1STDmXxVqAmsO+lSxbiI17dV9sBys8/LhDlpeqKiRSVUU7wBX6FmPB+ZNk6y
	20n0Rb8Zts8VNBKm0kALtorUymBW+biwCQ7G2MTOW2AH/q6j6zaBLem4zXR6TBk+
	DSU2DOk7gw036Z9L7lRe6W8UmjKAycsIo6qjN3kV6zmderZsdNrWuNBmk4Ozmno+
	DjrObXXGJOSsAwozoJ5pmSzKKFZp5sqo/nJbCWtJ2UZ3eymmIpNbttbKj5TwWggi
	eDQWfg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc62j5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:33:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb8c46e240so110838a12.1
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 00:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472425; x=1795077225; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
        b=PkUMMcxEM3AkcLFa7r/mAgvNAhNJlXvsdJ4gVhioMNpypOq9r3Hp3qieJen1ONiq2X
         KjCV6VIag9S9Rg9unR73aNZlj5Jcw2QvbE4Rdhh0MNeuPGuUgnGOB7dxknTwRkoTY6dg
         ScOSnLPv5H8xKkwF0HE5x8AEqxhig1zwtQXr6Ly4NspUJkWxKxVUuQgOzi+X53pH0uE7
         0XlHhqHoVWHiC8vRBKH/l1hqsRjrHNMAU3/D1am5d4ZtqblcQpDg6zjJiCIid1lrfKTD
         gJqDRyPvE/lpp+w3OD9ssk2pyUzqpA2g0jCy6B+i5auzDO1pbMWCOlfjhe68tmxKOIEg
         ANxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472425; x=1795077225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
        b=0GA4dVw1Aji+xtbjcOZ0FHIPdb8zRYaJruNYf4Bi78VRGIvk6UL8IGY2aTeqfKfJaQ
         8eu8cGDZ8NeSPw6hiDh7c1ZoJyEGcS9fx2WdScjl3j4RJxHAPbQ8O3JCOaoGa9Nq/es+
         zZHiVI9jUTStSSBxn/kABBa3otPvJQxgBM/Mu9Fs7gIHspb3stetMuHoRmKON51jsO0K
         7uXve7Bq+QtGbcc6xjSFPavkB1hb+B+og734Y0UD85v81/TYXPVHPoB0Vy1tMD40bXSC
         Y3Ifroow1WWNRm++dzt7CQHMJEdR6MqHmj5BOjGxPTMXuv/uCUg17ab3q7UGvK/zBYqb
         ndaw==
X-Forwarded-Encrypted: i=1; AL+hErFhV4NsAYoCQ7MRxjx9biL+PvtbhlTp7PSFTfJpA5q/3bgVTWVa1XwpPdSbVLagLKYrj2ili3I=@lists.infradead.org
X-Gm-Message-State: APuU4Z/95Wbwh5JJRr3ZeC2WSH/5SJc3E/ni5vzy1TI1RAu2qSIj76+5
	n6f7bCv2aknaJqq4bsqIfSnHJcrlCAUZ3Jvd28Jx6b8j1xxXOBokEhy7roqry+vRZlPzvyOALto
	ozpxLABJm3Dn8UEwsiPjKuBtskC8UGTdFyuVip2pbCjw2fqSCV9I2QJz6UFckvqfc
X-Gm-Gg: AYBFou0pEQ70cPDkXWn8YsduL5ZyuJS0tVte9EYCDlNJ6t0VJz4vVsyai67WnXq4ewa
	WxqL+O3+yqOQmMc5p3YHub0dJK4THEugTopeTKZ9cypcQcKhQQWDJQvhziobnzrWQKoUa/mqLBh
	GtVhFPZyLuyOvsvt9u2kLtXG2WJWJA4EU1wV/eE94hpY4V0xxkgzQIDDLeyFNvKiTz+4F5ZpSMA
	hoYQTeOp/d2sgNFGKi9PTdMLZAiGK7RIK98lj+ggFKXtF4mET7wNWGgBSOfLS4TaSYko/hygoaO
	+SPBC1BTDiGZ70z/3Z7FUtOydNq40Lgfl5+Jmh7QTS9gueqmWzAJpYS+yN2bdZ6sXXnWiM5SWFZ
	lElxJOTkrTzXVuwZXjZOLV0LHYcqVEXcJ5KJTrigH63URLIelkADn2RRxYZBfK07Gb74//d2RP2
	LilgLdWhBHjjL654fyMVtbML+4dypBb2oSg2eYTRF78nBTzQYFHv+HKB0xwVmm0rkq3rsvinI9K
	g==
X-Received: by 2002:a17:90a:e7cd:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b182fb3074mr4911484a91.26.1794472425116;
        Thu, 12 Nov 2026 00:33:45 -0800 (PST)
X-Received: by 2002:a17:90a:e7cd:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b182fb3074mr4911466a91.26.1794472424567;
        Thu, 12 Nov 2026 00:33:44 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:44 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:29 +0530
Subject: [PATCH ath-next 15/15] wifi: ath12k: add Wi-Fi 8 PCI driver
 scaffolding for QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-15-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: AHXDCbjrjRKJNVeB9QDnj7FKkTAWzBV6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX7974aLydXw85
 EHrLkqWypr7LBC51aSJP76+wVN4sdE5tJlSvY23AluKa0gfE091PfUpweCQHTiE5oXtERn/hRN0
 GMQnTYvI90euv0RK2GAg/52mFFUNeEJbcOFB+UknJ7Jau+PGPCaFFIQskL4mShrFOpx0raozvx3
 BJjzhX69oSNmiyRX+y9ylYMdKJ1eqo890EXWsNfTJEOvKxQhZ5sfaFBTl0DaREgXBifMWX/pO3w
 0CxOOvzBpxLz8BcyYzCDQuqPUqSMwukd5edjZ9uPxKAGuzxmDj2WAo/E6b8pBRuF08yR3PaF884
 hRHM0MFPeVg+dY0la6rH1hxWTvl9WMOgNoE4sGwfr0CfF4Ht5hJtYpj4ttI2mDIwrNDIMHNzOwo
 DwmhyVvJDJm7fK9ijcF0yxj2dXv1pL/9zqZU+WQAsPaiia45FcXDmS9U3m9ThKtk34hZfuw/MMO
 6LcYUV5wq7qEeZR8IHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXz7DyT4zMflYY
 TXxUa6dYzZq/1DJnHRxa3sHmX14kpf+YsUf2BN6kV8klH7sPBGRBAjCrP2iy8cALDgVvzRNnNIY
 OqXD4bUkE946SjVST5C9oBCyikXXJtQ=
X-Proofpoint-GUID: AHXDCbjrjRKJNVeB9QDnj7FKkTAWzBV6
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af579ea cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Yi4xBBFUvw6BgwE4oHQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
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
X-CRM114-CacheID: sfid-20261112_083348_111076_9F14E37F 
X-CRM114-Status: GOOD (  19.75  )
X-Spam-Score: -0.9 (/)
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

Add QCN9575 PCI window register constants (WINDOW_VALUE_MASK [25:19],
WINDOW_STATIC_MASK [31:7], CE_WINDOW_MASK [13:7], UMAC_WINDOW_MASK
[20:14]) and a Wi-Fi 8 reg_base instance (ath12k_wifi8_reg_base) for
per-device window selection. Implement ath12k_wifi8_pci_probe() to
configure QCN9575-specific PCI settings: MSI vector layout (3 MHI, 5 CE,
8 DP vectors), static window mapping, window register address (0x3278),
and hardware revision. Call ath12k_wifi8_hw_init() at the end of probe
to complete hardware initialization. Define the Wi-Fi 8 PCI driver
struct with the probe callback, and register it with
ath12k_pci_register_driver() in ath12k_wifi8_pci_init().

This series only adds Wi-Fi 8 platform scaffolding; QCN9575's CP, DP,
and MAC datapath support will be posted as a follow-up series.
QCN9575_DEVICE_ID is intentionally left out of
ath12k_wifi8_pci_id_table for now, so no physical device can match and
probe until that follow-up series lands. The id_table entry will be
added in the final patch of that series, once QCN9575 is actually
functional.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h       |  2 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.h |  2 -
 drivers/net/wireless/ath/ath12k/wifi8/hal.h |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/pci.c | 89 ++++++++++++++++++++++++++++-
 4 files changed, 91 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 9e88bdf4a93b..b30a8039b2ec 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -11,6 +11,8 @@
 
 struct ath12k_base;
 
+#define HAL_CE_WFSS_CE_REG_BASE			0x01b80000
+
 #define HAL_DESC_REO_NON_QOS_TID	16
 
 #define HAL_INVALID_PEERID	0x3fff
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.h b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
index 19e02bb16ff2..fe880b0befcb 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
@@ -31,8 +31,6 @@
 	((hal)->regs->umac_ce1_dest_reg_base)
 #define HAL_SEQ_WCSS_UMAC_WBM_REG		0x00a34000
 
-#define HAL_CE_WFSS_CE_REG_BASE			0x01b80000
-
 #define HAL_TCL_SW_CONFIG_BANK_ADDR		0x00a4408c
 
 /* SW2TCL(x) R0 ring configuration address */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.h b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
index c99521abdcb3..89fa9a7f3fd9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
@@ -11,6 +11,7 @@
 #include "hal_desc.h"
 
 /* WCSS Relative address */
+#define HAL_SEQ_WCSS_UMAC_OFFSET		0xf00000
 #define HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(hal) \
 	((hal)->regs->umac_ce0_src_reg_base)
 #define HAL_SEQ_WCSS_UMAC_CE0_DST_REG(hal) \
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
index 3975081d167b..fd0489f8333f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
@@ -5,14 +5,101 @@
 
 #include <linux/pci.h>
 
+#include "../core.h"
+#include "../hal.h"
+#include "../hif.h"
+#include "../mhi.h"
+#include "../pci.h"
+#include "hal.h"
+#include "hw.h"
+#include "mhi.h"
 #include "pci.h"
 
+#define QCN9575_DEVICE_ID		0x1113
+#define WINDOW_REG_ADDRESS		0x3278
+
+#define WINDOW_VALUE_MASK		GENMASK(25, 19)
+#define WINDOW_STATIC_MASK		GENMASK(31, 7)
+#define CE_WINDOW_MASK			GENMASK(13, 7)
+#define UMAC_WINDOW_MASK		GENMASK(20, 14)
+
+static const struct pci_device_id ath12k_wifi8_pci_id_table[] = {
+	{}
+};
+
+MODULE_DEVICE_TABLE(pci, ath12k_wifi8_pci_id_table);
+
+static const struct ath12k_pci_ops ath12k_wifi8_pci_ops_qcn9575 = {
+	.wakeup = NULL,
+	.release = NULL,
+};
+
+static int ath12k_wifi8_pci_probe(struct pci_dev *pdev,
+				  const struct pci_device_id *pci_dev)
+{
+	struct ath12k_pci *ab_pci;
+	struct ath12k_base *ab;
+	int ret;
+
+	ab = pci_get_drvdata(pdev);
+	ab_pci = ath12k_pci_priv(ab);
+
+	switch (pci_dev->device) {
+	case QCN9575_DEVICE_ID:
+		ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_PCI];
+		ab->static_window_map = true;
+		ab_pci->pci_ops = &ath12k_wifi8_pci_ops_qcn9575;
+		ab_pci->window_reg_addr = WINDOW_REG_ADDRESS;
+		ab->hw_rev = ATH12K_HW_QCN9575_HW20;
+		ab->target_mem_mode = ath12k_core_get_memory_mode(ab);
+		break;
+
+	default:
+		dev_err(&pdev->dev, "Unknown Wi-Fi 8 PCI device found: 0x%x\n",
+			pci_dev->device);
+		return -EOPNOTSUPP;
+	}
+
+	ret = ath12k_wifi8_hw_init(ab);
+	if (ret) {
+		dev_err(&pdev->dev, "Wi-Fi 8 hw_init failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct ath12k_pci_reg_base ath12k_wifi8_reg_base = {
+	.umac_base = HAL_SEQ_WCSS_UMAC_OFFSET,
+	.ce_reg_base = HAL_CE_WFSS_CE_REG_BASE,
+	.window_value_mask = WINDOW_VALUE_MASK,
+	.window_static_mask = WINDOW_STATIC_MASK,
+	.ce_window_mask = CE_WINDOW_MASK,
+	.umac_window_mask = UMAC_WINDOW_MASK,
+};
+
+static struct ath12k_pci_driver ath12k_wifi8_pci_driver = {
+	.name = "ath12k_wifi8_pci",
+	.id_table = ath12k_wifi8_pci_id_table,
+	.ops.probe = ath12k_wifi8_pci_probe,
+	.reg_base = &ath12k_wifi8_reg_base,
+};
+
 int ath12k_wifi8_pci_init(void)
 {
-	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */
+	int ret;
+
+	ret = ath12k_pci_register_driver(ATH12K_DEVICE_FAMILY_WIFI8,
+					 &ath12k_wifi8_pci_driver);
+	if (ret) {
+		pr_err("Failed to register ath12k Wi-Fi 8 driver: %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
 void ath12k_wifi8_pci_exit(void)
 {
+	ath12k_pci_unregister_driver(ATH12K_DEVICE_FAMILY_WIFI8);
 }

-- 
2.34.1


