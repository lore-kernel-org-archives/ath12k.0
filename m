Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715FACD98F0
	for <ath12k@archiver.kernel.org>; Tue, 23 Jun 2026 04:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1IZbHyzoXo/3ZP5PNgxLFxk3VP+JtWM62ECDSBs3Fnk=; b=3ywPezyil7KzKew1G/ularrxbD
	BlLq7c0bP8bqlusJzxrSICHpw8/CFzmpUpoXa1253uERVGjPFPKc2RYJV96bAsT/QWW1ZUKh8DWUZ
	6fEtHFZxBjBOYM9Rucm/8RTCZUXSjSibySi/1RwUws8qDPzJoOm1BH/1bmcQzzCl4JG4PtTreYjYr
	DvHMFTCNHsk7yecTAUheMMZVswgFl40z8X8buo1hVV1jUDpQ/gFHw+8QAk2F1QEFcuPhUuVBrjUGR
	i+e4COv8YP17eflmTWepMjfC/GCEmq4DCckHzVBHD/w5+36DKcO3RDf8f4+WcjpmNZ8tHk7eqhG1V
	Dk4HUOIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbsVl-00000005gao-0GfK;
	Tue, 23 Jun 2026 04:13:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbsVi-00000005gaT-1ZtQ
	for ath12k@lists.infradead.org;
	Tue, 23 Jun 2026 04:13:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N0hdKJ2286221
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 04:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1IZbHyzoXo/3ZP5PNgxLFx
	k3VP+JtWM62ECDSBs3Fnk=; b=SxllELRgb/YLCyRRluN3K3pLVnQ6UqTmHXZYva
	NNnJwVkNr1PAFljr3hu7C0o4iMXhQOt2EqW7jO/YwBTW0977d/rSF6Oe88+h+3rs
	b53YVF73OdW+WfO0hpQaqtBLi95lbjZDta6IBF6401kR/8psuz/GlXvf7HhS2xkW
	MlPRKvTrSwBuoAnUzr6jHJufgn0YQSCTmYpPc21Le5CRbn3rP3oMjUJ5/PvkyO90
	KAwZZ5jSawuHQ92mWTDnhXALWvv4TDJshipsBXEb+O7ispgXVsu5nwGqZN/3lLuP
	6ueDdfgxGcDrg9oBDI3BhYL2PSY6RHIQpAEW3CeeNT++kM9g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3cq3cgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 04:13:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845338eb797so486480b3a.0
        for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 21:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782187996; x=1782792796; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1IZbHyzoXo/3ZP5PNgxLFxk3VP+JtWM62ECDSBs3Fnk=;
        b=Eabtpk/QBYXo1lp0qb6G99CszdnBAPyQs05dv2Joy0y6OxhtVOBROjT7NlVInWvWx5
         VdaBLUi+Bd4K5r0hh/AqDfGyrv+iVGMzFgw56Lm3Xw90ATj9znxG5g2wpTDAYBxrpFXr
         XM+K0KDuEA0dGg0OB6GatXJqsG/zNSszurtxXtelKTEHUpBZBN+XFWncwnhKoagKZSrO
         5NTlwNQxTpNKUryXFX1tWVtwIpc+N0p7jKpgJT4kabRLicBlgyGb9OSj2HTvJxLCUc2s
         4a0nc0js5zK70D+nOLHy6XMsBpFPe8uEIa15BGMOOgEvML9fICtRn/4S5AJywi29xyiR
         uboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782187996; x=1782792796;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IZbHyzoXo/3ZP5PNgxLFxk3VP+JtWM62ECDSBs3Fnk=;
        b=ZC5SKqD/3hx0YmI7bwrMA5G/GORlvIBfI9GEXfI7qBcym7thWI+yKQfl7IG4pPe7s1
         GMGKfGUjALPCtmxdya0qCi/KrgySO/XCmP7TvHaYMk+Zy8X+zYS7A6GhWRxCdBVyrMrH
         rUmIA0vWMotrfopxDCu8NamXyySMKir2T2ZfArDMKAaJR/LyEV+6etz7zMtEE3i8QgRI
         cDI7Gmexq6X2N7dtHfWfYa5NT4S3J942UIrMbq0jihD0kr0cvqW/PvnJSAuD7DxDdifr
         bPfeWS+Y7IbMffNGusjFbHR1ixz2CB4nuYwkP5RHsYiaVO08AG8gkoCiT/O46mmXHBoJ
         LaKg==
