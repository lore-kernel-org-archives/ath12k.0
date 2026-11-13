Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118B5606A88C
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 18:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cg/qssio;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fURUUT0X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iuJjQnz5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sFBq9fRHwG6vJeIthGk0I4jMp83as5rl6WW7bRc8g/s=; b=cg/qssioBLuyXZ
	QGcG1zNy8eZuq5peW8Ag3YprugDZdUV4tTH3ooA8LQ8S7wRbYpkq62xJONmgvL7JXyqL3d20GP9YU
	wrJh2Vt+k3GIj2bOdOPIqT3tDwskrhVOvZr23ahThFpJ8vmCeFbFste0OiAArXh0nrXbPpksmq76B
	savhfJPHYD7Q9rJuML+HgEkLJIghSbf10bc23Jg3diJ55bGBdP4BxgZeqO9HbXXjVM8e6Ndr0EC+6
	7EDndPAhTYM8mmgej2AFxUyQ2nD9hFJ9Dq2PTolIlrzk5/pAUvOG9IkCjoUuiwXmL2XQEJhpiBEQX
	yudBe03HYsZit3q2qPDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwQD-0000000E25S-2vjx;
	Fri, 13 Nov 2026 18:54:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwQ7-0000000E1y8-2F6l
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 18:54:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRE5M1190175
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 18:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sFBq9fRHwG6
	vJeIthGk0I4jMp83as5rl6WW7bRc8g/s=; b=fURUUT0XleKiE1C/Vux+befwt+/
	dPsCZuHNQAShw3zqmbbPvnkWmciAMOJmcPPjX/Ypz5i8xGx5igroHMccVx+b153T
	uIpQ7885fRsHjkWRYpoBVsESepqQQcYBw2TwRc+AQxQQzBPmipPxvz2QTuBrcg/U
	fxflhQRaD9AWLlT0VkEyW8xmO8xeOm7gg0EuYPIqqxROMDx8T0RNRi2GJT+72Zzf
	BRyN7VhBSQrTqV5w2Gbr8XxWutaOeSSTe4uIT86yAJhpD14B7KdLcqKJBttPaHBk
	Nu7PpBDZGbwJEUEyWxW2WkQw3GHZ29zfEI+9kF/mEEv+0sfWto/DrsKryPg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufkrdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 18:54:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-378722fd4a3so1503902eec.0
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 10:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596082; x=1795200882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFBq9fRHwG6vJeIthGk0I4jMp83as5rl6WW7bRc8g/s=;
        b=iuJjQnz537g8cD+Lkcr3doDYiTreQvboyWO4OVxpFY+PhU2HFG5YeQ2BYL8U17jsFM
         qK3N2fb/pkxYzZ7ntIUznE6a5b+06wWMNjh4WL8ZTvxYBnrWVPT0dIx6yjuLCzNIfpKf
         8ZlN5YTbapkxIogVmVQzWv/oI9z+/mGEKs6Xu6dUy1TvGYshsdzuP4UKxmFBRsEit+y6
         g34JAFTGG4lIBLtQZnIt9azE8lR2MmA2bk4csn26esrm1sZ2BNeTXuqllg550IhbkKyC
         6sNqZ1i9jDAEKB7ayTv3Gl/7myDdIjW/+gTht38OD9adusgl3H1ykLlTncYIAWuO6hRq
         ZBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596082; x=1795200882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFBq9fRHwG6vJeIthGk0I4jMp83as5rl6WW7bRc8g/s=;
        b=qzX94i7rg7Xbv8dSw4DJ/hyJukv6/YtsRCfsKLwDWlOz3dDLYwTjhNLkreizHUfS4/
         EwJuecA4EUY4WUVWzsiZsqsOUm1rtdkBxMXOuw4+FYO6/OE/MEiUdbX4WFqX+NCkrtVs
         TCuoE1tH8h6ZFHNMys8WqmQjbrfhAUtpQDwxJMoYeTy3VWrYZGYDZoHEIPHnHZ8pFfzB
         5ADjGi6SaJgoVW5By20ON7oqMY/w14uKt341BS+BWMkSOu7qpDhTTVTlPTiPcYzQ2NFl
         ExoX9j3QhYZ4aPCyAoXUDmRSsytGBWoi/U0MaXMOhkaFMGP6jbFJR7W1/dH2X3U/AsIT
         JTAQ==
X-Forwarded-Encrypted: i=1; AL+hErEpxcokcJEtJmh0kr/bVu7n9kUPvxKCWGtp5Sf8HL7JotXDs4sDz0DoFgRH/M+dtGII2hR+f6E=@lists.infradead.org
X-Gm-Message-State: APuU4Z/5SQ3YzqAeiz4XQMQ5W9UEOKGXKdg+vRgyC3dY/FXJAIXWWppc
	HXEI1X985pob2DhBVdg+2AaI6ryM8pToSFj+VRjO6ARUfmF9KEmpVyEoekjQDFwEZsFiUDRJ0ja
	AchWNUApGpy6MrlOtRGC6/ftj3sHuU1V2wYCyXLf0ZJvQDmaPKC41q6LIJLKN9BuT
