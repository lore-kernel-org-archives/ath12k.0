Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44C4606A880
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 08:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O/m7bPb1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=R3ibJD6e;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gd/+fv9J;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VTWLPeX9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=; b=O/m7bPb1KnDDnC
	NxE8rDj6nzsUzT402ZU86pALWSM7zOr/NXe1RaDTy38kWXp44T7SNxMpTaY3eAqP7SNYHy9GVNHvX
	UIhXw5It9fv7Ne39uMn4QyUX/vOERdy+E7SqDHtridQokwQGkN5Cj60qf5G73vRq8s0T8jw00+0jA
	KD4wErYyw/reFTOTckRRNbGvpl41uY7pgXr/rNZxCfK7cnjIMlZtL4ws/xaKzOK9Q2dwGdi5NYpGh
	G7gZg8rJ3QazfqS3XIbnP9ubyvwfnyB0bCYFLgG1VVa+7l3x0bzpX/d/Sn7fdgcZ2acQr5BuNIY4v
	WCFvFk92XtnbHgK3veug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTapz-000000088IJ-28E1;
	Wed, 18 Nov 2026 08:16:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTapx-000000088G3-2qGz
	for ath12k@bombadil.infradead.org;
	Wed, 18 Nov 2026 08:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=; b=R3ibJD6eIfzO1EFsIUq95etujZ
	V4NeB1rYbha5QqaerPRs/MvCbNETAv5O61Zk6rkmOHSAO54PZCejasEJqGvXD5DDKX9Ib9z8HqbdQ
	h5Q2q2wgkTybGfH43TWZmqNtU8mhAqHj4BwNG0ve3TFuk5sfoQxutCoU1d2cwkysQWDJhn3fQ18X0
	MPC6r6Mw9fcDKHZe21fljBB8vuBlBFiRyov2fVu1qvrZwf72gnYu5pcrrFJRzHhUthxnMhlbUHoZ9
	aF9sjyeHY5iq/HQog5kkRl1tlOLgG+EtBhGikwCuaCdO32n2J0swdn7u+xyIPymGTNVxqTCf5i3Ot
	zUgI+MrA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTapr-0000000FmJX-41e4
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 08:16:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Urno2383084
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=; b=gd/+fv9Je/WDy+wf
	mc6jOJedFBF/SPzhIsNWDj0hxEvzxOlojOXK26/p/uwQo/TfE2jkuUIJ/im07ezO
	rrFdFrMlLKPpVZrXzs3CXPbHz9K7+T5YMlaQpgJGivNyJCl0I3a3lfc/fn4eXy2l
	/NIqeudzIgpQ/+xE6UH2hAqMJwyGDNrwqHqlmNw8dbENwEUlLhKQFsnYsYrbZb/l
	37aMreWx3dhuK9lVdt/LY6sixcnKmwZ0n+ctonHL5Oge98K3NJaFawD3A5m1DG9l
	oro5GY9g+4Q57I+s2W5WmnnmkuotIWo83HgyIbz0lJnX1JacibKCDdl7UrCQmFo7
	tdrajg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvat0nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:16:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so986233a91.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 00:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989763; x=1795594563; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=VTWLPeX98UgIjUGWk0SqaC7vaBfkSRRNNgT9gXN7auVVif6TGPHy2DnvBCJHPnndZX
         A30VNI9uE/ytv1yAOX2vL0ouCCA9+xWbUeDQQT4XNpa8HoFliOaWyGCKjFtL81NyZwTh
         Mrhf0S8C4xzJlHN0Wf7BAEMx+yoW8w0NPQ/O5uT/84UXEf7fGwroDo0I9s1I24o0nNoL
         /JVkJPNH8oX8m1ZyxXpev1YND312DK14BszJgZz+IEMJm7ETS15wEainP22Lz78i7J5/
         61Cfybtry5NGNqQ06d2Ky/NU3yOZxY73Bgd9Pqsejbmjv78RJeADHS9YGtm1zX7m5u57
         nupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989763; x=1795594563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=jM6zrNLjS/cfeiA0Kh1GcJzwnq9lvgtcPyfbKC6Gl8GuwLWGRBWNkvrQpJdzygW8X6
         vsjZMunEhcYDyaqWwL6cnBqXjrtQ3WikjHYaGNqPUgKIIKzD5Zl1D9V6I0NSqiQfeG+U
         AMSiSK8g0tZLwfJom3Daa0OQM4gWdp4gc7uV8iATlm90PwlWc2vrnEeRcr1a4z7+lFOS
         KgpYa/SMFITlLmyxo7jLPB6fuE9iYIZ6ofCtUQGHRlVJhVfsLkJxz41QiLdyuKqhUxe+
         JCOR1S1ukVMGplusvElm1v3z28nxPaCZiiLIz+nizGctS32DXI3Z+yxJ+/zDeBXzyHlR
         zo2w==
