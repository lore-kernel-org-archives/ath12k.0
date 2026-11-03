Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7157606A33A
	for <ath12k@archiver.kernel.org>; Tue,  3 Nov 2026 17:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Stsm4Nbf;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P8n8lwKS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fA+zYGjT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PYiEmA70j8TCP13NdNomODWDhfmQmohzhkIzMccZN30=; b=Stsm4Nbfk3ozqu
	gDflSEX618MOvcA05oBgZ71xqMyZzU51zODMHnFID4RMjT9q7yat2b4rD9z1igPksoKRTyNMA7d38
	7xzyYf2GgTB/NVH/AS4KuWy62Iqc9uuiwKL6Sbmiyo5UJxAY3iieFJgmndGQBwiRnW+hniFCgwcu9
	tW4422LnFQdU/84LBobs+S7+ak5t/6QDA5qxqm5pbKkWy8Z95cw33NKWj8FsULT+wpaFnRzt6EL8/
	PlWP4vPbgQq3BWE5HDN8WDoTHUUDQrsV/CffMOw1IeHzcw1TRvdg2OVn7Jw9E+Gvu2V2Z744hGe29
	Z+BM7+vgPHn+jOVaTIBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIH1-00000003Iq8-1lPv;
	Tue, 03 Nov 2026 17:26:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIGw-00000003IoZ-2R8h
	for ath12k@lists.infradead.org;
	Tue, 03 Nov 2026 17:26:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HPDlM2553211
	for <ath12k@lists.infradead.org>; Tue, 3 Nov 2026 17:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PYiEmA70j8TCP13NdNomODWDhfmQmohzhkIzMccZN30=; b=P8n8lwKSZVgwBbk4
	3fZ1MFdlfP7tythQCZlmkOvJlNTzxL9pfMC3OZ1Je7fR85/e6u/UPgBuhfEvBJgd
	U54prymqgJYEeN1GKlr2/DjParuN/Ur6QYo/8VcFIXmGyfO8wKGY6OL0x5+0aWTH
	aFDkQuaz788wKRmgYuYk8HJrnBOfefguPBU6UnO2XqixmbnG1FAUpOJSHVUqsfGo
	00r9Gc/kQK4fkU1BvMpRK+VcyYfrX/3NqEwBo5MJX98x3+B7gj51be3P8UNYEBdW
	eCNS8ZdwjFifofTAQlJl991whEf1qfIsk0R7+rXdLdkIbKl6ajEjLGWcDeTJLBIH
	fDEt1g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2brwxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 17:26:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso1277943eec.0
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 09:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793726769; x=1794331569; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PYiEmA70j8TCP13NdNomODWDhfmQmohzhkIzMccZN30=;
        b=fA+zYGjT8qsX1ZDuqLJpfPG5ewBIJHCwQUCH6oeIXpLF0TtwIpoyk3UbS60S2x9vXx
         4qiU83NzxrqYsYm8F2o8LGL3IoSKK79aktvlqi4Nbs/Ozf8q+siFFmO6HXVpBaGIqbS9
         0UGLZpooJQaFz5TFOZN8LudSUNF7juVbs+xXk0A8rGLdTPiHEBfUmVXoNBpe9dkhwCp6
         PY6S2Ac4Rv4/LHBqPcLxqO93PSyzjfXwQC+KoOwzuGV9mEWQqepLwkAswhLvE/FJ3n1D
         7HFP86E/aOK4CrOhUU7TxgDJ/hWcM0J2EihDyWp3rc54BM9hFGKxw7SNlZST69oy9mbc
         YQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726769; x=1794331569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PYiEmA70j8TCP13NdNomODWDhfmQmohzhkIzMccZN30=;
        b=FRFEcF4v2JUTwbh0meo0Dky+BzZO9z2gAJlxluI5Kb9sGvZDO1JytMBf7A7YIR77Tc
         FpTHj8RORzMcouj4ML1Y3sI+RhItfCuHYEoJe+HFRR4IWimMKU459/PNkEC8Yxq4/X3s
         bIBtluvpZQ2fssOi7u1Ol6SX9SjeijQR+9o+ce4HB9V6xeFZqvPm/oyODAeo/uisQXD9
         A+KtIeTNVU6Cib5mqcUIWSVdSquqGwiTfWx73qXgo26t2wYrNicxSXi3ZI6wgMFEtp5B
         MkoetbCn7Dc2n/BpiC6IBV8S1rngWLybImGF8NuZuKBXsDuzBpN7Fu+NEGCQaShScGxT
         ItEA==
