Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27206606A8A4
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 16:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a3M3ekit;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KKVB/IqJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FusCC7Vk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=; b=a3M3ekit6+wWI/
	na9auG1AxDlLQm1ISwc4uSlCy8lz/poniZv/sFWD+6WaYcxLZVe5MasiUAnBrToUZ6srtyYgzwy5W
	2aPLK0Bc1tOcNS8CKTkA41JsVg3qZFHJuFPS6VKf6Y4odOeNSoVEtSssAnL6+ME18ha6tYaCVw/ms
	8Kr0P6XeDH8OWN6Tkobs3sMg0IzAR1TrubSncgnaHkttUhMKb+8qD7FCq4DsFf3NN/9EjbTMAB0cF
	2ZsBk6MHfY6BbYq0ymK7ceM8ZGvKxyKJCMfC28KKgi19+zclWk1b9IVyzmYBkrFvlN6WQ9wsK6qdq
	qLZ33d69j3hsV0A2zgCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzTa-00000003CAV-3iTh;
	Mon, 16 Nov 2026 16:22:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzTX-00000003C8n-0TeT
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 16:22:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIRCV451747
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 16:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZiJ2cGdx8A1
	D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=; b=KKVB/IqJmIHW43Y5iX/SbkcNv6M
	4wqpIJ0CiEte9tqfaDQrZ9zzJqnYBCXMghfBaExOruMjXJ8ySaPDeUAOikyeXHjA
	IDIh23CX+6N9Hv+dhZ9XUPvO9G+2D63QvC76GObIDhBkOXCjyJ7NW1Il6rL0i1gK
	et8Hi2v5ywKSBGtMzY/ChlxUx3+cmrJHZlDrf1LZubrqw1mnJ7X31N5/Lrr7zIUE
	YSTuEFj5Zes9LFQH/0eCVzIvvr+A/Lqhx4SlG8pg2z3t4ZKjG68W26dfQfbW8Eit
	IHcgJZ0bUc2vLc731T4bAv1gXUjt3SzEzSYm/1aVm+lW9kc+w4K+Nh4UR5w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y0m04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 16:22:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f479b9819so1942137eec.1
        for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 08:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846154; x=1795450954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
        b=FusCC7VkVw9HtrmP/3ma2CjUXDNscaxoS2fDNLLk5IMell+Km6nk6SpZSQA1hkKkoB
         o89TAH2eGidPEnFs6isARM2Wc1/nywPnioCay1MN4rkwgRYgaU/gIL3yGVlzPHzOFfpW
         EwQ7gm+YDm5S5RViWQEtEITZQpZ92ORm6AJQCM/qDWRZvSiN4dkelHJZDluJUiLOaFlu
         ZusB0ujwOwG8UtXq2Ti0zWd/C9zdwxPZ3/Au2CtVSMH+Ys1YXEqnWpUYJ04f4RBZHHgG
         U/YUDyS/f3OuaKCO6xradcV91sotJhOICNeB/9j/6538lH2hejXmSeonH3W/VuVkVK16
         0D6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846154; x=1795450954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
        b=RLVoUUYHraynlNYAF6nPoM1emOGoHDs1pRQ/F7rTnNoayT9IALBQteK+A2Pwnc9qS5
         qpM9q5bx+NiGpP9w+sm/FrEmzZczFau0WLZl5cCN7Hr6OsFvqnR2C7m9SnsNFttx2Et0
         kq6kaSF01sQ0xsBzzH+/Xz7FStvnzwUPDwQXjVf6n6Mu1pE12iSi6iQstFTbH/QNLYtf
         Iu43CEKqSYoDhPR/0ebVZbe7t8WRedfkH8Jrn2/5rMJwZAjGQxs7oiPhyDu09In/T4HV
         O9YUH0ehRO0A4a/2qLM6Rqc3v9mgXScxfEXHadTrmnaVC0BKepff8ZyMzJeeTI2iyvcD
         Hdpg==
X-Forwarded-Encrypted: i=1; AL+hErE7T6lVUz5iDgbmvOqCVUy8AZ5UIjYI1iQb7Q5xCedmZzDmePYh9wa5xUiZc2fNPKHG6wh0KlA=@lists.infradead.org
X-Gm-Message-State: APuU4Z8a9n4EWtz535WvaUU3D5FpL7/6/YUyhAKeWiyC55DnWixqBWJ2
	TXH+Q5s5vzK0kJyT45lzQYIE0XJ2XXu6/c4+Z7Ew6C0UcrFPmQAkdmLv1Bn4jp3jt+h0xNQyRZW
	786S1BDK0/D21/BJXyYRpi2BLV7IV/mps2XwjHMNJoXkxjWqUYzd+NUtN8IsSk3sq
X-Gm-Gg: AYBFou1FCdrxDbLWnrtjLJwkE4+4maTf1UmmMvpk8mHvIPcVANHctgaMMiByGatXSEl
	rvNPjhNtKoqcbXJJrGF6mTAmVbMwpTs22BPrz01UjgEkd6SsiVN4MENxqoptFUJgszLiemw+q4j
	hdcw4ZCssbZQkPE0bIAhxFEDV5a3N3tJrQVo5EsNGjYTQieX6TChY2umu2REVY0CixnOLvPRmhf
	MxJcgCATQ0VancAGFf1iJCKTKmFYP2f5qv3qHMl9/AKFS2i1phdcxizJLluzDl4NC6Ifa6A1LZO
	3QUEWCQeDQCRcoAuXV2fPB55PwsBq+gk0AuXjMQ0C/5qUU01wwenNjnwT1xA1K/PtumfG4xmxWM
	rYcrxPnPjggA8IPIBucFdVModgFClhoSCtqpeZLLXL0cSTwPjRfgLysq9s/yRb6CrjXoNjWuGo9
	3W
