Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05A0606A8A5
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 18:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AK5vG/HB;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HkPJt1Mn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AdWgxSDO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Kz3mFGDHm3YL3jNa7eKBXnIcdFzL2ogUPI5D76TH/G0=; b=AK5vG/HByH5EUs
	/L5JyqVNI6m/3U5jcES7ZlJCbAu6ER65JM1INM6yOg6YwQVNlhDkf+yA1IWNF7riWzsW7ZQBFRzUk
	4UzNL2rp2r93hMn9Cyq2m1QiPjhH5WsFJw2DX/RIrXB+b2ewpyTF3UhjRhvUg6iUInGIce5LFLkbz
	C8ZI2zsuOoc2y2REOGRJKoVts01l4cqMWqFN9j0dcdYmiNnsunllEu8weFsj3mtcEtAa0yGctJO4u
	s9ejJcfvG6Kv+/X+6zHlKxBkxBr+hkiBmFOZkrfjZShA+XkmjPylkxlOy+AkEnA4NsF0eyUAsc4kA
	VJ5d+mEdCE1+34vY8QXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwPV-0000000E1Jd-2M03;
	Fri, 13 Nov 2026 18:54:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwP7-0000000E15Y-13Zj
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 18:53:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADH3gTw3868366
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 18:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Kz3mFGDHm3Y
	L3jNa7eKBXnIcdFzL2ogUPI5D76TH/G0=; b=HkPJt1Mnex7OSeyub8dctliLFSn
	urMff/xho4+9KuVSN2Bo+BeIoscTfRbdl9rpqLpsaeHb+gQ6IvqcFvUOAdD9mM3S
	dQSIXqAfcnTtLccXZz63HzodmTRDoMvuLDElNxh25ME5na/vFTfEm+PiSDmMFXFl
	doT07fDHnAEC+0dUKnq4D/AFKZ46uJQis49y35PuJyDKpgtbuH5BhTfMcGXNHd+v
	lyDVfQky/EpgemZtLok45+BYeqfExpyEeP+UzDB45iogzvx5G53QzM6d3tD32bU6
	/aSkyLD3Qg0ZSPFwCt9jUDxnWL/nkGkd1bcHx/bN8LOPK31STXQiBacWdng==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx6ma8d9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 18:53:38 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1af203073e0so1171668c88.1
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 10:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596000; x=1795200800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kz3mFGDHm3YL3jNa7eKBXnIcdFzL2ogUPI5D76TH/G0=;
        b=AdWgxSDOPLv5KPEHJyzoOijR26CWlwXAJK+8bXxLH3LBW9lkuX0xc9BI3V1sKuobCG
         Mwxbbg+6Z9zYpb3ulOg7+cSbMYxwAWlql0m3R/EBZ+nDsPoHm6Kt6Jcl0rO4sYr7pTZR
         esE2xhmdVC50amR9aLILPewVDlsRM26cV+JTAQ03PnUQDfK1DkP6ukZPC2vi4YAhFDb7
         qBhk6N8EcLakTjYvxGnq3pgzavmnmsJ39yFtd/FVrI2AuDRccM2eLP8j4Q+Ntlcwv9yh
         PdklDHPomjIAB+nPf2cznfTKLmgNfGLF3gC6EXrsBxJlhpekr2prG0OuT5Xa3/Jai08v
         qE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596000; x=1795200800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kz3mFGDHm3YL3jNa7eKBXnIcdFzL2ogUPI5D76TH/G0=;
        b=ECEV/6yydA+pOvsBfPCFe0Yp1v9eXpkZnNmOiPFkGRKU6FgdUezMf9sc7mAZpapbwz
         maXzLtdsCIZ0pckR8EiBeYVP81Q2SXcnNT43+FeK0e5hwsJSrLAze/IkVPhn72n5PDIl
         3xHsFkZjMeAXuvUEDN64EPfMM37Y81lxKzvdRCemDHMVXBzQ1m+sofjnXunJ++wmHsXo
         lOK9bSiV+6q3mJlYpAof40bExmNOl/kEXxtkv0kQjlHK4Q9WCtUVoo9GA+m/w+48q3tY
         mAI+tZ5pePBi3uoHpI+UQ/sP8UGPJdVpFW72CCgMJO5EUJ7t8gaColllmV4peXjiJdru
         0upQ==
