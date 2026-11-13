Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1DA606A89A
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 18:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b4sFH8eF;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pai7rOpH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D1t8+WIz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UOGbIgdMvNNbvF3rlYZmS8C4yu1k+1TFWuu8QXx7o+g=; b=b4sFH8eFQkrmtbz8O5G3UYW9YH
	6CtBrS72zrble8TlQblNEOo4L1RLUPw4uEoQrFq6CxRBp7b/WebqemQEKgw+EPlki/qR+He4L8yZR
	xmCMoG5uAk0AFQ3XwZJ+3D8QNAGUAbM14g0maEDwVnWK78QQhVN4/yr3Xs4Q1lxbHCqhV8HsgYcST
	weEX6KRL2mAg3EXtSp1PrtDKhgT5N2nekPQ0ApVdlrv765kj/AzJv4i5ccj3bD/mBEX4KHnc8sNBN
	wa1hbDk/SVoMJmK6fSzrFJNF9qAaeCgmPwaq7T8i+NuWxTFFwj6j5nb9MlPgKz8XY0vGukAuek1Sz
	Zm50Lelg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwM0-0000000E06Q-2cON;
	Fri, 13 Nov 2026 18:50:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwLy-0000000E05e-1XvC
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 18:50:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRhDD1725993
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 18:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UOGbIgdMvNNbvF3rlYZmS8C4yu1k+1TFWuu
	8QXx7o+g=; b=Pai7rOpHvCid7pBso1KJQNmUP3ay4+209rkTRCGKrA1soVsInzz
	2+EI/9XiO0RAM/GnD/STisvs4OSF4TmMqSpaYOTZTy4YrfruHtbiexkEV8X+AKhJ
	6HObc71xpqBRTgvwxdC0xYCS8IOuPWw7fCvssyM7FIliP505dAw/b9KSorRfVPSt
	Hs1K6yoPpdFLUGK+7yQVE9fsj5oYSiZgP9Mx0gEp4TlIeIfax6HA+62qfOkZuIA5
	ZsXxXC5DTQR/MQQPUz2nG7Lr+6BZ/wsoDvBGC3M/nm9/vZt3UjBSw5X6aDlmZjaC
	IaQbELHasdMoTMISlwbVrivN0NT59bXZNNA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx1bp9pky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 18:50:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37549877380so1629365eec.0
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 10:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595824; x=1795200624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UOGbIgdMvNNbvF3rlYZmS8C4yu1k+1TFWuu8QXx7o+g=;
        b=D1t8+WIzZoWFw7cwjMgLUse2o/JWJ5awILGMqAkPfdJEFV/N86MuRQq69CUmQYFsih
         bWfIDibEMqUcYcSvJ0VIriDogF4rskzI8kAZHPPV2Cc/xWGu7cWcBM0UdHGWjHWTQD9o
         rbIuEIIKakXn6fgQPLwjmDK07ihle9PqWxhzzOw6yP0ckLxIUawJja3XLFdFa6oUMPXg
         TERJSU3i69NvhS8uRZg0EVA3rvO0V1iLbF6t4pBho8PputNt4Z+KltE0SkHuXeWeJoDn
         xMWlfRZBhPngEXv/Zyc92Ppzz0k7IxqaFDwD4zvk4E1mhUABqOWyklSEyiOeZIbe/MQO
         zwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595824; x=1795200624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOGbIgdMvNNbvF3rlYZmS8C4yu1k+1TFWuu8QXx7o+g=;
        b=Etl71Iy7SLeTYkv+1SFgwcH/enB8ttiWhXTbFHTawFPYJE3FM9yjaMzIdObPwMJ1R2
         7JlAvL+LqeOH6iYNEg/1Hrb3OiCucZm4p7L3FMCIoYSqeNTHgT8K3mMDVB2zri7pJxYi
         2LdDyVSsiKuuQdRDOaR/nkP+R1tZh4Z9XLWBcORVAjNFWCbITTHacbT4t3J0mr0BS1QF
         sr/Vp2TuZerzUvsEaUKLcmKzl+ETeD1XmqNzlVgUW+o3qrb49ol44rscyrCicnIrjubP
         A/GuAdzBHsNP1w3kE/Sxm1k7iwrkqHovh+oSSvoyk71mmjuPcWroBcutT9nxMdAgFMrL
         UBWg==
X-Forwarded-Encrypted: i=1; AL+hErFy6J9ICH7FHgrshlzfXHB6Lz20naH4LFFo9uowHlDFOSTo69LpRIZ2BV79q4Tv2JdnHKo9QMM=@lists.infradead.org
X-Gm-Message-State: APuU4Z/kP6Lb2klDK/RA1JqAFwTCxom0Cn2FyQlXXm5aJ7YxQ1V54Uxl
	qR9xaVUX0swRhyL9FE49N2hDOVM7t/vtG7sMAvKo1eKfYSMpvnqmWvwk2yMOSbYNpUCX+lEek0i
	LLypTv7LRZhvO7tVU78m0yWegThgyTlW3PwMzKeFgT1S14+dlOQrh7zviXgIWG6aE
