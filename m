Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E20606AC85
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 07:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CLCNK0ju;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ecVZSRR/;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MeYDPFpE;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VWwNve4n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=; b=CLCNK0jujDnBN0
	D/ti53y8EII97qPFxLn3eEtwi4wTs31PPWGA6FEFnHxAMFREQ8F1Lx+0EBxbzetiGONuWOreV4aXv
	8TOr+mYQXAoMkyEAu4HxJKHc3RTcmrgRIaq2SikJ39CpSAWfdLMqigYM8eJlo5nLiaavaETcQ/CZA
	ASvVOP04uWv6OALIZRb30G/uBVXAjqaf8zkP7kcHKLjjGwiYxxArh3m5aAkLRzyl77DXzKdN8QUsa
	Gp1jVwPmn7em1n5k73np+m1Vd14icgn4xZTzWsRCpbuD3Yl15Vv21jzt65kgzZzoLz+nJ7YJjHyXR
	FTdO4gC1VY4O3sOyxLbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9I6-0000000FgfK-3Ok0;
	Fri, 23 Oct 2026 07:02:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9I2-0000000FgYE-2mEg
	for ath12k@bombadil.infradead.org;
	Fri, 23 Oct 2026 07:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=; b=ecVZSRR/l9z3crWysquT/CMTGm
	O7PU5SJ3PJSqBNHSnGosNZAUc5txuucNxY+RjxfnHd36DOZ0Q9L/bLyesoDzgEzRPa69br+rv1D5Y
	uA/Wn9ajEmsJ/YI/VXRVQhL2zWm+sGy7YlltTzTQqPtmwV8UuNiNX75NFQQiMuK7Wj4HaOt66SnCF
	T9zs22ezVZqJnJqL4pOL59GMI526pXltmRtaWiC+OsrjuiFwx5lNYyEN7J9MpRFGOgaI04cuKTr4f
	GH3bab1DiINPfUwP35PzaSY5gsmNGlwNc1PctSUhXssHTI/UGRXfvY2kNCBHdIjm33pt+MDlzifDW
	uYPAvCzQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9Hu-00000009vlQ-0fEe
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 07:02:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1ErN12389374
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=; b=MeYDPFpEXJiuyK1R
	FTSVjmziSChxYcP1uDYdu/SfKzHsysXiahXiQcZGZx+kogUzpJkVUBK9oU5wcfMf
	zz/Dul4sEZIgZtPbuwJSlYP/mtJS2vUPxTBAJyRaLxFuRwUMGcBv8w1e0I6kE1TE
	PuiQVIa4mUyXCa9OBL7tbLutpw+Ve+2BjkwnnXeNin1xDsQxqVsC+hcEy5C2HB+E
	g2tWa+rptx26aWUXRPlqWIVclLmQ51nVlBrFw9ZExnjQlxgome0X24D6yPhdCRYN
	cBogC3s/3dDLKWyEx97klaXkZZh9pM5Rsj14fEkp1ou+LYYxmfbukvvjOJ1cFf5o
	HRyajQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpac2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:01:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ccacc75a997so275099a12.0
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 00:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738917; x=1793343717; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=;
        b=VWwNve4nIz+M7xEamz4uSy3WY/SSjGHTSj/6cxhrNfPVbzsbG+GnuJaBqsMS2l7tYi
         SUWfohnO9/pOvVjprfGHlI2+FU5Gfy+WNcDLlvaevQro/8dHnpRDQqj0baXCqJlubUoQ
         SLpiNAK8kjn7CLPkxWxjheX0BcJoOg+kQaCPVES1D3TaZK5Bo0rETDVb2y6lw2rYARIA
         BfzoYwmr5EMY+S9oczwqpI23PMt4KI29FFS7z4iPzS80fut62CcmixrS/cTZnRGt4iDw
         7MshmCPDN2gyNexnVUkBdRTt1UPArcVCPSJohy/hk3Bbs1uez4GW7bnf9o949FkY+s7j
         p4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738917; x=1793343717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=;
        b=FixA52h3N6Zme7V2IBEHFIR8eXkV1Gx5oRxv/T+EWMg2MrIWV0m/zQgRl2ucMgHxUW
         M44PRN69twj5FfNivp+9gutuLaL+sKlT+uwPgtmutY38JcbWEq7g60dYSlBoIpARupXp
         Tn6msNAVJiuvYBOIfs+fXVao6H2aIgeN02+tmPl+xdDYl3eoM0Qyce+cSL5kkrlYaAbH
         xd5Pk5QIvvwB6qXNrYWKhTP5mebt568FnmLYB/TCxk++5YgVYBY85+aKx0hxliTN18cu
         Jzac3rKCDirIFrizmeCW9uyfyootPAgauryXVdbta4e3Fi7esQiYNGc2D8lrLn1gjFrh
         XiOQ==
