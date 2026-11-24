Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9153606A329
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 16:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mAk0TeJM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=BQ667Yoo;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hNVvFusJ;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pqcqpfmb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=; b=mAk0TeJMZmVhi8
	YGrt6RZcZ1sI0SdS3U3NvX8lck15pwThfwxaosYB/hXRpH6kS5sXSOKaBMRQps2uJdHDNjAihbRmL
	oCJkDVCkjrOdtCorFRX1ZUzZsCJCRbPJP2fRgKwEQaxtL0XUyrIXhFGohEwsNtZ+8ZjWvkxv4VtB/
	kSjzsdU+m8LNBc213c2m64Gg1qsYzRyW3wwyzIMndyxXbTKi5Ar3JU1ukg5NiJCH+k9CkoJD42Laf
	N58ntmhvswNBW2JV50V2vk00Ox+f5Fjzwq+uO/zwWqn+C6e6Mn4OFoI3p4G7rpHWvmWqkKK1Vzu5y
	qAdTdcgR+kRjekdwjpEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtcr-000000079aR-2daq;
	Tue, 24 Nov 2026 16:44:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtcq-000000079ZP-0mUU
	for ath12k@bombadil.infradead.org;
	Tue, 24 Nov 2026 16:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=; b=BQ667YooBC4k8IpLXKvshLdZZn
	cFO5pDKO70KfH+xYTSkK2GNgMGFDjEH412KYP40x6o8Jyhh2ArLygzReozZyNxtg9nKnBheiCOaRp
	pAufNCcfAUaD1rJXREsZiqfs3aYfzk2O0wRkDyFpZhtCeUuwxJJb2kWihvi9VthEzT/E0OCUUvu35
	whoIQu3Vr5nYuMWIxEsVk844mT0bW8KmDU0Ug9wjlbnYiU6K8hnDWR7CvhFBIFEjLfuelTPSmwJiq
	Y96Z/836Umhbh9r+IguoFbYB48ljLHN5o3Y/q+/El9hLtM4wsZcURcAPHbNyD7HFEvcX44J2qH7Sn
	38QTyZFA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtcm-00000009C8N-1Yvy
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 16:44:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL1dN1872684
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=; b=hNVvFusJ3kuKBjTW
	hRHLsDJjEyLz784A7pZiQjf9pialRZETnvetRZpwRukEOp1hBr7E85hxcTK+NwPP
	lh/qrDv9CM2QFZeiCUaHWBISHskzJaF7ugPNHz38yGlfpZyJdezRICclL81j5KaP
	V5Fe32hGI3QW7imhswH/p25qWBydwNaGLY61/qp+mlzbUHn58OacKiaskkvfuIjF
	n1lDMS1G+aCrTQEK6CrlMr8UXd1Y+hO2FrhV2/cadZ0y4Ne2fp3P8n115LDq40jX
	SIOB8qXJ/Sc1aDF7oPwfiqed5yDu9dXmzPSzJUsfrnFtWM/tsxiPJgpTAh6uByL/
	YekWEw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxk8ejn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:44:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386ad819860so2648294eec.0
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 08:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538643; x=1796143443; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=PqcqpfmbV58rWcqUM0xWcJWL2UwI7ce5z3k0amfM9Otw7+kn7XxPbFRC9cqEqdudHY
         1hu4Dfd71Z9XA4TPW/hkhgfCYOOOtjziJyjeIvFYz1lvf1goz536mZAkMHkP7VYyi/Ey
         SmdWeI57nvjhL4nU8t22ICYh5cbD13Pz1dhK02eLpRuslFFFNLNIwX+a8ObHnNhaGI5X
         wN7jU8d/EvCc6GywaazUgbxkZ486Vt7Uy2M3sUlpHL1+FBJTvceVcXjGFWedN8pQ4oYz
         TS/rfUlBskLMqKFRO4nIskfy/BzhuSNT/epkKmayiqw4diJ+rdRh84kpmJJ+dAsJ/omg
         L1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538643; x=1796143443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=PK2DNkKGlafORsURlyAjcU/3yTGcV3aphyg6NeJvyytIk+c/N83+4L/yqx5v7uvzLg
         j8jbCDvTXaH6xm6i5d4FqYehRUCptXLUF+JQ2h7IdxsIZoQT6uBDWIAXSOJQoaXa1PQ0
         a62tMAbG48fo2Qku8sVc77gXZ7PvR+3WzyhY9gWlIi1Z1sdOg6OJBGUWO/zidPjO5iLt
         FuN0NCqh1B9DsX1kC5juoJe8+/UaQ+6YfJxjwRRx2Wadx5cfBr0ytuHfgF1ap6OrQ9Pg
         n//cUpd2xT5LVgftftT2GRXfNlI+Va2ShVBDvoBREspRB70mqgpKNGukEeX/ITwx/kEe
         rDjg==
