Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BF0606A897
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 16:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OHDmacfJ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ImKUP3Xz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RepooE6B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=; b=OHDmacfJv4qDCz
	x9U755F8siQ1fw/roEiorGSuL2UTxPg2p0NCj5IoTMFGOcX6ZkUm2vmlmA9ukTRdkBjO4q2rJSoo9
	rMTjA8vpKcC5x7W+tn0zxFCkfmx77XnO89CDpj9mvbxOI1QcxLVMix6/O8GxYJiv8CzMID/0vQPdw
	3de34u4+s0QP09v8gN03V+PA0Qp+amlkUrkfqPm5978LtVEK3ER5V2qsjWQP2Yf+82GIKdFaKIOEi
	YTFwcq0yok8kZgFkVw/FesrEFJq84qk84wviFfGk3EiOGbFetLjlT/j0klVfxlcJhnvJn0/KsVGQx
	pDJsMJgwQaKkNT+N7AHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzTj-00000003CGg-47xx;
	Mon, 16 Nov 2026 16:22:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzTh-00000003CEW-0Wgr
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 16:22:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIJHD450657
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 16:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7/5IBT6uyH8
	wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=; b=ImKUP3XzzkcWGQBIHDld29kSpW1
	3G0uJ7xw4IKj6KnrhZDSfB9JFndd77V8uovcWSGwnRjYp6meXxZoJBI50ayEkCIh
	I330kLlI+/Ar3WA9eAymEYIX5A/kqaKYXMhTce83OnuGUbV62i7e5GZ7CKjqm7aK
	QF8Pn+N1ZojmqzzYyrfv/WTtBipZJUibUu/LVq72U5a0PnScjI1uzPbuh7NmL4o9
	B8ItKnCP9ocyMAghENDK6IwB1R6i4ADTkilLUnXEeH+jN+LYIeIb2Lc6KproX9NV
	2VR/aeYO4AzSy0m95rDre8ROZELsYzIzCRFwC+uWejLqZtliMUhFFFdJEew==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y0m1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 16:22:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso1204096c88.0
        for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 08:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846164; x=1795450964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
        b=RepooE6B2KBNgRmGrGHT4Eo+MRdfTHaEA0f+fMH3LsCdEl5DwHrlH91XSN+/hgTD46
         TfW/Ik2xcLosccvA80tZLaa9gojxHSYTj/qGH8aaAIXTB5ahMczMP2W3iC0tiZqlJKjz
         Viadw7x34fDXNNv5UtvSPg8Mld+gOIs4VR875IfOGhKb6a12WN+saFUzgNdOWdF0ObVc
         SH1mmV2EHoItiI/Q0ocOKw8dgUjw5plk1z4X9LOX+FjJAMkorX4y4hyzsGsI6dbmmUmf
         k6rTmim63H09Xv7N27dZm87KTdrF1H9o2sM1oXHGiWB+hMYSgOUlUwWH8ZDhjmuUBEIf
         hwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846164; x=1795450964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
        b=s+cEIxPcAJUXcW6mWEkY8xqtBuCzvfJV3rvM5K6LtjiskXFUlZQa/mR8vCvhUe2R/8
         RKJPKHjP0rCrO/Pcqyo4i1M9xpgHHGtaGYlOYDpUPig9+EjwmfZ7KEUTBMpazWmjct2S
         TGsuLxbrY8q5Wnuzq6WttOA2I0kg/5r6aV6myCUfsg3avw7/BUqwflznNZEiyWZHa3TK
         O677Z3ch3XfAvdV//O0f2jFe9oNx8L/W7zsW5LhImmVEXzrExBV+mIVV1oRtl3lcdA6p
         +zNIIXSz5KqJPBH2x/rBK5OhNgRvRczNRxFzBtkmR3s5TPk7XYjN1MvzhEg+GFnbReRH
         RVnQ==
X-Forwarded-Encrypted: i=1; AL+hErH59oYzHhEmn+92RmBOErUUYKzYTAcCRczUwTsDWpwT074QsN9bzBXxm5FqaPeilupGn9KP3/0=@lists.infradead.org
X-Gm-Message-State: APuU4Z//g43AHSOwi1XkXxnneF/lOhTtD5sRELipyH7uws5bFXv/HGL9
	qWy/nq+8e+td089AFHlHxCWzXREppBLo73pR1rRN90VXTU3doUDlrBGcstbS7jWzYDXvqdDR5vk
	12OPd28KaxtVMxDTwsNjGQntr2082NUybcp2OiX0OYWVvjxW/JAMhky1UH0Pc9LIk
X-Gm-Gg: AYBFou18aocwVBtX4yZpS42nRbAEqi3G7yRAlKCXhRYdoBfw5J/ZhEo8cja4qWGFy+y
	Er/z71PF4G9mep4U5jqKNdnpN7XppJJJgi5Y64O8qcHhOH96Ci5LDouco7P04Wj0mF1jfcdirz7
	R0E3qtOYmg1XrjUDD4B8cIpzgHv55T7wciic5wwpiIetEqyq1FA6TdNd3QHbx1JLtufAPLq02Kl
	stF1SEjBJx7oYtRVCrarGdOWuwwXjBPoRw5BTtqzD0zlvhMpOYVjbUckLHt3JVdSr7EIyhHXig+
	2i2WlbhF7YAJnywsZ6hHxqGN7NG/jSnNvOl/HxVPGH6gIION63DPmWamHTciCX89izV/0Oxb+NQ
	HYp+pu2BiUMOOfDli4KDcVDOC1eOUk/mEeZFvuWSyloVg+4u36Bl+1GyWf+MMBFsuTbR/nfXGlC
	zT
