Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6019606A326
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 06:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1n161yMS;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AEpwSuDB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f+g4a68o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4AMJnvFK8SwRYDl+HuoIp6UsfOovvQiFEHmiINggHuA=; b=1n161yMSpyQYHB
	/9FVViVs+g3Mk0m+1qB2ESFQ+nvhA6CqUkRgcWhvUCRgbZ1NilnXZf/yQ2x9zBlkpp+ztFV1JWqwB
	dtuJSnDuvC0H7K2kDNl2eo9MfJsG7jwluw/9CsjsHD+zPl4tCsilXkH+faPDLMtmfJqGaMcOqBTmZ
	3b4etvBPLsDAl1FbvQHtUOuDLkDj92b9bU25/ykhZ/pRWQPt3K/ikvmDQBDfmN11zHXIf3YtiPEIe
	Ma3Rn3Cu8/4tLoyHJVW/7P1+AalLazoaS9riYMWuN4EHYqx2HfrIOfuvo+BzTB9QHExSBzK06D7g+
	/oOWAo6WebzYh4eBtYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUVy-00000004Ppf-2DPN;
	Wed, 04 Nov 2026 06:30:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUVv-00000004PoW-46bL
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 06:30:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RDRh3459466
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 06:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AMJnvFK8SwRYDl+HuoIp6UsfOovvQiFEHmiINggHuA=; b=AEpwSuDBXBr893DP
	ptRuIdI3D8LXLves0VONr22OECRU+8fQ6tQXNqmQRhEon144OlZYFQTyYVpngLRG
	CnakAe2vXFdx8O3hW3OHDa/opRpxnyjxrWmDnMqfWcXTQNyPy9927WWd8dY1FrMi
	ur8WtKlyQ507Y3UmMNPE/Nm15ZHbMN+wN3Het9ttmrMaZwcQ9mS7Yb50HXJKKAYl
	Xmkn+QkhgIrpXGaKkicVDsHI0dDkG+CB8KL8+TmHCF6ZrTvJUF48M6JbqUFXV5HT
	3X2Skc2RLUXmVete/9zZEHj3yDJd7IlYptco/tyzQPOUTqGaRdg/l5akxbdyySWm
	I6QDZg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bunhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 06:30:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9995cea88so4211945ad.0
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 22:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793773827; x=1794378627; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AMJnvFK8SwRYDl+HuoIp6UsfOovvQiFEHmiINggHuA=;
        b=f+g4a68onr5iIUmnB4I/v1w1quG/UffByAgBJOoSvStKzz8mNy6XJfoJdoCrJwQWzh
         BSfUe4zZy7IHzAE7CtnlbzNKukCjPe7qgq+ZrWV0c6Gz9bIp4axu3zTjHORmBPN7Jnan
         0lijSGQgx3ckBZHJwHnRSSFVD1H2A5PxyUBdbnLMo+xBYfK2QuFBPU25JzXi8FZkS2yO
         cYUphryb4DRUUDU3eLuryrv34g0cmedBrZsuP4ty7jWGYTmid21H/vdEO3ZBQHuFgleO
         LRdsHnPkU1t1ZgxTG7m960UH2Vpvf7O1R43qDKn6i8QGoErNZGeuM3my3UVqUgIXhZRx
         H5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773827; x=1794378627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AMJnvFK8SwRYDl+HuoIp6UsfOovvQiFEHmiINggHuA=;
        b=crN70cyljCnMXaW0P5T+Vz/vySZwX0dhtcvaxL7BjPbvbL+/+K8AltnGBmzvz1ANUn
         BY8mzQ58F5qNx5OTds1GTHquWIVz9IE4JnG+fdS7sHDhIAZo7Z/+FG0LdbBYt5aZK3JT
         AtcYuNWVF6A2oRzQ0dBfVxie3snO407Fns0VPMYzVrBnA4aKQvubDnlkZxiEEL0ekVaF
         TVvCgnzU1PZXuuX8N7FVkbZ92HCgdrnOXSFUYEIQLMSjfeMcVaX5TQdT4KXDXFjIST8Z
         H0BmyFvkPylH4zh0D7YyGNfZXiPCfe5fuplw3eIrHLL3XvZuhNsULweL+/EVRMAxYZiI
         HL6g==