X-Forwarded-Encrypted: i=1; AKwUvBzv2n+2pBesq/v4EW95sAbJluTqVNkL8GQoMD836ZzfbzWlcN52eHzSqUanLygUwwlJciELWr0=@lists.infradead.org
X-Gm-Message-State: APuU4Z9xYs8WVibHDM3587kQwNcXzNJMEBUjlV/apTJoylzEYvPzlRKi
	M7zVHQy9DtGqTbsgm0X0Ffbuwn2/kP4P1mwLG3/bY6VtV657wwyd1ihoPraUjA7g3AyXgUH6k+J
	4tp8b59i1WLRliqrAawPEVChSZes/AQ2P3V1gpak99TqZunbXoyfkAK5EWqT4P/K1
X-Gm-Gg: AYBFou32tBu+f4RYSbIssaK/wV8QIZoxLSekAn2OASEfKOvjPP7jM3tQXzRYlDL9+AP
	ob9WJ1+gGaFs6neWnL/uvrvEKazQfS9ETxxo+Q7Ppe59BM/XsSFvd+3EbkhuchwJOaXlaui8+oR
	okXMEGOqH3bKSq+jAYRqLD8nljFh3fzOK5WgBmohdEBWUJ2vFXlMCmrLvaPvkmdQPUbuPgat0zy
	s6kNXhrBzA550TK3f7NwN69JLrQeSYdnBcVU88QC1lcNyZyxSO3R6cLkhWUlahVacqP3tUJFk36
	4ZAoMKfvIi2rxy065km+YxGh5vJ1Hf+dQop7wQy/qFo/BliAXwFSPWHJznCOXsVeLR82SHxswfI
	Z+ZPsSXT9+kBZ7E0CM8xeTsWrmK9zUKoRhjVZC7pbsTNP4NaJ1UZhh6ksfEeQ75Va7Ingkrogwb
	zGN1NIIXCNTsTuDXU+pdooZeh1BArK7E4csKbcfcUV/FucCaflm/WaIaKCCcTbPKJ2d01hfEhhn
	Dw=
X-Received: by 2002:a05:7022:628d:b0:184:40db:6bb9 with SMTP id a92af1059eb24-1a94876dbd0mr32647734c88.8.1793726769108;
        Tue, 03 Nov 2026 09:26:09 -0800 (PST)
X-Received: by 2002:a05:7022:628d:b0:184:40db:6bb9 with SMTP id a92af1059eb24-1a94876dbd0mr32647697c88.8.1793726768447;
        Tue, 03 Nov 2026 09:26:08 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm357310c88.8.2026.11.03.09.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:26:08 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 22:56:01 +0530
Subject: [PATCH ath-next 2/2] wifi: ath12k: refactor m3 and aux_uc firmware
 memory handling
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-m3_and_aux_ucode-v1-2-e14f13fdfa41@oss.qualcomm.com>
References: <20261103-m3_and_aux_ucode-v1-0-e14f13fdfa41@oss.qualcomm.com>
In-Reply-To: <20261103-m3_and_aux_ucode-v1-0-e14f13fdfa41@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2OSBTYWx0ZWRfX6UnX92qUES2X
 76wKpLrqFAllGoh5vm2tebSmsxqQf6xyQ0PI3uO/6h8N3Mz4Z0wbH+mrcOmx0TVjBWnJO3p2w80
 Ue2Q4oCt4VxDu9zypJX7qcv6f2KP22k=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aea1932 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7UcVal2zOK_enNmMlbUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: EJJ77eNXzk2ylDLFdHD8XXw4dJ-q0XIT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2OSBTYWx0ZWRfX7j5l00fxsrk/
 ZE4cRIML1v5fkGl6Fvha8jN2B5fjZzAH5UXota8/4pulxio+qkZPedlBljvDJ9sremamw+92UXK
 gtZBLj7K1f39HuB0zCcaQlTKT4Clucu5tdlTif1VIm+ncFBAGlHXyC/ICb1KCUxm4PG0hRobbru
 O5ZxvUvS/vJKBo6qdCk6XtCYG9TifSHgv3R//xWt9q1cl3he/F/ovhlzd+1ZoTvJGhsWeedwdcz
 xUgDZ5vY+IiXfLLEUHVAdaMXTJn+u/aeDx8yQai6NowWoYLRqrVPAJQ/WHuaMOPRlj++pk3HmOR
 hpT5m+zl7N4v3nUiBlhFSlXC9ts/sJsmM3FTxSrHYy5LPQKA9OU8dKcKw1ru/QH4SDYHR8vDvqN
 cbEqYKqFeyJkhi/zNoxr8+0Z7GFsRWAW0AqARH7+5YrAQtYcqx2aftJ4JGRewxr2dnY2UAnrg3O
 aZ6ISMvO+Spy+Vo6OwQ==
