Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C2B606A339
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 16:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jdikY+If;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1P5lJvN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jtibmUDv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uySENDl4qHKLED5Y781UpPB/TLSVGsjWluRr5p+nyD0=; b=jdikY+IffntokG
	GCPK3p/N6IbEvWlc29WRLzMWsrVWrjTbkPEwwxxyIckbzUyWYH0BxGwvhqFDUmcfQT8ZDJFS1wKxJ
	mX14CExj+wVCWhLSVxJsLXm6/qAq7NLWNPSN2QjpUJnu35blPaGotSZIB8W8SSzDboninWjA6a5uN
	9QPHOR4MfbsLYMIUI3ONJPdLtTwQ1goo82+BbwNJ6VJldbF4xsnWlaxhpEZEDJFDgcI4rSVdb5eEf
	ruaP7R7JSbIf4wW2y6nJX7UsHzUbLPrD9VPE5eGAe7VTO4vohfuBtyHIPBr9IhVXp6ODT0UhcnuxV
	elCDZ4u9nGShwzCZ4H9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzTQ-00000003C5J-2xkT;
	Mon, 16 Nov 2026 16:22:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzTN-00000003C3q-3Ak2
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 16:22:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGITx52790105
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 16:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uySENDl4qHK
	LED5Y781UpPB/TLSVGsjWluRr5p+nyD0=; b=Q1P5lJvNIeKfL56TfRIjIR9jsbt
	77bTCWfZSMMnZXthPUTgZCdXpi4O2Zen0smhOrBw2karVbUu/j3OLL7aN8MglY0P
	bGJvdD4H3Xu0ByqdwaJVvWSdqOKH41uHf3VhbLRtzbMKAGEFaCkemwzQjUw8ao3l
	G/Sd6Iu4A7qRqNEwx/uhcR+aDj1Db70ZP1ARRIeLTctUDqzGwpb+fbl7kKjxxiFF
	NMBrW3TMolw/qsJAgwxAN2B3Z625QLgJCPte4FneviTa73W5lH1TVWNjC+j2wOKV
	cHQH4ip5qU2JKos01EIjcSpvU2+6j7Tre8SmYWS9yvw9okcMylQgj1en7gA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfh7se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 16:22:24 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1aa0fb7f157so4355390c88.0
        for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 08:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846144; x=1795450944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uySENDl4qHKLED5Y781UpPB/TLSVGsjWluRr5p+nyD0=;
        b=jtibmUDvKHENjeo1jBYqvNY2jBF1DduSNMSCyy4LJOAeYQhil+i5jprC9k5NJ7rVC8
         JlrPl6jN9NC1Bp+BLu8ju1LhewqIfh/vGwDCpg239xi+mzeyoMFM3bBqLoQnjkHDdiyv
         X/O05HA7+lNp67Lr15Iy1o8zDTppnXilpC8syv/uK8K6FzCi0nxavIx6WJQilNupsGm/
         26f6oYIJNRgmW4xxtw2qiT/DMqKwrJk+LfHzkyYwzMfHeo87lNqhV9KOUMJuB8NLeh0w
         QUmnKk4BUeQ53xtroztFR66aQDZ/F71hRJ7TecjMuzzkKHmwp8j75XY2fmUmrSf9CaoZ
         eh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846144; x=1795450944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uySENDl4qHKLED5Y781UpPB/TLSVGsjWluRr5p+nyD0=;
        b=ScN7bALsSI2vlZnRsMP1rHMRbHCbWRVtQ7nB05WX+jhBf446wfKrl2/iNXxImGuYtJ
         qlXJ60ro7wmbxBeWFpiv78hkbTeXDB9isQ3HEsICVdz79MTodfWMemH8afcof43Bhc1V
         bIrjGBDFvTMBUO2380Fm9C3XeIVJHzCl/+7f+xeF7MwEZ4+MuGd4AbvYKAs8Lwl0UO5i
         vx0+u9OivUKi4n1ilApDZWZHZnDuU9lejf6v0JB99YY8nbe9v0rqmz8iWcMwjBYwNQkP
         HAc8mgrrNr6ol3z7bBv+N4Xgcw92zTQrUYvNsdhS+nyKzi3bykTzgiACsiV/nl2sB/Ia
         EeRA==
X-Forwarded-Encrypted: i=1; AL+hErE2ZlyLgriP1gN7oAktC7AmJCfkYHtUBqI/9ghdpeTzzYVwEFLEBpuVaiM6cVEUYl5urXkgCZ8=@lists.infradead.org
X-Gm-Message-State: APuU4Z/zZDCRDoTQr+RxTfc3JTNB0PZFUqEeMaRsi9BYOq46hBe5Cn+D
	0Ew8vgFGWeI9YLadrPQH0m7QZvBe8PUiP2m6TdehWz3f864O8ji1BQWlnXtvzPWrsSODcQmrUkO
	J8/k5EVYftbUHXC9yQj0t5Zb+Oo561xx5cVHK+rYJmQxsBbfcitO+gMQnJhAeHBMq
