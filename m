Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39176CD98E6
	for <ath12k@archiver.kernel.org>; Fri, 19 Jun 2026 05:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bm6aeURL822jXRVJQOEpxaAsYvkkIhSdGOk3vQmzGPA=; b=oJ5eSnO7uZzgRAww5rxUrLUQ4b
	2pVGm8PbWSH9Nj1kf0DjGNK+4A6cENii4tESa0QInjJL4fTcM6rjrw2qqxcU5s8pp5HrSITrYOFTG
	eHvRWCCzCCMIaoFRpyeoGzirv0c2M3AKZN2CNRHWv5tTCoramwC8r5RPZklPFwp8q0cyNrhWF+4iq
	QBVd1+qAYFvoADJo/1raVSZmt4MBQkyZRzkWbrq+bJmAz9niH43mZMOL88lKYw3Q3FyS4GtAf9SjB
	cwYvFxJ3Fog8o3980G9jRGE+0nuEdY5YniaoA/FAO7ND4oZqiYNtkHkiEe87RnGDKx1ycTGHkjhS0
	LYd0600A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waSCZ-000000021aG-2gSx;
	Fri, 19 Jun 2026 05:55:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waSCX-000000021Zp-32Sv
	for ath12k@lists.infradead.org;
	Fri, 19 Jun 2026 05:55:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J2tMS73158043
	for <ath12k@lists.infradead.org>; Fri, 19 Jun 2026 05:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bm6aeURL822jXRVJQOEpxa
	AsYvkkIhSdGOk3vQmzGPA=; b=P9BpJl2Qa3oEu1GsGiWmYFXXpbZAtczcniTQPg
	Ppginicr5rBdbF2JqaaVxoSVVN4sgNkQGdcJMvL4QDU/lA6b5j1lv5tuHPL9IxD4
	CgXDD0dKNddjZWcqQz1gGHRAdYGL1e18Yll+A2XZgwwpJQWFIW9GQhvthyst1B09
	wA50R/OYjxDHYT35og/ELxNRdbQfwAfLo7oKtKcCta6iGdtdwBod1koHLcIealoF
	hCecnlauO9Ipfx7eO+IVOtl1yXcjIOM6RA/CSFn/gNPxmSx9oiGY9P4HSPQEptoq
	uRHtyWe2Q2Wz5M+xILDp4uUomlgJOSNi8LyqjYIktJqY30Iw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm26anp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 19 Jun 2026 05:55:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6bc237b5aso28064475ad.2
        for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 22:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781848535; x=1782453335; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bm6aeURL822jXRVJQOEpxaAsYvkkIhSdGOk3vQmzGPA=;
        b=KyIcE376B7WjsttM/qFXx1pbS3Uc08TamZmlJ7EL9eUnrCdVZdcOtHqtFkdCF9dMz6
         wisJ6xHh3TU1H0wsoPvFUFZRULOj6vOXxgukrOkf59fNHdyPayq3+5EbljRCWvAsb1/9
         0i0+VchVgnJ/jW3bZQ5bxqIx3ensBu5c5Rw5FpGdSLtAByPEgJL3IHhycJw/UezT1GXT
         u9q+URhbtdlIoIkjMx3pMG/vUDA7VGSe+B/geI1i6WJHP3HAJDOI9cG+Lj/aaUKgfKrg
         dP4LAO85IWkf/L8pThXIq03uBirsF+4pPscfjl5TlO4P2sGi/ZyG3qkPOQVz3K0Rz6Bf
         r+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781848535; x=1782453335;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bm6aeURL822jXRVJQOEpxaAsYvkkIhSdGOk3vQmzGPA=;
        b=GMmjyV6RjISHn0v8P/9crhnon3hWrH0ptAKY44TyxZP46DTRBjPMmzLYjPIyWoKAfY
         KsH36TAiSJ4/AvCdA/ky4l7ApNjsq9ZATBXdYIeIKCxBOTpjG9i0Lo4Xo740HUdSREoW
         J+OTksY8Elgw5pc+IoDZn3eE4ehf84KqPjFaZ6mNwjhdwgejFYzQGxrT4iMSueS6ZJ4i
         mgjJwRiG9trDVFJIsfLZyUF1ktxMXzcY6SueKQexv/oB3m2dyJ1Z4uFd1cLIL4f9nFg2
         wjJtljXVyCXVVBjHCAVW3MnmkUQcH7SeIaRrKGlZ0NTog793J1VT813NodI6tiMye6kd
         Cr6g==
X-Gm-Message-State: AOJu0Yyirva/aD+IeYt/G4ilKcoBBER6tBvKbyDgqbHedVuvPOrAs6Bm
	GzH9+91FlqoljSViK8e/QlEkrUv/fz9Pvp1tfS7Ei6EqwnrAgVXjGWliSS2BcFYYx1yCUNAg8s5
	QoYOIXPIFq8dGPQ3H0i/IX10mHty9olA787LJtk3mHIADhyEsYs2CPFSTPktz0gtn6u1v6evY