X-Forwarded-Encrypted: i=1; AHgh+RrpSbIAfHLUYdcXVZm9M6wt9klubfM317aA4ht+423MlZK9W3933jhaE4s5/0t+ouEJqmZWiMk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxhBRhqK+EmKqJqBeX12jkDh6X7pFuscEMuOXdF5DMH3mhgZsYr
	eL/lJliPFjCPR/W4cekaXwAEd+GmWu5wORQ6Te4nR9WpuaL2G5dD1AuYIPRBAt78SGwiI267h52
	IYXJucTgRugsz8XpckmcYZ1rpT3076G5l9AXqTRmcbFu06FhGdosdhBXZODKmzvbPvHmh2sin
X-Gm-Gg: AfdE7ckR/VgO8OwKtlRkTfZ8LFjUgyFMOOq42btSWhaEsBrqY5tORmav7SqtcZuKY8T
	+ey8tisqCJ5yoz0qTQRG5JndmqPjCXh7Rmm91dCWSLFf5/54VxQlKPEkLgyYEj9rk84Cv2o4Agm
	NhTtqpwAVmpU4eGVbtFAlh0PDK4B4MAEEja+XDTg3F2ggWpXxqIC+Blkzl0P+r+yhDAxnAtJcy8
	gSOIVwL7AL3nh1IdkBBr71ISVxpabskvFvSNw39BuPr1Sb7wbSFmz7NFIj/5ATUz8l7vIj4+BZd
	VNqUt9bDGfa2EFsDu4s/XDNh9gFXA5M8Y0327K70lkBOdBM258R7ZwYBRKk+ydYRE8WequS/WXR
	LkSwcNcL8f1ig/Vh7Jt937ebQiTw/0JjUfQkgj4Eu7pzRxw89Mi0dW88AIcJpY8yMEmDinfBlq8
	vxoNFbPe/trm7cvb+CZ0wr85ewRrQv
X-Received: by 2002:aa7:88d1:0:b0:82f:684a:84ea with SMTP id d2e1a72fcca58-84591c2bf32mr1765419b3a.13.1782187996032;
        Mon, 22 Jun 2026 21:13:16 -0700 (PDT)
X-Received: by 2002:aa7:88d1:0:b0:82f:684a:84ea with SMTP id d2e1a72fcca58-84591c2bf32mr1765398b3a.13.1782187995565;
        Mon, 22 Jun 2026 21:13:15 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6c2d9sm12159382b3a.6.2026.06.22.21.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 21:13:15 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 09:43:09 +0530
Subject: [PATCH ath-next] wifi: ath12k: Fix inconsistencies in struct
 qmi_elem_info initializers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-qmi-inconsistencies-v1-1-0fc17f2b8338@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANQHOmoC/x3MQQqEMAxA0atI1hPQVit4lWEWtaaahdFpigji3
 S0u/+L9C5QSk8JQXZDoYOVNSjSfCsLiZSbkqTSY2rjaGYv/lZElbKKsmSQUjLYN1I0x9sY7KHJ
 PFPl8r1/weUGhM8Pvvh/DRjctbwAAAA==
X-Change-ID: 20260623-qmi-inconsistencies-34ce5bff72a6
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 4npqL9RyFWAAMWhbhYsNgCE3mXzhwBrj
X-Authority-Analysis: v=2.4 cv=VKXtWdPX c=1 sm=1 tr=0 ts=6a3a07dc cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5wuKFw-Lxssn0LJ63IsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 4npqL9RyFWAAMWhbhYsNgCE3mXzhwBrj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDAzMCBTYWx0ZWRfXzEmV8WtqLZkk
 0iF56WgD1inVxX+AHrbrJgXj5opgQrXzkfAB5JEyt0+1HLMUylc2FdDjj65gSaqUd3KLXgyER9B
 EaS/lX/q6TgNipoVoiySi+n1VUqNX9mNPw35lB/+VF7+Z8crQnGC55mS4gVakLvw1RnRruGRnji
 0vgAUV0rhMDbsNAMSvE5E7PiSVF93mEG9I5a4RK40CDc78TptoW9fVlP+FI3pnYzGh4J9tsjWdr
 F4/3zc566IQ9Yyrd5a4YCDOuxn583jGtI6bM/mCxPHVtcXvg0VNq4h6s6sTqdgW/7FuvOHXW9GC
 JBQRZObvIasjNx31+OdZOeY4BXHVBgJSFeYxZJRbXY/k4+ap68ur/kiym5BAfqkaCD46bYb18j/
 yNtO1NmnjExBbQ2OHq7aeW32QSyQRuK59b0X72u4ldZPwnrB2G8bE7yNnwJDsleBUGSFYC6opB3
 mpxS9YvXRTi25iq1Ltg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDAzMCBTYWx0ZWRfX7fuJdmuLaHtK
 NkON/LorJNgKaALiBeex0uaxOVtJErj3wdDCA/Ph7OrNB0UC9JLwZYdAQmFsyIUR+ViJkd3mvf9
 iTBxuqyHV8xgRSA2oGkmZeTq4MsvVEo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_01,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_211318_451546_AC7FC996 
