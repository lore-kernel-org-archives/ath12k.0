Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5BF606B341
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 18:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sfBLKhW9;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nMKw03Ef;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NnpRJ+UM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0iSH72bVkObJ6XNgFyC1IcqJNSUQhJ9lsse8nsmCQfg=; b=sfBLKhW9KRgY/+
	lEQ9WKIBL21CnnMX3KG7vPRW36jhDJX0jOz1zL+xX1cYz4l6gRkMpWCZZo3KCaH8ugEcq+KqLmDt6
	hfl0Dn+M5siI5+8sGO/B++tYUx5MRvagekfgDr3uX+enLYEREiRH66ORxaL/KNbjqc6PouVOi08mg
	Z8cGIWxrIvRMV/A1Ay+HivGuXbDhruHKOZe8m3Gsz6esljj7vKKzzNEeaC18ei1eGYt0v1G0zW7Rx
	D6/VpgGgHNYNIcjhGm+ucBwWQboNC86oi0W31SsH7QGqDvaVi0cK3hFWzDLxY0bWZgqkfu5Dl65db
	eu97qLHsMtF8n5YWFi5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwQ4-0000000E1tc-0UGo;
	Fri, 13 Nov 2026 18:54:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwPy-0000000E1lA-0Bsu
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 18:54:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR5OS551894
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 18:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0iSH72bVkOb
	J6XNgFyC1IcqJNSUQhJ9lsse8nsmCQfg=; b=nMKw03EfbnLviR49OfokSBHZcX1
	3teGDzpcCErjbqy9PXFzmTwRaCV4+5x73O2NLnI/SKSfL4f2qZCpqc1QgU1yTAzZ
	bohP8oY2w7ysZYL4GeijVUVGjZY7i2fnxwZk4l3Y/fDVLpLWCVutBIrsxHb731+o
	cuGLy05Q3tQXaVx6N9MSEc6TSvYZ0Xwd7O4lyB85OjohreZ1Syo+huuxomIbZpA2
	lqiWOG+DWIpRlTAc9+m3ZF92IJCT954ZJedL0k4CgQ5wYF0T/Cb1c5E4opbQy3g+
	fr3Er1PGcfsphCEtqUsbEpgch8yp6k9CapUKDewaQDt+WybJVlFtR8LyAlA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwcc7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 18:54:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso5771865eec.1
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 10:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596072; x=1795200872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0iSH72bVkObJ6XNgFyC1IcqJNSUQhJ9lsse8nsmCQfg=;
        b=NnpRJ+UMx2yquD4JeL7L501BHw/7fn4BLAQr6WbiBqUKPVJ/parz/6fB7fUEhEp57x
         PjTdGbZYQj5TNyeVcua9c+GEMdWRakKpW6D2sY5leafZqgdPs5x9QD2E7qtma9VZ6Mr4
         IcGhV9bV3hjmF7mydckzja6HjzaDT+S8W8Djdb1OEQQoFnDf4tP6iu8jUipQwCiyqJDV
         X+/PtwkObascHfT/S016E/lBTfpsQEG13hMh4ZIfORhate7phVWYlQ78tkYxpG3rFN1M
         ru5ui2w+PEae4MJm0zqkCuGNWVRmIUDoblFF6bxXSnInie+m0KuUu/VZKQS20mVz5H4Z
         zo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596072; x=1795200872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0iSH72bVkObJ6XNgFyC1IcqJNSUQhJ9lsse8nsmCQfg=;
        b=nRzrK0f1gRSh2oVfB1MCFa5tHDjARmpTS6l0cwekDXZAOe4zDNY+qpqXRnkjq5SWxY
         lZLJwLSH49O/TZ2Goq7RLPleBbT4VhXSeTQOJ1jnbrk58PqHFubBvKo36NViOT4QvGfz
         jHvnRdUrM46j1lm5Yed7GSl/O0D1QC2wxofr71Z1jPTk4hW7xOFZqTbF4VSLU113FVDD
         x2j0EukIKOjz0GLD3jz5LznKNUYp6ZaeRovlwS84OKJA0Z0NV/XsaYKmGgHKJB2ZAxhh
         +IQt90gKJCA9zMRzf437fBoyrijxtjnt8NwzOIN+4Lww+J7AOfmAD2URgzAVfb+VQkjI
         IM7g==