X-Forwarded-Encrypted: i=1; AL+hErEAdhLiTdJo6vqUvwVRpqwT4KUXIojq5sRwxf43xSLzzPDZTGbOh5a5yOmFHS/X3TEMnXd09Ak=@lists.infradead.org
X-Gm-Message-State: APuU4Z9cJveQ5tfeklMN6UVE34hzszvgdQZRBxVmF/pxuLlH3N32wZkQ
	6YR2wT4/gCwz25H390O/sH0tvDUjB2VbUxSTGnxfoTCKyO24eHy/QN3j8wP93a9o9Xhzv1EBG0L
	nKotjpFzOLM3CWPV4TxxqmEYIf8AdeSBiDPKCMm/HFTspiEhXV1O7HF/ciiEznKAkGabJ8hQb
X-Gm-Gg: AZFdTZdn3CVdhT9vYHpno9c10Oga2S4uUr3mnQyTydzGLcq41wsO2BgkkadKoPVDZyi
	rnikwm/O9y6WbDUJN2WPfNEI7a+c1u2mrLwjWrqjO8lLmO0wvzYZGqlKKnIeoOyh71qN8nP1Zma
	xFNZPLX0mpfMx0wkx5J8VaVrkSqiYq381IauQw/a+fhHHZuvcn9iPyyu1jCsWqp0/ZVR7YPALQu
	0zGYTzGnG/EAqVn4MLR7DLkVE0O5IzZgyVgBkPUH1l1UT6IP5KfUR/On6ADmp4X46PwYNAvJUVE
	2x30GfQJ21e44rAclN3MA6QEjirbv4iUzpq/BlRKhvo3aGkip2YXmD/j1D8Imd3Q95tDvFcKSdM
	iQEz8o/RE5tBbESKyfg3FGNPGHAveCriN3FUl6jWJZtJyr5k0zaUYC0Jb/bCChiYG3Mznv/crgQ
	ShjBlExqLokU9eZpeuQWfuMKGBpraEQUTMra9Pun3lPPGq/lgdolAVaM6mdt0zddzOR7jqCwLJG
	g==
X-Received: by 2002:a17:90b:4cc8:b0:3ac:7f4c:a68c with SMTP id 98e67ed59e1d1-3b3d07b0690mr2233240a91.49.1794989763337;
        Wed, 18 Nov 2026 00:16:03 -0800 (PST)
X-Received: by 2002:a17:90b:4cc8:b0:3ac:7f4c:a68c with SMTP id 98e67ed59e1d1-3b3d07b0690mr2233211a91.49.1794989762661;
        Wed, 18 Nov 2026 00:16:02 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:02 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:29 +0530
Subject: [PATCH ath-next v3 06/15] wifi: ath12k: add initial Wi-Fi 8 hw
 params and init helper for QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-6-9875d2a3953f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd5ec4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QEtot920D9eH50UxTSEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: csoQHQ0JACAjjKzIQCR2M0F81g5BxG4E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX0jZlztX/PZMA
 7FpV2xqauemI7N0LIfIrfbTiEFKTVB5wZvb8CrSuF6qtI8qa6Wo2zYFMhVuXgZdHUYrKqotlXu/
 hvACaHJEmmvq8nq+Fh4GropLb8flEyoDeiA6kQmHqONp7pyqiQymZ6ZNj3RWxV4egG6CHDmrgWF
 Z69BlZ5iwGoshnIM0ZcR3aoEZMRd/zdnvP7GadIiFMD0TarWRgRS3SekgEH/p3InmaAvapNAZ9t
 8a5YyCdZJGf4NUrt6DoNokWi5Hu5hwarJ1wA3VpklmeyW351yboBNW5reHJRuWsi45hHDYXBUyI
 FUTAlbTOpGSEjjUITW+Zwktc8arMJJDs1bMCUGL9WT8OiGV3d7hAkzsuvGrGl1KMBe/VG3QbNCo
 TDwkY7HkcG+VP5SxkqA+kUe1v9grIgm8OdFrjqw5Ha4a0TMcXy28jJCQ1D/BA9W2SryfXtHYFl5
 MW1utvOP3ABbxFZjC6w==
X-Proofpoint-ORIG-GUID: csoQHQ0JACAjjKzIQCR2M0F81g5BxG4E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX9f940vc1qyx3
 YavNjjF27Z5ll4lV9ngdwRHB6+gV1qcG5iSlmi/BxcBWELjuaZ70qN1YkAmEva1+NlNZ9B5g4ut
 cKWbf895b/qdDrAzMgmXIl+XRZfcHfQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_081608_466727_59B257B8 
X-CRM114-Status: GOOD (  23.78  )
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