X-CRM114-Status: GOOD (  12.22  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently, the struct qmi_elem_info initializers in qmi.c are inconsistent
in how they align the assignments, with tabs being used in the majority of
places but spaces being used in some places. In those places replace the
spaces with tabs for consistency.

Also fix incorrect and missing terminating records in the following
qmi_elem_info initializers:
- qmi_wlanfw_shadow_reg_cfg_s_v01_ei[]
- qmi_wlanfw_mem_ready_ind_msg_v01_ei[]
- qmi_wlanfw_fw_ready_ind_msg_v01_ei[]

Tested-on: Compile tested only.

Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 144 ++++++++++++++++++----------------
 1 file changed, 75 insertions(+), 69 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index fd762b5d7bb5..c176cc150f64 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -21,45 +21,45 @@
 
 static const struct qmi_elem_info wlfw_host_mlo_chip_info_s_v01_ei[] = {
 	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
 		.array_type	= NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct wlfw_host_mlo_chip_info_s_v01,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct wlfw_host_mlo_chip_info_s_v01,
 					   chip_id),
 	},
 	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
 		.array_type	= NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct wlfw_host_mlo_chip_info_s_v01,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct wlfw_host_mlo_chip_info_s_v01,
 					   num_local_links),
 	},
 	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = QMI_WLFW_MAX_NUM_MLO_LINKS_PER_CHIP_V01,
-		.elem_size      = sizeof(u8),
-		.array_type     = STATIC_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct wlfw_host_mlo_chip_info_s_v01,
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= QMI_WLFW_MAX_NUM_MLO_LINKS_PER_CHIP_V01,
+		.elem_size	= sizeof(u8),
+		.array_type	= STATIC_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct wlfw_host_mlo_chip_info_s_v01,
 					   hw_link_id),
 	},
 	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = QMI_WLFW_MAX_NUM_MLO_LINKS_PER_CHIP_V01,
-		.elem_size      = sizeof(u8),
-		.array_type     = STATIC_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct wlfw_host_mlo_chip_info_s_v01,
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= QMI_WLFW_MAX_NUM_MLO_LINKS_PER_CHIP_V01,
+		.elem_size	= sizeof(u8),
+		.array_type	= STATIC_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct wlfw_host_mlo_chip_info_s_v01,
 					   valid_mlo_link_id),
 	},
 	{
-		.data_type      = QMI_EOTI,
+		.data_type	= QMI_EOTI,
 		.array_type	= NO_ARRAY,
-		.tlv_type       = QMI_COMMON_TLV_TYPE,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
 	},
 };
 
@@ -585,21 +585,21 @@ static const struct qmi_elem_info qmi_wlanfw_phy_cap_resp_msg_v01_ei[] = {
 					   board_id),
 	},
 	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x13,
-		.offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x13,
+		.offset		= offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
 					   single_chip_mlo_support_valid),
 	},
 	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x13,
