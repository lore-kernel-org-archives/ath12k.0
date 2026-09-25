Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFDCC98325
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 15:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySc0a6RXUPc52wNB5/s9LfTmLDyBrV82ex9cPFNjiSc=; b=pSq1xfHwYbgX/sowaj//2F81DE
	/kUFYFWX2tETup0y+Aagzm6Gzi1YSbHvavaiu58JLKr7HWObXgISx3m0JhpxTCbDQBzyzXYra1e9r
	jBp418NP6vJ7L/moU8YzLH6Sv91AFYKzGKFWpRiKWyNU2y1bsx7979l2a+Ct60PpBTe9mL5yVHVYd
	0An0UlcniE3WRAVaQKWsTVShbhIxwSQ6lv0WdkwBTS8rmthMPttlnqOYIqAwCBaVANrzQWUMWtLwx
	WwwZa0B9uKUSPy+fwXxeJHi2dNgCOtk6lp/4H1qWu76peZQeghDo7gcNBhIr3JaFs65niZlcZRWD0
	Rc1OQBIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8Jl-0000000DsWj-2ePf;
	Fri, 25 Sep 2026 15:58:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8Jj-0000000DsVe-1Dyz
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 15:58:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PD4gJx208403
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ySc0a6RXUPc
	52wNB5/s9LfTmLDyBrV82ex9cPFNjiSc=; b=bxg0wKFsHNjDYHIiEqmTvQWvwMV
	5Nifc4KXUahwyZDMhJ/Uuv5GKjp8sFZ8QKLFvqvDfE4Jr6/hNahGwU4YFgOgkcJL
	RmHMUOfwVKkFGKgiVKweDgJ6OGD6x3Wxb/PlEvoB9uEGmlJ7FU/UtNjegP9Bmxu8
	TANC9W6tQ+pigu6YmdqkRDDgAUrCwATF1hLkBu+CeP+CwZ6CmL0bDzxqLJGrAv6b
	teICyY4UVEPGmxSLnAjq/s6PUZ52w/fcExzJie8VlICxt7Vtmiebx+VtmrN1XiPH
	3hYl6njSsDCk4We8i6S+Q1t0x3tzNMkcQ4YvwE0eG0EmKym71sZBEd8euvw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898v8h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:58:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86917d18a02so947789b3a.1
        for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 08:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351910; x=1790956710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySc0a6RXUPc52wNB5/s9LfTmLDyBrV82ex9cPFNjiSc=;
        b=eSU0i0IWn27l0b3PXdG3m0j7V1S4bMn5MwifGx5XAAvJ4YompvaExnaV8Qy26tor5E
         bukixQIY2eX7rgE2Q5swa01A/PEMadrKl8rG6mV+7kM1ddI1FlVVOobLlOjBfsj55/Lb
         qshGL+k3/9xE2DQYtrwBHsH01FBKAY+2tPVfhK8Q5o020Ww6BwnHokrJD1feoAs81RZK
         17A3qnDWRBRkJgKJ21Gf40O9ZrdbuSN/3hDrxukpS+KKeHt2wHiQNif/+t+bhBDNV5+b
         dqPLdL6NoA+OhoZdBneKtyPDFU3CXlcyrwG0G2YjNlHwE2jrfmO0svCpOkjFbYiXYqKZ
         0L7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351910; x=1790956710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ySc0a6RXUPc52wNB5/s9LfTmLDyBrV82ex9cPFNjiSc=;
        b=n7oSkMfU3SYBMres9c47+hTvGxdPyPWN57wLQFQd9rYUYI4MbyxVbREbHNJC36q/AW
         hKOK2llpwIdVwjVYkq958aEslz1x56DOIy6tNFcQQxQt8Tg95GefSbgpRqTUCrB8hv8b
         FHOcdcyROLuqYwRTnPBgk0XCeQ/vEsF9OzFH42t8/NsbHvwK4fAHn7G/wDHw968xHqMd
         QLhYPixt//QFnvYDy/qjNgkwljuzcFv2ewxdc1BM2RfYVpXN1SKIfcX7YPCya9F4WTpA
         SeQA2sTYs8G+SzDou4kqhobPV5iMtXiQkpC+oeL/JGJOpNQCPGuB2M1qHEeffXZ/oboB
         SSHA==
X-Forwarded-Encrypted: i=1; AKwUvBwRKBFQVZjKwpVOzkuWxDNLd7Kzh3iY8TBhMF00vAZLPLO3LnPBv5BYeBauLxfxsxvmn0XyiOE=@lists.infradead.org
X-Gm-Message-State: AFuF++mwMN8Al0huMKmaR2yBvZTBeRQPgeGhp140JXQ7jGb+qgn81XAL
	5JOdQyGBRa1+u1vg5aLbIjByPMKLgr6fjqMb7AQ7vfB3mtS5Ug7nnvQ23VdNOqdyJv5JgCmi/id
	GAutXpUcf+a+xaA3FdakhvE9E2XxJoUjV+eUQPWHT1GzMKmTQUSYJppd3hj0aIpM4
X-Gm-Gg: AYBFou2gFEBbqOsgPIogItRvFYBJBaCSA/FPjcB3qT06ZhrlQirqvZBmK21xc1soTzM
	8YPtt9+vW7aiET3zWXi43TCxOVazEK3xym3rwiZmZJSU0PH7PDUpmlXRkyYF/4pYQBWHapxDo3a
	yRIYyRk2bGAZwxk5ilybUvXHEmvSjz+g74OY0p2yUWWP5gIxVh4jWvJ4pSq7G/5BQcWjCapbFiw
	R88JsdhsM2De/hSx8HLubOCb3fwIaB14KjvrjPMvPYklCrMmzOosiMG6v+qlm+vUxzKh8vDL6Kc
	5hh4n7Pxji3HQJ7Wkg40hw2R6+fIB4srblf7CnXCHa1q1+ndxsg6SbBKFj4xNx3ndCspdrYnY2z
	pVwgi1rs30maZ1OYgp2+IxKnE47o=
