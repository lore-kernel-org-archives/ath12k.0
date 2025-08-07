Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1E8CA0EC0
	for <ath12k@archiver.kernel.org>; Thu,  7 Aug 2025 07:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IAd5Ze4vzEvwh8CRNYeZ2qA7tHf7jWkHfXPtXA/b2Zg=; b=R82llSpYfVotBU05bfIs/PQwnC
	YL+CmscsdXGczgBsTsJpUf1Xlo+PxHgelIVzexOCKBD5JakgUhI8h0q5h7h+5ey2hXd9ZJPPvumIG
	23auvxRQ2BHAg/KUg+ZxlsqSdm0qgt1KuEiCVjUxN/0MI4iPHCRJI5nAKgJinFCZISUCqlmjvL777
	SfibEzyWz19twL2FsjlI1CLxdu7mP397KBo1Qzxcdu+sgXcqmIrVuYVvyJe7wpoIUhSnb/tJRkTX5
	NlX3BFK8Hw+M5eeKddK8inCJWvYNZu2QBZQuGMKhNh9u/QWvGgotPzy5KK/cU7Y280J5SModOeCmc
	8njCDojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvNx-0000000HVdQ-3xlF;
	Thu, 07 Aug 2025 07:50:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvHk-0000000HUno-22Yz
	for ath12k@lists.infradead.org;
	Thu, 07 Aug 2025 07:43:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576LXxPX008940
	for <ath12k@lists.infradead.org>; Thu, 7 Aug 2025 07:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IAd5Ze4vzEv
	wh8CRNYeZ2qA7tHf7jWkHfXPtXA/b2Zg=; b=kq23wH5DE2+oLegmUvtX/zF+xtk
	g/FzoL6TijTXlnE32k18k+uqSgh8GeqMAlROGd8glIE9JimOn/gvrPY6p1yT/M6c
	hvUYYjy4mKzw+PWBhlybCB5wlRK4tCqB0FCGCASdh1dyJ9cLEs6wAAtNrJ2azJPT
	SKfMOV/BLmhYZPeropj9mMsLU39N7O348ny4KPgPgyf2PN8cRiTk9ExORGz8YT64
	ueOIL8NOdJKbRwlbVIpTO626RO+4buwTgyDjSliJXBp/cbm1jPai0e721awRoUc5
	WYQjTUZUMkAhiXrnLddJIHwL6ITOAcnK7Y4a4wYDy9lIm9U/VAf+qaVK4Og==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2whmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 07 Aug 2025 07:43:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2400a932e59so9581995ad.1
        for <ath12k@lists.infradead.org>; Thu, 07 Aug 2025 00:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754552614; x=1755157414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAd5Ze4vzEvwh8CRNYeZ2qA7tHf7jWkHfXPtXA/b2Zg=;
        b=APaCwufJU+nyiE8S8iaLQV1ntEgOV11vrJZ/XGwL285gQOoHb7bfJ0ac6h8KQ4/cKJ
         sR88U8z3aR8B9YCsnfwVKSpftfBdgJIsN2x5vl76p36wkiLnNgfJZ66rGEsZ1bT1zk3y
         R40DIbHdpIvB/zBwxj5AMjWlcoa9y51+W3ZZkpHuQ0aZDPpJ26iPzwQTzGQ6Sw1fwvFN
         rX5auJWLW6utGhaUo9lPXzHD5OogXUB7XVHsIsgacFnpDaElHhCcsRLTeZ9X/4hINujY
         tFxL66bmMVlAvXIpBVk3mlatQs1oH+kXm5d0BKxcZJrXAgdiC6AEZEZhguT94Lz7Tel0
         2LCw==
X-Forwarded-Encrypted: i=1; AJvYcCUUOOmsCel8w4CROV5oUIg7EpSUg4wDskeoEOvw7ZYIdkXUTJBiJP2feG81hv02XFaIe1crQcM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfqtPB38akA7lrl1se030QdSdgFNVlgDy/z0ZrCD53R9/7Ye8s
	WAV4H+m9jU27Zfw3Y4vb6zEsLUE5bCnNeEvbxLt/Zi+hISNNDgZlRuMFLsthMX6sxkJR5fbbKtc
	Jtb3etFN7kaHU4B+JP9pGmV+j06MNzeEe0Wt2xLHgxs8XYjIEX4PzZRQ8ep+O7sJq