X-Forwarded-Encrypted: i=1; AL+hErE6GKC0QYkOW7b6l3UxDxHzv7Ua3DYyLpDcQcFLqunWaIGemmz8/ggfj7dzPpMYiraf+/LaH4k=@lists.infradead.org
X-Gm-Message-State: APuU4Z/mLVMVN5kje9F8pT/p5c+k15FrRc5AeWTBdmVjA6K1tnOtSvCn
	U1iTg8qzYhZsPBTEP4ZBMJGpX5IlSh4C9hGwOqoTx3xGOZXEzSiiIDeMIht7y5MvqLScXFLChMh
	l7iSeInOjdqFrBBXp1OPOKr7y2EGf7awOhA2PDofxc2Lrzs7vt3JRI4zSBNBxsKO8
X-Gm-Gg: AYBFou33X2lVSpF3hdufZIwrN08p5EA9ZmYN6T6ETzPvrHpTamscqEXRcVe+G16WuUj
	pbjuOJ/y9nOpnMV0VqpLhJLNk9pOY4mAWuxxN9IhDgS0gS/pZaWBSJoYj2p+pLlG6nLRq0vT4YO
	U8Hzz4+vBLJELt6HbGA7apDU6Aa/T7ylLANbO0H2vNns6qeeZZVvnCFJPnzANBVcapE61l+B7SV
	ZgyzvwajXSzVcr+CBqU+gliXzIKExPBIFSaic6sds4kZPbj1jWkqkaU1dJvkZdUdPQYx8YwW7BO
	aIvqXexHLsY6N9SI2CEYULEVcOgJShH5Fx4Be5maJaeEpIvvT+VLE69hQFUnTxTaIhoLsVVjTcA
	pZTikRdBS5o2WZR0q7r0LWrrWlMrgNm3dELJ4jK7SztPYxhskXv74GblJLafCpSn95tI20sqlOZ
	8=
X-Received: by 2002:a05:7300:c594:b0:36f:a72d:29f with SMTP id 5a478bee46e88-37967ae6bf2mr3452321eec.34.1794596071739;
        Fri, 13 Nov 2026 10:54:31 -0800 (PST)
X-Received: by 2002:a05:7300:c594:b0:36f:a72d:29f with SMTP id 5a478bee46e88-37967ae6bf2mr3452284eec.34.1794596071051;
        Fri, 13 Nov 2026 10:54:31 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:30 -0800 (PST)
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
Subject: [PATCH v2 8/9] soc: qcom: mdt_loader: remove qcom_mdt_load()
Date: Sat, 14 Nov 2026 00:20:08 +0530
Message-ID: <20261113185009.157893-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af75ce8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=GTbpKQ6npsRNubDcNtEA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: nSs2WjtsN6LyCK1Im5bhpkZoKVsbvAmy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXwAAXi8maD+af
 oomzR5MJAuppVbSrH1XPSYHa8ym+ew1KixwiWyjsQqwYev+30KMsWLxoRQqeEUBICTitT9fpVIe
 9JRY8wDt2ETdLaUugrr8+gyQRuclGndupqhBA/0e0tiwNkOqqXHtaEIo67QVGF0SsooIJaExvlo
 Dg7c6Znc4/vEXiK7UbyIJoahQ5sY3CkwLkK12K4JYVc1obFFBWLVTMK0nYIJETRaWfLbL09AsBY
 k9FqGa2pESZAMbXhqMUfKIDjfB4qfEGRDbiHzYgzkP5D4qwItLEmfXvhMOeFKkk/PpI1XpjObZc
 rNke42cm6rmBng/Aoqi9q/vlXm8d5bYt2nykich0Yset3jma36p6dOACEszrVLC3+5O8wcOav23
 7+yWL4jRjn8QUUn7LDa2J5NiaE47RXfd0nbJ5/1GqLo4HXUxeYwOTgL5MR3mcYXOdS441Kw4MjW
 0O65QTNJa9pF+7za0tA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXxa9bpdAFM1So
 zB/vvUa0sB/1Z7NFb8I+n9O2o2t0ps4EagPCBr8DaFP36IIP1Kw8QgcSKAbOO5/QaZOk4VDXxrn
 dFqwaGCD305jEYEPaN2mnVm79en2ZyU=
X-Proofpoint-GUID: nSs2WjtsN6LyCK1Im5bhpkZoKVsbvAmy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105434_671986_F72EFA22 
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

All callers have been migrated to qcom_mdt_pas_load(), which takes an
explicit qcom_pas_context instead of a raw pas_id and delegates memory
setup to the context.  Remove the now-unused qcom_mdt_load() wrapper
along with its EXPORT_SYMBOL_GPL and header declaration.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c       | 59 ++++++++++-------------------
 include/linux/soc/qcom/mdt_loader.h | 12 ------
 2 files changed, 19 insertions(+), 52 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index c6ec67e1da09..fd638833b17e 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -329,7 +329,8 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw)
  * @dev:	device handle to associate resources with
  * @fw:		firmware object for the mdt file
  * @fw_name:	name of the firmware, for construction of segment file names
