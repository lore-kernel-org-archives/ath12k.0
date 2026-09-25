Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928E7C9830E
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 15:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zS7HAWLYB2KPmMHyPqOeaG0eVqDjrURQXru3PTmytm4=; b=d9V2n0OP3p+SE2WTL6l1457j21
	W7gfl/YEzAchbg6JGUnQ2DjftSfWQW5m8av6Wu1aPku1cmHTNMBVRcvXfCVOeTX+iqw7h3AfPzzEY
	q7EabFdYsilemFBH0FIxQHPcRVQeR9NVuQiZlP0ujb/LnjlZm9oEvpgFNtfEAg0Nssbr2zO0/jCo3
	QCi/1oEh0ughtJJVF6VwZ64hJVj7PVTZrDA9jO+RWtqmL27eFfCw7sJTFbjA0mRthuVm5wAYzxkHY
	v9a7ADaX28SYMEhb3moza5ecxngjB82sXEPxK17wAUOTOvPNS/AhawmlbcJL340Ck+LO/tBYZK/DL
	X2pE6Crw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8JP-0000000DsN2-1Dng;
	Fri, 25 Sep 2026 15:58:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8JL-0000000DsMT-0fxq
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 15:58:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBLdYK900279
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zS7HAWLYB2K
	PmMHyPqOeaG0eVqDjrURQXru3PTmytm4=; b=WeVZen3y/kyqt4GzvLiaHTnoRyf
	0jttmCryP7WG2a5THrEeUc3ec6gLqFVdEKSR+yOohOfKd6lA0X/5X3fhIFI+ImTu
	qmATk3FdhnabrwfDEVerNCuQiyff1wqt7u5FO+rNOcsDR2t/OnVlnaDeVJRnZBmg
	1GSkG/4WrGVLX56iHdFVVRs2j94RpENvp6Xt8GxuktOt3eWPZbOCXKcpHAy1R8m4
	DglMg+jA6+oHofSdidaJFWRPw5sBwVSRSQ+mHSq28uUxI2Dde3SUVcW3gzhDavmP
	fTke5X/1PEu9HjjDJMudD0IiSiQ12cRZzrNZMpNz8lcWsuQQ4YziFxkmOgQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr100x59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:58:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8663802b58fso802639b3a.2
        for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 08:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351885; x=1790956685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zS7HAWLYB2KPmMHyPqOeaG0eVqDjrURQXru3PTmytm4=;
        b=dX5kxMpkgZKseHL5G1G4aaqHc7PDGHOrLb08E/2ZJOn64zDSMvF09IDRX30DPanRnR
         RK7j1z7eebZVvKSgwncvBX3ibkmXgPdhSbXey0hgQbDced4J6kDpsHGe9qMczAk/DPfu
         ttLtdUq4qxlNq/l4NDIwGX+VEDS8G9GIJNjxWT6vHjbcUnKXQHGi/CJu9kAdu15dpGQB
         vFB6nb6kBQyM/hNY25YKXd3UBEd+6xnfF3WuWICjjIcdBmQW93ExnO6A1fe/ewbXbcAh
         0PBZba3cZA32z1uCBzN91WJSUlGMo9EQHu1ReCkMVGo+gefMxI+TelZP70522zxlcWRZ
         fR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351885; x=1790956685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zS7HAWLYB2KPmMHyPqOeaG0eVqDjrURQXru3PTmytm4=;
        b=HFxhKettekiiDRkC5Unu64zEBh/0pW3bLplYaVJ037+hx735hz6K+vVbBmNGs9y2b2
         wfZu+RZ1gIpQnz9kRMaBO/Y8FG5w6SRUk0KxuTjQ4cCDaBXMhVQmyU0VdmaCLgpokNjC
         SKutLU1gtrKidvw0iEdpomMiYyaOSpk27aZi1upc79byJHi+xWj6xzscM55QLvoI4w1J
         YoadeiXvZmqhu3mcUI50fnWdD2oVfuWDHwOnRIT/ATa0CqK28/Vl6GKNtgYwq6b0kqDK
         TQX6h4BNK4TRhH6EyV+BRL2DqB+afyWQBhj7XG8BiQK7AfXjQ1ueyIg0ga+BaRnbW6c5
         4FGA==
X-Forwarded-Encrypted: i=1; AKwUvBzshdtIBjfPRBHeEF1upU6sTACGufKGhLIzbRsNsysfbqEz8lj7H8nRS50gXyObZmbPqEEOiOQ=@lists.infradead.org
X-Gm-Message-State: AFuF++l1BCCOwLyvohk3TphebI42BWz3wkSN9VOZPd7EwOMC1jsm6jXq
	T0oaua6EC8hCvy9vRPTAjcz0Ve8X55cLXsOHR32u7tC0fS9r6BK3EwNFfxKa9y137ZX2vkJjaL9
	URaYt895KsorVDz+HJd3B4pXzq7mTb1dmrngpxS4sJPLxelKgJVsVR+1kYiC2CBeY
X-Gm-Gg: AYBFou31D3bogL42ZdEauubiBi9IcAqLfCYNtm2lA1xovi1ir+kszfXeg64hzbZzVTE
	ZSME5hZYbdoUj0fcILRGlZ4b96sSTRJFSG/23DKNomFyUIMinheZGbyVL/D8WML0sv2U21tRf01
	0VLhiHkZ435LQfTJgHLUnq1hvXZ12/weFasA78syBTSMwEYJ0bLZPFOCkp3OdUCBWV33YEpRWfG
	0P3guenqfipc20/NdtMUz1jzt9BSP5dpmJVl7H2SRO7Sw0S6MVqUUNZUGLi+OjZ4LY9txzNtzj9
	Chz/e6Qi+ZyH53Jozb29MDpuTZF4v3yowU/CUVlVBzbzGn8x6fTrIOBRFhRhBXV21WyJ2EDoZpc
	7cafaccAenDZ2PJTsaY3HPzR9fIY=
