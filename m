Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6E7CD4F26
	for <ath12k@archiver.kernel.org>; Tue, 23 Jun 2026 05:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F1nzYl6QagXdDViuD3bSxUu5deBQ8u2MUiQv690fH98=; b=EmQBkPiukT81taNR1Urhh8GzH0
	mFIROGXfkuTmeEb6i4QwsMEDDCSJI2hzsf26v5KAPSHvdh9m3wmSwd33y8FYW8GyfiGzIdK41toEB
	qF5ai5bCpJN9pz9xSjH7PKxBSVO/xSsz+9ShCCP9O4jYrFwnUbnd83YI4V7bKwR3oIUEbKgs0hi4G
	N+sGd6C5OP016pv4wxSTJJaaYzGnSRaPqqmg1q4JhwQizAf7LdxtcpMTV1bWoPEtIO3ld91ACmP93
	mUCpDaCK9a0PJzKlbrh7P1h78gRuSXPPAeuVk7IE/EMvEJQErC8Gs+xCb7K4/ihrwyDuJjjUkYMH/
	9BAIpRhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbty2-00000005jpK-25R8;
	Tue, 23 Jun 2026 05:46:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbtxz-00000005jo5-0Ixx
	for ath12k@lists.infradead.org;
	Tue, 23 Jun 2026 05:46:37 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N1Y8iD2672903
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 05:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F1nzYl6QagXdDViuD3bSxU
	u5deBQ8u2MUiQv690fH98=; b=Dv0YSHMKYzqDsDXV3N+YeQ1dqtiHOUIpRnbDvJ
	XHjOOYnarTgwcSEikcmZqIqIqfvQKkQZyNZNMxzh3FoRED9Y9KmwNWwIEgW1cAlD
	kQyefhiPJOAsOpAgOEHOTMW0XxZB1vn8yoU56/sZ8YCqLfceharPhULkQxJATFNI
	yMxFKxpe6LaJGKXktTs2h71bvRyPPvtRGHXtYUGQcGESQ+dKfKv/qp9NczSj6kre
	Kokkw9LizXTSDxk2dD1h9V8ofJgTMJOABVwpdFczPousMo5V61hB33P8JnI4T0vw
	nW+AjHlqVhyOmMB3Hk25dKZB9Q69xG4SAM1GERugMwcQGXIg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjgqsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 05:46:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso3380408a12.0
        for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 22:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782193592; x=1782798392; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F1nzYl6QagXdDViuD3bSxUu5deBQ8u2MUiQv690fH98=;
        b=HYAc1W6rp7p4D1pKmQficoyK4OYfETuJqT1PSnFwZeJ9QVS6hst8zyktZlI6Hf/6FS
         vpvrshRR0PV7weTvSUtVE/SsXn9oJ1wj272pjxAMC7YF3WCsvQfDFCeUYmlOOgosVdA9
         Ef8KlvGXQ4DOmNvXvcBCu80ONJA08UNyUSRm35LREcw7wJtt5hM8lPTMbLMqP5dbmRyR
         IPMXX7h3uu7oUfUxXOgpKpG0ruQ4Y8PatJrMqxFRHwPVAX48nHk2d62pqXO8XhCLdH5I
         Z09K8tLhGH/yyvH/hdRhkHvoC5ET6SfnPxV7aCdqV6MZi61pFASlZvtl1tpCNdiFGT6d
         8VVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782193592; x=1782798392;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1nzYl6QagXdDViuD3bSxUu5deBQ8u2MUiQv690fH98=;
        b=Yrn7CdvIeJ5odGUx+zQ3nPVEe06AG1ZRPI0fzZX2RwD+rpGIuhlhvBDdIuw00MXUMT
         Nk7F3rAag4gOs7ucsHHP21iglKjcQnEmpkNcjjpnScftsKcrr43n08wW3RLNlxX5HTLu
         ZRFaziOT1mHZuW3ZmXcGlADjb5hUnzG5f12by3O7WwreaQO3iYSx2wlzeIn3RwMIOaEN
         I9jWDuCPMy/uYyuw4qPmW67/vUrHTE27C9bPnMyuMnsSmBGDjmv/KVDU86cWGePTTyq/
         JKFflbVkNSyzgvA1UvBmCuRLEtHu0hAYF6ltyeTN0g9fAFMZYsTysNR8obsskaYC/xTv
         1mmQ==
