Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701BCC9830E
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 15:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsHFeSAp3CUeDC6/pijBcy66HKE+cMN4f7sayTp0/R8=; b=GvMbMuoTTboKsvhUoEa0FWw/DR
	iEa9HtS9ZLLU6WoRYO3nxBwJweoDtmyfnxdzQroTLmhRWdhtdE6FpAIy1n0KTjQoTduOMryPTFK2G
	k45q0l43kLC2QOP9VEAU06qpuRw3Do/ilXNG6cupBJVZpbbLd3NCFkNkErob2Azti1GmR9Wtb59mb
	qtUijpK33PZ2sUq/r3RWNByUQBPr56sNrh2JvTpORuUcT25TIcFLciqx6Y5KSEh7BteYpfzw3T8Tq
	9wRZcVMl2ytJyuVynYx96udBLNORft2XgdlwVV3PMs53HwWD+eH/N3KCLrui66dsBF8m7MeSBOK9e
	OIZY78xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8K4-0000000DsgK-3FZ5;
	Fri, 25 Sep 2026 15:58:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8K3-0000000DsfM-0b14
	for ath12k@bombadil.infradead.org;
	Fri, 25 Sep 2026 15:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YsHFeSAp3CUeDC6/pijBcy66HKE+cMN4f7sayTp0/R8=; b=dzc2oMdanuBEtN4ual4nVRIIjD
	R0jg/B1IjU1WZ5on0cjV7engai6ZVd+oJtnNPsRvN6JE4/vFgBYj16kiH1tkAv9IuhXqF7WBAO0uZ
	9r4+f/JtlUmgmlR3AGiR8m9IgYfZTPs7Oq/9W7fhlvHtfAipME0N9rbS1+xUnHsx5avkkY5TlNgVc
	rKGuVsMJYDJ1VUrXp1uhh5ypvYbkvdPUMSQ0FzjMl8K3Q/l9u2h//tyXw8lo6vQxer3XNumK9lFuO
	+j/BoaLkFGpd242qo/l3bb0SQemxrOw5x+eI0Vs/yWJC45Fv+WMk/lPYZ+Buc6BEg/X+5VCosLFwB
	VO8DRBIg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA8Jy-0000000H6Ec-0mUC
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 15:58:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PEAa4I600037
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YsHFeSAp3CU
	eDC6/pijBcy66HKE+cMN4f7sayTp0/R8=; b=jIh+/103IYUgxoTwAISVwVI9lYA
	8X9dPiweKj3Cj0ivXSMIKmEEEYGRkUWAlt253f8PyQYc5/C5IXZKTsHM/umc7NKA
	2qHjdlZledxNycrIjw0fOBEbnjABaVvwICnn0YA8AvagzVYEbEgDNlPIGtXsrNyp
	jsm/bGVdqYxHfYx7CxYfX6L5j0HxotN3Xxhv15jXbjs9NG6eni44ZN5Na69g4V6i
	y7nAIjsa5GyCEmkP+3JLpXFcMhqq1R7qf8iIV7LFudxHOYebTl9UKNvj0Wf590Zv
	pvNmY0xMfykGXoiZlTQXIYgWC5D+/2MeOiaVPRfK8in7WG24ohov7Ck8oZA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvt29y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:58:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-880584d08f7so482351b3a.3
        for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351921; x=1790956721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YsHFeSAp3CUeDC6/pijBcy66HKE+cMN4f7sayTp0/R8=;
        b=gYdT8XALFENIzvs7SK/iy8L+6Ei3BsMIhf2EUx2u0wrf6gPpXQqJLg0JfufxsGnBkn
         evO9s2w9nQ7jnZe60avxQd3nOcmGGNBV8pEcAmHtB6Z4ZQU6U97eyPH5DzoME6E0y7VI
         H0vEslZWWWwEg57jG1C7PboZoBhU7kfP8Co4QqPHBbWJgE1cGM5jgADSGDgiwHpjmp+7
         TP3NimUaJyMt17D8LnwGUaBmPqC8Zb0hiSXEv6TG80gBOhUYCQv7l8jLkS66DuLwEmvc
         /ttjGbT2dGcjSB2Tx6CbBZgEQgIUuHFiEsfgWz2E/KxdIbI442b5xrjxowcW6ONOdKk6
         4eUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351921; x=1790956721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YsHFeSAp3CUeDC6/pijBcy66HKE+cMN4f7sayTp0/R8=;
        b=T7HV6H2JRBUBK35S0KJFRS8YZl2pGrBzo32ggMcWdXem6zMs4p6fWlovIr50qbOe4P
         Yk2CbtM0MhRJ8mXd0BO0LcIB2VIIVmyjjnJ1dRcm92DLqA4vi/o5R9zfjHrTMM/8zGP4
         I1Uf2MK437B94se8VN8opFJRpO6ePNPn62dO/pOZ4hWNm/2BcNhY0G3Ggg7K3WCeeFoR
         LFqjl+ZBYyzsj6PbCmvO9UsCAZOOjtF9K9qRYq5l7/A8e3LBrKxjMIi8CBnwcOH66a8m
         73b0EZi4OD8R9qP30BJXMEBH8eCDatDpGf1zbqwjoK8/5CcLmGWqszUTfc5OhQfWnPio
         HJCA==
