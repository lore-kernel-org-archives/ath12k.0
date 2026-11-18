Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8CC606A325
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 07:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r3t7gpZC;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gFZ8clbQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eroh2ZFX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FN3DG3UZS6vwtUZor674yEAfqKkdNA8VKkIDlTDBmDk=; b=r3t7gpZCIIG8vbzlPeaP1OhVWI
	eWvAjNLVgRj7orsM6TRTocj0XBnlFxEzTEHa4VbKCGY2cfWqrBiXEaRElfGQB8yJ+r3kPTh3o5kkT
	isGybsnDADk7L5vBQbum+DhMvSFrhkc67rD8U9as2+ymmuO/sq/Mi6F/Pb52GIWduiKqWYls5JdEB
	sHux0St6zpk+FuCHkvS+cLFRE+BD15VjNO+goNE+HkzJfe1/6zHY9imwahQ6/MHAjjDioswCvpC9/
	xsqP9nowcIqL6yT7+vXGTdYihHxWNpeW1Ire5NwwROEs16+MAakSdKSgz0T8kTlAa5R/DUyyn7d8B
	caNCpbXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZr7-00000007yqk-2RDB;
	Wed, 18 Nov 2026 07:13:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZr2-00000007yqG-0lkr
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 07:13:19 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI7AjoA2605302
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 07:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FN3DG3UZS6vwtUZor674yEAfqKkdNA8VKkI
	DlTDBmDk=; b=gFZ8clbQ/yt5fPnmWC5+DLgPTd8Lttgwxd3QeCF6kGV1uuygd7q
	JDqI1oTTux5ZbYEIrY5pmaezRE8DrJ8JvRycVdkngyWhAuTRDH3ziOnuPvikvRkE
	MdZfH59TzhAKEJ23Deboqr7goDn6YnwjBrSiVHBP5UwQjUukx1GaFJhjp99XQpSY
	OpoNNMnqViqSfNvXVvXjWCygNDgQv6oe6vM4q2UC64PumQbNb8VX0Xf9maoAaPEf
	7KF1aAlQjOShzQca9wPsXf2/q0nLw6G3zW6s11oCZGj18efXLlC4znW/AMfpWYtV
	2vln8l7McMCqGd/GHBNNrWA050HgxZxZqfw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8hrnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 07:13:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed1fbae872so8377815ad.2
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 23:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985993; x=1795590793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FN3DG3UZS6vwtUZor674yEAfqKkdNA8VKkIDlTDBmDk=;
        b=Eroh2ZFXdHW5GrJPP99fQgcVtD3Amtw5t7A83WZD3hYp+vfCDHIkPtLqAkkK3xO65+
         rDH6LNtOU+nvUtBiD6bR2pnL181yKMpo1b5eiHBym/i6O8hUwdskB1+H3Lhs6E74YNtA
         oMABQpBWbX8/J2U3JdGCuZkgkeMqfW0zrSEIhniUGtKJJHyD9ME8oBI0ealxfkZnY26m
         KRRjzE6iP1gZ3MBvohM17u0gY+lKr/Uttv4rd+7WgvVoES+TtlIVbuXDE73dXwKWMEMc
         lvyo45GxEyEEGHgKXBwNiCHCMCVeYe7hwuLU8sf81WbEuiGm3TK5AB25vNX8XMOWIvWQ
         8VXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985993; x=1795590793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FN3DG3UZS6vwtUZor674yEAfqKkdNA8VKkIDlTDBmDk=;
        b=a4uaUG8YaO2cpJUyrORDRRjvo9k+I9Ej6AJVLnaedqGyf+kA0Kzj8H9gDzDe23xG/U
         pO/6tr33k4arqIvxMdY4J1tSOrvGo9dymEFILNDenOgXPgWmDhJEu7FnAVZ8Dc+ifZ1g
         tDMIQNot/qLI/eadSeeRkFxpdSNgTSgPGc3Np6JJXFgaEANuyF1x6JZG6BxEr4cQhpFZ
         Mu6DoAWAFfjTPlq1G21n276DHsjEktHS3oftH6gHCOVcDdR/Dd/AV+YhRBCU8zHLZck6
         F6P8h/+E+wCFXy9pQylHtxMnYvH3cTZTXRmomTlDUHSYWXrNk1YeEC3loT43xcZn0jEW
         SagQ==
X-Gm-Message-State: APuU4Z8SRu0RnaxIsfXjNURmukSqwAY2Yd0a306hpdJKWJcOvNjjp2K8
	rYgNdJOlfdgaCzygliuTyA8aydWXpHlCiTSpo1oGU2KQPIGAcOWU8WIQTgF1EiPJsdVDXQsc2Wp
	p1TtBy8st4Y36Iq4ehKunyCtaiQHQr1Q+re2YpKNCwy3HKW8jZ+uct9oejDN4K9+k0wXtGFQ6
