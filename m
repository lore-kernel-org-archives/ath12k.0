Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22EE606A325
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gXgwabjd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=MrsJ+Ic8;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Grcbm2Xq;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MiESHRdr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=; b=gXgwabjd6m+4Vo
	BZICiY5YjYdQ/hZBZvT9nSYSuHvczpFHk7hTAStetr9i+MhHdtZjX3FDSvmpWPuNm03DchqYv3eHY
	NTiZNSDT2lfiLOsByrwEM4GEWatzAG3vDTscuR26/AbZSHjYPQT+8sHzqlrea4Pmz1NtBSwZcAdYd
	mWX67A2rD/C+4SuMZHi/ACgboTyBt6qqmWi6WlMm4jBSA74rJuB7flFfamMUTA6SMPUKGK0WhTd5S
	c2P1BoNnqPbQMhkPOSf59/z7TH14c/IUUTV0ep8KK2vs17obkCfPTQTp7ZkLxUN7EZ0mww9raNWAo
	8IcZ/z5CEuEgoZAgMBHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ2L-00000007sO8-2chd;
	Wed, 18 Nov 2026 06:20:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ2H-00000007sLH-2eaB
	for ath12k@bombadil.infradead.org;
	Wed, 18 Nov 2026 06:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=; b=MrsJ+Ic815V43B3gZNF6H+tFG+
	ITZWyG/ktrtGNLVoVQW6PdflzCp5dZ68YLgYRACFp2oG5IgfFwyIqsZVutorgRaq+thNXnYBf0D3+
	aADGduZAMlB/7hltSNpTCVYxhRV5385KMw7n/qJKsBSg3S5xPut6HL66bH3xPXR0V1XmENvbY29UU
	utkECgbVDd2nONw3PGe5t43AIDMr7t/7G4o1flyjdE+AMLfG+TUssFv9ZJTj/g52ZR5cI251rB55S
	F1viU7QN5g0+WMJhrkYeKkVm+akuDWYoRAjiEjFLefLHFRSLKumSE7djWtuzhrYvjGaPlXsx0bNoq
	vnGTtJfg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ1I-0000000FghI-1Y7j
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 06:20:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VBPD472838
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=; b=Grcbm2XqdikCIFC6
	9bohMJTNmk66EgQmWKXYo7hkfBZiw9FLCRsPDAQV7RhojP/P/Rzd48UiMangWNcm
	MLAhQCnV5bEcu7s9Oph7fpO+RvTKsxVK6KisJg8/Ve0qQ8C1lHzor0ABfPhxKeup
	allGGuO8E/L+zW26h0DVfpe0YZd7+eAGM+chuJkePB5XF0NBGCNFRBXAaOz6ctfW
	XS5a4xjOGSIqHZFLfuom3HBb/pstpwB0aEwykyO/IXJ4fNft1t+xRcGKZ8r1F7wG
	/uIr0pFNVhb8OMBRhjuPqImtw58toemSiWvAjxNpRR5JuF+EmakBzxJc/2Gq/FFN
	lWMguA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv89ge3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:19:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so589503a91.3
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 22:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982782; x=1795587582; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=MiESHRdr2kbXpbRnmF3loEnFToho3Dcdl2rlNii7Q33KuHfoEXS3zi1WYmBq/xHf1F
         ip9uXp+AfAdUgbNXWSCVq8a11AFlGYG0Q4WyIQip8wGAJhRJmMXnDboktEd5yR8MLmF0
         7k6+I+wS6T6MO6O3yqRc/AwUTiRoykmd03APbnVw2jZJe12qIsqBc1enlMddXDDbtman
         E0lgo942bTdO05gkhim5612qQdXVSLZVI5aICvXwvvxyWCbvcbpTrxhT+lhOMUgTaeVN
         B/dZFyEPsjhdnvKqcQ+if4igfu+4djTTGGWZtJHRW5wb1Z0gXTxx0J0aMWN8JzeuYjsJ
         A+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982782; x=1795587582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=rllFPDWaAizkcaapdSXRXewugmnFXbg8PR0JIoxMdwUYrjwqpdljVjySczTm0/XlZ+
         e68SGlZ1T8QYDldnwn7S9ePLs3dAmkRa/j0a7n5ghsaQfMiSSDHZEg7gOXN236lizzxj
         foqaWv+OTQ2FJtgsEmEcMMw+BSipx3uCCloeIaJIonr+yCaSomQTG3/LkYM/3q66Hl62
         Hm+i4ovTbqJdM+Xr44Pz21tonnkbxgz4CftyZpfRG3U9ZoIhAb3i1mB/N3WKIz2HNHM0
         He3KB/COHuhQnhZ6Tuo3h3VVraeycvJOmYMsT62PPVRSUtWGTgbUvJXrFY66fhHRTd2Z
         G4Mg==