X-Received: by 2002:a05:701b:450d:20b0:149:49c:233 with SMTP id a92af1059eb24-1b5030bb598mr10533738c88.27.1794846153730;
        Mon, 16 Nov 2026 08:22:33 -0800 (PST)
X-Received: by 2002:a05:701b:450d:20b0:149:49c:233 with SMTP id a92af1059eb24-1b5030bb598mr10533694c88.27.1794846153043;
        Mon, 16 Nov 2026 08:22:33 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:32 -0800 (PST)
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
Subject: [PATCH v3 3/9] drm/msm/adreno: migrate zap shader loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:42 +0530
Message-ID: <20261116162148.2864501-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DdGlXTYEDx2saQsK81Du7mNugfVEGyGk
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afb2dca cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=zg618T-2U28-L6wfSYIA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: DdGlXTYEDx2saQsK81Du7mNugfVEGyGk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX69WP52Ar79Hb
 eGh2GF8KgEMfnY5EnTaAyFuI72QMkcDHZWZ1Rq/I8wcDO77IB5vacHCNFa4dMXcGOcMfj0Jk0BJ
 6MRacuE9lfdyEtnQKuubb8yZgG68Neo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX6Sxdt04xPa8G
 ZdI+NZgbxwhvsEVMHN3iUnTAhgoavOLsn/DGrOGbTxdiuhCiNaFKJ2+KZFbCtfsyqg+7qxoaDJP
 3LQelR7N1Z/KN/Dg0YsRjug4IytYcomEH5VVw4sLeef0Ns5gaVhm0xVqRxpW3uwhsjgMWjPV+EJ
 x3xEgxMWmkrP605c7malPsN+v+NIsjBYv3dgO0WLpVL7P8KSX6fEMnC9whj1hXJxFZyjpWF25QU
 Mu6UWxOoL/Po+CmsbNaAK3IZewI5/e3W6eYVgSLDyPba/8mCFh2XHCKp8flsVGH5yPbkf5EZMdE
 R/5UPYKKMWEBJKWVO+WschYs9qpz4KAKB0CrvX4XaZSUfGJQ3/fjwD6iFopxx0a83YgqemnbR5X
 s4kQMOcmz0vPoa2I2z3/aKH8VSS58xcnow7WB12CPBAk8eBZ3wm786q87TcUiLHNgWsiZT0EgBf
 1bN4ZGbvkpitZNEoTzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_082235_157824_DB1235CD 
X-CRM114-Status: GOOD (  22.41  )
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

zap_shader_load_mdt() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context.  zap_shader_load_mdt() also calls
qcom_pas_auth_and_reset() for TrustZone authentication, which is the
intended behaviour.  However, a new qcom_mdt_pas_load() has recently been
introduced that works with a PAS context and can handle everything
qcom_mdt_load() provides, along with additional functionality such as
shmbridge creation and retrieving memory from the shmbridge buffer when the
same remote processor needs to run while Linux runs at EL2.

Replace both with qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
using a stack-allocated struct qcom_pas_context initialized by
qcom_pas_context_init().  zap_shader_load_mdt() is guarded by a
'static bool loaded' flag so it only runs once; the stack allocation is
sufficient and avoids any heap overhead.  The manual memremap/memunmap
pair is removed because qcom_mdt_pas_load() handles memory mapping
internally.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 54f337475231..8e4aa8e22108 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -34,11 +34,11 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	struct device *dev = &gpu->pdev->dev;
 	const struct firmware *fw;
 	const char *signed_fwname = NULL;
+	struct qcom_pas_context ctx;
 	struct device_node *np;
 	struct resource r;
 	phys_addr_t mem_phys;
 	ssize_t mem_size;
-	void *mem_region = NULL;
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_ARCH_QCOM)) {
@@ -121,39 +121,32 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		goto out;
 	}
 
-	/* Allocate memory for the firmware image */
-	mem_region = memremap(mem_phys, mem_size,  MEMREMAP_WC);
-	if (!mem_region) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	qcom_pas_context_init(&ctx, dev, pasid, mem_phys, mem_size);
 
 	/*
 	 * Load the rest of the MDT
 	 *
 	 * Note that we could be dealing with two different paths, since
 	 * with upstream linux-firmware it would be in a qcom/ subdir..
-	 * adreno_request_fw() handles this, but qcom_mdt_load() does
+	 * adreno_request_fw() handles this, but qcom_mdt_pas_load() does
 	 * not.  But since we've already gotten through adreno_request_fw()
 	 * we know which of the two cases it is:
 	 */
 	if (signed_fwname || (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY)) {
-		ret = qcom_mdt_load(dev, fw, fwname, pasid,
-				mem_region, mem_phys, mem_size, NULL);
+		ret = qcom_mdt_pas_load(&ctx, fw, fwname, NULL);
 	} else {
 		char *newname;
 
 		newname = kasprintf(GFP_KERNEL, "qcom/%s", fwname);
 
-		ret = qcom_mdt_load(dev, fw, newname, pasid,
-				mem_region, mem_phys, mem_size, NULL);
+		ret = qcom_mdt_pas_load(&ctx, fw, newname, NULL);
 		kfree(newname);
 	}
 	if (ret)
 		goto out;
 
 	/* Send the image to the secure world */
-	ret = qcom_pas_auth_and_reset(pasid);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
 
 	/*
 	 * If the pas call returns -EOPNOTSUPP we assume that this target
@@ -165,9 +158,6 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		DRM_DEV_ERROR(dev, "Unable to authorize the image\n");
 
 out:
-	if (mem_region)
-		memunmap(mem_region);
-
 	release_firmware(fw);
 
 	return ret;
-- 
2.55.0