X-Gm-Gg: AZFdTZdUfFUfez+kiv3uOvrImccOUC3YqKbuF2UbaOK2nIoScqGNWDPExMR9PDeSKly
	hutCgRTV1Nia9aCbi71BzKmANfVu9c1VCHOiR5y0aSu7ubOQ36mkjr7/Bn+fUiitqWkQaVmkoTT
	wGk/zZ/BYe+Vh8H416C+4hsWRfNCjV8yYgU9FzaBOA+bfQgtgvRMMy1EigFTrCSs82a5avKuLad
	OSt2SUchNEO9SJl5p5D97/XspM5jI8pfMNnCQJfxOYnF9QQRfAmXc31JQkggZfOxoYV12mibXOU
	Yc5CvPPm3+hheH0ZjRS8ypgpvMQ3iHdg652RPXIaHQJcRTx9QdGagQf053gteF1EryVCRO7V+n8
	k8gARVeK7/oTCK0ohJ6w/l75eQP0a8aWYdp4MFfd2q7LTnCE/o1pIvtx4MxUs7eAOiGqyG/etWW
	qIRt1FahE95hrx/IUYF/h4D7qBiIcU+3ljmNGl50Jd4BeGgl0Z3QeEISjjjDIwPUeNz/qQZDd8p
	3Y+XA==
X-Received: by 2002:a17:902:f54a:b0:2ee:1c51:7eaf with SMTP id d9443c01a7336-2eff73fa810mr17772315ad.31.1794985992896;
        Tue, 17 Nov 2026 23:13:12 -0800 (PST)
X-Received: by 2002:a17:902:f54a:b0:2ee:1c51:7eaf with SMTP id d9443c01a7336-2eff73fa810mr17772115ad.31.1794985992422;
        Tue, 17 Nov 2026 23:13:12 -0800 (PST)
Received: from hu-viswanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6181433sm8503225ad.29.2026.11.17.23.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:13:11 -0800 (PST)
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: jeff.johnson@oss.qualcomm.com,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Subject: [PATCH] .mailmap: Add entry for Vignesh Viswanathan
Date: Wed, 18 Nov 2026 12:43:05 +0530
Message-ID: <20261118071305.1823524-1-vignesh.viswanathan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: B8_1xfBphgazrLfl2j_dABKCDl7Sn1zz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyOCBTYWx0ZWRfXzwucM8OdfQGE
 rJvIBDy3EZ72RHrW+RprijJ0tI3ZMI8ET8UZGWaewWJFZ93mDbyt8WbbPlMSxZofddIR2/+NTJd
 esthI04gDYpEeIG+fux0/J2XhaOqnKM=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd500a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=XrjatHZFAAAA:8 a=VwQbUJbxAAAA:8
 a=QB4Mt8Xj0i9qn6F0QGcA:9 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
 a=pioyyrs4ZptJ924tMmac:22 a=6mBinHg7xRqGZp0ErLwN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyOCBTYWx0ZWRfX/XuqxGp0PaXS
 3QGTWc3uCwBpreyD8hhQGVyDdfSpBX3P5o1hBSNnW3V6ObMHXPN4jVH4uHEKu7Mtcmp38t5Gjha
 jctUxldrJ930164zt1JTN9xpQRQO0LTdcBVe4Pwmx/Tsazn+Z2jDpfD5Xvu23SypTFcX+WDV0Ju
 k9dd5FpKOiypvHZPSzzFUvGkT7DoVvqbFAGkh5JeDKz6oydld3EHKhH+a3Iv2wGVkAai7mMLtGr
 Itx76ISL6C/BE0AsGg4mchJX0MCdJLmHOu0CGJcCLKnYx+Je2nz227IPkgYH5JasCBvNAJfri5m
 vnpvvHfhidH8ao25Z7M5swLmsUwc2X0344TH3vnS9x+8p365Wm8fx1C3yeX6Kc84JcRgd7qT4Kv
 8iq3qq7RAvGnBkkgo6/UEv9MrNlGmhH6wUrXQStlp4UzWpFgZB6HsDZ1p6stdCVy3lcT4il0WWj
 3cYUi46pSXlI5RY29Lg==
X-Proofpoint-ORIG-GUID: B8_1xfBphgazrLfl2j_dABKCDl7Sn1zz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_231316_360334_8ED618B7 
X-CRM114-Status: UNSURE (   8.97  )
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

Map my previous email address to the current active email address.

Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 3e5f84689439..985c1111f8af 100644
--- a/.mailmap
+++ b/.mailmap
@@ -1000,6 +1000,7 @@ Veera Sundaram Sankaran <quic_veeras@quicinc.com> <veeras@codeaurora.org>
 Veerabhadrarao Badiganti <quic_vbadigan@quicinc.com> <vbadigan@codeaurora.org>
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com> <vnaralas@codeaurora.org>
 Viacheslav Bocharov <v@baodeep.com> <adeep@lexina.in>
+Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> <quic_viswanat@quicinc.com>
 Vikash Garodia <vikash.garodia@oss.qualcomm.com> <vgarodia@codeaurora.org>
 Vikash Garodia <vikash.garodia@oss.qualcomm.com> <quic_vgarodia@quicinc.com>
 Vincent Mailhol <mailhol@kernel.org> <mailhol.vincent@wanadoo.fr>
-- 
2.43.0


