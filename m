Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FC3606A331
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 06:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CSjpKHoZ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RgT/i3c3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EVMLn11U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D1JMuHDuJB7WM40OF4LWjX7Ih9UPYlKv1FoFNhq4gJw=; b=CSjpKHoZuBw7Dv
	Nke1pR1a7n2Hoyqi0LKOUCpb+IUi3qku+ZnFraCpZcwWbZOwSrgPqo02KAnjRW7Ai+II4eQS8WbQN
	kHQ7XFC5mRoZ9/igbl7Xus+l7jpriECA7CsKZe0PCkVe3yw5eYrGYZlbwcOeYzYEjjKj78/pk67+k
	xl9z+ljgLy2EIBhOZJ0mBXKBi//dr2utKdVjtVKVCHGhPe57ZZ4uJSFgARL4mkccDnm0OXTEr5L9R
	UxjdQWTXgxfeIajST2nphF30x19wnh82agZZz2vu/jWiFcBkVs0hoPMCg+s6cANevccqlX7yLfWtv
	eeHlCArkZpInORk2gEfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUW2-00000004Prd-2hup;
	Wed, 04 Nov 2026 06:30:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUVz-00000004PqY-29pi
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 06:30:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RDRi3459466
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 06:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D1JMuHDuJB7WM40OF4LWjX7Ih9UPYlKv1FoFNhq4gJw=; b=RgT/i3c3iJUiddzO
	GmGwVFZt2/pEq+5N4cNtAXo9ee/0wzg8lk9o5/Ux8o1QkmdPH188pU5NnFweZSQw
	QWbFS5NSfgriTc8PhROOJtbXr5/AlpUjV1c8vHw0J7+BfTw53prf5sPQymy/bc0n
	WfFwsuj8/ZWx31xraIH6klgxc3wJuepw0B2hleBpqwHLldRLsSyDFVODgn54yzho
	ytdQNlQ8FtikCZRpnzwsG6trvpjIgwOjfAE6QjmJ7HKiXxBfHcSzSA7xU4PMq9W9
	CeoQmW7CA+fa/vt8aaYFOWh6CrJezXx1dIQtmvxCeq7um3WjSSvwx5hrf85+O6v9
	izD0ng==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bunhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 06:30:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae59682799so514827a91.0
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 22:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793773830; x=1794378630; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D1JMuHDuJB7WM40OF4LWjX7Ih9UPYlKv1FoFNhq4gJw=;
        b=EVMLn11UFF3/nBetXM+aMfiuzbinsgAdlhAdy6SU85T64irdlWFx6R+hEZHotatKgl
         OZ/XT/SsNCHD5K1/PmEmEpb/BnyUBJY6eeqdh+cOyQWax1PsGWvgo5Dzm+1UmGfoZIRj
         yY7KHLKSlFRlR4dV2YGqT60N3ngxTLl/8husgP+9dIIZEYm84MtZyEKxMOgvO6BuHItA
         f6+rndvrNZriPHFcgNZGCly0Mx1yhO2mXqbxQk8mP5GvECyluNAEmBoR4/EmcYFgJRGT
         PhwEnqfu/nwvcd6kMy7FyAU+mzmSDmlXqrLtEnU+ti8RHCZfeleNeiICNXCTN0iL9q73
         xyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773830; x=1794378630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D1JMuHDuJB7WM40OF4LWjX7Ih9UPYlKv1FoFNhq4gJw=;
        b=AWQC24gzC/tgYq4bjIn4jhnBDe7Kz3KOxTgwppNZMZj6Su8IpY9xioMclSjjOnxD/d
         eSKBfRMR+jRfVvR0FD0BLFIWS3qAhR/XVQoEMmUEU83kkfcYd4RwCW5TvFqqtzQmiTBi
         WzSo0COvCnul5xtvNub8VucoFTDsGumEqYfuwL36qWIVsvBOs0+o2vsWH1y5uk0aEifl
         PIGeLjlp669ErbmtFiB6dZZ677oMVUYYvWgShJTzUaOkSzIUCD4iXgs/q8JuG1vhuMka
         XGcXx9f1siXYQj4RVqfSY8o8w0yGGly3C4tIG42u2JNR6CbhxnTbgYhOQnhaAwckV2Xj
         CboA==
X-Forwarded-Encrypted: i=1; AKwUvByu7cx0SmQmAefENNPJOHNKLZsOn+XNhSVJugMPwNiZOOcK6eX8xuV3TDj8gek4SEOE+Bb2hnU=@lists.infradead.org
X-Gm-Message-State: APuU4Z93Vjpmn9Ce8z4GdXgzHmzIt2l3D4jusT3rfRfeGty1FpK65QdP
	PNJF7oElgR45eITAh/K2p4KI2kQ9Qsjib4uAjyXpUbn5+p7IlGEImEHtd7MddFygXK0imbn/Gys
	my1KaPBUeD4v4+vPBYOlUh7E00aNkPANMBh1gTcd9A5+Y5PGZzAvjycFwITbzaVFd