X-Forwarded-Encrypted: i=1; AKwUvBxlCO65EBB3aKKe+FFp02aHfJxjAjLcfAZ6iY+uAeEssVmCxuB1LkEfuQ8Q5TvkLRvN5idwL+U=@lists.infradead.org
X-Gm-Message-State: AFuF++ljhGJ0JLZXd0Vtjntkp54URx0l3cKh4Sbxd71toMtIPz2NPabi
	haim30I5rN9GgUiZdgzughdiTZ8qedVBJvi1LRHTvNvlAnH5QLETnhbY1OJQqJwl5fWpO6D4W//
	xwAA13SHLQFJT8xH6pAz1BEhBiyPdp2qCjKYJdSJVwee559udDttKazWGAgfvhvgc
X-Gm-Gg: AYBFou35hWgEcka5uj+3rZRw6gtn0Tx5U2xbC/OnHxHyJwPI5lO8JvAgEKhxZk5l5il
	dBidgHEGzyngbVRYy812DnKKpZWz0gcYAuA+hM4WIvEk1bDzkEK3nsixBPnauVcmGUBQWebew6D
	YBa2OD1G6MwEb+ivW3eTPPRjf3oZCCjicl1gNNYhZG1i18qGZqUSWHDeB9Zvi+LsWbAacXZjelP
	ofFc65+5GaDJqYlhwAfltPLyBq5zM6Vz+Su81go91huiBGX5ElFH834tWJOSQr6hchMzqTT9Ymk
	HBb7UyRSWWHYDwoOWo91qOBYvFtMs/N9vHD4qv9J38DigSE8zU4DUe1X9kKbNoRSdkrMhRTwBOm
	s23Blt+yS6DT1lCRXPb0ukFe/9EE=
X-Received: by 2002:a05:6a00:301a:b0:874:708d:b631 with SMTP id d2e1a72fcca58-87e9d8da4dcmr5253207b3a.29.1790351921294;
        Fri, 25 Sep 2026 08:58:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:301a:b0:874:708d:b631 with SMTP id d2e1a72fcca58-87e9d8da4dcmr5253154b3a.29.1790351920637;
        Fri, 25 Sep 2026 08:58:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:58:39 -0700 (PDT)
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
Subject: [PATCH 4/8] media: venus: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Fri, 25 Sep 2026 21:27:33 +0530
Message-ID: <20260925155737.4161358-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OtH71Avi4RHsYZmKqWjO5pqSet2F0ffS
X-Proofpoint-ORIG-GUID: OtH71Avi4RHsYZmKqWjO5pqSet2F0ffS
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab69a32 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=KXBF9D8WR1mqcvW3O5AA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX2GQpZHngxN49
 5xIYBRu+dVOySzAmFz2ZuP+fF2nOJuJK2R3+xYhWraaiHjMKvxnHZSiCpx4yLykMgKlfQc6lA1i
 VjHCKj8kIfrenoKsl8LIkEAt61p9BgU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX0qKkcJ6n5UEj
 n9nnlAvsWBDOgxoYyXwlUqrnsqfNJPPnjo9t3jde9mLwlAem+3soXZ1jLwSnJqORydYkPhOEgt7
 BbbpCnIS0+qg4dOrj6IJRlUqvG8ktaoXvgf9wBMsnXFosQ82tO+oP10b7oMFnwTLSa0lGklzTwp
 oQfsqoTT6KioeQlGxEz2vcKfuUQf38FCkpxswiUWJTzgt8NtQ1JBzoedL3Jk+R+UaUivmE/f4y1
 UrsEALPJL75Ed9baoV3RGx3IcpOACQ0Ds4foKRY3QmmB0qPbNaxhv2+NkJMnS5NW4dRUxBhwhfq
 YpOQL0oV/clz48mqIqshsQSSSHUFxjXf9OAo34rGeqdUTsMVg/IYgOJA4fKRouDGIBrjBp0+NJH
 QFRix0omjawVUaWJmv5jU+r88Bg7uS3czFLZjWNcjH0Et8HLtMZsP8yqi2pkLmGre2rzO7U6iUY
 A1iURnmze3Y/C1wqdFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_165846_541765_B22B56D4 
