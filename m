Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7230C98325
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 15:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwWgdkmodUkwOcTt4ODaG1IRCHTJP6TRQlF7VVlOptQ=; b=U29XdNUqeIg+pYwO2DtwXh6ccR
	5mQsVhV41I0wrDhpSTq9ofqx7h5YAnKEDJQDw9rxF2nywcJNgRigdwKc2r9JeBfYEXGGZoqkDgqaK
	Gv2I28tgw54k9isu1IQl1qrOuV0yGaDPieBRykawR1LPSrsPB/fqn571MB6qhNRVVBC+c1r6XhMRC
	XS/8XrMVFVzp6y+s7He8zBBVLCZCg/lsvMiGqBqqyNTD7YcfYm9P00vGoOted4u1q2mNuzXHvWiwe
	zyJP/mFOvPcbTjiDz2fvPauyNRzGaw7QXoEV1EppI7PWk6WXI/YGopAsqSeVyOdmom2pM7OUgz+m1
	GafgJFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8Jb-0000000DsRW-1oiE;
	Fri, 25 Sep 2026 15:58:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8JZ-0000000DsQZ-0GjG
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 15:58:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PFI5hO2555412
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EwWgdkmodUk
	wOcTt4ODaG1IRCHTJP6TRQlF7VVlOptQ=; b=RTrbhiXuprnEVvEXgCWrKWWbex9
	R2dTkucVuZzBnUe2kXl8Lru+KAJbJZt3UmL5bMjOmVHV9DUncg9b08tjjSa7QeaF
	Zcjfsj2Zmr+nq78ZOSGeYux5mr1J4exjxqtBGB0Z5MFxsNyYFsVlLUoomocIS8/W
	8zyu5t7eYDSLsLQPJ/8PBBdmeTkSs0x/OTLk2d5xLd1HEeKJI8S9Vc4XB7FrZvRd
	IjNITOrBSM0Lz8HUn4b+no7WADJnIFF0ctwxX2ATacLc61n+tRdi750Hkb6aBHZ2
	UWmv/z38bEWIeIhWoRCRsgTHAleAJcuDW/7kncTEmSI+K9uGwP815oJCcsg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwufk058h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:58:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so1100078a12.2
        for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 08:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351900; x=1790956700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EwWgdkmodUkwOcTt4ODaG1IRCHTJP6TRQlF7VVlOptQ=;
        b=QQbszzEqfgxwTacF1ez69MrENQNmclsUsTp2yUa+qlbapRdNKkEE4j/aRezO1oRDwf
         GRJuMih6F2rrAkg5fvsmbCt3leEU+O3LX2QCeY7wx5VDtYga5malVJpTehwwDbHGKxjm
         R67+b/2zY6Uq4NZqEPNvDpGZGnBz8QTr8PsA8PRoBDoAXLdJOvWgVijYig428XkuLR3b
         aYfT5XFOZaXq9f99eNNUFzPlkEZKKSe+sI8OMx9iJUS6b5Ys/vGzx3pIFmIapL4b7hqq
         Cpxa1O8zIYyLwJA9whCQYchgOKX1ZN8gw928iD3LaeuR+w4FsCa5uiH0ppA6PWU9MTsB
         kSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351900; x=1790956700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EwWgdkmodUkwOcTt4ODaG1IRCHTJP6TRQlF7VVlOptQ=;
        b=mpBshOWNUlH1LMtpT0BUDYI8wDxuOYyAONeYg3raekeybHErOJl4TBvmKPxiQIUqYH
         LwrOAxq9gM3vefxyT/aCr9dRC1SeImvx5QqPpqP+CR+JXX5rHyKzHnR/5pq20K2rDwvC
         PrKgVJO49JENRY0fpEYEVh6Cytb9RyIR8uL6otnL8E8vg2xH2xj9glSqSeuWaqHlQmaX
         5nzX44re3mPdCc9Kq3qC1kY49s4o3SZ6WfYDGxrPCpazkZPeWe3zvzC4aZmWtsxJVV5v
         DFcM6IJi5RJmc4CYXzdXuUrwtnt4jEJ37XMKSMAxhzO5NYIYpMqP6Lkw66cbLYHsXAEi
         mTOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmfpobbx+f5kYrcB22wrahcwofVUIYbNvl9MVT261KJVEMuE+9TTOBszzpMHWUiDaEEBMnzKA=@lists.infradead.org
X-Gm-Message-State: AFuF++mB3yV9kCgcasYwp6oOaZy2rNstaiIQqxV7yKgzHIUZHGqlQcRz
	GSnQEyFRloUuCP8Vb1ZKdeR1k0xf9Q2IeTn2jSlhkQ42GQ95WWXZRweE3ZFogyA9wiQnJwM/Rez
	Iizg4XRPN1pikBxpgnQ6xOcQS53pbZb7UMkFcq9iRsAnmUHKQDqiZrd365/k64d70
X-Gm-Gg: AYBFou3fQaoKfKH+N5cdmK9ixtZuepBBSfLAaHCZFRLOERKwo8FXnCtQSok/7WkFLlc
	IkwISJZ6PMZTFB0kzPtM05y55Ljyh+v1pKmSxIjcKH5TaLOFnLNHjeZoeGs+nkCS1zly4SzB+n8
	Tm5pQFk5XDXq0mSMhJGwSjpEBIqqKw/Kr6UCBNAv2s7No37Gv1Vt8TLMbivuWMnds1u05vgHA21
	w3oDM7BX0Mkn1wCIFfU599DDc1esneLCunXHLoe6+cONkELK54VeKnvye58o/HXaU77Jh8/IY+Z
	k2/FbGmVX4DVMgX8RhjXyAXwt12DWc2VtsGHsTLyIBgEdAFUDO3KJcPz2WXO9L4F1QqbRM0/qCN
	2Iw0/0ZKN9Xvj4nDhNgFm3DqIWlo=
