Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA8B606D830
	for <ath12k@archiver.kernel.org>; Tue,  3 Nov 2026 17:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tlOGZHYh;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aPyFHDBs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JjLXmPko
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4AMJnvFK8SwRYDl+HuoIp6UsfOovvQiFEHmiINggHuA=; b=tlOGZHYhpg/hMZ
	e0h/WV6YDqaEz3v7fI1tbC+KspVapd/6Wtbupq+7DfRjd081ipN5SQBrM5JlnOOTXVpfB0T9pu0ai
	OiYD6XIA/bJCpEbbwa6ScD8DYKq+A0Wy/hvROkQAkMa9PdguLD4TEiBQlDT1oMPstj9PDgvAzJpN+
	MfTKVyeAXdSLEXvFh+fSffohbZigfof56zELNBnuykf7ysd9XvFr+cNzMkiyr2ReExCT0gZpmD/Mf
	+JXdp98a37s01DCAyTLMj+EdFMM08F+ClNeBltBP8ZILveO+Z7jls0XSDbvLP1rynI5SGANx7OCeG
	1VhkndRkd/fQHU4Z1gFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIGz-00000003IoY-1KAb;
	Tue, 03 Nov 2026 17:26:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIGu-00000003Ini-0Xzx
	for ath12k@lists.infradead.org;
	Tue, 03 Nov 2026 17:26:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HPSgd3484393
	for <ath12k@lists.infradead.org>; Tue, 3 Nov 2026 17:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AMJnvFK8SwRYDl+HuoIp6UsfOovvQiFEHmiINggHuA=; b=aPyFHDBsXRkWmU9q
	eWjGabTYD70+YC4gdNFEPcZClMGh1E20RTDAHigJtsgcoDts34GB0MiPkUpkufsh
	OWuqk/WWngQeKza9d8JUzA/XpTW9PIfW5iCr1ugnBfXmYOzAWZkO05igoGLDYc2n
	tKpxrcgUCaabRyZ6c36Ip2U60w2EktU+9m+4kL9qdBODF3dmmUNpi1w37hJ8KhDT
	mDzs+XDI7ozEA9pMj+pu4lmcdk9mYzV8oeQg9JISxeREsFVIKRWstschb9DgNOnV
	KXKJ/Luv6Egmy5BzJpHt1AQ3PuF6Ijp7m7CK71Y2vDg/+r0siSJpT0/Bc6SD3Bp0
	kCt+yg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5kwsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 17:26:07 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1663fb7e005so4609569c88.0
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 09:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793726767; x=1794331567; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AMJnvFK8SwRYDl+HuoIp6UsfOovvQiFEHmiINggHuA=;
        b=JjLXmPkopFT1lET3PKo+OormBNoRY8+Z0i/OqYIUmGgTqk/5atlZdzBrcq6rVZZXQ/
         ga37WUyYIhkxoWhwSX55NtRalcrV97C96shh8a6ida+yD4Nir0YU0M5EyU5PykpIb/up
         i4RaxaQQ1Hw8hwXu98iSipnqoSrLxDoqrbRj2d5SlRWRNsfa+H6kZHAI1goRc7qSDG8V
         1SjX780V4ypUUVO4u90Fq2gANGMUFQGxOFrCTjcCWMabXz/jCICUh3IfI3bPaISA2uzN
         GjskNOv2gzKUJy+Dd28cYx+U3VgKBGnFAdmrOR7pwr+R/BAI3SV6Uj2jd4WqAer65HGj
         N/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726767; x=1794331567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AMJnvFK8SwRYDl+HuoIp6UsfOovvQiFEHmiINggHuA=;
        b=MZ87Q8GBfAzIzBx3/26N6xVphLlrWCiyMFSEWF8FmDGs3rPv0gCx0SpsTadahGhjXy
         eqksrVxZaIrZq9w9WwzoAcDsAg4iQ7wIDNGskkUYvEwn9vb7uFSvkr712DexlQJq363B
         BTqJGeu8yPu1XbaYx09GObHYAd8WW/NrFhbkLJILstB1hCqQym/ktzyFd+nWbrjh9ASq
         kOVJ2yuWOY4VMVlE0EXP2E6nKCQJ4RBDNk9z3gDaD1rnkLufEsFhAMYaTuA6et30Aeqp
         reBkzOv6hhwe09ghwr/0Ll3CqdTQEkKFj6NDP1fWlAbEvHD7vnJFqVtu0asNqFYb4R77
         EzLg==
