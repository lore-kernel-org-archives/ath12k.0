Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FB1606A880
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 18:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r/7fHehP;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=chlWtNlF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H6FoGS5r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=; b=r/7fHehPLvmoFm
	BCVzS8prOQLDS3dbEw+3X9B5a3J6Hyklq5s6DsJjJsam5EBs/u6WSdCmnQjtlEF8OtP6Z2aWB5Do+
	NmyuSqu2nlxnGzYiQ4mBvFrJ6m7YMi8jytLlGR4k4CoOFPUwP76qEaCSUtC29MAtnEpzFno4Q7kJX
	OL/zCtIVZgKD/IPgGw4n7TIvk4dSFqKhM8caY50gyRtF9ajp/fqZaQ3joGtBzdQ+uq8ruKti+/IJm
	q+BIvh+hU7eAIQCT7FJWviderxLoppUlLyo5KPLQPbmZ7/vvoO4ZVhgKiJYXD9fWhag9Iz8Y0y5QQ
	vhIebBgFhJTTk9i5tmLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwPY-0000000E1Kx-1C3R;
	Fri, 13 Nov 2026 18:54:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwPI-0000000E1D2-2VEg
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 18:54:00 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR5wa737244
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 18:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7/5IBT6uyH8
	wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=; b=chlWtNlFOsXFLmcefZtYaJNjW5x
	vy4O8EZdPf0zimj6RIz1A1D7MSx6iXjy7hDhXUfl/ad8fAVY2g3nyKLdbIsD/VO0
	fTeyNigeR9xlG2JaYFW3w5mG0fTreYlRb6BR27cUseLWXV8LlCIRgxiKYXva/twy
	xHBqPV6C+MiphHXqXgYfN/lr8EHponBTaA+2nxafx9I/h7OBHHbCxZfFSNyo8qi7
	HNGuwmxpZlhyr56WCuFDE9sBAmtjLV+/GacKnuXMQKi7vllonn0MUvQk7Tic9BLV
	gYqZb/a+S8yUTIGpcPVtN5NgfYidUal/f/dgNlvOCH0PEMi2kX7b8SQbfOQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37jvdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 18:53:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1618682eec.0
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 10:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596031; x=1795200831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
        b=H6FoGS5r1WlM/32mWB3DBUojMv70aBwzHmItZCnGUWWujqCtHQ4yyIaWcFk8sRSBBO
         iRuR+h+y7yNwe+Y20UZ8ck2mtdpeA9IYCSUucXu3oRl1Z0BgDXlulnB12y8RKjgomppf
         qWmokiM3cS8yRJ9Wlo70xMqlZ+Pd3f2dIrXxcaoUvEPaBOfo8PDbwgS/xfVCPXkB1tfN
         kOvA4Hx6CB9ahd5ON9a+TGoiBOaJYTwW9Jaz2ObrU0HF5GvrlR8s7QSYHnxsNUef+Wox
         iP9BTMe2PCTE27NHJo+v6ihCiMZGF23sQnIzNHYQP6xyrDJWGRdoKIktnZ2WPSO6IrIb
         wbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596031; x=1795200831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
        b=lZJzIU/+y+jz9dciVY1BWLQYekigZMNAeXFAhm2/f+ck3c1KJS4aDzL9kBItiU4pkH
         mIiatWelDKajtSYRCuWZe8bsE980kUFCT6y441jDWZqsUmZjPlA55t0lwfMadafpxICM
         1Nx7s5xBv+rVB39IVTRdvWRFqLRaBW25ab43MIJ/f9barD5lfrXyRvYqzhYG8qKIUqDe
         xtBC+vKONXHP6MxNKLuW4y7T1euPOylFK5gzv39KCb1KitOt0qWo8e1p7tokGcpHDJFc
         F1HXt53k7K2lgCyNIDfR0HgNjuvlS2YP6q6jsGYrF9TZrIibttw/xDMkfyIpOD7IQGmq
         kCZw==