X-Forwarded-Encrypted: i=1; AKwUvBze90GqTsIdu9ebMtwkoAheu9yJIOLPjlvIl1zmP/Izzj8Fvin6N+N+KEcoKSFwVOalaRSuLsA=@lists.infradead.org
X-Gm-Message-State: AFq9FYJs+t70UXWeCIf2rRz2eDXTdYg1iCQPF9YVaJyWTR2y4fZjUevC
	q4mD8cqsgE8cxACNfBnBliBJUkUiJ9YF1dnTS9c5wwE22LysSjtKn3HFz1C34ISPCLUs2JY/TLX
	Asso0D5C2l5OzrNQaa4iOXM2fO2CGTd1k3diCeEYsbSSIQmQIsCKAyhGF5oEN3RgJ
X-Gm-Gg: AYBFou0VrG/eibeLOEl+pwutK4X2mYk67ZBDFrHZIL4seemfrx5pk/toKTEH9OQcNOi
	+Ywv2TP/9VW2S8vxVODMwiwReTPYhwrRigELweOQ0Lm0INXiRz5ceRVRxhNDFWJAT2fIqVGstC1
	/0/iYnBFRmNvwU61hhNVUPTlZE3A1+zJelsTGsP1lADAJhSsSCwLo0VXPv7JcpFjgujuKiGBIPK
	o+Yu5rhprjWxVm9lK52Qn6AhkQv3eZcaMdL6WXg1hk+yYoxcXFYC5gIS8lUn9LhC6aFzOPm5ce9
	8dbjVTOkttT/NG5b0C+6E1QgdQjguze2RilNEGJs5jrxR8CsMoZCqGfZetJrdMH/lpYEdWOh5/v
	QJboP+pIxCPwi1ngleLmgNpVBgPyJNH+RoaQWCY6I+vXr24dHjQlrYlRduHEP+AwX4aPRh/kFCH
	eM0aHB53e7332cLx/z7ITKxA==
X-Received: by 2002:a17:90a:dfc3:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3adce02eabfmr1018334a91.31.1792738916971;
        Fri, 23 Oct 2026 00:01:56 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc3:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3adce02eabfmr1018315a91.31.1792738916469;
        Fri, 23 Oct 2026 00:01:56 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:55 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:13 +0530
Subject: [PATCH ath-next v3 10/17] wifi: ath12k: move MSI config to pci.c
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-10-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXwzYwi9GeAvcT
 4Uz3KsQ+1ZmYlL8RtNltvMTSMLZb7lc8HKvhnp7Ff3EG52UQI9Pqh0atP8JtOaG1FW+9rG1ciOF
 FvEkNcOxqneOhG7sHT9klCK8HSE0CXI=
X-Proofpoint-GUID: uBOp1TQ2-sCezdgAoSLbGMO7jg8OZwjF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX6Aj0W10LF7y0
 0kQPJ+EaqRBjpNnFYwcW77HGeY7JFMzjwTWExgBBR/179/CDqOEu1uygMM77BMqb6gdRhXlPH/U
 cJZpsUJ1/aDIcU9/Tx+aPQOseZernueryM5QYTKnm43jYDsBDVafeTOmm9tPCBLVN65Zb5QTy6B
 8UCVW1muuwp2Pt4yeKGdYHyKNYhCwuLP1ycahy5wKaHHYPcYPlj1tzw4gLpSOOv3Lop88IXb6ko
 n17SZbSTAz4N3mwIMitjNm3B3VY+sRdJxCG/uR82SCQhJKGFSMwCVfHqsehIKpDdjNkGYubtd/g
 jcOT4bLk3rqZ/gwATXWmTWMrtRl8uMoIPCvRV3LfCc40AqySj2VpqetQLKfIViXYzUj15C45/U2
 vvpnKIDP30/uKk0pntHWR7xNkM3x/6AuZIslmwnhLjhgtlRW644l+mMH/w298rWcTCmhaUtf/ze
 s9cG0Y3KMa2HQO+Xlag==