X-Gm-Gg: AYBFou3mLfCh8G26j+VmxlS4YUUFGqGatVK/ABzn1BaDREsrJQZvd0iujUo/aImIALE
	sDDux5nPHZ881PEkkgdejE64RjU/V5jTSmimg2bbyWLZfN0H4IfU0fVv7Ri+FT4leaS2kjnjiLU
	Px6x5lxTIvX9A0hHe2XB9qL9zSUqmn+lyg0epoBJlq6CVC7WNtJiS+1YEDysFapY7xsXMX695YG
	n38+XqxAI/UXcU8Yp43UTO8n3Pr6HyUJvo8bNH1M6UsPxjxigenqPOrZZI7KShEzmQFRun7OgQa
	p4yINoKLe0vGWtAciazORi7evgAb8SymaNvJm3OgJwjYBSCrCLKqPEt+IUQEY3yT2OYpFn1LP0m
	N7u4psQPFXXLoy+eYsh635j+JnKM4+Nah4QT0jve8KEje+/XWX0PGRWPyXYs/2OnBwyuhUoaBr/
	w=
X-Received: by 2002:a05:7301:90b:b0:34d:755b:d60b with SMTP id 5a478bee46e88-37968b8a031mr2753173eec.34.1794595824160;
        Fri, 13 Nov 2026 10:50:24 -0800 (PST)
X-Received: by 2002:a05:7301:90b:b0:34d:755b:d60b with SMTP id 5a478bee46e88-37968b8a031mr2753127eec.34.1794595823416;
        Fri, 13 Nov 2026 10:50:23 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:50:22 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/9] Migrate PAS clients to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:00 +0530
Message-ID: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W9ytxhWk c=1 sm=1 tr=0 ts=6af75bf1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zG7KPAmT95cOeVn0dqYA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: YL5Z-QKKKOsUBChbGBtItyfgHd3EbUDN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXyyxdwQpSIHRm
 gUUP4CVc9tD5w68RkR1hmDiWbNKpd+aDDO9ohmge9yzAwycNNHSgBq+28QCYFjQTjXaNB2vgbz8
 w1k/mTs+y8/bL0K6Fbor0dWhkkjGOuQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX1ErRUSvGImez
 qlql9H9vQaQLvIPDn6kVNFCAdHS4I9SQxKa+HoknBOjWXV6TFYM9Q8JEGNk8HLRHgkY1YTtLR8z
 vaeu2SHv+Oz7RvmCLfZoS9BTOP1f1kR8aE15BCjYAAOXP3dqNw+DTQDOwrmPE4zlMJ+Qt9iZyan
 9L+MXbQ3mpHOnh1ukKEDiJdYN5YVC90XgJi3s96lrqYp0oV5RZA5HsYf4/iPJm0QBjmMrjFCbg9
 vrJqFK2JwdygEOPn5bHK9aKnEbdK1+houixOP61DTPfvRzPqbII42j/eRqczem/VkhMbyZuDe5t
 r6xJeiJzkxna2UgTDe0zlp9jHmkrKs8dW/V3PGcfopi5lPxuQYMRaqVbZC4QQfgxyZelzg6Zqjs
 1SedEttOF09SKzkGgFLhU/sghj4seLKe87msYu+TdMjXUwEoFj3w0wE8BATY9+os8bZOeIoN3nH
 qCsHBCy01Qb/YTpBGIg==
X-Proofpoint-ORIG-GUID: YL5Z-QKKKOsUBChbGBtItyfgHd3EbUDN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105026_526848_ED5CE587 
X-CRM114-Status: GOOD (  11.95  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In preparation to remove qcom_mdt_load() and qcom_pas_auth_and_reset()
public function, migrate every user to the new PAS context-aware API
qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset().

This series migrates every remaining caller of the deprecated APIs
(qcom_wcnss, adreno zap shader, iris, venus, IPA, ath12k) and then
removes qcom_mdt_load() and qcom_pas_auth_and_reset() entirely.

Requesting the Ack from subsystem owners to get this merge
through Bjorn's tree.

Changes in v2:
 - Addressed Sasiko comments.
 - Addressed Alex comment and added 1/9 as new patch in this
   series and use the  API to other patches.
 - Commit description change.
 - Link to v1: https://lore.kernel.org/lkml/20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com/


Mukesh Ojha (9):
  firmware: qcom: pas: add qcom_pas_context_init() for pre-allocated
    context
  remoteproc: qcom_wcnss: migrate to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  drm/msm/adreno: migrate zap shader loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  media: iris: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  media: venus: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  net: ipa: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  wifi: ath12k: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  soc: qcom: mdt_loader: remove qcom_mdt_load()
  firmware: qcom: pas: remove qcom_pas_auth_and_reset()

 drivers/firmware/qcom/qcom_pas.c              | 42 +++++++------
 drivers/firmware/qcom/qcom_pas.h              |  3 -
 drivers/firmware/qcom/qcom_pas_tee.c          |  6 --
 drivers/firmware/qcom/qcom_scm.c              |  7 +--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 22 ++-----
 drivers/media/platform/qcom/iris/iris_core.h  |  2 +
 .../media/platform/qcom/iris/iris_firmware.c  | 27 ++++----
 drivers/media/platform/qcom/venus/core.h      |  2 +
 drivers/media/platform/qcom/venus/firmware.c  | 29 ++++-----
 drivers/net/ipa/ipa_main.c                    | 23 +++----
 drivers/net/wireless/ath/ath12k/ahb.c         | 23 ++++---
 drivers/remoteproc/qcom_wcnss.c               | 12 ++--
 drivers/soc/qcom/mdt_loader.c                 | 63 +++++++------------
 include/linux/firmware/qcom/qcom_pas.h        |  3 +-
 include/linux/soc/qcom/mdt_loader.h           | 12 ----
 15 files changed, 116 insertions(+), 160 deletions(-)

-- 
2.55.0