X-Forwarded-Encrypted: i=1; AL+hErEf6SduruclT7FteMHSmV3XnnUZjoy+IUt2TWe0oKmofZL7s77AUn+ZKU8ytbNiBGNvHk9ULEE=@lists.infradead.org
X-Gm-Message-State: APuU4Z82EEjjLVqljRs+KOhEOdmGe1VrijFdxudymsXAoVcNMqWrOKId
	Ez/xS1Gu6hsXT9oueafvZ0MRZrMCneHCulbnVsga++sXLndHrude4AA41qfOufLCJUEVbt2BdPM
	DD4szL9BrHbKsIXHMK9WBPgqGgKlIJA9d5dsSwcmbjaAU3OCSsgqtohRTtxWsgaeo
X-Gm-Gg: AZFdTZebLu8HbaeMVsRZ6s/JfuisDGpq10T+qlhHPIMR5Nf3lDVZ9ugXXSBoH858518
	k2vV2aQR7ePdkiYQrLHz5tBtEC73zrECVQL95hiAJL2jgzZW1CrgofCJRwD1OlKQCeAsTcpwz1i
	iJcl8IkJWoiUXi85Rw8QJkTY0onQXAEK2TXbgvog/FwP6S75BDJ6kJwl0D4sO8j94qwPh4mHt0o
	28Mpsaqblbd1IgUDE5kjxbKiIpjmE/n00kgrqb3J4tq6iIZ9ZDL66LoDYa3+QOmSZXiIyqR3oFJ
	3jNa0t7IJuf+BoQSGt6PklkexME5dR4HL6rRCWHxZUIN8B77zb5bYmeH+bKyJyuDX7lywvfTkPE
	eY0Xlj46jw+VaL4yygS4cPAodRCk2+6nMMAWztuLIO+JVkxwWdm48Xkgl5cfZsu4voYJD57YAaO
	ecSh67JlAb2jspLnMl+uy2RK/mi/BrzV8/uehWU5jUQYt0ApG2NO1w3D3jGi94g2wIj4L8l60BV
	Sg=
X-Received: by 2002:a05:7301:923:b0:36a:1709:458 with SMTP id 5a478bee46e88-3856f859121mr17415992eec.27.1795538643124;
        Tue, 24 Nov 2026 08:44:03 -0800 (PST)
X-Received: by 2002:a05:7301:923:b0:36a:1709:458 with SMTP id 5a478bee46e88-3856f859121mr17415963eec.27.1795538642407;
        Tue, 24 Nov 2026 08:44:02 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:02 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:31 +0530