X-Gm-Gg: AYBFou1QpGDKBeHgavqR4Pfj2UVbEdAKBsQH2U941vaueDG/QnQbaCKLyAhjXcsSN2G
	EVNOaE5y00TpGH8oHfsgRhaOQSuw04ZETNQe3vwOlWjA2otbcxn24ZhGeTh+VoV4lWBJtsdZzdF
	ukMZjimWN6llXXMKWJJ+qCeAUNSlsBiEeGu54uS4kjA0i1sRNcuO/xXxSbuqqdsQnQWmytw/kqi
	TnkxbSTz1EFt2p3XjwHD5y1EECF5ks/ZMy4upgBcC1PtHXy8XReVqlDsNQpleIC8SF27yfP8STx
	P+kCH1kezWmV4lGRrUtiAQuTPi9XqpAv+eKkHShTTTyJODy1zkAmXptom/SQihO+3erIrGaXgXz
	4tJKIOgO/UVCDELZ8ZXtnThrGsThqEKFZ4ltDsNJvd0ScYOkYQ4RLjLaNfxigY0Bwp9oDOv/mb2
	s9
X-Received: by 2002:a05:7022:7f1a:b0:1b5:23e7:3387 with SMTP id a92af1059eb24-1b523e75033mr5758267c88.19.1794846143428;
        Mon, 16 Nov 2026 08:22:23 -0800 (PST)
X-Received: by 2002:a05:7022:7f1a:b0:1b5:23e7:3387 with SMTP id a92af1059eb24-1b523e75033mr5758228c88.19.1794846142809;
        Mon, 16 Nov 2026 08:22:22 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:22 -0800 (PST)
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
Subject: [PATCH v3 2/9] remoteproc: qcom_wcnss: migrate to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:41 +0530
Message-ID: <20261116162148.2864501-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afb2dc0 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=BENypEIf3hN4rM3MEzYA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX6Pl2kEdJDTFD
 1l9Kd/ifskVFdIN0yvW5PkeOMwlOc83WrH5ZniGm+VAM236nJ8VuSxlec6Wv+7DuNz62S3nbdvf
 O4voHohtKZsqK3weB7XwOkXcRoak6U4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX8swvlEchWSHq
 UixeAx8EUwzLLU1h9euP5clPWQOD7zEui+w31PeaYzqXRGxbc52wAhbu2s6vXkwO0/4a36kR5XO
 oQMXLrLh/QKRVzcwuIfYqohsYqkPFYf+9JfsMSMxjVk9MgtRv/GswHk+G3ITjn1DiBlLdICfmYx
 k9mvC2RXspppoKlgFwJ8iuYskhiDzuQfyklTOiHGIMLDA6cqBGTJTsAaOBi0jvcz1lsitoasib1
 rvaYlloOGxHK3C0mmXA3WpI1/VhIDvlkc5Ox5YQ+YN8t0fGPc2ICGwdM0+c7Nypq4L7gm10hX3D
 h3mLesUc7Cpmr+9dmhM0ZCZNt53uBnWmPxlptjIEllBv9FHw8BTSGNOnL6Roc7qf8uLhioWwYHs
 BJLxlSDlZHclWABjMf1guYZhowB6xCTGTfmDIqjs/cQ+kRsEihbqKI/slzVSVAdI5rsbHIHZY8S
 kHBsRFUsHLBLCGus7fA==
X-Proofpoint-ORIG-GUID: cUg373UnKP-XlJbfc2TzDuzkWDPH30D7
X-Proofpoint-GUID: cUg373UnKP-XlJbfc2TzDuzkWDPH30D7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_082226_189624_A6241AD8 
X-CRM114-Status: GOOD (  17.35  )
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

wcnss_load() calls qcom_mdt_load(), which bundles metadata init,
memory setup, and segment loading into a single API that does not
expose a PAS context, and wcnss_start() calls
qcom_pas_auth_and_reset() for TrustZone authentication, which is
the intended behaviour. However, a new qcom_mdt_pas_load() has
recently been introduced that works with a PAS context and can
handle everything qcom_mdt_load() provides, along with additional
functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to
run while Linux runs at EL2.

Allocate a qcom_pas_context in wcnss_probe() via
devm_qcom_pas_context_alloc() and store it in struct qcom_wcnss.
Replace qcom_mdt_load() with qcom_mdt_pas_load() in wcnss_load()
and replace qcom_pas_auth_and_reset() with
qcom_pas_prepare_and_auth_reset() in wcnss_start(). The existing
devm_ioremap_wc() mapping is retained for wcnss_da_to_va()
address translation.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_wcnss.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 02f38fe29f20..840fa67a6928 100644
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
@@ -599,6 +598,11 @@ static int wcnss_probe(struct platform_device *pdev)
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