X-Received: by 2002:a05:6a21:7484:b0:3dd:cc61:c0df with SMTP id adf61e73a8af0-3de26c83b92mr2661229637.25.1790351899744;
        Fri, 25 Sep 2026 08:58:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:7484:b0:3dd:cc61:c0df with SMTP id adf61e73a8af0-3de26c83b92mr2661193637.25.1790351899240;
        Fri, 25 Sep 2026 08:58:19 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:58:15 -0700 (PDT)
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
Subject: [PATCH 2/8] drm/msm/adreno: migrate zap shader loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Fri, 25 Sep 2026 21:27:31 +0530
Message-ID: <20260925155737.4161358-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dxu_GolL9tVSPpMJ9WDGvrM1kXG09y82
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX/aPx7PD9rKIW
 uCtS/0vHq5jLcDDx1wbUWf6FsQztazv7H7hDEnj1TCE/NgeqwvIcwy7gV+bRzIaTeJmb7z+pQzk
 n5SFApaXPc9VUo55d6lxZsRd3P3bKKQ=
X-Proofpoint-ORIG-GUID: dxu_GolL9tVSPpMJ9WDGvrM1kXG09y82
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX8HJrI4ELz4yt
 JRWTS3XgDH6vs08+I73x4k/bO4csgEuZ7mWaM8bzBOONNYYEpO2d7wFmRU18bFoCFyZ71MiyV3Z
 8f88CcsVxGQ/S405k5VNZRnAE9L9hld/B8J43Li4FW4WdkjxKk5UYeK9j2O3b0A1szyw8V6EMEA
 C+rlGiRmUrr8F0JhNQUVbmiztXdF06e8kcdVSag4wteh51k/+G8uL7AHV613u1SBCHxX3J0EAaR
 VntkQ9NInSnYAf7/RD1lR0KWhp/M3N9oGr+ED170UQjKIQwNA9eQvsTvKgfXe1jrZBvjjvwKpDu
 ARedrD5dVfI8TLvB8WH5oP1t/l8m7uH+Tpq811xeYzWxxh6AAoeak2wAV79zRtie9TFpsI7sLcS
 vOiSQ//cuDutwTodrRAJTooS4rCX7p2/tRXZK9gZ+Dhy8kgu7EETVA5uEh91cDCfTkRWeurMZr6
 gRO7Or5/my5ptn1nD2w==
X-Authority-Analysis: v=2.4 cv=B+wsQ+tM c=1 sm=1 tr=0 ts=6ab69a1c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=heNUI75aw_s-mFou8AwA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_085821_109069_DF84C4D1 
X-CRM114-Status: GOOD (  19.06  )
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

zap_shader_load_mdt() uses qcom_mdt_load() which bundles metadata init,
memory setup, and segment loading but exposes no PAS context, and then
calls qcom_pas_auth_and_reset() which skips the shmbridge prepare step
required before TrustZone authentication.

Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence
with devm_qcom_pas_context_alloc() and qcom_mdt_pas_load(), then pass
the same context to qcom_pas_prepare_and_auth_reset().  The -EOPNOTSUPP
handling for targets without zap shader support is preserved.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 5832dc25d6bf..d3e843220b73 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -34,11 +34,11 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	struct device *dev = &gpu->pdev->dev;
 	const struct firmware *fw;
 	const char *signed_fwname = NULL;
+	struct qcom_pas_context *ctx;
 	struct device_node *np;
 	struct resource r;
 	phys_addr_t mem_phys;
 	ssize_t mem_size;
-	void *mem_region = NULL;
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_ARCH_QCOM)) {
@@ -122,9 +122,9 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	}
 
 	/* Allocate memory for the firmware image */
-	mem_region = memremap(mem_phys, mem_size,  MEMREMAP_WC);
-	if (!mem_region) {
-		ret = -ENOMEM;
+	ctx = devm_qcom_pas_context_alloc(dev, pasid, mem_phys, resource_size(&r));
+	if (IS_ERR(ctx)) {
+		ret = PTR_ERR(ctx);
 		goto out;
 	}
 
@@ -133,27 +133,25 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
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
+		ret = qcom_mdt_pas_load(ctx, fw, fwname, NULL);
 	} else {
 		char *newname;
 
 		newname = kasprintf(GFP_KERNEL, "qcom/%s", fwname);
 
-		ret = qcom_mdt_load(dev, fw, newname, pasid,
-				mem_region, mem_phys, mem_size, NULL);
+		ret = qcom_mdt_pas_load(ctx, fw, newname, NULL);
 		kfree(newname);
 	}
 	if (ret)
 		goto out;
 
 	/* Send the image to the secure world */
-	ret = qcom_pas_auth_and_reset(pasid);
+	ret = qcom_pas_prepare_and_auth_reset(ctx);
 
 	/*
 	 * If the pas call returns -EOPNOTSUPP we assume that this target
@@ -165,9 +163,6 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		DRM_DEV_ERROR(dev, "Unable to authorize the image\n");
 
 out:
-	if (mem_region)
-		memunmap(mem_region);
-
 	release_firmware(fw);
 
 	return ret;
-- 
2.55.0


