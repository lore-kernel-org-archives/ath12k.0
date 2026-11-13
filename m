Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA671606A8A7
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 18:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iTLXAjYZ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSsCY0NT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tm/Vqa44
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=; b=iTLXAjYZ1S9Ds6
	ZynWv7GhFWuqID1L1IDrVjQq1BoBfBqtu4ixCCtJRLLAoc8A88s8L6Qqu4XnVY8Cy+e1IqgsGuMS3
	be75xegTO1gAEqT4r+nEGYTjIBmEiL5TJZLF51evwEcRmr2bU21MZqxw0zcr+CTLGmhJygfJlC0rq
	Bqz0jxU1r1TOVEQLMpPSakN2s1TVpX1bR5aLzQuw11UBeqrg/7cG/F4BhGOxZwPwe2yg1vQRbJSlw
	JNiD7k344uFyLtAbnASUZFgPoIV3/1MH/2/MuXQ15CKeBROx+rhSJqvVQ2tkKE+wSiL9PlOojyRfw
	l/bDLfsBJRCMUaPgIjQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwPY-0000000E1MZ-2hLc;
	Fri, 13 Nov 2026 18:54:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwPR-0000000E1I8-3aC4
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 18:54:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFQtBs074761
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 18:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVUhyr3d7Ss
	o/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=; b=fSsCY0NTXlvartabOwFgIj66jdN
	vofpr4TxtrxMNECIXDDGSBZ4KpYyrhYTR22a4EUgWcuv63U/2PTmqs3ULD3CkdPq
	Llei5ZU6jj1qUsTDW631MVD1FiEcIk7BQEbbw2+tXuZvKSxPCnai7kZRuy207yFp
	g/UxbKZw+JgwPOOa2tGSsHsdNgn4ZSMYLFMLBUb9CY5SdSNZ/md3q4FowwvrWQKp
	6YofDJm5ghJqsl/s3K/6TNRLLGFC+vjjLTl2MNEvjT8WdHKvcGnAcD7dLzUVRcSC
	tqqiMB1Thm7dyOl+aYwTpeuEMH1orm+iu8pz5ekAhw9DKzxMoOelPQWr0xw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mu3xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 18:54:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37628596fc9so2441178eec.0
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 10:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596041; x=1795200841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
        b=Tm/Vqa44gKfBjfgW2VP8gpNLpkLJq66FHJc4J+4GajOh2xtfhcIdKIFF21TNkubXeK
         vRIloS/aBTy793RBGB4neq0GMU5CjI4yYygx5v/AdyHf/Suz7VTGYXF/44H/eFrRbIrk
         S728XS0Hm0AlVY5e8uqNTGwhP7T3If7DYIoO+hEH7pZg0esuxl6faYs7QMBexfgNNN4C
         eiGLzFr02bVQIlURCjaTT5F0onuxPAtNRFW86HdT9viko53Cp1MmocKRMFKRhVq+SNMK
         kqCOlU21E3RGdqgr5XzzchdSyO0W3wPpgcXAeyVyP7qJmOjuJCaPsOcJze1MGeircFhi
         Wzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596041; x=1795200841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
        b=urnJlHfRNp5xWdlR93ywZxyj9jxplOgU3HRcpXfgfqFjoZUOahvh72BfHHsY/krjqC
         +97hASjQkKYoiggvT7ykg8ENhIgS6LwUkq/cdrqf5oGqId/jcdN03oPD0wlV6bE6GOxm
         ZlGidpZj2G72r/6v3tNxdRCkap+8A3LB0o08yBt9ce0fX3UeNeymJTibKMxcXwGjig6D
         CeLqkCQjvGfdW5fBrW/YESTTa61l7M7PyCkyj+iOlo6GPR40aTurqvBUGw528YVfIqNH
         OXIoMi1fWu7wRgNkkpjMe8+2rQLtvc5I1qAzt7sD4lwPiaXj3dNmESBDIs5dyBqw2tIX
         hOKw==
X-Forwarded-Encrypted: i=1; AL+hErFVMwF4Rv02aF9kNdGH9IkhB+6LcsKtZdvI0U5Ttfq65wyYDp17598oI4O+38usfhqKtuTp+aA=@lists.infradead.org
X-Gm-Message-State: APuU4Z9XGYQw+60xUqeyWObk/5aroh1HyLv8hpa1e6kdH5TBfUkGyi2q
	co9rzvB41RD4ekn/NSfpLdQmEdz2VTBZp+LqA3M+K/ePGfWQRW7TKM+iaNZ4i1kJC/fVIgGKM7e
	DViADq0aL26uINiSKRvNw21H8cUaR+/C+pHuVKacjsYglBCE4hOpcAbM77KTDtJhD
X-Gm-Gg: AYBFou23GjyBTlY8USiy2gdBeN5KxJlULBtr3DaV5ClgLnOp6dAO04gwcuePT+P9AP5
	vAaCIi3iUjhDHeHBvFo7awAouuYJe/bxZ+NYj/yiSpLG31x/ZCcp2PyCGTAdX2nDl0iWbYN4/aV
	ue7UjtR6yVnVe+HlAUUwBS+5m6/IdwJgbK1NJ96ZLY2GAUXZigECWR2UCOcq1In2NGPdA6bNO7L
	x56rJ5/Q2XPggqvzS0avJrLev2gewtF+tDRmWBKpOTN8O26XQmo2aofKkUeXTC+hSZMX8j3cxpb
	1qI/y1cHHdkO2yZw8ipirpOtsf8faxDLVa9Mt/o7P9badWKGF42hNZzF0DMg5w1xEP9giIZWP8Z
	U9RvaYPJfrNk68z7V1ZOb61Uy6bA/azCbxtg74EpLIfkQml3WwnnbUuY3W6bc/t491QDkGvA7aV
	Q=