X-Gm-Message-State: AOJu0YwiwOD5hgXj3y2D6y64UmrYeEyZLTN2PpeEB4oOjWab5NmS58lG
	KwqsNpSbXoSH5vrPZRBAf6u/E44Sa4kYLa0emTHqcv8AIpzCgc+aY8xMtVvX3+enlOgcAt9SH+O
	/xTh5vzX003XAtvbhmp556Iet0zyRJAViXNDKln79egZwGI1O62cmKNrVi3YNJdtnDeelzPNE
X-Gm-Gg: AfdE7cnQhUdGkUY/gC4wkS8SK/2ZY8B7QYzcrK7JHspxoUZVv7pEMgLGmNRJ9gzlfOe
	IrkWM8gRzjC6Z8CfHNlBkFrDbFvAOWUCSUR+YtnYUeYWEO6vBsREUzJxwIq0PS6cb47s0nDQ02X
	RbAmOf2f9OhJWIKjhGR5/Xv+4F3LJjVgxVuYCUFewpHInD3Gufmn3s+y9n3C94V/I6KouggTNhc
	Vzp6rDq/Yb9SZ1kmZ/O/WctDBGjJrUvF9kMjFif4OIsbtZQEGkM019s5XgMhEsunTUvy0XuBL0Z
	3+8WgWYgs9YGosDACQSrkuGqNexVxio3fRpFxe6uL30B9jgpqPQG2ayDZQbsoOp8OXW0UyJwCZc
	xyUl2vlRELP5DyQi5AHGvL5f8cBqS16KLxfoOhwbMFMhmHA4cvnSoY31TN6mRuamUcgktLvTJRN
	m9KNyY1VX+JOJ28Qkfbo3+QTZS4yydH3/AxrgRTvuD9k4=
X-Received: by 2002:a05:6a00:298b:b0:845:18b6:1154 with SMTP id d2e1a72fcca58-8459707b307mr1348967b3a.8.1782193592476;
        Mon, 22 Jun 2026 22:46:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:298b:b0:845:18b6:1154 with SMTP id d2e1a72fcca58-8459707b307mr1348928b3a.8.1782193591966;
        Mon, 22 Jun 2026 22:46:31 -0700 (PDT)
Received: from hu-mdharane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ed3bd8sm8989152b3a.56.2026.06.22.22.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 22:46:31 -0700 (PDT)
From: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 11:16:21 +0530
Subject: [PATCH ath-next v2] wifi: ath12k: advertise ieee_link_id in vdev
 start MLO params
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-ieee_link_id-v2-1-8a89d71baf58@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK0dOmoC/3XO3W7CMAwF4FdBuV5Q7TQh5Yr3QBPKj0utQQtNV
 zGhvvtCxQVjcGPJss53fBWJeqYk1our6GnkxF2bF/xYiNC4dk+SY94FFmgKA4VkItoduP3acZS
 qxDIohR7BiBw59VTzZea2wg2NbOkyiM98aTgNXf8z94ww3+8k/CVHkCAtGu2Cx+Arv+lSWp6/3
 SF0x+Myj1vRPVu9yCoTar1SwVuI/7O3X0Z87NdPBmaDlF1VLmpTOvvGUI+GeTJUNqKDoGuyVQH
 mhTFN0y9PhqwufQEAAA==
X-Change-ID: 20260610-ieee_link_id-3424c332b216
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hari Naraayana Desikan Kannan <hari.kannan@oss.qualcomm.com>,
        Karthik M <karthik.m@oss.qualcomm.com>,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA0MyBTYWx0ZWRfX+nLAgAPiD+DT
 M7KO45VvTf356pMGNIH/FXGV76nzqPgA6gtM453rYs8beVKyP5XWR61J9mBbDbJgzWmAN8FW4MI
 TaLKWwtm4ZWi4qAojY9APXQtfVQ2t5zewF2xzYh+vuXJqmgFG7MD7GfyDJuLqJ+mDCDW7k2piCE
 /Sqd96bl/bcwvNwilrJVphv6yrOyNx5cbr2pE6i+yf4lqONIeza+FoGleorPwOzOkNI3Ug3xDe6
 gWkAmnjY3ZCgTZL0sS5lAmgJ4PmsjTR8x3Gr1+Bl0CItkp0d/oGJVCoaFcp4uY/FT6r8MUu59Iy
 /v9iWFmXSve1haEcdl58WO1UKFRP2Wzn7lB4pJ4E4rEx+KEFcjRKzYjcwKmg4n5U/tO/IOaY9ic
 L0fIBoA/4hOI6pgOhn9rbAQTJmaSwOb00fqfzpntDN8/4imu3iVpuV66pWe6UDkAhHKWhwp2jlI
 0URpKr1GhNX8lse4b/A==
