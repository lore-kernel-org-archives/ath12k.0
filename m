Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB5B606A327
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 18:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NpDI/Fcb;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lDCGc4Da;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HSPiKNdY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1pg51pe/31RdnPvnOyGiz66zvNpNhsnA7dx1wDRzP8k=; b=NpDI/Fcb/NbfaC
	OKAVGlidmXohztuSCbHhhlk3pAGeZ4ZEzMd/KLTGpRQL2vwhjN0yd5Ncv7v06yCu//MM9KLsqJX1B
	6ovzsz/CU9NvdC8tkD/LV8NOaSUPueeJ3Fucb2mUdbph5/ITbd3wy4Rn1PpCbjOsAPX0tp1hqC9il
	9xjcq0leLvP/Sgsctod49SaTuTJpF1Pk+hTDqNpAfKSNFI7+NNVa+cdbZ6swQO70YVCCGwH95AAPS
	AgQRzmqZfwcLI2o4vlGEpBAmwJ3FYvtRBcGJadpPA8+qCgkLx3t2l/7hTJD8u6dt85tnJJgrUu3Br
	31s2hyzNgkcQzljoYmUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwPu-0000000E1h6-0QkZ;
	Fri, 13 Nov 2026 18:54:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwPn-0000000E1bg-311M
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 18:54:28 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR4X6551701
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 18:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1pg51pe/31R
	dnPvnOyGiz66zvNpNhsnA7dx1wDRzP8k=; b=lDCGc4DanLItTTOu1ctUWq1jtJ1
	8Mcr4M/OWQsWRK74Oy0WG7wmQlJBJiSAv1+kcfVmGq/eLGeucU3XBnA4u2e8/PJ8
	1udRvJL4lLFj8n6/h43MI0v2u3v7C6IdV7XR4tIXuplhwdVVYWiTMdd/8pcjuRWT
	ucsf0Zj5k6lNsyZ000zx8HCiIczfeMe6KGW0SWvjGx2bqkTXSeTRyeRDRm8qBJUH
	TD11VyNs2XLxm3ag8IYy7VynBWFNiurEX0CJUXS5REBMps9HBhWbn7AdZqR8ckg1
	kA3NBuGaNMX+4JXUFOpX+sSHHEDFf7DY1+NzKNdx8vkDY+OIhBfUB3KWC3g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwcc6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 18:54:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so1305682eec.1
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 10:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596062; x=1795200862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pg51pe/31RdnPvnOyGiz66zvNpNhsnA7dx1wDRzP8k=;
        b=HSPiKNdYAkyArPj5r6t6O6fXxfsH97mQD16Z05U1Q2E17xr321qQNKF+6oRDamD0lG
         SDs7KPVtaEU+dIFpzp0qS9VlWuWjn9esyoc/s3ebXo0dcxrGRXzcKX7oY5uPpCOdC6HP
         GcqLdbduHRBaVhpkfdJVjDR2Gq54cAWI43UtXtBkzGHVP1z27awz/M9MdcoGLsaJGh8c
         mkw8nH1irAqaTNjcVNAZcmIXtCOOAy1t6/ak8HNbye9IgZ3AIqksHrB3iX/XV0pjD5xX
         /MTzpzlDfhMLiyUB3/9keKy6HuRU2MCScCEvnl9eAylVt+xF1BYAWiKBCUFZEHhrGHKN
         35zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596062; x=1795200862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1pg51pe/31RdnPvnOyGiz66zvNpNhsnA7dx1wDRzP8k=;
        b=KEobts363JikJMrcj7rlKRAEsDdzO5yVQjByStRHMUpe14Klp2oGVlfrQY81RYZWXE
         5BtFVHTnuJ5L6YGDDqZ/XSGAe2e47ICwDEYukwhXA8Nne5HkRjWd0bDI7Ebxy/u872fy
         NfnWupiAt7ybre74JcFfnCXm3ZUDODNJBfkG8zzue/NTiafD8+sZnKgVdjnkMJKc4fnY
         1xtKEwgncEVsJdGO0QgXD22GuAgxFAXMby/IU4LVXZZ+Hn4P3McLS/XnZKbtjd4jtHCW
         I5zMSgZTa4LKAtogUXWrUPNNeyhtkkWhEMf0q+I/caCwV1Ft5q7Gj/0FQDY772PE/PTb
         shnA==