X-Forwarded-Encrypted: i=1; AL+hErEn4mLsm0/BLZspCZo/ZjhCcSMzZi2aPdpUT3S0BjPw8V96JAbmHtv6VEarvbdicx6a+e8iymc=@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZO9K96HincuUsSkBchL07cicoQQpJpSAnmoEjqn8BRijt32Nt
	1n8csi68zirbsG7jnE46SphyJeXFFz9zF8oHKzmH8d+41uZfoQglmxj7/FG/rklHSaPULtf9Ne+
	QFjVFvsRUC92z1BElerQXwP9jJo0wUi2+9RJq31haOEtxAH1q+jHSYwB1eSR/Sthw
X-Gm-Gg: AYBFou26B4flASDuzHNI58CDg8Zv0KWwaDLjE2WZ6rR07QeLHx8YiTnV0WK8VaOnzn1
	IuznxHBOMXHnOFIpcldEenKwCHGI87eLwNNGBoxzL6urStPR6ijMvSkC1xgY++WPz5gZtCYqlry
	q83yPEeZ/PBeJsRtBwE1p2cEkNZA7tfJZH7gbbNb6Z0asyiyEvw/JvIUTWMYk0W6xqIxDmmKEIf
	0y6SImzW/eQXNZ3VWcdBYHdWn6zpGS2+iZuN4dgOaC9kPmnRiQnWInWg+36B/KINCMeB6lzl912
	7yGv5XyHwJStW9xKGjOoyzwbgUfRGyjQkiXb3BdvTlwP34X4nyKlQOrwQMQI2ME7Hy9t4HP8R6h
	8PhVUeW//7rVlwtiHGvuvALE2SRdUsfj6U2KdE4dTwZp/+2HmRz1RPZGnaG28oXGkxIu0N3Rgrm
	Y=
X-Received: by 2002:a05:701b:4504:10b0:15c:1679:1cc7 with SMTP id a92af1059eb24-1b50313d80bmr2955484c88.37.1794595999682;
        Fri, 13 Nov 2026 10:53:19 -0800 (PST)
X-Received: by 2002:a05:701b:4504:10b0:15c:1679:1cc7 with SMTP id a92af1059eb24-1b50313d80bmr2955427c88.37.1794595998965;
        Fri, 13 Nov 2026 10:53:18 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:18 -0800 (PST)
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
Subject: [PATCH v2 1/9] firmware: qcom: pas: add qcom_pas_context_init() for pre-allocated context
Date: Sat, 14 Nov 2026 00:20:01 +0530
Message-ID: <20261113185009.157893-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LeXejpMXS71D7XDOSV7JoAiWqf5fjwaQ
X-Authority-Analysis: v=2.4 cv=RbcFmFtv c=1 sm=1 tr=0 ts=6af75cb2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=O747SXQATtv6IwqlEkcA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXwxz2p+ZfdmSP
 q4Xz7DptnHv0ZHuab6cJvlIsXq0g+k24ZShE3IQ1IEXU5w5PaVCYvxURm8GRbX5NWf1a4DOSciS
 ud7/EEKzfVKa5YqIraL4CeaAD7U3bnDhqDsN5LdCPIqw5NIDZr6mNb1ZF6CSNs47nqxexCXjdpO
 sWc9RviR/LHTRKeosNJbUsaeN/VW9Dwss9Job+zDPfShl1CPe3MiV7I6hidNN5b6/oddcxYwKJD
 zoCP67n+5PyAa9bIcoSrbsLDdYwdlVfk1lHk0gcbdmf8tKzpbytgS3DfYQ+TDwgPN/oGORS44h2
 /ZR3X9RQQ5ZWgqBP5UokQSlD5TvIwryUgRyIu04yLgUbTDJ6GwsPabjWD6r8UJ4ne8aqGQJvb4N
 jVjSfY1QdwfzHkLTu6OHLsWSIpc6CDn41laAC4DbYVxmu8FYIwMnnY9Brc2J+zJfXpsaCgGu+gY
 FVI1L3scbsOqEb5ipfQ==