X-Proofpoint-GUID: 53ccn7RVcYeq3LrZNTsBTuyS83E8UCbV
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a1db9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=r-ZuXGAqLrq8oxxbCEkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA0MyBTYWx0ZWRfXzuX9Nt7P5Vrv
 HnPgoXaifTW9MvcdPvjlYRQof4V2XSGyEL+70qWbFjXdkn5Xypfwaw6uwRdSnJgy9tV59B+AVtb
 VuUwRpHMDhKA8NCyIa3BmzUd6GeTg8k=
X-Proofpoint-ORIG-GUID: 53ccn7RVcYeq3LrZNTsBTuyS83E8UCbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_01,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_224635_237563_A0BADECD 
X-CRM114-Status: GOOD (  16.59  )
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

Firmware builds the AP MLD partner profile from the hw_link_id passed in
the vdev start parameters. However, hw_link_id is not always the same as
the logical per-MLD ieee_link_id, since ieee_link_id is assigned per MLD
and not per pdev.

This matters in mixed MLO and SLO setups. For example:

  MLD 1 - 5 GHz + 6 GHz (2-link MLO): ieee_link_id 0 and 1
  MLD 2 - 6 GHz only    (1-link SLO): ieee_link_id 0
  MLD 3 - 5 GHz only    (1-link SLO): ieee_link_id 0

The same physical 6 GHz radio can use ieee_link_id 1 for one
MLD and ieee_link_id 0 for another. Pass the correct ieee_link_id to
firmware so it can build accurate per-STA profile elements.

Add ieee_link_id to wmi_vdev_start_mlo_params for the self link and to
wmi_partner_link_info for each partner link. Populate these fields in
ath12k_mac_mlo_get_vdev_args() from the corresponding vdev link_id
before encoding the WMI command.

Introduce two new flags in ML params to indicate to firmware when
the new fields are valid:

  ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID         BIT(18) for the self link
  ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID_PARTNER BIT(19) for partner links

Firmware parses ieee_link_id only when the matching flag is set.

Also fix the debug message by using correct format specifiers and host-endian
values instead of __le32 values.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Co-developed-by: Hari Naraayana Desikan Kannan <hari.kannan@oss.qualcomm.com>
Signed-off-by: Hari Naraayana Desikan Kannan <hari.kannan@oss.qualcomm.com>
Co-developed-by: Karthik M <karthik.m@oss.qualcomm.com>
Signed-off-by: Karthik M <karthik.m@oss.qualcomm.com>
Signed-off-by: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
---
Changes in v2:
- Addressed comments on debug message.
- Modified commit message to include the details of debug message
  modification.
- Link to v1: https://lore.kernel.org/r/20260619-ieee_link_id-v1-1-36cf573cb81d@oss.qualcomm.com
---
 drivers/net/wireless/ath/ath12k/mac.c |  3 +++
 drivers/net/wireless/ath/ath12k/wmi.c | 32 ++++++++++++++++++++------------
 drivers/net/wireless/ath/ath12k/wmi.h |  7 +++++++
 3 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index af354bef5c0d..773ecd6da8e5 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11253,6 +11253,8 @@ ath12k_mac_mlo_get_vdev_args(struct ath12k_link_vif *arvif,
 
 	ml_arg->assoc_link = arvif->is_sta_assoc_link;
 
+	ml_arg->ieee_link_id = arvif->link_id;
+
 	partner_info = ml_arg->partner_info;
 
 	links = ahvif->links_map;
@@ -11276,6 +11278,7 @@ ath12k_mac_mlo_get_vdev_args(struct ath12k_link_vif *arvif,
 
 		partner_info->vdev_id = arvif_p->vdev_id;
 		partner_info->hw_link_id = arvif_p->ar->pdev->hw_link_id;
+		partner_info->ieee_link_id = arvif_p->link_id;
 		ether_addr_copy(partner_info->addr, link_conf->addr);
 		ml_arg->num_partner_links++;
 		partner_info++;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 84a31b953db8..22ff17708722 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1228,10 +1228,14 @@ int ath12k_wmi_vdev_start(struct ath12k *ar, struct wmi_vdev_start_req_arg *arg,
 				   le32_encode_bits(arg->ml.mcast_link,
 						    ATH12K_WMI_FLAG_MLO_MCAST_VDEV) |
 				   le32_encode_bits(arg->ml.link_add,
-						    ATH12K_WMI_FLAG_MLO_LINK_ADD);
+						    ATH12K_WMI_FLAG_MLO_LINK_ADD) |
+				   cpu_to_le32(ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID);
 
-		ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "vdev %d start ml flags 0x%x\n",
-			   arg->vdev_id, ml_params->flags);
+		ml_params->ieee_link_id = cpu_to_le32(arg->ml.ieee_link_id);
+
+		ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "vdev %u start link_id %u ml flags 0x%x\n",
+			   arg->vdev_id, arg->ml.ieee_link_id,
+			   le32_to_cpu(ml_params->flags));
 
 		ptr += sizeof(*ml_params);
 