X-Gm-Gg: AfdE7cnA9gmz5aj8zjJRcJqIP/Ehvjo7GYseR8A6Z+oyVeV6ZcYn1v7DtefOc4qgcM1
	+3WNlkjY4vbRpNEdUGeZ+OfV7QYpD0LInMhhU0TDdhlfS+s3m4LpmH1t8w/JMiZGndEq6jx3FxW
	gAzJ+bH3aycTaBRgVvVzr+fuhhC/7SoDjshksBKE2+UAH2NfBOHzDu9Rf+CeZqu4dghglaCgiqJ
	bQHo51ngWHgT8Z8zqDtoBczRpvdW+QO6G0SVI+ogQ+k91YA0UFFkh9l+XdGOVVtDgYPNEtQgOmK
	8c1JsgyyHzuGPTpQPCjjPaFCGIMbbok9J5zLcOc1ov8+We2VWekHvpBqegYkCreN5INJVPjh+jf
	ulvJ/5gpqsz7SewS0MwqdeY5bxOjHCV3y9apA2jKkbRvPs+qucKqvrqMqZr/QxbEbGPb3YJVTuF
	s/zyNfzU5kQYDuaBREh+e3W1/J6r6ctzskwp/WbIxvzyQ=
X-Received: by 2002:a17:902:d50f:b0:2c0:bff4:96a7 with SMTP id d9443c01a7336-2c718ca5e42mr24589195ad.12.1781848535349;
        Thu, 18 Jun 2026 22:55:35 -0700 (PDT)
X-Received: by 2002:a17:902:d50f:b0:2c0:bff4:96a7 with SMTP id d9443c01a7336-2c718ca5e42mr24588855ad.12.1781848534919;
        Thu, 18 Jun 2026 22:55:34 -0700 (PDT)
Received: from hu-mdharane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7209bd3ddsm10559785ad.38.2026.06.18.22.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 22:55:34 -0700 (PDT)
From: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 11:25:13 +0530
Subject: [PATCH ath-next] wifi: ath12k: advertise ieee_link_id in vdev
 start MLO params
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-ieee_link_id-v1-1-36cf573cb81d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMDZNGoC/3XNQQ6CMBAF0KuYrq1hplDBlfcwhpQyyEQoSpFgD
 He3IS7U6GaSn5//5iE89Uxe7FYP0dPInjsXAqxXwtbGnUhyGbLACHWkIZJMRHnD7pxzKVWMsVU
 KCwQtwuTSU8XTwh2EGWrpaBrEMTQ1+6Hr78ufEZb+RcInOYIEmaJOjC3QFlmx77zfXG+msV3bb
 sJZvBHfjeTLwGCQSreZKRMdm/SPod4N/WWoYJQGbFJRmkWgfxjzPD8BMBrk60EBAAA=
X-Change-ID: 20260610-ieee_link_id-3424c332b216
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hari Naraayana Desikan Kannan <hari.kannan@oss.qualcomm.com>,
        Karthik M <karthik.m@oss.qualcomm.com>,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA1MiBTYWx0ZWRfXznWDL+Bkoo+a
 ihLXPXmZtuymBXMmcST42pEZj7OcYbpDjH5PqJmoCAzblSwLCVtBx7rQJEjS6TwuTt4VyR8hrD6
 XZr5bUiJUT12AMpkMUDsu7ifNqXlqJk=
X-Proofpoint-ORIG-GUID: weFPd9cFGDJ0tJaokFInH4zE1CTaHHPF
X-Authority-Analysis: v=2.4 cv=dL2WXuZb c=1 sm=1 tr=0 ts=6a34d9d8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=r-ZuXGAqLrq8oxxbCEkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: weFPd9cFGDJ0tJaokFInH4zE1CTaHHPF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA1MiBTYWx0ZWRfXzhkuy2lKn5Ks
 J/4V1hykx5tb4E3Ed+NcpxmJsPNexIrgZxIvi4UIwF5U7yw9YZ6vBJiCroY19O8gf1XRrtnddJd
 3qxkT7jr1yT/Ai4nfQoGmqeGJLfaR85z94SlIKP0Uj6ecEkK0CXqP7H1yRZ7bFdSuUaVRSWwgfD
 HdK5v7NZQtKOnmQJBSTHB9eNJZtIuICFUlmQbT/ZAsoqtZCrKRVQzjV+mc4S+HUc25RSoDFTy5+
 469pBLz3qNRYdkVp7RX68JggfMF+cCli3oi18w1kfyc4LEjArh/jjy8NMtRR375ENCjuS3HJB9c
 qxgAXd9hlc6KNTemH/Eoc02MCY5j9ajby5yW87Wr9Ol2Zenqc1+jE7DTmT9vd5mv3VghAHTDeXC
 hLqA6ixJoFAOuKj6c6nVJdtbyux4ZJ4q9NP9kLbfpwUnX01QY57uf4rPPHE5u2AqMjNqE4myZWn
 TXPSzFnpYjydVPPoMHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_225537_779475_ED1D5E8B 
X-CRM114-Status: GOOD (  15.07  )
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

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Co-developed-by: Hari Naraayana Desikan Kannan <hari.kannan@oss.qualcomm.com>
Signed-off-by: Hari Naraayana Desikan Kannan <hari.kannan@oss.qualcomm.com>
Co-developed-by: Karthik M <karthik.m@oss.qualcomm.com>
Signed-off-by: Karthik M <karthik.m@oss.qualcomm.com>
Signed-off-by: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
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
index 84a31b953db8..a0e8b5678ae3 100644
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
+		ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "vdev %d start link_id %d ml flags 0x%x\n",
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
+			ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "partner vdev %d hw_link_id %d macaddr %pM link_id %d ml flags 0x%x\n",
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


