Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42957C531C9
	for <ath12k@archiver.kernel.org>; Sat, 25 Jul 2026 18:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oViaTxTEJFf8D4uFBbYAXOcG09FPtk8+dz6gicLx8n0=; b=pArOXijT+OCeP1
	wHrg87ipFRmr0tIhBGr+bBn21eEqLHIPyj421Rta2keI9NB/7HA2Jcv2hOsfsuDTO0gNkVtyBieCW
	/7mC9OykXo75M27/6pdKLp29kOw86nVFXlVlkMj1vTl1wODFn0deu4czf+60uOAg0Jid9lC/EaTjn
	5aJT0/5sd6UhEQW6SJF4/+eKD1i+VsfztwZxZzhXnrVSKneZDsH/cSfBDJWrGRFu3tDxGvVbTvxUe
	FZ3YLCmC5oON+wLSUyHY/IRYyvSz17sxGslwOCBt5ZTWHNKda56UaJkSSXs1nK8tfCOdxr4JuIBEC
	+mTP69IzxQQVQ/wkUJVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wngqn-00000000dOb-3eWH;
	Sat, 25 Jul 2026 18:11:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wngqk-00000000dNU-21KN
	for ath12k@lists.infradead.org;
	Sat, 25 Jul 2026 18:11:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66PGvKon3604018
	for <ath12k@lists.infradead.org>; Sat, 25 Jul 2026 18:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oViaTxTEJFf8D4uFBbYAXO
	cG09FPtk8+dz6gicLx8n0=; b=KQenNCQmmimFSxBZ+AiQ3hlXWavaJyKWSWl9fi
	0Q5TUIrwQHBJqYgOXRImgwSxbm6eC7phgCcRXkingMAghiM5yRifY4Yc/rH157TZ
	6sWBnzZmwymqRmRkeGjcF7+PQAxleiqrRgXeiB3TwRFZhY4IChN7TtwFmUYRI5w1
	u+e5GvvNa1WqOHn7yT4PNmRAyFapoqITAXt6CPecFfVJgSnaS1dl3H7AuIVd/ZmJ
	5np3d0fl8lStRq7U0C0MXbCnfdtFqBuFhDAki+U+pU2qyDHedQ9CeTjwAj98P0jy
	cE/3dl9jvKJ3zxsdi2y6iu7VJermEvScCYfWiYYf0e6gCJIg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjufspjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 25 Jul 2026 18:11:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so2599603a91.2
        for <ath12k@lists.infradead.org>; Sat, 25 Jul 2026 11:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785003109; x=1785607909; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oViaTxTEJFf8D4uFBbYAXOcG09FPtk8+dz6gicLx8n0=;
        b=YQzyHNu24iCQvAS2aIdJFolZMlCLZn7mMhkqW0gcbCZqY3EECz1e8JS+xKx2aealdd
         8DLOZgrGtKFnyHm5/Wz52X3wnQem1qjxBJW7zKBlsVmGO246LX9WkgrEsfXVb5Djr1u3
         7QF0OGw3q+6BbeLr/5avrgVJfNRNkJoWnbrpKH0UKct3Cn1uUqvlJkXPbf/wKCN2J3Nx
         enr/dp3Y89i7voeaLk4+eQUL/z2a8ObP9AkBLJV9JggRtTHKYMy2r6Ofp68pkM3awp61
         SrbCXjGyHNoFK1HR3S7bwTQzW4k/iU0u66vp2sVlKxEFBQRIZvnvGNVAf5XyPQega8uv
         Ietw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785003109; x=1785607909;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oViaTxTEJFf8D4uFBbYAXOcG09FPtk8+dz6gicLx8n0=;
        b=Bz48B79NVw2310jWDS85eLuxHQXrMqSQ0ZtUWux90x+Xwu7LsA3NPhYX2ttBavK2bT
         22CwYgW4+BwsGX6GHsQ5zgKka4lmz1F3bVNDVATy9bGcS3ZPjZwOdLlItu2oMYezDqBl
         wy+tW2QjbvrmtK//3mp8g+OBox2covR4N5XaTZI70IoHmLE39ttMcckrbHTEqKU15hCv
         wqe2mU/l/Bd9efRmbDuR8yCq74Lr00Af5wn1FRsSEhC26XRQO1XZlslBawV4Eacmn1ll
         VJUyNeBv5mtdl+F1gWZOV6jSLgaQ0wXmLXrj+vgGIgN8Wu1dX9KLUkL1mxF9T9g1OxzL
         Js1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr0VRq8aQictnmjCteiE68q2Zfl3Wk5DexN/buRo2Rn5QrfschJtWTJtX8RgFqI1g8an2NVU3U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7QMwa9bSEukmPpXRoIw4gJZqH9n9dRoy5ru/+zbpWF3+mury4
	odN656gHH2HvXzBBTpX0GbILRvj3N1dvDC3Qo6eAAGznFzTQdVE2RgzVpxEvY5Y92eOc0wtB+jY
	OOEoaQxS4TwpFXe5E+ZsciRtauqP/RcUdvDXnBlyXpD3Q8ZuqVIaFy6YlvZwpuKrk