X-Forwarded-Encrypted: i=1; AL+hErElzNuHjqImkM/o3QDEgg6k/EMglIN/8YciqTU43H0dsi9xzKhWU5TQM8zW68D/KBHm9LucgU8=@lists.infradead.org
X-Gm-Message-State: APuU4Z+MlXLiIqBJzYLDwWRcNeCAscnYvnK3dohQlUn2h0pGi8FYpnGW
	EP//rthBnZ7tkURakqSukqWW7P/QQ/MOf1o4x4KvGZplgmloSg2Ito+JKhBTW7plwUWLbHsB7Lg
	Nka3nMwn0XTdg+VfsZq47XU4NV/ky26Otkbhlq1LE3U9F7iYfLTDgCjV5iU4V3654
X-Gm-Gg: AYBFou1DzTIiMde71ao0d5qNURQ97abpo3t6kfJfQYaXpPty3D5OKrzqRcM51lgi+On
	xiMngc6gc2iSdNzMwTKNgmk0/ZMSJl3FBMRryZi+sIOeZRwm3/t2E+JBmix+lsnLUI8TaATbegB
	AK8+n10bddlk3jF56CtnbyfL2W8NY+HDDj6yfIcT5MMYI4elQYvhzQYeEM2sPhvhbhK++MMSlt/
	CpCTB3jw5M4rIhldX6NHPAhKOVT8ExHX8ZM7rneLpnaNsfuWOAtaxByqIb0viY7aF+TfXZRZuPm
	nnmizUYRQEPLuRyEd2jrXWc7yPNIB2GNZLyIGGsYO+r77alkl/Ge3ZIIRo1xCcga17KTTWNWhT5
	AC4t61sbZfc79ZlZPNZw5wXcFGDqTF356OR2x84clInbFoCwGRMSwJj9xOYhzGTgw1bYdjtXMoS
	s=
X-Received: by 2002:a05:693c:41cf:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-37967506841mr2876432eec.29.1794596061492;
        Fri, 13 Nov 2026 10:54:21 -0800 (PST)
X-Received: by 2002:a05:693c:41cf:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-37967506841mr2876388eec.29.1794596060847;
        Fri, 13 Nov 2026 10:54:20 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:20 -0800 (PST)
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
Subject: [PATCH v2 7/9] wifi: ath12k: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:07 +0530
Message-ID: <20261113185009.157893-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af75cde cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=tFPd4D2tFowRDCwbfnIA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 6DVUiB2ZLXubY6gT9p3lmYDu2C192OoS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX0Z7DmvEi0dOZ
 QEMYAzgbrukIR51g6/Cv9/U1mfPD+eAYR9qTw2ZdYQ/K4uvobwXA5467TDIM5RcauejDKDWXyH8
 YSlXG78a9ph42kquDhBf3YGisDJL2fADjazN0DpJ9JlLTAIDJb6l3rnZDi3TjCH4TQGO/ic7JW/
 oy7MxNyoB6deHzssbM7gf3UNl7Ar1CCPgSTFuXOMszYtc5XfGfV0bxJ3kimIBPndPXO55KbVHs0
 /ubwz19FgygfBYcW0Bs5g67oivQEg8bXTm1O2h+2aqXyxr4DWfAeXBXOcrkBGr7QM7u/RvHWYh1
 ki9OvkpbGjB6yD9A1R0Oz80F+/CObtH60W7rCxIP1o5p9ObCJ2ZjnRFSuyw5FORv3qYTteP65u3
 5tMK/aFdbVIsp/JI3LFnZ5ivsp68LqxCq+Z+KYnVYPCnarKm2x7QhiOws3nwzdaDrOjtMZDBL/e
 TRwbyLUSGp+oJk7U8Ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX31dCzOcYu0ar
 xzQIQJ78YjSvs60zCM3PftgYmtl6AybqgAhgIWppzc4ubKG8iuOaY6xKjcjZESnSO+5HX9ccAyu
 S5gaZ1PNC0pl4n2cwoOm3CUvzB+FQnc=