X-Proofpoint-GUID: EJJ77eNXzk2ylDLFdHD8XXw4dJ-q0XIT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_092613_369035_7DA50F11 
X-CRM114-Status: GOOD (  21.24  )
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

ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() implement identical
logic for freeing a DMA-coherent firmware memory region and for
loading firmware into it (reuse existing buffer if large enough,
otherwise free and reallocate, falling back to a standalone firmware
file when no embedded data is present).

Factor the common logic into ath12k_qmi_free_mem_region() and
ath12k_qmi_fw_mem_load(), and have the m3 and aux_uc wrappers call
into them with the appropriate struct ath12k_fw_mem_region and
firmware file name. The shared free helper also clears paddr, which
the previous per-region implementations missed.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 159 +++++++++++-----------------------
 1 file changed, 52 insertions(+), 107 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index b1efed1702cb..ba9365d10180 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3225,77 +3225,78 @@ int ath12k_qmi_load_bdf_qmi(struct ath12k_base *ab,
 	return ret;
 }
 
-static void ath12k_qmi_m3_free(struct ath12k_base *ab)
+static void ath12k_qmi_free_mem_region(struct ath12k_base *ab,
+				       struct ath12k_fw_mem_region *mem_region)
 {
-	struct ath12k_fw_mem_region *m3_mem = &ab->qmi.m3_mem;
-
-	if (ab->hw_params->fw.m3_loader == ath12k_m3_fw_loader_remoteproc)
+	if (!mem_region->vaddr)
 		return;
 
-	if (!m3_mem->vaddr)
+	dma_free_coherent(ab->dev, mem_region->total_size,
+			  mem_region->vaddr, mem_region->paddr);
+	mem_region->vaddr = NULL;
+	mem_region->total_size = 0;
+	mem_region->size = 0;
+}
+
+static void ath12k_qmi_m3_free(struct ath12k_base *ab)
+{
+	if (ab->hw_params->fw.m3_loader == ath12k_m3_fw_loader_remoteproc)
 		return;
 
-	dma_free_coherent(ab->dev, m3_mem->total_size,
-			  m3_mem->vaddr, m3_mem->paddr);
-	m3_mem->vaddr = NULL;
-	m3_mem->total_size = 0;
-	m3_mem->size = 0;
+	ath12k_qmi_free_mem_region(ab, &ab->qmi.m3_mem);
 }
 
