Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09552606A684
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 16:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xzGJD25u;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbjvrhbH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXOl5j94
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GewxboW2hXSDVmXaCPwYTAmOKBkHq4ztQWAaquPxL4Q=; b=xzGJD25uiIwDNk
	fl+BOcqDycfl5mGZ5IgV1ituBViQmfdb2u5PEQxNUgxBrP/Y0aBLBBolsQxl6hhRnVzNzX+lcNmdP
	xOZ7vDahKREfIiQtarJBJD8oHNzh7KvKpdE93gVwvmfngVNsXu6vr1EYM4ke/3OJG0mmCUC9d3A9q
	ICYOTUcVFOAdwqCCiTS3YlGSOlCoobRQ9qRb8vxzNaAFDmpx8iegXJGeD5+jRG8lIqf8WgdejOuvF
	GdGH/6PVwjSOCpnkxlU7R/i/VTlmcQUFdPwRUxgK8V4rL1fdNwwmBBWas87+vC4Z5qqAyEy2Sr4Oq
	FgwRHsI4Yon+e0xILYIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtcS-000000079N9-3HKw;
	Tue, 24 Nov 2026 16:43:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtcP-000000079Lw-2hKx
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 16:43:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL8Fe2318155
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GewxboW2hXSDVmXaCPwYTAmOKBkHq4ztQWAaquPxL4Q=; b=XbjvrhbHRhWqbiUE
	MSDZgkiSKt3z7maHJm7TRdqXnk2vekOnBC3JOX3AaZYScxUnUjSQgOtI5i7hLKS6
	6BiU7C55Kpye+Ih97e1pdPSbOSZ7NlPLG7rGNIhgWh6iXIScHBBZsrdWcadzGjXc
	VWTSifo4mZhcTfSXHCGOt41IVLkv2YTOeuTp4/U/JmbOrunSYyil4r73PJN6FXPP
	VBBK0YSM5u8OPoVKCMsrvalV3+DrD/M0U8O8rfv5NNDmoiEEGTVDKu9+J02cz07y
	lmRhbBn7zApKNJ9ov9+U9jGLHr4oB99oHkDM9R2i8bgAJg/JJghVJs68q1RE7GNY
	nf6Pmg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd3vec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:43:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso8285848eec.0
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 08:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538624; x=1796143424; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GewxboW2hXSDVmXaCPwYTAmOKBkHq4ztQWAaquPxL4Q=;
        b=AXOl5j94JGfnUwu8T+fROVXWAWgCvn/ZmJ6IdvzbBeoy13C1b3n+9eCBc7WPUFJDCa
         3F3lRuA+tb4rDo0aQR688VoeqAx5Q/ObxGYAO+eiWtd6qcYIp9zIDCZNL538nZjS/uPd
         m66s93XzCCzPxy5AgCU2cycNdEgrF7x0/AzZr2za3Kl6HahN59dhCzkriPR6R2uJZC0H
         pQzjZyPFdnsm5vs26CCB7pESBwEGDQGakkRQjAdn2RLhUP8BKfoa0JlgWDArk4AyeaaW
         K5HRRBfZptJLJM9Rn8Mol1oM19PVpz3mJDLSL2U9TKkz6cJE0mypXaPuvO82uatE1C50
         KkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538624; x=1796143424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GewxboW2hXSDVmXaCPwYTAmOKBkHq4ztQWAaquPxL4Q=;
        b=ctbzfVW5vRWPflyu8EX6EmOvcsrpBbGhSYpmAZ6anEfBsdnylQtSps8qWGtgd2mZyc
         3EUVa201apSniFswmuODJM5IDyZHSs5SLB2xjwjmz4IA5i+RgOsX2J/KfcvDwRwaIadU
         69q7NrpHAW/7qOxF5PXiVtlHHsM+OTkyLCEDXLI26u8Ft9z2gzoPqucoMEKvTROLw0v8
         Q0BUIxhtQHlpjkv1U5/SlrsEqDdEa4bKu3cpXUMgYjwePMr6KCTEEFvveOY72r6tW2yP
         ptM27uoFGQWP8vtIkOfIl+7ZPLDFjKXEfmHyUzRXTiLfJtNC7Hkji86FlmHzlcG2ZJFn
         Phjg==