X-Received: by 2002:a05:7301:1c18:b0:375:b560:a323 with SMTP id 5a478bee46e88-3796365f033mr2852006eec.1.1794596040403;
        Fri, 13 Nov 2026 10:54:00 -0800 (PST)
X-Received: by 2002:a05:7301:1c18:b0:375:b560:a323 with SMTP id 5a478bee46e88-3796365f033mr2851980eec.1.1794596039826;
        Fri, 13 Nov 2026 10:53:59 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:59 -0800 (PST)
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
Subject: [PATCH v2 5/9] media: venus: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:05 +0530
Message-ID: <20261113185009.157893-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: coMgKTQHZnY2OMWWcZchMQdbdvYO-vlC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX2vKZbwL2hCNu
 1Ok75f0lohMYvqdi5GXfwwoulvm9Y01d9oSp3fxs0FU1JjsaE166NghzQdPF8v3831d1O3nrpeV
 qqTHV6FuRqMOqfyQqOHUQ27pn0/fWJRhlG0FmA4PJWxMVI7fxQO0NR+wMTynHx9twNgE+rGiAFI
 HOG7Gp3bjA00lXYuRmkkADdflAkz3F59+Fi4VEOif+8ngDOLIFOURhx/W28evyLv1booLJzUJma
 O8B4wLer7WKl23JzOhs8h/8bdBR1Ym66ddkdz6B8OFpEARAVAVE4huuWlIYX4U4TL9g+QNKOhwm
 m+at6aJDnkJ/dhRsxy7L2VqCsMQ5PtQchNlRaxt4aYa3uUqm78c6vMM3i6lvreQoizFyyux56Rp
 i9EJEvEoYmYPG/rOJD+wU1NcRwXAqMsV1e/DgNJepuzfkWYfCurIE8L4/6ltugxPqqsEO5ivIfF
 Y70puQz5VDen94QH5YA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX0qFLVpDAleVv
 BYOBB9oCX5f+MiW60ZXH8IgnoNPgGGzTxNPghBP+XJcLLuDcXtQcyj0iHct9AlAFyZeLWk3L1L/
 GtFqZ2swopp309RnacqjKPiwWgueljI=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af75cc9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VuDNxQijsV4jnZh2Ru4A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: coMgKTQHZnY2OMWWcZchMQdbdvYO-vlC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105404_822592_DAC9DE88 
X-CRM114-Status: GOOD (  17.98  )
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

venus_load_fw() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. venus_boot() calls qcom_pas_auth_and_reset()
for TrustZone authentication, which is the intended behaviour. However, a
new qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Embed a struct qcom_pas_context in struct video_firmware and initialize
it with qcom_pas_context_init() inside venus_load_fw() on each call.
Replace qcom_mdt_load() with qcom_mdt_pas_load() for the TZ path and
replace qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().
The non-TZ path retains its memremap()/qcom_mdt_load_no_init()/memunmap()
sequence since qcom_mdt_load_no_init() requires a caller-supplied mapping.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.h     |  2 ++
 drivers/media/platform/qcom/venus/firmware.c | 29 ++++++++++----------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 93fa77f05834..84a0d4a8426c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -10,6 +10,7 @@
 #include <linux/bitops.h>
 #include <linux/dma-mapping.h>
 #include <linux/list.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -228,6 +229,7 @@ struct venus_core {
 		size_t mapped_mem_size;
 		phys_addr_t mem_phys;
 		size_t mem_size;
+		struct qcom_pas_context pas_ctx;
 	} fw;
 	struct mutex lock;
 	struct list_head instances;
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 3a38ff985822..704343e241dc 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -117,21 +117,22 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
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
+	if (core->use_tz) {
+		qcom_pas_context_init(&core->fw.pas_ctx, dev, VENUS_PAS_ID,
+				      *mem_phys, *mem_size);
+		ret = qcom_mdt_pas_load(&core->fw.pas_ctx, mdt, fwname, NULL);
+	} else {
+		mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
+		if (!mem_va) {
+			dev_err(dev, "unable to map memory region %pa size %#zx\n",
+				mem_phys, *mem_size);
+			ret = -ENOMEM;
+			goto err_release_fw;
+		}
 		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
 					    *mem_phys, *mem_size, NULL);
-
-	memunmap(mem_va);
+		memunmap(mem_va);
+	}
 err_release_fw:
 	release_firmware(mdt);
 	return ret;
@@ -237,7 +238,7 @@ int venus_boot(struct venus_core *core)
 	core->fw.mem_phys = mem_phys;
 
 	if (core->use_tz)
-		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
+		ret = qcom_pas_prepare_and_auth_reset(&core->fw.pas_ctx);
 	else
 		ret = venus_boot_no_tz(core, mem_phys, mem_size);
 
-- 
2.55.0