X-Received: by 2002:a05:6a00:3e27:b0:880:fe7b:bc61 with SMTP id d2e1a72fcca58-880fe7c01afmr530740b3a.50.1790351884763;
        Fri, 25 Sep 2026 08:58:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e27:b0:880:fe7b:bc61 with SMTP id d2e1a72fcca58-880fe7c01afmr530719b3a.50.1790351884190;
        Fri, 25 Sep 2026 08:58:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:58:03 -0700 (PDT)
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
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
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
Subject: [PATCH 1/8] remoteproc: qcom_wcnss: migrate to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Fri, 25 Sep 2026 21:27:30 +0530
Message-ID: <20260925155737.4161358-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX2oEBzMl4ZhyR
 t206XaMFyHJebK7t48Kle/KGOxjcq2KQKGR3XIzRGo3m6vrDi0q4SRTULjNKa6BXydlEUYug9+h
 vKZJ2+oZtEwVj+ulDkonxmcNGfZoughOGtTDxMRyxaKpehAqQHpO0TyY3xG3AaczA8by3EGIHs8
 St5n6wD7IsZPhmJHJXseRBP8ObLeqmL36NuwUNTj+qefgZSM4ZMocN9GFTrEwjCepKH7y1FEczq
 8JF4V5cDM0luwPW1JkKBwmt9eigunsudjbjyKwsAf54dhDAcGArSPPHKCTQP9YMQ8JW2fOlkE6U
 uIFobvRHT6QbqSG2zLhn0TblyqVfjD8i85nt4+SGy98GrrERnkeCwTMafX93bvMuVQcIG8l7rgq
 ZklndFz0wZEK+T0KImVb//6hjmn+cTYYLgl1NAwXkFih42L/ke7EYdGu2Z405G3/78PutS3YczX
 7oVCmjb9q1n/BwMomWw==
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6ab69a0e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=BENypEIf3hN4rM3MEzYA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 0sBCYDhJcAUAZHBqb-4uOADbD5Eksq3u
X-Proofpoint-GUID: 0sBCYDhJcAUAZHBqb-4uOADbD5Eksq3u
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfXzSURwKBnlOde
 1EAxFzzr2k/RLg0O9HMyLxIyZxNWP4dSIjekMxjv3fbtP3r3IDMNd4rbcdti3vQzZjD7yf4D73s
 nRLkByuha5rVyf4Bl8K5WZ18Noqq/m0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_085807_316327_E8F8EBB1 
X-CRM114-Status: GOOD (  15.19  )
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

wcnss_load() calls qcom_mdt_load() which bundles metadata init, memory
setup, and segment loading into a single API that does not expose a PAS
context, and wcnss_start() calls qcom_pas_auth_and_reset() which skips
the shmbridge prepare step required before TrustZone authentication.

Allocate a qcom_pas_context in wcnss_probe() via
devm_qcom_pas_context_alloc() and store it in struct qcom_wcnss.
Replace qcom_mdt_load() with qcom_mdt_pas_load() in wcnss_load() and
replace qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset()
in wcnss_start().  The existing devm_ioremap_wc() mapping is retained
for wcnss_da_to_va() address translation.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_wcnss.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index c856a92af43c..01f9076aa0b1 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -96,6 +96,7 @@ struct qcom_wcnss {
 	phys_addr_t mem_reloc;
 	void __iomem *mem_region;
 	size_t mem_size;
+	struct qcom_pas_context *pas_ctx;
 
 	struct qcom_rproc_subdev smd_subdev;
 	struct qcom_sysmon *sysmon;
@@ -157,9 +158,7 @@ static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
 	struct qcom_wcnss *wcnss = rproc->priv;
 	int ret;
 
-	ret = qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
-			    (__force void *)wcnss->mem_region, wcnss->mem_phys,
-			    wcnss->mem_size, &wcnss->mem_reloc);
+	ret = qcom_mdt_pas_load(wcnss->pas_ctx, fw, rproc->firmware, &wcnss->mem_reloc);
 	if (ret)
 		return ret;
 
@@ -257,7 +256,7 @@ static int wcnss_start(struct rproc *rproc)
 	wcnss_indicate_nv_download(wcnss);
 	wcnss_configure_iris(wcnss);
 
-	ret = qcom_pas_auth_and_reset(WCNSS_PAS_ID);
+	ret = qcom_pas_prepare_and_auth_reset(wcnss->pas_ctx);
 	if (ret) {
 		dev_err(wcnss->dev,
 			"failed to authenticate image and release reset\n");
@@ -600,6 +599,11 @@ static int wcnss_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	wcnss->pas_ctx = devm_qcom_pas_context_alloc(wcnss->dev, WCNSS_PAS_ID,
+						     wcnss->mem_phys, wcnss->mem_size);
+	if (IS_ERR(wcnss->pas_ctx))
+		return PTR_ERR(wcnss->pas_ctx);
+
 	wcnss->pmu_cfg = mmio + data->pmu_offset;
 	wcnss->spare_out = mmio + data->spare_offset;
 
-- 
2.55.0