-static int ath12k_qmi_m3_load(struct ath12k_base *ab)
+static int ath12k_qmi_fw_mem_load(struct ath12k_base *ab,
+				  struct ath12k_fw_mem_region *mem_region,
+				  const u8 *embedded_data, size_t embedded_len,
+				  const char *filename)
 {
-	struct ath12k_fw_mem_region *m3_mem = &ab->qmi.m3_mem;
 	const struct firmware *fw = NULL;
-	const void *m3_data;
+	const void *data;
 	char path[100];
-	size_t m3_len;
+	size_t len;
 	int ret;
 
-	if (ab->fw.m3_data && ab->fw.m3_len > 0) {
-		/* firmware-N.bin had a m3 firmware file so use that */
-		m3_data = ab->fw.m3_data;
-		m3_len = ab->fw.m3_len;
+	if (embedded_data && embedded_len > 0) {
+		data = embedded_data;
+		len = embedded_len;
 	} else {
-		/* No m3 file in firmware-N.bin so try to request old
-		 * separate m3.bin.
-		 */
-		fw = ath12k_core_firmware_request(ab, ATH12K_M3_FILE);
+		fw = ath12k_core_firmware_request(ab, filename);
 		if (IS_ERR(fw)) {
 			ret = PTR_ERR(fw);
-			ath12k_core_create_firmware_path(ab, ATH12K_M3_FILE,
+			ath12k_core_create_firmware_path(ab, filename,
 							 path, sizeof(path));
 			ath12k_err(ab, "failed to load %s: %d\n", path, ret);
 			return ret;
 		}
 
-		m3_data = fw->data;
-		m3_len = fw->size;
+		data = fw->data;
+		len = fw->size;
 	}
 
-	/* In recovery/resume cases, M3 buffer is not freed, try to reuse that */
-	if (m3_mem->vaddr) {
-		if (m3_mem->total_size >= m3_len)
-			goto skip_m3_alloc;
+	/* In recovery/resume cases, buffer is not freed, try to reuse that */
+	if (mem_region->vaddr) {
+		if (mem_region->total_size >= len)
+			goto skip_alloc;
 
 		/* Old buffer is too small, free and reallocate */
-		ath12k_qmi_m3_free(ab);
+		ath12k_qmi_free_mem_region(ab, mem_region);
 	}
 
-	m3_mem->vaddr = dma_alloc_coherent(ab->dev,
-					   m3_len, &m3_mem->paddr,
-					   GFP_KERNEL);
-	if (!m3_mem->vaddr) {
-		ath12k_err(ab, "failed to allocate memory for M3 with size %zu\n",
-			   m3_len);
+	mem_region->vaddr = dma_alloc_coherent(ab->dev, len, &mem_region->paddr,
+					       GFP_KERNEL);
+	if (!mem_region->vaddr) {
+		ath12k_err(ab, "failed to allocate memory for %s with size %zu\n",
+			   filename, len);
 		ret = -ENOMEM;
 		goto out;
 	}
 
-	m3_mem->total_size = m3_len;
+	mem_region->total_size = len;
 
-skip_m3_alloc:
-	memcpy(m3_mem->vaddr, m3_data, m3_len);
-	m3_mem->size = m3_len;
+skip_alloc:
+	memcpy(mem_region->vaddr, data, len);
+	mem_region->size = len;
 
 	ret = 0;
 
@@ -3305,6 +3306,13 @@ static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 	return ret;
 }
 
+static int ath12k_qmi_m3_load(struct ath12k_base *ab)
+{
+	return ath12k_qmi_fw_mem_load(ab, &ab->qmi.m3_mem,
+				      ab->fw.m3_data, ab->fw.m3_len,
+				      ATH12K_M3_FILE);
+}
+
 /* clang stack usage explodes if this is inlined */
 static noinline_for_stack
 int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
@@ -3359,77 +3367,14 @@ int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
 
 static void ath12k_qmi_aux_uc_free(struct ath12k_base *ab)
 {
-	struct ath12k_fw_mem_region *aux_uc_mem = &ab->qmi.aux_uc_mem;
-
-	if (!aux_uc_mem->vaddr)
-		return;
-
-	dma_free_coherent(ab->dev, aux_uc_mem->total_size,
-			  aux_uc_mem->vaddr, aux_uc_mem->paddr);
-	aux_uc_mem->vaddr = NULL;
-	aux_uc_mem->total_size = 0;
-	aux_uc_mem->size = 0;
+	ath12k_qmi_free_mem_region(ab, &ab->qmi.aux_uc_mem);
 }
 
 static int ath12k_qmi_aux_uc_load(struct ath12k_base *ab)
 {
-	struct ath12k_fw_mem_region *aux_uc_mem = &ab->qmi.aux_uc_mem;
-	const struct firmware *fw = NULL;
-	const void *aux_uc_data;
-	char path[100];
-	size_t aux_uc_len;
-	int ret;
-
-	if (ab->fw.aux_uc_data && ab->fw.aux_uc_len > 0) {
-		/* firmware-N.bin had a aux_uc firmware file so use that */
-		aux_uc_data = ab->fw.aux_uc_data;
-		aux_uc_len = ab->fw.aux_uc_len;
-	} else {
-		/*
-		 * No aux_uc file in firmware-N.bin so try to request old
-		 * separate aux_ucode.bin.
-		 */
-		fw = ath12k_core_firmware_request(ab, ATH12K_AUX_UC_FILE);
-		if (IS_ERR(fw)) {
-			ret = PTR_ERR(fw);
-			ath12k_core_create_firmware_path(ab, ATH12K_AUX_UC_FILE,
-							 path, sizeof(path));
-			ath12k_err(ab, "failed to load %s: %d\n", path, ret);
-			return ret;
-		}
-
-		aux_uc_data = fw->data;
-		aux_uc_len = fw->size;
-	}
-
-	/* In recovery/resume cases, AUX_UC buffer is not freed, try to reuse that */
-	if (aux_uc_mem->vaddr) {
-		if (aux_uc_mem->total_size >= aux_uc_len)
-			goto copy;
-
-		/* Old buffer is too small, free and reallocate */
-		ath12k_qmi_aux_uc_free(ab);
-	}
-
-	aux_uc_mem->vaddr = dma_alloc_coherent(ab->dev, aux_uc_len,
-					       &aux_uc_mem->paddr, GFP_KERNEL);
-	if (!aux_uc_mem->vaddr) {
-		ret = -ENOMEM;
-		goto out;
-	}
-
-	aux_uc_mem->total_size = aux_uc_len;
-
-copy:
-	memcpy(aux_uc_mem->vaddr, aux_uc_data, aux_uc_len);
-	aux_uc_mem->size = aux_uc_len;
-
-	ret = 0;
-
-out:
-	release_firmware(fw);
-
-	return ret;
+	return ath12k_qmi_fw_mem_load(ab, &ab->qmi.aux_uc_mem,
+				      ab->fw.aux_uc_data, ab->fw.aux_uc_len,
+				      ATH12K_AUX_UC_FILE);
 }
 
 static noinline_for_stack

-- 
2.34.1


