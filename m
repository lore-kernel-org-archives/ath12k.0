Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB3F606A31C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 05:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A/T/L+S3;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cUTdriNk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXpRmseu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4Ba1EGedREVYutvGt8ju1aDcJuBwT939CaPNjVGMo14=; b=A/T/L+S32aV7Bt5t4Lsgy7P3Ys
	Mxx/SDlmJ6cjb9IAoOSjRQfeZxddibB8YIzM36nqJO0FOsc+DmuJQp+1qAizH41QOuqCe4Yt2yS5f
	lnWZbbgI9T1UIpr71j1wsbKJJd+sV8hK+cAW06/iX081tl1lFgZj8YYdthPeFagwRrfGhJRNEKM7F
	F0smlMODDSAAtKBSfMLLdb+fxYBIvAsVSYYhcH3hMxnf9WO4WSbPeInuB+/am9d6RjhsmDk+GR0Wk
	N/jPjzHn1I6vcc8LTSfIUxmPQB1W9asyKr0LmgkE9k7za7ne0POnXuTk2g/qVzbO1rhU488iR/AOL
	k03/KTEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYJY-00000007kty-3WPZ;
	Wed, 18 Nov 2026 05:34:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYJV-00000007ktX-0T33
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 05:34:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V27f2106333
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 05:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4Ba1EGedREVYutvGt8ju1aDcJuBwT939CaP
	NjVGMo14=; b=cUTdriNkRCJJKITBjC1RG5EFFiWx0UDoWy0xIFWmIUDINphVj5z
	jpN+I/Cng1UGrm3sQJkCQAP+YoAeACxvtEaeJBFb6uOZ4RAhgqSrOdKYYeaE9T92
	a/Aomt+x0GyBWh/f51Bw+1wth9jIz36zcAFlfMjeQuTcVBH3KY56XlB9RWxdKBf9
	zxcuLgB97h4F7QKbYPGCUbxMGDNjCXV1Cggqj6vCzRlVPB5MpC5msq3NmZt6Vsgk
	tjZK/maLBqyeiGQCyy7V04GDI87AQUB9F4vkq+l/MFNOu7voznNn473Rl/70GKl6
	WSS6DbEzsdjP/yrish0P93Y+vWGCjMWEBwg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sbdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 05:34:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb96533adfso453068a12.3
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 21:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794980069; x=1795584869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Ba1EGedREVYutvGt8ju1aDcJuBwT939CaPNjVGMo14=;
        b=gXpRmseuKw4GTssbs/kAsfJm2qKGzLW/hU0reylqPp/Co3Oymx0J19IrmOdO9vaK2g
         6ZLLrkjxtxV7j1GMhgn0/6svh57AkxT3nmm+qHDaeU/NFfcrFJYsZ/10L8IBZABVE4yd
         M92/Nj44la3F7Zt9EQvkwG/f1/0sAgN4BrPxU4wXIgL9w1S5t5LfcET3Iw8IEpT9K4su
         o1jzRTSy8uh5JvWRnz1fEn0Lp+MQVj7bvW0FQY6nwUkcpvWhvC1C2x9bzSEupORxzzdh
         xQDfWsD/8G9f+S7n9HbwfMSt+x/H9rEum6eZe0e4kwiEK0eQGlJU7TxAAOXegmJ1JOPW
         1hJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980069; x=1795584869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Ba1EGedREVYutvGt8ju1aDcJuBwT939CaPNjVGMo14=;
        b=Vt/6nfv3hTRfiU15EHAvB5QTN2nBzNmXjOci77oVZDdAYZftj68qVPFgirJZzymVRZ
         c5njftH9tNBvc5rlMTgN7P05MUEbHk+HFbSRdyNm6k2+ii0hAhnyJo3C4gv8MDSluPVh
         8JT8QhHfO35OJ6A+a4Uuq3Jk/r8i6bplJz38di1gpV4ljCkmDllKoyi4I43n/DR1V69P
         KWs+6doZe7UeUUOXqN1CrC4B36L+CtnHTlFeNx+Za+2MSw8Z8UC2BHoQNepqVjp3llVJ
         NpP75m7fJSkimElN79EKl79nC0I9tel1ccSraG6n2is2IKvOVmBfcP6EVpli0erj/XLM
         a5WQ==
X-Gm-Message-State: APuU4Z81y6r/CKcvOfnhK/PsJ71SqCqm/lzAcVMWTeOxh1YvPY4HVYEz
	wqhTK1c7lOSAMl2YypJL/GxPSIp+SqnM2fc1+U0+SaBxI2IR7nV0CTlQWQ91YLdnhzywPqw4iE/
	cWOn2HhaaPrBqDtPBr+5IiWhrrvmFRjyt18xTNHFGGffJ+v35bwa96m2xwoD3fhyBn19Se0ih