X-Received: by 2002:a05:7022:2594:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5030ad1d8mr12473131c88.21.1794846163613;
        Mon, 16 Nov 2026 08:22:43 -0800 (PST)
X-Received: by 2002:a05:7022:2594:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5030ad1d8mr12473081c88.21.1794846163018;
        Mon, 16 Nov 2026 08:22:43 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:42 -0800 (PST)
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
Subject: [PATCH v3 4/9] media: iris: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:43 +0530
Message-ID: <20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cuiOJgwpKzofSe5PuVTSTdyaip1OFI6i
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afb2dd4 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=0taKFLn-hLWpjNWZEgwA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: cuiOJgwpKzofSe5PuVTSTdyaip1OFI6i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX9hqOl/8rFf8V
 9pONdrqB1Yil73bT/hhc17AGvRsl693Uv0TLW6SjfTDgdic/HpdTChUCJflh8FrZN5LZ31GiJYk
 he1RvYJSNT+qJzv2vGZ3erkyWOoshEc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXyyriABrud4Mu
 hngHci305cqjkaZILWon7iQ2IfRmYnmNEC8UYo9QWye6ir08MtOEc5BsMQPq2k6TniJHgoUBgsW
 rfDJZUAWXRoRKTzNP7LkGmFvs0HdWgnRzOW6/Zjdsib2l5TnYJd/RtVbMHm6DoCbAv3p3BGeRu5
 yFBzsz/8zry831itW3bMl4X4WZH8v7FLBvu6SibtJMoebV8QbHjTEELo9jLeXpApMnQJpSofOLp
 A5+jXD7gwrfPOMG3FFOKqy1hDB9L0QXQAwHNEQnKpuZ1t8oxgG0qTOQnIHRqOnPc8j4pwz6CtAD
 CmEMMJ9FIMNG0Eaxe0JKf/KLGmcOBEzRoj6RMPiKo2okPyndvliTcwzxA+uP9DBPoiZ2GZTjLlV
 DLvrZpv4NnsD3rxdRdQAqZ8DXZkVPAhaIHFHL2xGIzcX3llBLqh3EsknwVQeW4gSowpGG56SZn6
 plfvyiQL3sWNxMtN8xg==
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
X-CRM114-CacheID: sfid-20261116_082245_188679_D25F6D61 
X-CRM114-Status: GOOD (  19.69  )
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

iris_load_fw_to_memory() calls qcom_mdt_load(), which bundles
metadata initialization, memory setup, and segment loading into a
single API that does not expose a PAS context.  iris_fw_load()
calls qcom_pas_auth_and_reset() for TrustZone authentication,
which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with
a PAS context and can handle everything qcom_mdt_load() provides,
along with additional functionality such as shmbridge creation
and retrieving memory from the shmbridge buffer when the same
remote processor needs to run while Linux runs at EL2.

Embed a struct qcom_pas_context directly in struct iris_core and
initialize it with qcom_pas_context_init() inside
iris_load_fw_to_memory() on each call.  Replace qcom_mdt_load()
with qcom_mdt_pas_load() and replace qcom_pas_auth_and_reset()
with qcom_pas_prepare_and_auth_reset().  The
iris_detect_firmware() scan retains a separate memremap window
after qcom_mdt_pas_load() completes, since it needs to read back
the loaded image data.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
 .../media/platform/qcom/iris/iris_firmware.c  | 27 +++++++++----------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 3e4cf652bf39..ac73bda072f8 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_domain.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <media/v4l2-device.h>
 
 #include "iris_hfi_common.h"
@@ -129,6 +130,7 @@ struct iris_core {
 	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
 	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
 	struct dma_iova_state			*iova_state;
+	struct qcom_pas_context			pas_ctx;
 };
 
 int iris_core_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 21f57d37da18..b701a7f43514 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -201,21 +201,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 		goto err_release_fw;
 	}
 
-	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
-	if (!mem_virt) {
-		ret = -ENOMEM;
-		goto err_release_fw;
-	}
-
-	memset(mem_virt, 0, res_size);
-
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
+	qcom_pas_context_init(&core->pas_ctx, dev, IRIS_PAS_ID, mem_phys,
+			      res_size);
+
+	ret = qcom_mdt_pas_load(&core->pas_ctx, firmware, fw_name, NULL);
+	if (!ret) {
+		mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
+		if (!mem_virt) {
+			ret = -ENOMEM;
+			goto err_release_fw;
+		}
 
-	if (!ret)
 		iris_detect_firmware(core, fw_name, mem_virt, res_size, desc);
-
-	memunmap(mem_virt);
+		memunmap(mem_virt);
+	}
 err_release_fw:
 	release_firmware(firmware);
 
@@ -233,7 +232,7 @@ int iris_fw_load(struct iris_core *core)
 		return ret;
 	}
 
-	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
+	ret = qcom_pas_prepare_and_auth_reset(&core->pas_ctx);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
 		return ret;
-- 
2.55.0