X-Forwarded-Encrypted: i=1; AKwUvBxhxhfAU6vYv/Mv3RdgXxcYDGU94jmZNRr0qUBZjeAF566tvSBK1ij9wJzTkXg9UeZPI+fOCVc=@lists.infradead.org
X-Gm-Message-State: APuU4Z+3WRxf+K3yBh0j9OJevXhQl65sK9D7WmEjaEKc18tXw6OfiAwC
	RhHI6MumeiIYV9G+dHCKfcFd43cx0gJoBlDQrcxnVbaO8RLl+QeB3XhhBf7JG/oeWBzYqRq2k7p
	QSHMy4Su4q6bhXS+XSPaYPDIspPhfSWoBrgDxZN0unRL13a5r8Yz5kCE4a6SZ4rqGyYF15vYl
X-Gm-Gg: AYBFou3Rfp5NQqqaFCyEC43YLAy+iJky94Ix1Ryqyf6XCVZq3IgEYI1iFbtSvkjS8nZ
	Cxe0JyqVm4piUfzsmq48hg2ciUOivIirqpg8En3tyHeSiuBWt/yY09Iem6OHfZAEMt92Xqs6vdt
	rXlNr13qAcnLqL65iOH4hn0AlokLCJyMINm9RZvqZvYMq3/R/sR47B9ld6EFPDrhkinqkfk8htW
	G/WGDL6KiGFcYS4bDRNyl010jsqVPR1QCjfHmlNG3i4xSuaWqS8mQuk7B5kfnJUtILo57byGRPQ
	swK4CjkXRg2QPvR0T2kuyU+8rPVB2knN8NiheWQ1hcbj478Q+H5755HrMcUblRj9phJUQBAMvV2
	M7WwCwpkSNw0oTDtAsOW533SwGJuHomsz6araM4E0k85n9GJWkdI7QOZUMS7NiduExoQ1bUbrFN
	jVrYVawNzBFinVXItjo8OH4HaG7q5DK/3mln1zLy/+pBOCwd0JBsdgClzFrMS49z7ttIZ4PH2C4
	Mg=
X-Received: by 2002:a05:7023:90c:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1ac56d95448mr22902674c88.3.1793726766674;
        Tue, 03 Nov 2026 09:26:06 -0800 (PST)
X-Received: by 2002:a05:7023:90c:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1ac56d95448mr22902633c88.3.1793726765841;
        Tue, 03 Nov 2026 09:26:05 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm357310c88.8.2026.11.03.09.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:26:05 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 22:56:00 +0530
Subject: [PATCH ath-next 1/2] wifi: ath12k: rename m3_mem_region to
 ath12k_fw_mem_region
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-m3_and_aux_ucode-v1-1-e14f13fdfa41@oss.qualcomm.com>
References: <20261103-m3_and_aux_ucode-v1-0-e14f13fdfa41@oss.qualcomm.com>
In-Reply-To: <20261103-m3_and_aux_ucode-v1-0-e14f13fdfa41@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: E8d_36_nvtclzVvSlP9WPaUA2xNRWp-d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2OSBTYWx0ZWRfX5dcpQRcZynPf
 GXIzmPygVc2GNQyhtm737NNFMMmP5eEsS1jNwE2ko9D5EyjS/4ojGq9xMbiDL2yPSIRvmhSwZMN
 aMfa+1inNoa8oZU4yeWASkf6cz7vf9pIb9rR+o+ITD9dx9JsG/GYNl/fJi2mjrfug2nYe9GpdS4
 xGCeg/BZ0ru/qpjIzAh+C0E6oXMOERAwASFxZi7HR82PsWT4YksTXDoRReh2IDxWsI3RMR8zYSQ
 O4EBd9/Uc1aWCeXnV/mCE9mxuepKgFQSNU/52NECPxKGiO0uHbLon2Us8XaI4wTRWVZn4VBD/8o
 FLdi5mlIWg0GLn6Gnh9alB7FOe6C4PVAUyb2XxaLqXROB8bpOOVF869Rk7kCQt3CqJ956aXDbbw
 g9/O4tD9bKoiEVxRd9omR6lcRy1vRZFjrNI9y3bnnEciXIQ8teT0L9s1LObZEOtUi1lE07keGUS
 eFHNKzuqHt58CH2sbsw==
X-Proofpoint-GUID: E8d_36_nvtclzVvSlP9WPaUA2xNRWp-d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2OSBTYWx0ZWRfX0hO9m5b9bjvc
 AhosEUFbMXIocj9uj9bDiP0pc5iEkJTl2BT59fc2WiUEh2n7Pq09MY88X8bPQMcHKVdTPeQELov
 8qTbnzCDg6YC37CgyW1XkJxbt3HWgn0=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6aea192f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=J5wuaM5RjebvB5ep-PMA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1011 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_092608_179438_06970E3E 
X-CRM114-Status: GOOD (  15.08  )
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