X-Gm-Gg: AYBFou1LiTs7Kb3kJ7gjWJUU7rjt8K1PKZ7hQbRslH+FY5mpOQzaVeDiocu4/vgwwT0
	ssee0/NHbcQXxcIG17W5bBOv4PSbcgMoy7wPQ5cO9tanR0EODMCVdC0+Rr4G+vIeXR+mA84M0qu
	13X340nOFrTSyS37/6BHggHvJU61El83IfDlppfqXQhLUP0d8CRWXPfrbKUlOXId2ZvT0Lz0t+x
	DZ/XH7d5lnuSNxzFXMKXr8xlr94kOIUv3zdWAGiLa7GgyOJkw7KBDCadhrN9tlyTA2UO1eTLQyL
	hCBAAQR/tVwcnbolbmTOR0HLvQIgDvaA8TPD1HnucIXqpVgHjSWYbcd9oIFFDRzZw3RIwt86IdQ
	CF1tUl6Y02XllpmUP9Esbapvt/8DWztEpNZ7jrDUOwobCIUAuILQgyRj8l0Dxa4cI0AEsM/IsaQ
	t4OELg9SkHL5TqBByHtpjm8Nh+7ecOnBO3oNJQFwxsnh72L7PrjCWHZyK+sF3bQKNr2m9WTkDOW
	w==
X-Received: by 2002:a17:90b:134c:b0:3ab:9c73:12f with SMTP id 98e67ed59e1d1-3ae897ee533mr13031697a91.24.1793773829603;
        Tue, 03 Nov 2026 22:30:29 -0800 (PST)
X-Received: by 2002:a17:90b:134c:b0:3ab:9c73:12f with SMTP id 98e67ed59e1d1-3ae897ee533mr13031671a91.24.1793773829039;
        Tue, 03 Nov 2026 22:30:29 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09445f7b3sm2420646a91.5.2026.11.03.22.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:30:28 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 12:00:08 +0530
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: refactor m3 and aux_uc
 firmware memory handling
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-m3_and_aux_ucode-v2-2-b6c335c14dfe@oss.qualcomm.com>
References: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
In-Reply-To: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyNSBTYWx0ZWRfX2bRTMwhR4tHl
 Tc5Q8cxde342FDexW5tkKDQygmZWgrllvaZp/1dpmAN6F7fYbHLMuNpo3mPf6aP/h+NGLV6udXe
 S4NPiEfvJS6FddZHBiPDkQdii61Sjjw=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aead106 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7UcVal2zOK_enNmMlbUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 3MrpZHhRDfHx7lY3cDG5F4kHQx2mPKo2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyNSBTYWx0ZWRfX+VrvPSOjlwyZ
 SIIACjkksFCno/svzZCxaiUw97XReQOM6tVKlYEOhEsZ+vH9mWvpjQeECMr7RKAJhJGQouqIFsW
 b9FffyN29JDUDQ/UXTDZVpcjiA5VDTuNBw0AImtPne44G0Fs48m5DImiRck+V0iYvtx4yVIMy5d
 ewhYoSX3Se0Zqh3wD3KYIqyQJXBti27EyieLFJg121lyyOd9LHhMXeCOnbd1+y0e5qJp0ytHyPF
 twy9bo5/SaxdmoN2vzKZ+U4ouQyWWrwkSMPeN3ljAlkgVT3N03wTJvxEgbOAu+8zkGdxfbYbDww
 5u3iu9ImGgVdB+HvnflnCTxFTvDUOecr0gH0QRnvJcVxvTuM2X3mltYuc1l1BIr22mwG3tBzVDQ
 77HQGpKTdQpwr7JWs3ISo9Ev2zjv6yHKpO0vauyNQpt3MbBPEmL7G1WT7SZxbzfiOaRaCNHB7eh
 hMZ8AmJY5rDhKwK8d1g==
X-Proofpoint-GUID: 3MrpZHhRDfHx7lY3cDG5F4kHQx2mPKo2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_223031_574955_FB212C6E 
X-CRM114-Status: GOOD (  21.73  )
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
 drivers/net/wireless/ath/ath12k/qmi.c | 164 ++++++++++++----------------------
 1 file changed, 55 insertions(+), 109 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index b1efed1702cb..237df9198e76 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3225,77 +3225,71 @@ int ath12k_qmi_load_bdf_qmi(struct ath12k_base *ab,
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
-		return;
-
-	dma_free_coherent(ab->dev, m3_mem->total_size,
-			  m3_mem->vaddr, m3_mem->paddr);
-	m3_mem->vaddr = NULL;
-	m3_mem->total_size = 0;
-	m3_mem->size = 0;
+	dma_free_coherent(ab->dev, mem_region->total_size,
+			  mem_region->vaddr, mem_region->paddr);
+	mem_region->paddr = 0;
+	mem_region->vaddr = NULL;
+	mem_region->total_size = 0;
+	mem_region->size = 0;
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
 
@@ -3305,6 +3299,21 @@ static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 	return ret;
 }
 
+static void ath12k_qmi_m3_free(struct ath12k_base *ab)
+{
+	if (ab->hw_params->fw.m3_loader == ath12k_m3_fw_loader_remoteproc)
+		return;
+
+	ath12k_qmi_free_mem_region(ab, &ab->qmi.m3_mem);
+}
+
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
@@ -3359,77 +3368,14 @@ int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
 
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