X-Gm-Gg: AZFdTZdo1NmUHwzKSRGQT/Ai4o0YcqJdJxcKWxDJd7jBT4PoIG8H2bJCmI7iLn3oAt9
	7s7f8DetcDvibkrn7ZsX3MWEmSSyWoIecv0m0GCQ/xwu0e7MK6mEUt+WcXnl/JGp7RxhviyBH08
	Qzeh6Q5Um2HMAhrxvcG5SxMxdGpZXKemKuMF8W4t821GVgfAx03j9b/xO1UZWS2SIG+6mdA35ds
	Zy/C2ER5m1bjotAM7r4Md6mq90HP4iK3yW9+72B50pA5Zav3tvrSDDwGMWginJ9BoTWa4WGoumh
	DEtdJnbu5/mEf7x1hd+4c3EMvuVFQvx9iad9bIuhJnWrw1Nj8JW3p5le+mYJho0Mh8cuggQmEJr
	xKZ0GZGLMOZffweyD69J4sr5qgqPioqp9s7oOZAArmlvjbd3YNnRlmPKorRxlenjLyaAUCNIJQt
	nIJhx5tUE4HVRJ4ylta212n7wgiOQ6ncuAI9dEOQL8lYX8YEgtA0pxx5BxNKK0/wdICmI1dw==
X-Received: by 2002:a17:90b:17ca:b0:3b3:c00e:56a7 with SMTP id 98e67ed59e1d1-3b3d07d458bmr1529827a91.42.1794980069466;
        Tue, 17 Nov 2026 21:34:29 -0800 (PST)
X-Received: by 2002:a17:90b:17ca:b0:3b3:c00e:56a7 with SMTP id 98e67ed59e1d1-3b3d07d458bmr1529812a91.42.1794980068944;
        Tue, 17 Nov 2026 21:34:28 -0800 (PST)
Received: from hu-sarishar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d4bfc2c1sm690347a91.2.2026.11.17.21.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:34:28 -0800 (PST)
From: Sarika Sharma <sarika.sharma@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: Sarika Sharma <sarika.sharma@oss.qualcomm.com>
Subject: [PATCH] .mailmap: add entry for Sarika Sharma
Date: Wed, 18 Nov 2026 11:04:07 +0530
Message-Id: <20261118053407.3089782-1-sarika.sharma@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BVSoPfYi16VcHALX3A1B7ib2zTbIXwwJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfXzEeBpPWmM6my
 pTQvUSe//iMEcn+tbof+fa3QL09KU21xh3vOKbczvLd0NVoqhD5L6i8P9MTszeYhTsuEzxd9VCl
 aXsbItxaL1qQEGL4NOioIpnxk+S/S0I=
X-Proofpoint-GUID: BVSoPfYi16VcHALX3A1B7ib2zTbIXwwJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX2CAJSVqtzh4p
 PmoCx7zvu5dV2kpdwdu0DFjlyhWuIIZSXWQL1JbE+monBc8tqGOL57aJErHWHS8BwGSqeop2b5O
 sWrZMStn4X7qIW8t3nP2JdOTagj2z0hujcTZGKYeRl7xKP96qBORoFCycmOqoi+4LSC5IGrNBwM
 0fYHLj9BT9PgVODmaFGzjOzXc0Ge82jlP/fU3B17CG2aepznXUFPj23v6wfwrITbrXOfT0/rxKe
 1R4mPf3Aj3Zm46xhnyB/LKIRvRnzHo4z4MkrK3XK30dtw0ndxHwlE5PX8tGy+emGJthdxrHSUEw
 5fmLapjhhOqi0rBfET6Xf4aQqBwFKDXbjHwa1lwJuC1hpVLTTDpTbH3vvU4+9dH8mu/o/hNMI0+
 dqMMVBz/hBQelEBdhqDmaEdEnE94xGo4nPi4PGpFz/0uU4TUMnaU7ZdyBGj48cj0MZE37MNfQoC
 aII4hvazpQQpbuIoBJg==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd38e6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8 a=1XWaLZrsAAAA:8 a=COk6AnOGAAAA:8
 a=pGLkceISAAAA:8 a=wmhE9n2aV8QMZK8crdcA:9 a=3WC7DwWrALyhR5TkjVHa:22
 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_213433_295360_88312E27 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

Map past iterations of my e-mail addresses to the current one.

Signed-off-by: Sarika Sharma <sarika.sharma@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 847928a2a715..d49ab7b1c3d0 100644
--- a/.mailmap
+++ b/.mailmap
@@ -842,6 +842,7 @@ Santosh Shilimkar <ssantosh@kernel.org>
 Sarangdhar Joshi <spjoshi@codeaurora.org>
 Saravana Kannan <saravanak@kernel.org> <skannan@codeaurora.org>
 Saravana Kannan <saravanak@kernel.org> <saravanak@google.com>
+Sarika Sharma <sarika.sharma@oss.qualcomm.com> <quic_sarishar@quicinc.com>
 Sascha Hauer <s.hauer@pengutronix.de>
 Sasha Finkelstein <k@chaosmail.tech> <fnkl.kernel@gmail.com>
 Sahitya Tummala <quic_stummala@quicinc.com> <stummala@codeaurora.org>

base-commit: ee7edfb99ee26581633fabb0662382734ea3cdbd
-- 
2.34.1