X-Gm-Gg: AYBFou3K2vWd1+vf3kHnZ+aQKb5fvAY+ADZ3J+0Rqf0jPOAU+QUpPV1FT2aOkOOFByL
	bjnce/Mq9RuOHweCkTDyeRXTvEAFc1VJBT4MwOE4fQ7CVObIonen7VCaVSohvje0ne9LaxGqchw
	+TDiZT+jM7lAbND+auvgd4WqOLoFLM8cyIRAL/4wWUvHTZK7zBXY6rODX75YVo+VgEnDEsPReos
	F23coWfQzqpwk+fIMKykEm7g4RiVh4vMM98mLMbqaJpROH2Yy/bTDRZP0Ro4V1RwvB5xo2r9AOw
	Gy5BluJV+4vWz3oZo4ZVl2dK5ahb65Kk89/QIW4+lMQe7bR2j5zXXfcGysudzOjslw5fAh5KirX
	1NAGRZjeQS2LoGvPfWTpy2IkfBLd7IAdlFMcGI3YlGULQ9LOtNtdtUWYkOjXcX+gQ74u9WKYn00
	U=
X-Received: by 2002:a05:7300:c7c3:b0:377:ee18:c290 with SMTP id 5a478bee46e88-3796676b12amr2938738eec.21.1794596082061;
        Fri, 13 Nov 2026 10:54:42 -0800 (PST)
X-Received: by 2002:a05:7300:c7c3:b0:377:ee18:c290 with SMTP id 5a478bee46e88-3796676b12amr2938703eec.21.1794596081228;
        Fri, 13 Nov 2026 10:54:41 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:40 -0800 (PST)
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
Subject: [PATCH v2 9/9] firmware: qcom: pas: remove qcom_pas_auth_and_reset()
Date: Sat, 14 Nov 2026 00:20:09 +0530
Message-ID: <20261113185009.157893-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oClNIZXQ7EiOg_wNHDIvKiu-UdMvi6DJ
X-Proofpoint-ORIG-GUID: oClNIZXQ7EiOg_wNHDIvKiu-UdMvi6DJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX+oJhYlSkeWvM
 ktTXq9cVCURbAYqbPZyp8s8D0vq98xviu0ea0u3AW5cEo4GiLWMHkHi4ZxC2f91olZylTTnubyJ
 epyqncbDGmpby37kUIZQIZdD78oDTn3kHx5nDkde7F7MQKMjU/5yHnTo6TF/JUqAyVZjxtm2COb
 6GYsibcyCVKfdvjDNGm5Py8Xm7n7bY37JsqWg9P/jdLugiXA2VPSZrVpmd5Hj73FJ5/jg8yVaP2
 2h2SbnyWDWzksWub4KG9oktIMVmHyocyYFV5eOHYvGoOj0UPatlAnffQZUJBxWziX52Hey+fD1u
 runuWflCxh0e7aAlfXzScHf2QiOjWJdQXR6lYUSqVqt8Rz4VS5q8disdQ7gQedEyG2G7DHuvVBp
 OW2XMe0XP0purCE2HASIwQD6eU0P9tTbMGuqXECjRiuDI7TmaJyOX/NXJNRRkNsVlow3rxtsVsP
 iWfIHDVDCu+SHUt4GGw==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af75cf3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=sV0Ut8U-cAKt8JUqj3YA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXwL+vXBHjyMoB
 HDw8sjwIPlE8pMtyaIf10t2owXON4elqHFRSDFrAgUpAM1FTBAojLqPssdpRt8iSkF7cXFm2RGr
 K0ji3WweZf9rIdSfbXSFxPceFhEKePs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105443_728181_800186B6 
X-CRM114-Status: GOOD (  17.40  )
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

All callers have been migrated to qcom_pas_prepare_and_auth_reset(),
which additionally sets up a shmbridge over firmware memory before
TrustZone authentication.  Remove the bare pas_id-only wrapper, its
EXPORT_SYMBOL_GPL, the header declaration, the auth_and_reset ops slot
from struct qcom_pas_ops and both backend implementations.

The internal helper functions (__qcom_scm_pas_auth_and_reset,
__qcom_pas_tee_auth_and_reset) remain as they are called directly by
their respective prepare_and_auth_reset implementations.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_pas.c       | 16 ----------------
 drivers/firmware/qcom/qcom_pas.h       |  3 ---
 drivers/firmware/qcom/qcom_pas_tee.c   |  6 ------
 drivers/firmware/qcom/qcom_scm.c       |  7 +++----
 include/linux/firmware/qcom/qcom_pas.h |  1 -
 5 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
index fdf62003fbf1..08bf3a8d3bf6 100644
--- a/drivers/firmware/qcom/qcom_pas.c
+++ b/drivers/firmware/qcom/qcom_pas.c
@@ -184,22 +184,6 @@ struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
 }
 EXPORT_SYMBOL_GPL(qcom_pas_get_rsc_table);
 