@@ -1244,19 +1248,23 @@ int ath12k_wmi_vdev_start(struct ath12k *ar, struct wmi_vdev_start_req_arg *arg,
 		partner_info = ptr;
 
 		for (i = 0; i < arg->ml.num_partner_links; i++) {
+			struct wmi_ml_partner_info *pinfo = &arg->ml.partner_info[i];
+
 			partner_info->tlv_header =
 				ath12k_wmi_tlv_cmd_hdr(WMI_TAG_MLO_PARTNER_LINK_PARAMS,
 						       sizeof(*partner_info));
-			partner_info->vdev_id =
-				cpu_to_le32(arg->ml.partner_info[i].vdev_id);
-			partner_info->hw_link_id =
-				cpu_to_le32(arg->ml.partner_info[i].hw_link_id);
+			partner_info->vdev_id = cpu_to_le32(pinfo->vdev_id);
+			partner_info->hw_link_id = cpu_to_le32(pinfo->hw_link_id);
 			ether_addr_copy(partner_info->vdev_addr.addr,
-					arg->ml.partner_info[i].addr);
-
-			ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "partner vdev %d hw_link_id %d macaddr%pM\n",
-				   partner_info->vdev_id, partner_info->hw_link_id,
-				   partner_info->vdev_addr.addr);
+					pinfo->addr);
+			partner_info->flags =
+				cpu_to_le32(ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID_PARTNER);
+			partner_info->ieee_link_id = cpu_to_le32(pinfo->ieee_link_id);
+
+			ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "partner vdev %u hw_link_id %u macaddr %pM link_id %u ml flags 0x%x\n",
+				   pinfo->vdev_id, pinfo->hw_link_id,
+				   pinfo->addr, pinfo->ieee_link_id,
+				   le32_to_cpu(partner_info->flags));
 
 			partner_info++;
 		}
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index c452e3d57a29..51f3426e1fcd 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2954,10 +2954,13 @@ struct wmi_vdev_create_mlo_params {
 #define ATH12K_WMI_FLAG_MLO_EMLSR_SUPPORT		BIT(6)
 #define ATH12K_WMI_FLAG_MLO_FORCED_INACTIVE		BIT(7)
 #define ATH12K_WMI_FLAG_MLO_LINK_ADD			BIT(8)
+#define ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID		BIT(18)
+#define ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID_PARTNER	BIT(19)
 
 struct wmi_vdev_start_mlo_params {
 	__le32 tlv_header;
 	__le32 flags;
+	__le32 ieee_link_id;
 } __packed;
 
 struct wmi_partner_link_info {
@@ -2965,6 +2968,8 @@ struct wmi_partner_link_info {
 	__le32 vdev_id;
 	__le32 hw_link_id;
 	struct ath12k_wmi_mac_addr_params vdev_addr;
+	__le32 flags;
+	__le32 ieee_link_id;
 } __packed;
 
 struct wmi_vdev_delete_cmd {
@@ -3120,6 +3125,7 @@ struct wmi_ml_partner_info {
 	bool primary_umac;
 	bool logical_link_idx_valid;
 	u32 logical_link_idx;
+	u32 ieee_link_id;
 };
 
 struct wmi_ml_arg {
@@ -3127,6 +3133,7 @@ struct wmi_ml_arg {
 	bool assoc_link;
 	bool mcast_link;
 	bool link_add;
+	u32 ieee_link_id;
 	u8 num_partner_links;
 	struct wmi_ml_partner_info partner_info[ATH12K_WMI_MLO_MAX_LINKS];
 };

---
base-commit: 63abe299b12b317dfee5bcd09037da4668a4431a
change-id: 20260610-ieee_link_id-3424c332b216