X-Gm-Gg: AR+sD10SL75+JWWoDSk7Qx4PAJ2VLAAQOt9scbVlfuAWzgopeRZEmiPZPTYzhhszMOU
	qli4IpjzYetktlXGTPElU3FptQpxKtZC8zKrRvYVSt3Ek2t+dDJGpARa+wSFKaqp/KR9fk6PfJ1
	ieDaLXgoNfBBi6HZeJR5cES/XJbX/UjhW9tW4A0E1uCM/RFDZivXu3tEObNHblaFohtGMt1thX/
	f8Bpbna0BxPCFXQDICY6kh76+qdYP1B0jJzZX6yNBht4f9dz6YSOuBUa97r/4qI5dKGZHP01LOx
	QV3lx/yes3/o2FTpAGEGLReWvd5pVhrHfkvzxaId5ftDhXGZnHpsaklg5eqDMR/VI9+jY9nO9Qk
	ASI0QiDy6bkZvdIzpUdpfD7M7RMQEdyLvrc1vx+pZrXTdRsYbfKunPeQ=
X-Received: by 2002:a17:90b:3c8e:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38f2960fabbmr2985130a91.22.1785003109188;
        Sat, 25 Jul 2026 11:11:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8e:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38f2960fabbmr2985120a91.22.1785003108789;
        Sat, 25 Jul 2026 11:11:48 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm64692635c88.2.2026.07.25.11.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 11:11:48 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: Cleanup ath12k_firmware_mode
 enumeration
Date: Sat, 25 Jul 2026 11:11:44 -0700
Message-Id: <20260725-consolidate-firmware_mode-v1-0-aedff0ce0ba5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGD8ZGoC/42NUQrCMBBEryL7bUoSaUv98h5SZE22dqFJNIm1U
 np3Q0/gz8BjmDcrJIpMCc6HFSLNnDj4Aup4ADOif5BgWxi01I1sVStM8ClMbDGTGDi6D0a6uWB
 JdCejVT3Yu+4MlP0z0sDL7r4C5lF4WjL0pRk55RC/++ms9v4P/6yEFFg3iLW01pr2ElKqXm+cT
 HCuKgH9tm0/v11m1tMAAAA=
X-Change-ID: 20260717-consolidate-firmware_mode-93c215fdb29c
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 4JIzYK6wgjQ8u6G71vDLehMmEJz0wSAH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDE3MyBTYWx0ZWRfXwvzVgR8CWXUz
 kC6mz8DKWhgrEhHqA2NkrLPJOfNaM01hEWmXpW34bBuyHG6NnYyaBzB27oIEZVmnMDyhag1LZOU
 cmsBIauZ1qHWgULZPlcTFC+BLMNPAcU=
X-Proofpoint-GUID: 4JIzYK6wgjQ8u6G71vDLehMmEJz0wSAH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDE3MyBTYWx0ZWRfX52LmtbTEgTjd
 kFQJs+DqDptLJ0D4Pz+yYenB7r6GWzmwCgWzzFllC1cll2KDP/XBcPaz4p1zpUkTpOQghGWxutL
 Mo3JzMMXVeI3wGAn0BDiujE9hEsg7EAfjHkXqrR+e2URNbmwIydi3icLD5+AagiWR+XWsbvLxWQ
 D6xFJ9qQvIEj0tBE2IxKWNJ7PyDxwaNY1woby7/gYuLX5DdWwzMt+venzBLnewfdCLk1gAPl8C2
 H97nym5Ifx6RcgipFZpGGOkiY6pDGzK5Lmm2gqagu1HSW1qoCazAGd6oBf3WvcH4JomsHq3aodu
 fwy9q2GLbxwJUFGQJn4pLwi4g1IJ+mXNST6i+J0p+Q037kDJqEvf2d7KaWA41qt/2Gd+tT14Db8
 4BsKLUYRiENFY1WtdAezTK3p7bvIXkg/EeNDzzp1FpHb3FHp4HJKdFTY3QVOAaU2psmA16U1vQh
 rFmkPnjoojF5Mn3ilOA==
X-Authority-Analysis: v=2.4 cv=F5ZnsKhN c=1 sm=1 tr=0 ts=6a64fc65 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=G7SgPBRoAAAA:8 a=UXYPoygNbYHkjK84YqUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=2rYB-OeQH5pmQqQB7sEg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607250173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_111150_532480_C782059B 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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

This series inspired by [1] for ath11k, but takes a more comprehensive
approach.

[1] https://lore.kernel.org/all/TYZPR01MB55561DF4543A0265B47A58CDC9C92@TYZPR01MB5556.apcprd01.prod.exchangelabs.com/

---
Jeff Johnson (2):
      wifi: ath12k: move firmware_mode enum to qmi.h
      wifi: ath12k: rename firmware_mode enum members to use QMI namespace

 drivers/net/wireless/ath/ath12k/core.c |  5 +++--
 drivers/net/wireless/ath/ath12k/core.h | 10 +---------
 drivers/net/wireless/ath/ath12k/mac.c  |  2 +-
 drivers/net/wireless/ath/ath12k/pci.c  |  3 ++-
 drivers/net/wireless/ath/ath12k/qmi.c  |  8 ++++----
 drivers/net/wireless/ath/ath12k/qmi.h  | 14 ++++++++++++--
 6 files changed, 23 insertions(+), 19 deletions(-)
---
base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af
change-id: 20260717-consolidate-firmware_mode-93c215fdb29c