X-Gm-Gg: ASbGncsMANtQxTXb6A1gF1Py5zuTYPGQxL7fznkziBFap/vU3C3fiQO36gULnvvXXoS
	H9hk+WeU+YKF+ro+aBnhGzQaL5YAfnNbAGppgJLGqoCF49/8NAd6RRQiI1Fs3nsD/O9qwxumfNf
	Zlu+f8FnyvXXMvRaRkNOpSKEBhJVyU18WIfJQM15uFCDwsuabeCGA3Icvzzk5CGimHYDSlX1/8/
	xH/l9n8LqePqad6gL9V11/gR2wpnnEVCsDO/tF7N6j+bVK48ac7ojdSPPGJiZLYwfBdtdizt0lB
	1rDbiY4qK488E+Tp4qqVpXQtIOM5FjKa2gUzEibdmsxSY3VbRVTx6UkIMZquxv6y3qI=
X-Received: by 2002:a17:902:f68f:b0:240:3915:99d6 with SMTP id d9443c01a7336-2429f4abfd4mr86270765ad.33.1754552614143;
        Thu, 07 Aug 2025 00:43:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmQ70xW0VJBqeSlIUWMJPARL1fYQTkCAlkasjy9//oof5xTgkO6mW9mVoX4c12poiyfQ7JHg==
X-Received: by 2002:a17:902:f68f:b0:240:3915:99d6 with SMTP id d9443c01a7336-2429f4abfd4mr86270555ad.33.1754552613777;
        Thu, 07 Aug 2025 00:43:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm178166395ad.39.2025.08.07.00.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 00:43:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [Patch v3 3/3] soc: qcom: mdt_loader: Remove unused parameter
Date: Thu,  7 Aug 2025 13:13:11 +0530
Message-ID: <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
References: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=68945927 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wln2f8d1oZJPYHCAfSYA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: C9QTu9i0DHxMydrmt8xE-0AubxbcirxB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX0K+IbMAjf5Cq
 wREkTPGH0WP+9Y9oMaT+9UjG2khcVW1cME4CjVT6XojiZyfv8WROYeiUO4f4HXe741Q+q0Pf/vs
 b/8BlMJYmj+SaC1UU3zLUUZw5sKgNvXc7fYLEjlF9dCLszNGQSXXM7pffGKHSCUtJ4GEn+Y9qf9
 QedqFNWNYDm4EOLHI3m8nvrd+1P7/7DETqxJNIItTDz9ouk7aMP8zm71fuzeBcn9M8TjpG80WSf
 ExHFMW8yLG87jX/C4+Ksmf/xekffVUeikPQTeEHrBPSz9hKl7Du4mzdz4/IimGErvvciIYwjgOZ
 IHPtL7u+8/oIRYWx+VvFxZXvQGMBWCGsv7svG+HLNIz8CY25CqU97isHKD9HALMkkzRH5EN5XNM
 K9ze0/9+
X-Proofpoint-GUID: C9QTu9i0DHxMydrmt8xE-0AubxbcirxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_004336_639284_E077717C 
X-CRM114-Status: GOOD (  15.56  )
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

fw_name in qcom_mdt_bins_are_split() seems unused now, it may have
used in the past for logging it but due to code refactor this parameter
is unused now.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3: https://lore.kernel.org/lkml/20250806172531.1865088-4-mukesh.ojha@oss.qualcomm.com/
 - Caller of qcom_mdt_bins_are_split() was modified in 2/2 of this patch in
   earlier version, bring the change here.
 - patch order changes due to drop of one patch from earlier version.

Changes in v2:
 - made this as separate patch.

 drivers/soc/qcom/mdt_loader.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 74c415774657..7522223835f5 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -302,7 +302,7 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_init);
 
-static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_name)
+static bool qcom_mdt_bins_are_split(const struct firmware *fw)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_hdr *ehdr;
@@ -353,7 +353,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	if (!mdt_header_valid(fw))
 		return -EINVAL;
 
-	is_split = qcom_mdt_bins_are_split(fw, fw_name);
+	is_split = qcom_mdt_bins_are_split(fw);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
-- 
2.50.1