-/**
- * qcom_pas_auth_and_reset() - Authenticate the given peripheral firmware
- *			       and reset the remote processor
- * @pas_id:	peripheral authentication service id
- *
- * Return: 0 on success.
- */
-int qcom_pas_auth_and_reset(u32 pas_id)
-{
-	if (!ops_ptr)
-		return -ENODEV;
-
-	return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
-}
-EXPORT_SYMBOL_GPL(qcom_pas_auth_and_reset);
-
 /**
  * qcom_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
  *				       remote processor
diff --git a/drivers/firmware/qcom/qcom_pas.h b/drivers/firmware/qcom/qcom_pas.h
index 8643e2760602..a296be2be8c0 100644
--- a/drivers/firmware/qcom/qcom_pas.h
+++ b/drivers/firmware/qcom/qcom_pas.h
@@ -18,8 +18,6 @@ struct device;
  * @get_rsc_table:		Peripheral get resource table callback.
  * @prepare_and_auth_reset:	Peripheral prepare firmware authentication and
  *				reset callback.
- * @auth_and_reset:		Peripheral firmware authentication and reset
- *				callback.
  * @set_remote_state:		Peripheral set remote state callback.
  * @shutdown:			Peripheral shutdown callback.
  * @metadata_release:		Image metadata release callback.
@@ -37,7 +35,6 @@ struct qcom_pas_ops {
 			       size_t *output_rt_size);
 	int (*prepare_and_auth_reset)(struct device *dev,
 				      struct qcom_pas_context *ctx);
-	int (*auth_and_reset)(struct device *dev, u32 pas_id);
 	int (*set_remote_state)(struct device *dev, u32 state, u32 pas_id);
 	int (*shutdown)(struct device *dev, u32 pas_id);
 	void (*metadata_release)(struct device *dev,
diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
index 1fca2712d791..525b8a02ae82 100644
--- a/drivers/firmware/qcom/qcom_pas_tee.c
+++ b/drivers/firmware/qcom/qcom_pas_tee.c
@@ -331,11 +331,6 @@ static int __qcom_pas_tee_auth_and_reset(struct device *dev, u32 pas_id,
 	return ret;
 }
 
-static int qcom_pas_tee_auth_and_reset(struct device *dev, u32 pas_id)
-{
-	return __qcom_pas_tee_auth_and_reset(dev, pas_id, 0, 0);
-}
-
 static int qcom_pas_tee_prepare_and_auth_reset(struct device *dev,
 					       struct qcom_pas_context *ctx)
 {
@@ -412,7 +407,6 @@ static struct qcom_pas_ops qcom_pas_ops_tee = {
 	.init_image		= qcom_pas_tee_init_image,
 	.mem_setup		= qcom_pas_tee_mem_setup,
 	.get_rsc_table		= qcom_pas_tee_get_rsc_table,
-	.auth_and_reset		= qcom_pas_tee_auth_and_reset,
 	.prepare_and_auth_reset	= qcom_pas_tee_prepare_and_auth_reset,
 	.set_remote_state	= qcom_pas_tee_set_remote_state,
 	.shutdown		= qcom_pas_tee_shutdown,
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 030e4ba90812..b0f96e751167 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -855,7 +855,7 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	return ret ? ERR_PTR(ret) : tbl_ptr;
 }
 
-static int qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
+static int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
@@ -896,7 +896,7 @@ static int qcom_scm_pas_prepare_and_auth_reset(struct device *dev,
 	 * memory region and then invokes a call to TrustZone to authenticate.
 	 */
 	if (!ctx->use_tzmem)
-		return qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
+		return __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
 
 	/*
 	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
@@ -906,7 +906,7 @@ static int qcom_scm_pas_prepare_and_auth_reset(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
+	ret = __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
 	qcom_tzmem_shm_bridge_delete(handle);
 
 	return ret;
@@ -987,7 +987,6 @@ static struct qcom_pas_ops qcom_pas_ops_scm = {
 	.init_image		= qcom_scm_pas_init_image,
 	.mem_setup		= qcom_scm_pas_mem_setup,
 	.get_rsc_table		= qcom_scm_pas_get_rsc_table,
-	.auth_and_reset		= qcom_scm_pas_auth_and_reset,
 	.prepare_and_auth_reset	= qcom_scm_pas_prepare_and_auth_reset,
 	.set_remote_state	= qcom_scm_pas_set_remote_state,
 	.shutdown		= qcom_scm_pas_shutdown,
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index 458075868bf5..53b8d9631f22 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -48,7 +48,6 @@ struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
 					      void *input_rt, size_t input_rt_size,
 					      size_t *output_rt_size);
 int qcom_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
-int qcom_pas_auth_and_reset(u32 pas_id);
 int qcom_pas_prepare_and_auth_reset(struct qcom_pas_context *ctx);
 int qcom_pas_set_remote_state(u32 state, u32 pas_id);
 int qcom_pas_shutdown(u32 pas_id);
-- 
2.55.0