X-Proofpoint-GUID: 6DVUiB2ZLXubY6gT9p3lmYDu2C192OoS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105425_586519_CC3BE219 
X-CRM114-Status: GOOD (  18.04  )
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

ath12k_ahb_power_up() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
TrustZone authentication, which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Replace qcom_mdt_load() with qcom_pas_context_init() +
qcom_mdt_pas_load() and replace qcom_pas_auth_and_reset() with
qcom_pas_prepare_and_auth_reset(), using a stack-allocated struct
qcom_pas_context in ath12k_ahb_power_up(). The non-scm_auth path
retains qcom_mdt_load_no_init() with the caller-provided mem_region.

Apply the same pattern to ath12k_ahb_load_auth_shared_fw() for
consistency.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 8a3919675134..75d3141f968f 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -418,6 +418,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 	struct ath12k_ahb_rproc_info *rproc_info = ab_ahb->rproc_info;
 	char fw_name[ATH12K_USERPD_FW_NAME_LEN];
 	char fw2_name[ATH12K_USERPD_FW_NAME_LEN];
+	struct qcom_pas_context ctx;
 	struct device *dev = ab->dev;
 	const struct firmware *fw, *fw2;
 	unsigned long time_left;
@@ -451,14 +452,15 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		ATH12K_AHB_UPD_SWID;
 
 	/* Load FW image to a reserved memory location */
-	if (ab_ahb->scm_auth_enabled)
-		ret = qcom_mdt_load(dev, fw, fw_name, pasid, rproc_info->mem_region,
-				    rproc_info->mem_phys, rproc_info->mem_size,
-				    NULL);
-	else
+	if (ab_ahb->scm_auth_enabled) {
+		qcom_pas_context_init(&ctx, dev, pasid,
+				      rproc_info->mem_phys, rproc_info->mem_size);
+		ret = qcom_mdt_pas_load(&ctx, fw, fw_name, NULL);
+	} else {
 		ret = qcom_mdt_load_no_init(dev, fw, fw_name, rproc_info->mem_region,
 					    rproc_info->mem_phys, rproc_info->mem_size,
 					    NULL);
+	}
 	if (ret) {
 		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
 		goto err_fw;
@@ -492,7 +494,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 
 	if (ab_ahb->scm_auth_enabled) {
 		/* Authenticate FW image using peripheral ID */
-		ret = qcom_pas_auth_and_reset(pasid);
+		ret = qcom_pas_prepare_and_auth_reset(&ctx);
 		if (ret) {
 			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
 			goto err_fw2;
@@ -1056,6 +1058,7 @@ static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
 					  struct ath12k_ahb_rproc_info *rproc_info,
 					  const char *fw_name, u32 pasid)
 {
+	struct qcom_pas_context ctx;
 	int ret;
 
 	const struct firmware *fw __free(firmware) = NULL;
@@ -1074,14 +1077,16 @@ static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
 	ath12k_dbg(ab, ATH12K_DBG_AHB, "loading firmware %s, size %zd\n", fw_name,
 		   fw->size);
 
-	ret = qcom_mdt_load(ab->dev, fw, fw_name, pasid, rproc_info->mem_region,
-			    rproc_info->mem_phys, rproc_info->mem_size, NULL);
+	qcom_pas_context_init(&ctx, ab->dev, pasid,
+			      rproc_info->mem_phys, rproc_info->mem_size);
+
+	ret = qcom_mdt_pas_load(&ctx, fw, fw_name, NULL);
 	if (ret) {
 		ath12k_err(ab, "failed to load RO firmware %s: %d\n", fw_name, ret);
 		return ret;
 	}
 
-	ret = qcom_pas_auth_and_reset(pasid);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
 	if (ret)
 		ath12k_err(ab, "failed to authenticate and boot shared firmware: %d\n",
 			   ret);
-- 
2.55.0