X-Proofpoint-ORIG-GUID: uBOp1TQ2-sCezdgAoSLbGMO7jg8OZwjF
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb0665 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qUmDSaCxm7SoV8805q0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_080202_532935_DAD77671 
X-CRM114-Status: GOOD (  14.28  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move the ath12k_wifi7_msi_config array from wifi7/pci.c to pci.c
so it can be shared between QCN9274 and QCN6432 devices. Rename it to
ath12k_msi_config.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/pci.c       | 14 ++++++++++++++
 drivers/net/wireless/ath/ath12k/pci.h       |  2 ++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c | 19 +++----------------
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index e6fe891e58b1..fe0939ca890c 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -40,6 +40,20 @@ static const struct ath12k_msi_config msi_config_one_msi = {
 	},
 };
 
+/* TODO: revisit IRQ mapping for new SRNGs */
+const struct ath12k_msi_config ath12k_msi_config[] = {
+	{
+		.total_vectors = 16,
+		.total_users = 3,
+		.users = (const struct ath12k_msi_user[]) {
+			{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
+			{ .name = "CE", .num_vectors = 5, .base_vector = 3 },
+			{ .name = "DP", .num_vectors = 8, .base_vector = 8 },
+		},
+	},
+};
+EXPORT_SYMBOL(ath12k_msi_config);
+
 static const char *irq_name[ATH12K_IRQ_NUM_MAX] = {
 	"bhi",
 	"mhi-er0",
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 3097afb03432..55cc875f9ce0 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -96,6 +96,8 @@ struct ath12k_msi_config {
 	const struct ath12k_msi_user *users;
 };
 
+extern const struct ath12k_msi_config ath12k_msi_config[];
+
 enum ath12k_pci_flags {
 	ATH12K_PCI_FLAG_INIT_DONE,
 	ATH12K_PCI_FLAG_IS_MSI_64,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/pci.c b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
index bb617bb6b71a..783c5d020f07 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
@@ -37,19 +37,6 @@ static const struct pci_device_id ath12k_wifi7_pci_id_table[] = {
 
 MODULE_DEVICE_TABLE(pci, ath12k_wifi7_pci_id_table);
 
-/* TODO: revisit IRQ mapping for new SRNG's */
-static const struct ath12k_msi_config ath12k_wifi7_msi_config[] = {
-	{
-		.total_vectors = 16,
-		.total_users = 3,
-		.users = (struct ath12k_msi_user[]) {
-			{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
-			{ .name = "CE", .num_vectors = 5, .base_vector = 3 },
-			{ .name = "DP", .num_vectors = 8, .base_vector = 8 },
-		},
-	},
-};
-
 static const struct ath12k_pci_ops ath12k_wifi7_pci_ops_qcn9274 = {
 	.wakeup = NULL,
 	.release = NULL,
@@ -103,7 +90,7 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 
 	switch (pci_dev->device) {
 	case QCN9274_DEVICE_ID:
-		ab->msi.config = &ath12k_wifi7_msi_config[ATH12K_MSI_CONFIG_PCI];
+		ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_PCI];
 		ab->static_window_map = true;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_qcn9274;
 		/*
@@ -130,7 +117,7 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 		break;
 	case WCN7850_DEVICE_ID:
 		ab->id.bdf_search = ATH12K_BDF_SEARCH_BUS_AND_BOARD;
-		ab->msi.config = &ath12k_wifi7_msi_config[ATH12K_MSI_CONFIG_PCI];
+		ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_PCI];
 		ab->static_window_map = false;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_wcn7850;
 		/*
@@ -154,7 +141,7 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 		break;
 	case QCC2072_DEVICE_ID:
 		ab->id.bdf_search = ATH12K_BDF_SEARCH_BUS_AND_BOARD;
-		ab->msi.config = &ath12k_wifi7_msi_config[ATH12K_MSI_CONFIG_PCI];
+		ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_PCI];
 		ab->static_window_map = false;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_wcn7850;
 		ab_pci->window_reg_addr = WINDOW_REG_ADDRESS_QCC2072;

-- 
2.34.1