X-Forwarded-Encrypted: i=1; AKwUvBy29NP03Jb8HTVXESiNz6YwUAghtx3HRq2CmkxBv8AFr0VQtMbnZEeemx1C8no9Clrx1JU1GDM=@lists.infradead.org
X-Gm-Message-State: APuU4Z+rRSSnwF3agXxm0C6Lpog9F/I3nEQt1gvPgZMb1gud32QXB/Wp
	FJeOXrgkKHZpvRsFCEHUceLIQn1AJB461WXI0PtWyPDbrxaigwW8Dti8l0WhTEOPb66t/G6u14g
	0nZXNQ0sh7+A4MMOLGQNRgb3+rMkU3Fd7gixVGAM7ay8BETUdoKCxbBZUhI7gXT+gSmTF4599
X-Gm-Gg: AYBFou3D9eKNUgCjbwAKzjoiVbthEmoOhoOGr2Oadv3NqONdvkqzAF1ddwKLdCSYSJp
	A4Vhql/LjBl+bRfuSoHc1LoKpZB21vZjVUf9PpMq/x1IJ8i6iRphOozVUEj1thOHdsrDBJMs4h8
	wtRPLIF2u8iW1+ce/pnKiGY4ElaUk7skUHX2Sd4Y7KBbkRZAeup6yA/2fsGCo+23nUsRClzFFhk
	4yVvverPFGqwccSP6aPP/ShM7kcQhMtEUEkF4xGQ3P2aDaAGYnpsLh+heyoGohfgCxGmM4ijjH7
	EB197tzUUgtoyk2HsMyMX3f+FsXy7f7HJjoUa8GOwgJDWJa885KDqpJ5UnLAf0dXYdn5IdKo3oy
	mN0F+gKXRdXlNDiSoo4mRkmfH1JojQ2qY+48FlhlspUPv65HqG/Dqb/RIk/4sTpPab5xsldUPTL
	kypjXb60VHmlNIq+jN2aIkU2SE70jrtLtmpDQvjKQ3gBXryMHrrD3DAcROmRdccrvf17PN0f5xZ
	A==
X-Received: by 2002:a17:90b:1a88:b0:3ae:3f20:7056 with SMTP id 98e67ed59e1d1-3ae89746c9cmr13784750a91.31.1793773826556;
        Tue, 03 Nov 2026 22:30:26 -0800 (PST)
X-Received: by 2002:a17:90b:1a88:b0:3ae:3f20:7056 with SMTP id 98e67ed59e1d1-3ae89746c9cmr13784734a91.31.1793773826046;
        Tue, 03 Nov 2026 22:30:26 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09445f7b3sm2420646a91.5.2026.11.03.22.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:30:25 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 12:00:07 +0530
Subject: [PATCH ath-next v2 1/2] wifi: ath12k: rename m3_mem_region to
 ath12k_fw_mem_region
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-m3_and_aux_ucode-v2-1-b6c335c14dfe@oss.qualcomm.com>
References: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
In-Reply-To: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyNSBTYWx0ZWRfX2cllrbAERzri
 ogcAh7PkmE1jRvlDfa9+PW5uAnqsuClc4K7HyeJq1YToWnGsGvQP1pP3Klu3k43WlEf830tTZYC
 Da0xm3HFMfSRZ/kBDR/4RI7twDXKY4Y=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aead103 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=J5wuaM5RjebvB5ep-PMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: i4RHqELzLtghKUqhwcvCSRFKJQ8SNp5m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyNSBTYWx0ZWRfX3eq6nh4YMuRj
 FOES4BOGez+sNmfvN3DbDwEixvPb769fYHQFwnTSPyZS/j+4hooKJd16myKAcdfbacgYa6E0kub
 /sTfimgB6Dct+ePmjX/K0slG+IlZqgOxO9HHpBMZRNs7NnVx1CodIEjza9ZJyUPkbV+UHjUzXnY
 C7/1sKnhQWi5wujLMfZq/5NxIs8a+IkqS4feVUh3ntoWaVVfqpVJ17LHbR4+Dpr3gcyO7DgzAnh
 PbtgnK4BuCNDDyyWKvTYRMLVFmPhIzyraHBnrFZHRHNSOarBu+WDyA4FSeOUovr0rOSwwcTX6nj
 Uy5ZXINCN5qXc3a5wdmiaARbeZopNWgK9+el9O+2SrcblXR5KJHglWmLwspBrtt3yUQJbeLyG1A
 kysCmMTBTIobq/AAj1nxvX+z9ZQUWs+BrHhdnkKLIApA72zoQ2f4UlCv2RE53BK2krS4rQ9YipF
 fUMXltrLARJ+F4iazqw==