Subject: [PATCH ath-next v4 05/14] wifi: ath12k: add initial Wi-Fi 8 hw
 params and init helper for QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-5-1f5b87ece6a3@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXwu1yNGFgQnF/
 7pavIx4CTDKcTfUOr366lrZWZDECP8pjMWzZJ539eth3RhgGrHmUlZgGH2JYHnThfikvEecOdP7
 Nzou72YzslRCdccN4rfT0pD3mhP3fj7i+Mc/2p2t+xsLcEHdbminQ28mmAkXlgzevcr/bkTHGzC
 krPQkIKGbYFPBlFAMgpwCI0HGSEjZT9rlMD0GCNXfuwWJaC4NplUi/6MljoNwhnIWqW26V7TKD8
 07WmdQsdByglrRQyQETCx+JS2qCe9+g85mRzeZdXvbHbMa9eWo9hlBkKovbThgb6w6+v5Sd7BY4
 kLCuS3VsSQP7kJ7TFvF0FFUQD/BX1/61krAA7xqn9wM3lwGctr+90O7oXqu2Bofrng8Z9zPCm27
 eeX2KCeDLPe6+KmFi9aJAYnLKyrUKTbab6L6Srn7PZExu43JJBCCmCeXJXI2VlpqAWcNz4MEW0l
 QPUp1Fw9iTzSTatzWIg==
X-Proofpoint-GUID: WCDYRjOn_FT951NiqphSg6q-SPReadqr
X-Proofpoint-ORIG-GUID: WCDYRjOn_FT951NiqphSg6q-SPReadqr
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b05bed4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QEtot920D9eH50UxTSEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX/zosZwAPJkLr
 rxcU2BSkpCnu11oAWTlL/MFdJzw3ai4P3l3FGGNt6JpVWAuJWZWJ+qahwqf4SMBGGmrG0SZH+T+
 NWnnPPpHR/6wgdKLyI+DkT47TrApWrg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_164408_797377_13DBEE20 
X-CRM114-Status: GOOD (  21.91  )
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

QCN9575 is a Wi-Fi 8 target that requires its own hardware-params entry
to be matched at probe time. Add ATH12K_HW_QCN9575_HW20 to ath12k_hw_rev
and populate the initial parameter set in wifi8/hw.c. Introduce
ath12k_wifi8_hw_init() to walk the Wi-Fi 8 hw_params table and select the
matching entry at runtime. Hardware-specific operation pointers (hw_ops,
wmi_init, mhi_config) and CE config tables are left as NULL placeholders
until the corresponding subsystem support is added. Explicitly initialize
every top-level member of the hw_params entry, including zero/NULL/false
defaults, rather than relying on implicit designated-initializer
zero-fill, so the full set of fields is visible and easy to audit as
later patches replace individual placeholders with real values. Add
wifi8/hw.h and wire wifi8/hw.c into the wifi8/Makefile.

Define QCN9575_QFPROM_RAW_RFA_PDET_ROW13_LSB with the correct OTP
register address 0x1F90070 and set it as the otp_board_id_register in the
QCN9575 hw_params.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h         |   1 +
 drivers/net/wireless/ath/ath12k/qmi.h          |   1 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |   1 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     | 135 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hw.h     |  14 +++
 5 files changed, 152 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 2a4b5e5e1af3..56b509841126 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -159,6 +159,7 @@ enum ath12k_hw_rev {
 	ATH12K_HW_QCC2072_HW10,
 	ATH12K_HW_IPQ5424_HW10,
 	ATH12K_HW_QCN6432_HW10,
+	ATH12K_HW_QCN9575_HW20,
 };
 
 #define ATH12K_IRQ_NUM_MAX 57
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index fc68ff649352..438ab92802bf 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -19,6 +19,7 @@
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_WCN7850 0x1
 
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9274	0x07
+#define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9575	0x07
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332	0x2
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN6432	0x60
 #define ATH12K_QMI_WLANFW_MAX_TIMESTAMP_LEN_V01	32
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index b8c5b6d3a7bd..277b5f13754d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
 ath12k_wifi8-y += core.o \
