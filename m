Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B79606A32F
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 16:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GxZ5jOnc;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7OfNETp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Um3oqPaP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jOFnPdS9OzKd2pQAuWQI40FvjqklDv0OYhhO4gHPm10=; b=GxZ5jOnc1hZlhWvZkAmZVcmheI
	pPdcObnnm2axKpFtNMsuloBCHcjb41cCIFiNMV6Hqp3knqFVVpM7ET0I2XI5Lx3vytKEPqQs7W31h
	unPvigiG3nRhwogUh5/FFm2/bfNjh2Qghkg561rXMl2I2Lh9vmzS0sy1WNg2+sQ1KSYGAOedoKhZx
	E9BiXXef7eo1mySfvHYh3kroSWo5JPIZenhU8hqpfm6fTfY3/6ZMcCYO+jaM4dSAFqN/wajJusLV6
	qByF8CSQx912G5JQoYMgiQo8GcAq6BqIQ1IlVQc6SfAsdUTitutwqRItCnTrPL+R54UfkZxO+Fw4f
	rvINIghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzT7-00000003Bxy-2FCN;
	Mon, 16 Nov 2026 16:22:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzT4-00000003Bwk-2sOr
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 16:22:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIZfd154123
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 16:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jOFnPdS9OzKd2pQAuWQI40FvjqklDv0OYhh
	O4gHPm10=; b=p7OfNETpEr68CLI0FHZnru+WSdSkOWcv95PEkSOO17XhebYpD14
	DfEypxXf9qv30Nno20G5GbZdH4vUA3yytNSqTdr3jQyerOMYoNX1kbXLqUeE8Xm3
	z2Amb0sNDDdy1hNjpFWoKsJuhvJIplQtmtAZGdMXE+f5NlINe+yFbbK4RRC5Ytyb
	tAUx0aeQRf8n+viyoAihM06FWVfPSZD9kU71jhEz7na1nkNmtBuqcuBgrY+rrbAR
	ZFAyEDhlZ/4gSypJ2dXu9AQmSvDFrhSrR2tpFFbE04k+Y47f95sguXhUF7fnxqGz
	TLMba/Bnqx6GI/MB5R1SWBV8ytMR4dK7m2A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6ghjc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 16:22:04 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a5005fd0f8so5244565c88.0
        for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 08:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846123; x=1795450923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jOFnPdS9OzKd2pQAuWQI40FvjqklDv0OYhhO4gHPm10=;
        b=Um3oqPaPL32bB7yZXKVxtj1/v4/RskMoOwYS1ZYzzypqhmbw6bXPFN8ln7QDmvZIz7
         +46IttZoCwtNLsUw2/R0wXJjiZLVlZMobMJBS+bHmxzA+bDbuHwIPToSdLfjuegAyHWB
         KaTe7ff2q8gy8xv6M1T2Ts1pEVr2jhY5Qssu3ld3+SpdG0m41b9WLspokmO7VqwCH4Xg
         CH5v0Azgh1MDCtrYeKKxSuCXlJqgZOqRTSKrAhgO76PIxQh2u2vtBCIXrGJNNG1/fAkB
         4fX+NjQFpmfXHz26PGzS8AFLjpgC2dRkbIbdJP+H5r+8KKgPoXZEOr3NXWMAv9ed8GK9
         3yVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846123; x=1795450923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOFnPdS9OzKd2pQAuWQI40FvjqklDv0OYhhO4gHPm10=;
        b=pJiOtfcGALe+kYflETwMTGtNBiLq1LcrNnORh59e5BtJLcHkeQ6+jKnCnFfDBMSzk/
         fpkiNZBz4Hl8lG4RNqg9LOWeyzKxcjcfSO4clNVKtxbDi69jgz2CFBLeYGF4x2xQXn8w
         omgYOqsF8aAUkq4Nu1FT0ZW+LRTj+n41Aqi6tLpdWQYFdChytzVJl5VuoX6c16GltW+O
         f+O6fH2beRF0CsWbNEKc5DELLfFS4H9gTjDG0ZgoGCWffll6CF/aMg2VFx9D6Da9qzU8
         IVOocQ33f/rjZ2eO88G1W3XW0SEW4D1rHkyyWVryTfaBgNTWwvGj9toO1glLQmoP04f/
         F0BA==