X-Forwarded-Encrypted: i=1; AL+hErEAnj7yi7KNyuHtrCtOgDHa2k3p/0UwkoxHuCULSU3ro0ERHWIk5MIem9TCRN7QotptYcUXxgU=@lists.infradead.org
X-Gm-Message-State: APuU4Z+x+hx1lE3xw7J1GBv4sP9RlyU9h99pf+lpE2oZjif6RWth+g5Y
	EkvtzUiCTx/57aGCDwzGCJ9A0RN5RPpdf0Br7N3WaJF8Q96fB4I9cTJUJygwt89lIJNVl+VZjl6
	UlrQ+Mnm8KnNE1BQEgOoFG8tBkXrQQGHGAdiHFpqAVFeGf96cx5SFjOEHmC9ZE9ee
X-Gm-Gg: AZFdTZduW+q5+Mu7Kuf7F1eYl6xOY+mG6SFRjPUE2I/2DyYAIyP7TwwJ0XE2E2F/z68
	0LNHDUvDQNxgMQN3JisCweRHIvXziN8Lrh8hT8dxLHDAiEhMYLMreAAIBjTxFQPGs5WSznw3lnZ
	RiWlqUQmYwlQjfyhtrjTs3beAJghNhjiT1Hwhfrwk11biDqvQAIBeL3Atvh/hPsApiKyQQ6Ji/R
	LbKGAbPQNGTYzw38iedbj2Vc3MeIMtzGZmjUYOd0blTsO5LejhxMs/YjdGiEdx7JZIjBRxmIDvj
	6FoNwavrcxJHn6dJNRPrGrIIzKwCcOG7hvWOun9rVjMz00+GE5lsbqNOtUySxW47faRBj9DuXir
	mEDu/Dbcq0hr354weZL8scm1JNnWjxqjG6wdsnw7rKS02FX7XlwkRIzclCSOJg8OobQaAI0ySua
	yy48oRZvt+1W2EUtSf5GKamWSRv0g3eSgrjOkDyEOm18tgtWg46/i2pL5NEVj9BnZQ619DW541t
	qM=
X-Received: by 2002:a05:7300:ce8f:b0:369:f035:661 with SMTP id 5a478bee46e88-38570450918mr12922051eec.15.1795538623493;
        Tue, 24 Nov 2026 08:43:43 -0800 (PST)
X-Received: by 2002:a05:7300:ce8f:b0:369:f035:661 with SMTP id 5a478bee46e88-38570450918mr12922010eec.15.1795538622611;
        Tue, 24 Nov 2026 08:43:42 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:43:42 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:27 +0530
Subject: [PATCH ath-next v4 01/14] wifi: ath12k: refactor PCI window
 selection to per-device layout
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-1-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b05bec0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=MC8DN0fT8aYryp_U8K8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX6MmdueQJeNpd
 aGNFpt0EX/WTZVdXUgNgo0RPskztnCRkmp0OdITjsTqwcAB/l4GEsdP+y9cR+TDdGUImjysobMe
 S1P/hKQzyHwXcIZepVGsPblmU+PfTiDCiLN8Sut74r06wvOkcJBtkwismF0nGTHVjS95BAG+3Pm
 Pavh1Ljl0sykWZxmn3qi622RbuvCf0gaH/JJ2SyYhkrYFGCQMh5sBvPJxLcLaXsuqiUEt40wKel
 eoRwrfsMIGYsryQM5LQPH75IjwakaCvurbT4q//tzzasi2p3heDZdEcCHRasJ/sjqfzxhdJUKty
 BctCIHDbBoTRy14mO44P1o4YXJ3Pz0IV/+PVIKY/PEX41Mkavv3CEWswbuLueMjAeEtIP4DsjCW
 B5R0M263KCxmHgBLikAOv7VUYsso9xMPSg4ga0Gp5L16SvRWewJl0BMcdz7ZcmjWOZw2t8fpPnQ
 iV1xp2mGuTgtxa35XlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX9ZLAhqTQMsU9
 QcURZ9R3pjYyGxkqD/TRkbajOyc93xnHCdC3Y6BMzCZtn7N+AwbzyRaXaJKhV64jeQSryI8ypC9
 y01Ryab1DLAd1SqcD0pa8jkkPwEKkus=