X-Proofpoint-GUID: i4RHqELzLtghKUqhwcvCSRFKJQ8SNp5m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_223028_023743_E823D5CE 
X-CRM114-Status: GOOD (  15.61  )
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

struct m3_mem_region is also used for the aux_uc firmware memory
region, so the name no longer reflects its purpose. Rename it to
ath12k_fw_mem_region to make clear it is a generic firmware memory
region descriptor shared across m3 and aux_uc.

No functional change.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 12 ++++++------
 drivers/net/wireless/ath/ath12k/qmi.h |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 817bd820623d..b1efed1702cb 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3227,7 +3227,7 @@ int ath12k_qmi_load_bdf_qmi(struct ath12k_base *ab,
 
 static void ath12k_qmi_m3_free(struct ath12k_base *ab)
 {
-	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
+	struct ath12k_fw_mem_region *m3_mem = &ab->qmi.m3_mem;
 
 	if (ab->hw_params->fw.m3_loader == ath12k_m3_fw_loader_remoteproc)
 		return;
@@ -3244,7 +3244,7 @@ static void ath12k_qmi_m3_free(struct ath12k_base *ab)
 
 static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 {
-	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
+	struct ath12k_fw_mem_region *m3_mem = &ab->qmi.m3_mem;
 	const struct firmware *fw = NULL;
 	const void *m3_data;
 	char path[100];
@@ -3309,7 +3309,7 @@ static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 static noinline_for_stack
 int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
 {
-	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
+	struct ath12k_fw_mem_region *m3_mem = &ab->qmi.m3_mem;
 	struct qmi_wlanfw_m3_info_req_msg_v01 req = {};
 	struct qmi_wlanfw_m3_info_resp_msg_v01 resp = {};
 	struct qmi_txn txn;
@@ -3359,7 +3359,7 @@ int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
 
 static void ath12k_qmi_aux_uc_free(struct ath12k_base *ab)
 {
-	struct m3_mem_region *aux_uc_mem = &ab->qmi.aux_uc_mem;
+	struct ath12k_fw_mem_region *aux_uc_mem = &ab->qmi.aux_uc_mem;
 
 	if (!aux_uc_mem->vaddr)
 		return;
@@ -3373,7 +3373,7 @@ static void ath12k_qmi_aux_uc_free(struct ath12k_base *ab)
 
 static int ath12k_qmi_aux_uc_load(struct ath12k_base *ab)
 {
-	struct m3_mem_region *aux_uc_mem = &ab->qmi.aux_uc_mem;
+	struct ath12k_fw_mem_region *aux_uc_mem = &ab->qmi.aux_uc_mem;
 	const struct firmware *fw = NULL;
 	const void *aux_uc_data;
 	char path[100];
@@ -3435,7 +3435,7 @@ static int ath12k_qmi_aux_uc_load(struct ath12k_base *ab)
 static noinline_for_stack
 int ath12k_qmi_wlanfw_aux_uc_info_send(struct ath12k_base *ab)
 {
-	struct m3_mem_region *aux_uc_mem = &ab->qmi.aux_uc_mem;
+	struct ath12k_fw_mem_region *aux_uc_mem = &ab->qmi.aux_uc_mem;
 	struct qmi_wlanfw_aux_uc_info_req_msg_v01 req = {};
 	struct qmi_wlanfw_aux_uc_info_resp_msg_v01 resp = {};
 	struct qmi_txn txn;
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 1b1c88906f1e..e43e4a42aad7 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -118,7 +118,7 @@ struct target_info {
 	char bdf_ext[ATH12K_QMI_BDF_EXT_STR_LENGTH];
 };
 
-struct m3_mem_region {
+struct ath12k_fw_mem_region {
 	/* total memory allocated */
 	u32 total_size;
 	/* actual memory being used */
@@ -152,8 +152,8 @@ struct ath12k_qmi {
 
 	u8 num_radios;
 	struct target_info target;
-	struct m3_mem_region m3_mem;
-	struct m3_mem_region aux_uc_mem;
+	struct ath12k_fw_mem_region m3_mem;
+	struct ath12k_fw_mem_region aux_uc_mem;
 	unsigned int service_ins_id;
 	struct dev_mem_info dev_mem[ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01];
 	u8 dynamic_ddr_support;

-- 
2.34.1