- * @mem_region:	allocated memory region to load firmware into
+ * @mem_region:	virtual address of the memory region to load firmware into,
+ *		or NULL to have the region mapped internally with ioremap_wc()
  * @mem_phys:	physical address of allocated memory region
  * @mem_size:	size of the allocated memory region
  * @reloc_base:	adjusted physical address after relocation
@@ -344,6 +345,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
 	const struct elf32_hdr *ehdr;
+	void __iomem *mapped = NULL;
 	phys_addr_t mem_reloc;
 	phys_addr_t min_addr = PHYS_ADDR_MAX;
 	ssize_t offset;
@@ -353,12 +355,22 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	int ret = 0;
 	int i;
 
-	if (!fw || !mem_region || !mem_phys || !mem_size)
+	if (!fw || !mem_phys || !mem_size)
 		return -EINVAL;
 
 	if (!mdt_header_valid(fw))
 		return -EINVAL;
 
+	if (!mem_region) {
+		mapped = ioremap_wc(mem_phys, mem_size);
+		if (!mapped) {
+			dev_err(dev, "unable to map memory region: %pa+%zx\n",
+				&mem_phys, mem_size);
+			return -ENOMEM;
+		}
+		mem_region = (__force void *)mapped;
+	}
+
 	is_split = qcom_mdt_bins_are_split(fw);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
@@ -437,39 +449,13 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	if (reloc_base)
 		*reloc_base = mem_reloc;
 
+	if (mapped)
+		iounmap(mapped);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 
-/**
- * qcom_mdt_load() - load the firmware which header is loaded as fw
- * @dev:	device handle to associate resources with
- * @fw:		firmware object for the mdt file
- * @fw_name:	name of the firmware, for construction of segment file names
- * @pas_id:	PAS identifier
- * @mem_region:	allocated memory region to load firmware into
- * @mem_phys:	physical address of allocated memory region
- * @mem_size:	size of the allocated memory region
- * @reloc_base:	adjusted physical address after relocation
- *
- * Returns 0 on success, negative errno otherwise.
- */
-int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-		  const char *fw_name, int pas_id, void *mem_region,
-		  phys_addr_t mem_phys, size_t mem_size,
-		  phys_addr_t *reloc_base)
-{
-	int ret;
-
-	ret = __qcom_mdt_pas_init(dev, fw, fw_name, pas_id, mem_phys, NULL);
-	if (ret)
-		return ret;
-
-	return qcom_mdt_load_no_init(dev, fw, fw_name, mem_region, mem_phys,
-				     mem_size, reloc_base);
-}
-EXPORT_SYMBOL_GPL(qcom_mdt_load);
-
 /**
  * qcom_mdt_pas_load - Loads and authenticates the metadata of the firmware
  * (typically contained in the .mdt file), followed by loading the actual
@@ -489,21 +475,14 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
 int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
 		      const char *firmware, phys_addr_t *reloc_base)
 {
-	void __iomem *mem_region;
 	int ret;
 
 	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
 	if (ret)
 		return ret;
 
-	mem_region = qcom_pas_ctx_map(ctx);
-	if (!mem_region)
-		return -ENOMEM;
-
-	ret = qcom_mdt_load_no_init(ctx->dev, fw, firmware, (__force void *)mem_region,
-				    ctx->mem_phys, ctx->mem_size, reloc_base);
-	iounmap(mem_region);
-	return ret;
+	return qcom_mdt_load_no_init(ctx->dev, fw, firmware, NULL,
+				     ctx->mem_phys, ctx->mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
 
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 74886f772d46..f49de7b388bc 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -15,10 +15,6 @@ struct qcom_pas_context;
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
-int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-		  const char *fw_name, int pas_id, void *mem_region,
-		  phys_addr_t mem_phys, size_t mem_size,
-		  phys_addr_t *reloc_base);
 
 int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
 		      const char *firmware, phys_addr_t *reloc_base);
@@ -37,14 +33,6 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	return -ENODEV;
 }
 
-static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-				const char *fw_name, int pas_id,
-				void *mem_region, phys_addr_t mem_phys,
-				size_t mem_size, phys_addr_t *reloc_base)
-{
-	return -ENODEV;
-}
-
 static inline int qcom_mdt_pas_load(struct qcom_pas_context *ctx,
 				    const struct firmware *fw, const char *firmware,
 				    phys_addr_t *reloc_base)
-- 
2.55.0