-		.offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x13,
+		.offset		= offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
 					   single_chip_mlo_support),
 	},
 	{
@@ -1625,42 +1625,45 @@ static const struct qmi_elem_info qmi_wlanfw_m3_info_resp_msg_v01_ei[] = {
 
 static const struct qmi_elem_info qmi_wlanfw_aux_uc_info_req_msg_v01_ei[] = {
 	{
-		.data_type      = QMI_UNSIGNED_8_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u64),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct qmi_wlanfw_aux_uc_info_req_msg_v01, addr),
+		.data_type	= QMI_UNSIGNED_8_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u64),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x01,
+		.offset		= offsetof(struct qmi_wlanfw_aux_uc_info_req_msg_v01,
+					   addr),
 	},
 	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct qmi_wlanfw_aux_uc_info_req_msg_v01, size),
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x02,
+		.offset		= offsetof(struct qmi_wlanfw_aux_uc_info_req_msg_v01,
+					   size),
 	},
 	{
-		.data_type      = QMI_EOTI,
-		.array_type     = NO_ARRAY,
-		.tlv_type       = QMI_COMMON_TLV_TYPE,
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
 	},
 };
 
 static const struct qmi_elem_info qmi_wlanfw_aux_uc_info_resp_msg_v01_ei[] = {
 	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct qmi_wlanfw_aux_uc_info_resp_msg_v01, resp),
-		.ei_array       = qmi_response_type_v01_ei,
+		.data_type	= QMI_STRUCT,
+		.elem_len	= 1,
+		.elem_size	= sizeof(struct qmi_response_type_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x02,
+		.offset		= offsetof(struct qmi_wlanfw_aux_uc_info_resp_msg_v01,
+					   resp),
+		.ei_array	= qmi_response_type_v01_ei,
 	},
 	{
-		.data_type      = QMI_EOTI,
-		.array_type     = NO_ARRAY,
-		.tlv_type       = QMI_COMMON_TLV_TYPE,
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
 	},
 };
 
@@ -1772,7 +1775,8 @@ static const struct qmi_elem_info qmi_wlanfw_shadow_reg_cfg_s_v01_ei[] = {
 	},
 	{
 		.data_type	= QMI_EOTI,
-		.array_type	= QMI_COMMON_TLV_TYPE,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
 	},
 };
 
@@ -1925,7 +1929,7 @@ static const struct qmi_elem_info qmi_wlanfw_wlan_cfg_req_msg_v01_ei[] = {
 		.data_type	= QMI_OPT_FLAG,
 		.elem_len	= 1,
 		.elem_size	= sizeof(u8),
-		.array_type = NO_ARRAY,
+		.array_type	= NO_ARRAY,
 		.tlv_type	= 0x13,
 		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
 					   shadow_reg_valid),
@@ -1934,7 +1938,7 @@ static const struct qmi_elem_info qmi_wlanfw_wlan_cfg_req_msg_v01_ei[] = {
 		.data_type	= QMI_DATA_LEN,
 		.elem_len	= 1,
 		.elem_size	= sizeof(u8),
-		.array_type = NO_ARRAY,
+		.array_type	= NO_ARRAY,
 		.tlv_type	= 0x13,
 		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
 					   shadow_reg_len),
@@ -1943,7 +1947,7 @@ static const struct qmi_elem_info qmi_wlanfw_wlan_cfg_req_msg_v01_ei[] = {
 		.data_type	= QMI_STRUCT,
 		.elem_len	= QMI_WLANFW_MAX_NUM_SHADOW_REG_V01,
 		.elem_size	= sizeof(struct qmi_wlanfw_shadow_reg_cfg_s_v01),
-		.array_type = VAR_LEN_ARRAY,
+		.array_type	= VAR_LEN_ARRAY,
 		.tlv_type	= 0x13,
 		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
 					   shadow_reg),
@@ -2003,15 +2007,17 @@ static const struct qmi_elem_info qmi_wlanfw_wlan_cfg_resp_msg_v01_ei[] = {
 
 static const struct qmi_elem_info qmi_wlanfw_mem_ready_ind_msg_v01_ei[] = {
 	{
-		.data_type = QMI_EOTI,
-		.array_type = NO_ARRAY,
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
 	},
 };
 
 static const struct qmi_elem_info qmi_wlanfw_fw_ready_ind_msg_v01_ei[] = {
 	{
-		.data_type = QMI_EOTI,
-		.array_type = NO_ARRAY,
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
 	},
 };
 

---
base-commit: 1547a99cd8d8c1ab3e04dbd92b72b3b5f7cb85a9
change-id: 20260623-qmi-inconsistencies-34ce5bff72a6