X-CRM114-Status: GOOD (  16.81  )
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

venus_load_fw() uses qcom_mdt_load() for the TZ path and a bare
memremap()/qcom_mdt_load_no_init()/memunmap() sequence for the non-TZ
path.  venus_boot() then calls qcom_pas_auth_and_reset() which skips the
shmbridge prepare step required before TrustZone authentication.

For the TZ path, add a pas_ctx pointer to struct video_firmware so the
context can be threaded from venus_load_fw() where it is allocated to
venus_boot() where authentication happens.  Replace qcom_mdt_load() with
devm_qcom_pas_context_alloc() and qcom_mdt_pas_load(), storing the
context in core->fw.pas_ctx, then pass it to
qcom_pas_prepare_and_auth_reset() in venus_boot().

For the non-TZ path, pass NULL to qcom_mdt_load_no_init() directly,
removing the explicit memremap()/memunmap() since qcom_mdt_load_no_init()
handles the mapping internally when mem_region is NULL.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.h     |  2 ++
 drivers/media/platform/qcom/venus/firmware.c | 29 +++++++++-----------
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 46705a666776..adcf67043bf6 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -9,6 +9,7 @@
 
 #include <linux/bitops.h>
 #include <linux/list.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -223,6 +224,7 @@ struct venus_core {
 		size_t mapped_mem_size;
 		phys_addr_t mem_phys;
 		size_t mem_size;
+		struct qcom_pas_context *pas_ctx;
 	} fw;
 	struct mutex lock;
 	struct list_head instances;
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 3a38ff985822..4ea4c7769ac3 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -86,7 +86,6 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 	struct resource res;
 	struct device *dev;
 	ssize_t fw_size;
-	void *mem_va;
 	int ret;
 
 	*mem_phys = 0;
@@ -117,21 +116,19 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 		goto err_release_fw;
 	}
 
-	mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
-	if (!mem_va) {
-		dev_err(dev, "unable to map memory region %pa size %#zx\n", mem_phys, *mem_size);
-		ret = -ENOMEM;
-		goto err_release_fw;
-	}
-
-	if (core->use_tz)
-		ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID,
-				    mem_va, *mem_phys, *mem_size, NULL);
-	else
-		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
+	if (core->use_tz) {
+		core->fw.pas_ctx = devm_qcom_pas_context_alloc(dev, VENUS_PAS_ID,
+							       *mem_phys, *mem_size);
+		if (IS_ERR(core->fw.pas_ctx)) {
+			ret = PTR_ERR(core->fw.pas_ctx);
+			core->fw.pas_ctx = NULL;
+			goto err_release_fw;
+		}
+		ret = qcom_mdt_pas_load(core->fw.pas_ctx, mdt, fwname, NULL);
+	} else {
+		ret = qcom_mdt_load_no_init(dev, mdt, fwname, NULL,
 					    *mem_phys, *mem_size, NULL);
-
-	memunmap(mem_va);
+	}
 err_release_fw:
 	release_firmware(mdt);
 	return ret;
@@ -237,7 +234,7 @@ int venus_boot(struct venus_core *core)
 	core->fw.mem_phys = mem_phys;
 
 	if (core->use_tz)
-		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
+		ret = qcom_pas_prepare_and_auth_reset(core->fw.pas_ctx);
 	else
 		ret = venus_boot_no_tz(core, mem_phys, mem_size);
 
-- 
2.55.0