X-Proofpoint-ORIG-GUID: vcTgeF4CrDk70AGVtL3KRYTW0EFz9yiy
X-Proofpoint-GUID: vcTgeF4CrDk70AGVtL3KRYTW0EFz9yiy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_084345_833215_2867A07B 
X-CRM114-Status: GOOD (  24.50  )
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

ath12k currently assumes a fixed PCI/AHB window layout with value bits
[24:19], CE shift 6, and UMAC shift 12. Those values match Wi-Fi 7, but
QCN9575 uses a different window field and shift layout. With fixed
values, ath12k programs an incorrect window and breaks register access.

Move window layout parameters into struct ath12k_pci_reg_base and
struct ath12k_ahb_reg_base, and use them in ath12k_pci_select_window(),
ath12k_pci_select_static_window(), ath12k_pcic_config_static_window(),
and ath12k_pcic_select_static_window(). Set the Wi-Fi 7 values in
ath12k_wifi7_reg_base and ath12k_wifi7_ahb_reg_base so each device
family provides its own window mapping for both the PCI and AHB bus
paths. Move the window register address into struct ath12k_ahb as
window_reg_addr, mirroring the existing per-device window_reg_addr in
struct ath12k_pci. Replace the open-coded u32_get_bits() calls that
assumed the fixed WINDOW_VALUE_MASK constant with field_get() and
field_prep() using the per-device masks. Remove the now-unused
WINDOW_VALUE_MASK and WINDOW_STATIC_MASK constants from the common
pci.h and move the Wi-Fi 7 window constants into wifi7/pci.h.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.h       |  6 ++++++
 drivers/net/wireless/ath/ath12k/pci.c       | 15 +++++++++------
 drivers/net/wireless/ath/ath12k/pci.h       |  8 ++++----
 drivers/net/wireless/ath/ath12k/pcic.c      | 27 +++++++++++++++++----------
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c |  6 ++++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c |  4 ++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.h |  8 ++++++++
 7 files changed, 54 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
index 373dc3b92728..712fddb03f6a 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.h
+++ b/drivers/net/wireless/ath/ath12k/ahb.h
@@ -14,6 +14,10 @@
 struct ath12k_ahb_reg_base {
 	u32 umac_base;
 	u32 ce_reg_base;
+	u32 window_value_mask;
+	u32 window_static_mask;
+	u32 ce_window_mask;
+	u32 umac_window_mask;
 };
 
 #define ATH12K_AHB_RECOVERY_TIMEOUT (3 * HZ)