+		  hw.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
new file mode 100644
index 000000000000..6e89a42111b6
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/types.h>
+
+#include "../core.h"
+#include "../debug.h"
+#include "../hw.h"
+#include "../mhi.h"
+#include "hw.h"
+
+static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
+	{
+		.name = "qcn9575 hw2.0",
+		.hw_rev = ATH12K_HW_QCN9575_HW20,
+		.fw = {
+			.dir = "QCN9575/hw2.0",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+			.m3_loader = ath12k_m3_fw_loader_driver,
+			.download_aux_ucode = false,
+		},
+		.max_radios = 2,
+		.single_pdev_only = false,
+		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9575,
+		.qmi_max_chunk_size = SZ_2M,
+		.internal_sleep_clock = false,
+
+		.hw_ops = NULL,
+		.ring_mask = NULL,
+
+		.host_ce_config = NULL,
+		.ce_count = 16,
+		.target_ce_config = NULL,
+		.target_ce_count = 0,
+		.svc_to_ce_map = NULL,
+		.svc_to_ce_map_len = 0,
+
+		.rxdma1_enable = false,
+		.num_rxdma_per_pdev = 0,
+		.num_rxdma_dst_ring = 0,
+		.rx_mac_buf_ring = false,
+		.vdev_start_delay = false,
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+					BIT(NL80211_IFTYPE_AP) |
+					BIT(NL80211_IFTYPE_MESH_POINT),
+		.supports_monitor = false,
+		.supports_cong_ctrl_max_msdus = false,
+
+		.idle_ps = false,
+		.download_calib = true,
+		.supports_suspend = false,
+		.tcl_ring_retry = false,
+		.reoq_lut_support = false,
+		.supports_shadow_regs = false,
+
+		.num_tcl_banks = 0,
+		.max_tx_ring = 0,
+
+		.mhi_config = NULL,
+
+		.wmi_init = NULL,
+
+		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
+
+		.rfkill_pin = 0,
+		.rfkill_cfg = 0,
+		.rfkill_on_level = 0,
+
+		.rddm_size = 0x600000,
+
+		.def_num_link = 0,
+		.max_mlo_peer = 256,
+
+		.otp_board_id_register = QCN9575_QFPROM_RAW_RFA_PDET_ROW13_LSB,
+
+		.supports_sta_ps = false,
+
+		.acpi_guid = NULL,
+		.supports_dynamic_smps_6ghz = true,
+
+		.iova_mask = 0,
+
+		.supports_aspm = true,
+
+		.ce_ie_addr = NULL,
+		.ce_remap = NULL,
+		.bdf_addr_offset = 0,
+
+		.current_cc_support = false,
+
+		.dp_primary_link_only = false,
+		.client = {
+			.max_client_single = 0,
+			.max_client_dbs = 0,
+			.max_client_dbs_sbs = 0,
+		},
+
+		.host_alloc_ml_id = false,
+		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
+
+		.support_hw_link_id = true,
+	},
+};
+
+int ath12k_wifi8_hw_init(struct ath12k_base *ab)
+{
+	const struct ath12k_hw_params *hw_params = NULL;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ath12k_wifi8_hw_params); i++) {
+		hw_params = &ath12k_wifi8_hw_params[i];
+
+		if (hw_params->hw_rev == ab->hw_rev)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(ath12k_wifi8_hw_params)) {
+		ath12k_err(ab, "Unsupported Wi-Fi 8 hardware version: 0x%x\n",
+			   ab->hw_rev);
+		return -EINVAL;
+	}
+
+	ab->hw_params = hw_params;
+
+	ath12k_info(ab, "Wi-Fi 8 Hardware name: %s\n", ab->hw_params->name);
+
+	return 0;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.h b/drivers/net/wireless/ath/ath12k/wifi8/hw.h
new file mode 100644
index 000000000000..ad11370f9752
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_HW_H
+#define ATH12K_WIFI8_HW_H
+
+#define QCN9575_QFPROM_RAW_RFA_PDET_ROW13_LSB	0x1F90070
+
+struct ath12k_base;
+int ath12k_wifi8_hw_init(struct ath12k_base *ab);
+
+#endif /* ATH12K_WIFI8_HW_H */

-- 
2.34.1