X-Proofpoint-ORIG-GUID: LeXejpMXS71D7XDOSV7JoAiWqf5fjwaQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX5uWNmpL+Zuq5
 Se2wRjgc3+ijyY8l9yked94ESFYffnHrMQDfyeypp4EbKUj8FMAYwzKfU0kxt1IA+eLoxSURNDi
 2Qg/eOOJoEttf/RKRZ02K+WDBq881W0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105343_969573_9E87C379 
X-CRM114-Status: GOOD (  18.34  )
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

devm_qcom_pas_context_alloc() allocates and initializes a struct
qcom_pas_context using devres.  Several callers, however, either live
entirely on the stack (short-lived helper functions) or embed the
context in a larger structure that is already managed by other means.
Forcing those callers through the devm allocation path is wasteful and,
in the case of functions called on every power cycle, causes a devres
entry to accumulate on every invocation.

Add qcom_pas_context_init() that initializes a caller-supplied struct
qcom_pas_context in place using memset + field assignment, with no
allocation at all.  Rework devm_qcom_pas_context_alloc() to delegate
to qcom_pas_context_init() after the kzalloc, so both helpers share
the same initialization logic.

Update the kernel-doc for qcom_mdt_pas_load() to reflect that the PAS
context may now be initialized by either qcom_pas_context_init() or
devm_qcom_pas_context_alloc().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_pas.c       | 26 ++++++++++++++++++++++----
 drivers/soc/qcom/mdt_loader.c          |  4 ++--
 include/linux/firmware/qcom/qcom_pas.h |  2 ++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
index d74dd7b4f332..fdf62003fbf1 100644
--- a/drivers/firmware/qcom/qcom_pas.c
+++ b/drivers/firmware/qcom/qcom_pas.c
@@ -14,6 +14,27 @@
 
 static struct qcom_pas_ops *ops_ptr;
 
+/**
+ * qcom_pas_context_init() - Initialize a peripheral authentication service
+ *			     context for a given peripheral
+ *
+ * @ctx:	  Caller-provided PAS context to initialize
+ * @dev:	  PAS firmware device
+ * @pas_id:	  peripheral authentication service id
+ * @mem_phys:	  Subsystem reserve memory start address
+ * @mem_size:	  Subsystem reserve memory size
+ */
+void qcom_pas_context_init(struct qcom_pas_context *ctx, struct device *dev,
+			   u32 pas_id, phys_addr_t mem_phys, size_t mem_size)
+{
+	memset(ctx, 0, sizeof(*ctx));
+	ctx->dev = dev;
+	ctx->pas_id = pas_id;
+	ctx->mem_phys = mem_phys;
+	ctx->mem_size = mem_size;
+}
+EXPORT_SYMBOL_GPL(qcom_pas_context_init);
+
 /**
  * devm_qcom_pas_context_alloc() - Allocate peripheral authentication service
  *				   context for a given peripheral
@@ -39,10 +60,7 @@ struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
 	if (!ctx)
 		return ERR_PTR(-ENOMEM);
 
-	ctx->dev = dev;
-	ctx->pas_id = pas_id;
-	ctx->mem_phys = mem_phys;
-	ctx->mem_size = mem_size;
+	qcom_pas_context_init(ctx, dev, pas_id, mem_phys, mem_size);
 
 	return ctx;
 }
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 0d55e9e0af3f..c6ec67e1da09 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -476,8 +476,8 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  * firmware segments (e.g., .bXX files). Authentication of the segments done
  * by a separate call.
  *
- * The PAS context must be initialized using devm_qcom_pas_context_alloc()
- * prior to invoking this function.
+ * The PAS context must be initialized using qcom_pas_context_init() or
+ * devm_qcom_pas_context_alloc() prior to invoking this function.
  *
  * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
  * @fw:         Firmware object representing the .mdt file
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index 1d132e89536e..458075868bf5 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -36,6 +36,8 @@ static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ctx)
 }
 
 bool qcom_pas_is_available(void);
+void qcom_pas_context_init(struct qcom_pas_context *ctx, struct device *dev,
+			   u32 pas_id, phys_addr_t mem_phys, size_t mem_size);
 struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
 						     u32 pas_id,
 						     phys_addr_t mem_phys,
-- 
2.55.0