@@ -111,6 +115,8 @@ struct ath12k_ahb {
 	bool supports_multipd;
 	u32 static_window_reg;
 	const struct ath12k_ahb_reg_base *reg_base;
+
+	u32 window_reg_addr;
 };
 
 struct ath12k_ahb_driver {
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 4bb14a95aec9..6617440954b1 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -125,14 +125,15 @@ static const char *irq_name[ATH12K_IRQ_NUM_MAX] = {
 static void ath12k_pci_select_window(struct ath12k_pci *ab_pci, u32 offset)
 {
 	struct ath12k_base *ab = ab_pci->ab;
-
-	u32 window = u32_get_bits(offset, WINDOW_VALUE_MASK);
 	u32 static_window;
+	u32 window;
 
 	lockdep_assert_held(&ab_pci->window_lock);
 
+	window = field_get(ab_pci->reg_base->window_value_mask, offset);
+
 	/* Preserve the static window configuration and reset only dynamic window */
-	static_window = ab_pci->register_window & WINDOW_STATIC_MASK;
+	static_window = ab_pci->register_window & ab_pci->reg_base->window_static_mask;
 	window |= static_window;
 
 	if (window != ab_pci->register_window) {
@@ -145,13 +146,15 @@ static void ath12k_pci_select_window(struct ath12k_pci *ab_pci, u32 offset)
 
 static void ath12k_pci_select_static_window(struct ath12k_pci *ab_pci)
 {
+	const struct ath12k_pci_reg_base *reg_base = ab_pci->reg_base;
 	u32 umac_window;
 	u32 ce_window;
 	u32 window;
 
-	umac_window = u32_get_bits(ab_pci->reg_base->umac_base, WINDOW_VALUE_MASK);
-	ce_window = u32_get_bits(ab_pci->reg_base->ce_reg_base, WINDOW_VALUE_MASK);
-	window = (umac_window << 12) | (ce_window << 6);
+	umac_window = field_get(reg_base->window_value_mask, reg_base->umac_base);
+	ce_window = field_get(reg_base->window_value_mask, reg_base->ce_reg_base);
+	window = field_prep(reg_base->umac_window_mask, umac_window) |
+		 field_prep(reg_base->ce_window_mask, ce_window);
 
 	spin_lock_bh(&ab_pci->window_lock);
 	ab_pci->register_window = window;
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 55cc875f9ce0..62b72558c0e2 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -77,12 +77,8 @@
 #define QRTR_PCI_BUS_NUMBER_MASK	GENMASK(3, 0)
 
 #define WINDOW_ENABLE_BIT		0x40000000
-#define WINDOW_REG_ADDRESS		0x310c
-#define WINDOW_REG_ADDRESS_QCC2072	0x3278
-#define WINDOW_VALUE_MASK		GENMASK(24, 19)
 #define WINDOW_START			0x80000
 #define WINDOW_RANGE_MASK		GENMASK(18, 0)
-#define WINDOW_STATIC_MASK		GENMASK(31, 6)
 
 struct ath12k_msi_user {
 	const char *name;
@@ -118,6 +114,10 @@ struct ath12k_pci_device_family_ops {
 struct ath12k_pci_reg_base {
 	u32 umac_base;
 	u32 ce_reg_base;
+	u32 window_value_mask;
+	u32 window_static_mask;
+	u32 ce_window_mask;
+	u32 umac_window_mask;
 };
 
 struct ath12k_pci {
diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
index b6d306fd3b99..de71cd0930cd 100644
--- a/drivers/net/wireless/ath/ath12k/pcic.c
+++ b/drivers/net/wireless/ath/ath12k/pcic.c
@@ -15,13 +15,19 @@
 void ath12k_pcic_config_static_window(struct ath12k_base *ab)
 {
 	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
-	u32 umac_window = u32_get_bits(ab_ahb->reg_base->umac_base, WINDOW_VALUE_MASK);
-	u32 ce_window = u32_get_bits(ab_ahb->reg_base->ce_reg_base, WINDOW_VALUE_MASK);
+	const struct ath12k_ahb_reg_base *reg_base;
+	u32 umac_window;
+	u32 ce_window;
 	u32 window;
 
-	window = (umac_window << 12) | (ce_window << 6);
-	writel_relaxed(WINDOW_ENABLE_BIT | window, ab->mem + WINDOW_REG_ADDRESS);
-	ab_ahb->static_window_reg = readl_relaxed(ab->mem + WINDOW_REG_ADDRESS);
+	reg_base = ab_ahb->reg_base;
+	umac_window = field_get(reg_base->window_value_mask, reg_base->umac_base);
+	ce_window = field_get(reg_base->window_value_mask, reg_base->ce_reg_base);
+	window = field_prep(reg_base->umac_window_mask, umac_window) |
+		 field_prep(reg_base->ce_window_mask, ce_window);
+
+	writel_relaxed(WINDOW_ENABLE_BIT | window, ab->mem + ab_ahb->window_reg_addr);
+	ab_ahb->static_window_reg = readl_relaxed(ab->mem + ab_ahb->window_reg_addr);
 }
 
 static int ath12k_pcic_select_static_window(struct ath12k_base *ab, u32 addr)
@@ -32,20 +38,21 @@ static int ath12k_pcic_select_static_window(struct ath12k_base *ab, u32 addr)
 	const int max_retries = 10;
 	int i;
 
-	window_bits = u32_get_bits(addr, WINDOW_VALUE_MASK);
+	window_bits = field_get(ab_ahb->reg_base->window_value_mask, addr);
 
-	/* Update window bits [5:0], preserving other bits */
-	new_window = u32_replace_bits(ab_ahb->static_window_reg, window_bits, 0x3f);
+	/* Update the dynamic window bits, preserving the static window configuration */
+	new_window = (ab_ahb->static_window_reg & ab_ahb->reg_base->window_static_mask) |
+		      window_bits;
 
 	if (new_window == ab_ahb->static_window_reg)
 		return 0;
 
 	reg_value = WINDOW_ENABLE_BIT | new_window;
-	writel_relaxed(reg_value, ab->mem + WINDOW_REG_ADDRESS);
+	writel_relaxed(reg_value, ab->mem + ab_ahb->window_reg_addr);
 
 	/* Wait for the write to take effect */
 	for (i = 0; i < max_retries; i++) {
-		if (readl_relaxed(ab->mem + WINDOW_REG_ADDRESS) == reg_value) {
+		if (readl_relaxed(ab->mem + ab_ahb->window_reg_addr) == reg_value) {
 			ab_ahb->static_window_reg = reg_value;
 			return 0;
 		}
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index ae5380eb6f8f..8552f403864e 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -15,6 +15,7 @@
 #include "dp.h"
 #include "core.h"
 #include "hal.h"
+#include "pci.h"
 
 static const struct ath12k_ahb_userpd_map ath12k_wifi7_ahb_userpd_map[] = {
 	{ .io_start = 0x0c000000, .upd_id = ATH12K_AHB_USERPD_ID_0 },
@@ -91,6 +92,7 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EOPNOTSUPP;
 
+	ab_ahb->window_reg_addr = WINDOW_REG_ADDRESS;
 	ab->target_mem_mode = ATH12K_QMI_MEMORY_MODE_DEFAULT;
 	ab->hw_rev = desc->hw_rev;
 	ab->hif.ops = desc->ops;
@@ -112,6 +114,10 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 static const struct ath12k_ahb_reg_base ath12k_wifi7_ahb_reg_base = {
 	.umac_base = HAL_SEQ_WCSS_UMAC_OFFSET,
 	.ce_reg_base = HAL_CE_WFSS_CE_REG_BASE,
+	.window_value_mask = WINDOW_VALUE_MASK,
+	.window_static_mask = WINDOW_STATIC_MASK,
+	.ce_window_mask = CE_WINDOW_MASK,
+	.umac_window_mask = UMAC_WINDOW_MASK,
 };
 
 static struct ath12k_ahb_driver ath12k_wifi7_ahb_driver = {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/pci.c b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
index 783c5d020f07..6dc674e045be 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
@@ -167,6 +167,10 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 static const struct ath12k_pci_reg_base ath12k_wifi7_reg_base = {
 	.umac_base = HAL_SEQ_WCSS_UMAC_OFFSET,
 	.ce_reg_base = HAL_CE_WFSS_CE_REG_BASE,
+	.window_value_mask = WINDOW_VALUE_MASK,
+	.window_static_mask = WINDOW_STATIC_MASK,
+	.ce_window_mask = CE_WINDOW_MASK,
+	.umac_window_mask = UMAC_WINDOW_MASK,
 };
 
 static struct ath12k_pci_driver ath12k_wifi7_pci_driver = {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/pci.h b/drivers/net/wireless/ath/ath12k/wifi7/pci.h
index 662a8bab0ce7..1017975b4c9f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/pci.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/pci.h
@@ -6,6 +6,14 @@
 #ifndef ATH12K_PCI_WIFI7_H
 #define ATH12K_PCI_WIFI7_H
 
+#define WINDOW_REG_ADDRESS		0x310c
+#define WINDOW_REG_ADDRESS_QCC2072	0x3278
+
+#define WINDOW_VALUE_MASK		GENMASK(24, 19)
+#define WINDOW_STATIC_MASK		GENMASK(31, 6)
+#define CE_WINDOW_MASK			GENMASK(11, 6)
+#define UMAC_WINDOW_MASK		GENMASK(17, 12)
+
 int ath12k_wifi7_pci_init(void);
 void ath12k_wifi7_pci_exit(void);
 

-- 
2.34.1