X-Forwarded-Encrypted: i=1; AL+hErFl6XWdbF/xHmt+L8pd8Bf+dpX2IVK50W/GACIMaYDNk0HUix0L6OIzPKRMoCF8aeQdZ54c9HY=@lists.infradead.org
X-Gm-Message-State: APuU4Z/O5pH0zUZ2KXLa7R9UamQhSeQxdMGAHptwrlxRWkpskwYEjLwR
	fxO940Su9BSIw/Tt6B+RHNW3VQbm7cHHs639B05v9nzg6Un95MLSzjeBR0oEQypPfdUjpqxQo4A
	JtW0IhUR6uc9HjRU3ufhBrsXsioH+fQvEGAbvYkhfAqnh4onZa1v1OYYGeN1OWtcO
X-Gm-Gg: AYBFou1Vbtie+8uCLcYVaBJ73n6wqW0ZGQoHJrEqE8uMhkXaIJbqT9aKHl+92pjAdfz
	+DXMB99NqEnP5vKqDT23xXhOTkczC+vhXYV6OGpB/3bTH8xBG4qz0y14jegDJlUWF5b0QiMs2ZU
	bp8ctz1eU5jvlQVbzIvnKEjxaJSAAtPJKbv/E32bL/1rjiD06e5UzvdH8Tybu03bq8L009x78Je
	myT5323ap/jbn2zgRUSlj8muz7qpWkWZyg1Ccag1bxc3appvnCwK26YW+9B7ujKAyUpAXEztlQh
	bo7BH3G8k2qhjn3J1DFlSo7TuIuhDjycAL0uvjoPs7CAmigiB5QKR3ePynlDtY0BkY46yDsEKat
	S4vQw0FJC4Ho0CcstOKaD9XqCz6wM8FwE9okS6xYga+KmvLmXXjIFSQHOpm0jd55DSVuW2Rk8Gm
	E=
X-Received: by 2002:a05:7300:c00f:10b0:361:1dd6:531b with SMTP id 5a478bee46e88-37967600b2fmr3108362eec.26.1794596030286;
        Fri, 13 Nov 2026 10:53:50 -0800 (PST)
X-Received: by 2002:a05:7300:c00f:10b0:361:1dd6:531b with SMTP id 5a478bee46e88-37967600b2fmr3108341eec.26.1794596029602;
        Fri, 13 Nov 2026 10:53:49 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:49 -0800 (PST)
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
Subject: [PATCH v2 4/9] media: iris: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:04 +0530
Message-ID: <20261113185009.157893-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX29beRdzCRg6K
 st4iZLeFULKjjiJzGyG+4vVlmYQWHjOvjdXsjqKMMSGoviF3xGSHonLN789mp6m6KsxgR5z11UB
 D9IGn3vMB6Bp2Z++illYBmwXvbumBOU=
X-Proofpoint-ORIG-GUID: KbueFvMuWnd03I3QB1-QIVo3tZ6_-uar
X-Proofpoint-GUID: KbueFvMuWnd03I3QB1-QIVo3tZ6_-uar
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX6bHtAqyY2v0I
 wmBQ+izZoDK7IBZuN5XrkG2NLs3J/y5fT0ahItJZrSmrDXS2H8UpnNf9aWFgPW1IGIWsfEI7VNy
 6RjveXTCIizcDGHV7p/O5j7RVZpeL/vftK3FsG94d3uoUc+nQiq/G7W8j95Nu11STKQeyhgja4k
 Dm3f0KE8GDs5msN6R7m0kHGHBSGSsKC54SqSBWTXqK75P8KSyIeT1eTAWqG+OMf5/mxAgo2v9rY
 CV7r5VbbvYurqN2tI1Vyx7crrBPZkR2Mv6NyniJGQf9nm4y4PGso+93xUsAAkcbkrEPNUhMz501
 MqUk/nCoTEcQuO5+qcVUFrstsTgJPIDWqusxVk8d7g+aTZ/tYtZUUgENwihDY6xeM/HrHV0gQN1
 n/aJEZZKMseaHR4GWkUDEKAJNujImSdNFMTMCGwwlnT7hOUlIvF3G4o1EYm2CfaDrEhLq+UHfd+
 Vo+AMOj9xKLa2O2pTnw==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af75cbf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=0taKFLn-hLWpjNWZEgwA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105355_985111_35196035 
X-CRM114-Status: GOOD (  18.92  )
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