X-Forwarded-Encrypted: i=1; AL+hErF0XVBrWmXJ43ZqcUJ9jsH0tswekoTBEvmVVWeiwFzCMr0vOWOHQku3TlpR054IC8Dsjbzli7k=@lists.infradead.org
X-Gm-Message-State: APuU4Z+TtzPC/kNcWBhrKlYCNHptoVY+E75HS/MypEPefYpictuPYfbV
	N9GvqmwnVtPAuSr8zMxyy5QYeiBy11R3hcmI6BZCEeG/IuBrexJvwhRuv+HeFR4qFiuZZLj6SgJ
	TT2y4nZQFjYL3vw+Z37cTDTTq3UmavMYnLJHyg7DYDO1xqGXqaGkllVn8sTcISer5
X-Gm-Gg: AZFdTZeSO5Psr7Y6bP6/NWnvZnauONweNwpee8w53dtg8B8/kZbLxzxLOBWbE8USDnu
	flgfavjSC2V5f8EOjrpOPGLA1mLhhYGKxI/7Dr3ibRoAsjO4A2M5j39Z5tvabG4pl9xuTIMT4B+
	Tr6qdPKOB4NcXGxG3Rx55D5BcGD5Wx40dckcFoLj1Fo8fcFF03ZVmRILqROpxbhPbd5IJHTC9p/
	bmBunE7cZDTpLPlN5zlUmskBDM93h3XGCrLt0vx/xEKEbAL7K7lhbUlHDHS4mL17UM3NyLkssAU
	tlPxximAJ754AwXT4WBPF2loDD8629w7b7Ypw3D+klthDDi7NBSrTbK+jmuGMFc7YNMFbV5OEwM
	umvhqqPimdF+xhR+9S3rmDXd8EatBvuMTkrcCMJcMtxitpqlyQuRaaLuFwUYf+M2Sg4BH9anh26
	+H8I+S87MZB5N0QhZy5VXY21qiZwCIi2S6HZXaZxunDIl7LXERopGb9JdFzDd1eWrAj6IwvCCFn
	r8=
X-Received: by 2002:a17:90b:2fc5:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b3d07a8326mr1509078a91.21.1794982782110;
        Tue, 17 Nov 2026 22:19:42 -0800 (PST)
X-Received: by 2002:a17:90b:2fc5:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b3d07a8326mr1509048a91.21.1794982781577;
        Tue, 17 Nov 2026 22:19:41 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:41 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:09 +0530
Subject: [PATCH ath-next v2 06/15] wifi: ath12k: add initial Wi-Fi 8 hw
 params and init helper for QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-6-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Jx9N3HbF6YkqH9t_vNEyMmif6UlW9Q-p
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd437f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QEtot920D9eH50UxTSEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXzHKMmG3B0dv/
 W8ji8fi8vWwxsrQ6od0t7U0+k7A/Y0Pbxp6/0/dko3eDCwjY5gLSvlJ2jKuPI/nP+fIuR5UTyR3
 HziRwuUSz2SotG8nrVwOcVS+EV4IQ7tdzGvwYOlAAAWSn0PK/aWOqunEv5FaRSfNWl+WQSSWz9p
 eHPgaOl+LpRE0622RBezmQkYE5V24dMfoRN0RP9eq2uDOyJNtARy2I7oAin6XZqPQLMApHkYzRK
 RXoFU1GJzGBR398XTeGEhjaAXO6tUAudgbBNoIVBsvnS6K9RTCzU91MbPlK+HpClAZ3nKW/sCkm
 /Pd+EwRZeBQlqZr6D/mkwU9skIdbM2I6lALbsGf5iiSVj1xfKRJJmpS1ThEn0qPVK3l7Ob1NjKe
 glgWncS1+c3VkiWMF0UmDCIQS/MaIGhGZqCD6i5Rx0tBULzOarep8Wl/6JQKVmHwkP7zhASuyw1
 xztoSaIocmii/WOh8ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX4Pj1Z8fC/xih
 bYD2pBfPkiA34eaXIamj8kmQhQZUOFLT+zVoBWtE2rMYIyL4OCW/SzEnTjHbxUMoIWUddB/eqHg
 c7qkdgfTkoLWA7q9YsVCPpHnEkNhM7M=
X-Proofpoint-GUID: Jx9N3HbF6YkqH9t_vNEyMmif6UlW9Q-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_061953_821568_6FA43BFD 
X-CRM114-Status: GOOD (  24.24  )
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