X-Received: by 2002:a05:6a00:3d4c:b0:86b:b06a:d3ad with SMTP id d2e1a72fcca58-87e99568559mr5209974b3a.23.1790351909933;
        Fri, 25 Sep 2026 08:58:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d4c:b0:86b:b06a:d3ad with SMTP id d2e1a72fcca58-87e99568559mr5209932b3a.23.1790351909300;
        Fri, 25 Sep 2026 08:58:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:58:28 -0700 (PDT)
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
Subject: [PATCH 3/8] media: iris: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Fri, 25 Sep 2026 21:27:32 +0530
Message-ID: <20260925155737.4161358-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX5A8OFZ7xo17M
 wYiprq7pJWEXQ0CXebYcRkpQUkyTE46Nl+VJEYzGsztUAKlIZH0aeCKsRCki2a39nkYzED/vAQR
 V97e+huFSz0hYCFi6Myi167peYS9lDxZMSiePdHF2XygCAk1eoaflNrZw07zlji7tERRDs4Y5C/
 Undvja0XXEa5JlzrnF5QVReo/4GP68h4iTGmwE2h7DLxlWZUVHs2frIHAK4tvQBVzgw6ebekNk5
 8EorqZbse4DAwEcNRhSiSkn5r00UxWnuXF362vUQoFXPs+pug0eCud2r6Blf2Hu+UjQJgZTP+l1
 Mhgp3XZ0uZ6TL3sIFCGIVd0VShBlxE4XfgAmzAvsIBLrDv4849YwAx6Et4p/HiJyfEqyE62hjFr
 PitpdzJB0W0DnYFrqxYWrkdfbptA21iPWq788z71F+MIUh0vhM5XSHa8Uf544QwGrcuqMXIi0fn
 hTuda3TUflhcOyVstxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX93K48iMRjPM2
 AmIQRsuBRZaliv1PlVH1HI3fdxrhwsFQ/944ymas4ruRBerWvbUsT/WyIJM0l6slFHOCSfswztr
 mdw28Cnr+XfoIzwWsnOx04ONbDPDYz4=
X-Proofpoint-GUID: N5e0eShdTi3XdqIL4oig6gIF89BykTFx
X-Proofpoint-ORIG-GUID: N5e0eShdTi3XdqIL4oig6gIF89BykTFx
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab69a26 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Wu4PtPgZBy_53pNpwMMA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_085831_334926_98A447A3 
X-CRM114-Status: GOOD (  17.63  )
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

iris_load_fw_to_memory() calls qcom_mdt_load() which bundles metadata
init, memory setup, and segment loading with no PAS context, and
iris_fw_load() calls qcom_pas_auth_and_reset() which skips the shmbridge
prepare step required before TrustZone authentication.

Since the auth call is in a different function from where the PAS context
is allocated, add a pas_ctx pointer to struct iris_core so it can be
threaded between the two call sites.  Replace qcom_mdt_load() with
devm_qcom_pas_context_alloc() and qcom_mdt_pas_load() in
iris_load_fw_to_memory(), storing the context in core->pas_ctx, then
pass it to qcom_pas_prepare_and_auth_reset() in iris_fw_load().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
 .../media/platform/qcom/iris/iris_firmware.c  | 20 ++++++++-----------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 24da60448cf2..68e6adcc1dfd 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 #include <linux/pm_domain.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <media/v4l2-device.h>
 
 #include "iris_hfi_common.h"
@@ -123,6 +124,7 @@ struct iris_core {
 	/* encoder and decoder have overlapping caps, so two different arrays are required */
 	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
 	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
+	struct qcom_pas_context			*pas_ctx;
 };
 
 int iris_core_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 21cdf1c39835..e73a5dd98b88 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -115,9 +115,7 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 	struct resource res;
 	phys_addr_t mem_phys;
 	const char *fw_name;
-	size_t res_size;
 	ssize_t fw_size;
-	void *mem_virt;
 	int ret;
 
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
@@ -125,7 +123,6 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 		return ret;
 
 	mem_phys = res.start;
-	res_size = resource_size(&res);
 
 	firmware = iris_detect_firmware(core, &fw_name);
 	if (IS_ERR(firmware))
@@ -134,21 +131,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
 
 	fw_size = qcom_mdt_get_size(firmware);
-	if (fw_size < 0 || res_size < (size_t)fw_size) {
+	if (fw_size < 0 || resource_size(&res) < (size_t)fw_size) {
 		ret = -EINVAL;
 		goto err_release_fw;
 	}
 
-	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
-	if (!mem_virt) {
-		ret = -ENOMEM;
+	core->pas_ctx = devm_qcom_pas_context_alloc(dev, IRIS_PAS_ID, mem_phys,
+						    resource_size(&res));
+	if (IS_ERR(core->pas_ctx)) {
+		ret = PTR_ERR(core->pas_ctx);
+		core->pas_ctx = NULL;
 		goto err_release_fw;
 	}
 
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
-
-	memunmap(mem_virt);
+	ret = qcom_mdt_pas_load(core->pas_ctx, firmware, fw_name, NULL);
 err_release_fw:
 	release_firmware(firmware);
 
@@ -166,7 +162,7 @@ int iris_fw_load(struct iris_core *core)
 		return ret;
 	}
 
-	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
+	ret = qcom_pas_prepare_and_auth_reset(core->pas_ctx);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
 		return ret;
-- 
2.55.0