X-Forwarded-Encrypted: i=1; AL+hErHcD9W0kpeVe1EFUF9+fPWTMXTmmFprxRa1LSW/CChuR+DhfDyubQTevn/rguuVmGh/EJpNy6M=@lists.infradead.org
X-Gm-Message-State: APuU4Z8s1oFcZ8eU+FhuzQ4Y2KrXzfFNMNVsDxC/gCdFm6Jz+y64/app
	3D0doynBtBjib/N9S1s4oTpRgnyryskrbbKGW5zNYSrP+j9Pee4aITKRzIdnf7DZyEg8yxOX535
	3dbFQlrUWd5IQ0dOGQWRRSenUpTLiCtQNHyJ0RjmXs00JULbjofmFHrOSblSl5anV
X-Gm-Gg: AYBFou3GTX6yHMYrRwrwfkEibROQDmTQUuZaYocG+Cs1pxu+PYLpihBBPwhizNL+nSv
	b4ii922bJq/Cv8/MBavoNz1V7vygSlrTcGKN3f4jyFAnUIc0mih2SVkNN4d0HK4+zewK9CYGrkL
	4MrM+XhNp2kl+2dqHJKSSH8DL6w/y88Urw1r9sX8fLm//vQgzeJn/c7223YI9HKNnmu3kOTBysG
	7dXnEdPg1s3H1RnUmprG2Xt1IymymOqSnVKS4JaI8PGB3Yn0v2NQ6UnFVbpxLexewoWZFJYluDC
	qjhuwbDaVdCpPPvKlLih52I/QkHwEtPidcl1QBpHoR2j2AVL7Q5NqImdbGNoXW/AfvhwsyV8N/E
	bOuoXGwOsn2KS0O4OEVAnK6tpq66IidP2b7l2e2QNYSutHYjmvjM8gbjTEAt/th2syu8+ekta3s
	z5
X-Received: by 2002:a05:701b:42c6:10b0:1b3:ba92:145a with SMTP id a92af1059eb24-1b503171008mr11928422c88.19.1794846123258;
        Mon, 16 Nov 2026 08:22:03 -0800 (PST)
X-Received: by 2002:a05:701b:42c6:10b0:1b3:ba92:145a with SMTP id a92af1059eb24-1b503171008mr11928366c88.19.1794846122515;
        Mon, 16 Nov 2026 08:22:02 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:01 -0800 (PST)
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
Subject: [PATCH v3 0/9] Migrate PAS clients to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:39 +0530
Message-ID: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXwIW+UDftX1S/
 SnNQbUhzcJBSlAEqH/pu3NMkGsddu8rAuMUw91PtzVy/DexsgrQbkK0By4QV4u+FqRsptOjboGA
 pNDOOmu5hNSrpprWaZg+OsiiLJf2mdNLVvpt87cGPxI3ldfrZ4wKTJdPSYrPH4ok0QzHv2dyyRx
 OsmzcwlRpp2KPM4OdNz01n9YFkeaKhttnp3wu1R0O+DImINOKinGy2HsR607r/BTcx2e5Z1h21l
 czKoMr5VzmEYrITDfDJTG82SSWI2RVuSOh8ugN+QKFXPc/QuICpu38mXHfYxFKlzJU5PgTREOTA
 2K0onmCLq7IXQU84bSGVJ7TZSStr/26rB3LYjvazpQfDuLCPxz4mi2+NYCK1lVbWiribSxuDSSE
 rHwW+0U5eD9IjC3pN0Pt+0nEFYHHsonV+uOHQRp6by6qkbqwsbw1kt6fYnrVpkCyInAp+KirNoF
 GagNT4VFCz5ICWzHM5w==
X-Proofpoint-GUID: g9kE--H5n3Zjw6V_94_-pfB9lw4SKPqR
X-Proofpoint-ORIG-GUID: g9kE--H5n3Zjw6V_94_-pfB9lw4SKPqR
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afb2dac cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HLFs0uR_R7ZgEvxmAyIA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXzrQCZQtJcY/5
 225lpY3+Oo2Rg1vhNcxKNOvhmvPxLjWvvj3tWaKAJO4c5Rc8aDPd/MG7nyFSvSMGKrukvZMX96d
 XTddq51J9/4cRhXfSLmLlay+x7FX0gI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_082206_841153_47853D3F 
X-CRM114-Status: GOOD (  12.51  )
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

Requesting the Ack from subsystem owners to get this series merge
through Bjorn's tree.

Changes in v3:
 - Added Acked by tag.
 - Fixed build warning.
 - Link to v2: https://lore.kernel.org/lkml/20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com/

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


