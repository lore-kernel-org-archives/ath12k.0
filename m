Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD3DC83F16
	for <ath12k@archiver.kernel.org>; Tue,  8 Jul 2025 19:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1FAG17sRidFuF3rwaY6fJao8lQnUQusYs/ZoyKTlJ4=; b=NFldJUTae6BW8ILiymXX1MPcwr
	ezX7V21ImI2YgmPfM2olhcTkh+0RhOjT1FYbPpeqM7R5h3f0jHvRNReJD1NDE8DjEzIcdH41YNvAr
	lDndDtWrcYiK50f55GERcn3BFuG0ziEZo+UKwv2TIlA9OTYC3xe1ESYGrjGD9Maiu4fwsX88cfoaW
	nkxS73bmkImYUnDOr1a3tsE27eKeFD/AP3WWYoU3sCH3kbe2rgsHCwswi1a/I+7gzb3dF52G2efjN
	uYOJyG3DwwyjDJvYhcfmfxEkuSNXkEBVyGliBZkeLDXJ3NpGNAE4ViPX2+IHR7hx/yIJ/Z15kBGst
	7VlJvJog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAm-00000006NpA-0TO2;
	Tue, 08 Jul 2025 19:40:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCmi-00000006DI5-2Z9G
	for ath12k@lists.infradead.org;
	Tue, 08 Jul 2025 18:11:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAYWQ029345
	for <ath12k@lists.infradead.org>; Tue, 8 Jul 2025 18:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/1FAG17sRid
	FuF3rwaY6fJao8lQnUQusYs/ZoyKTlJ4=; b=Ses9odk91b8H6hPoCV4vecRgc1q
	bfnMy+qp5wagfW56a8npX2UJNRsnE3oC3JkJDlpmhzVrCn6csMOvwyKkUhVR7Ti2
	66FyOVFtQO/GxCVLUFSz70mLW7CR8zrojkgKHfeoXoSRZGpiPgcmIA4agC205YMO
	TYo5gIIPXSC5dNNYt3oQJQy8RIvLQ/SNHTOAv68+8A68XfAKbtG0B+8eeeKBeI2M
	qXstKKjPZyNO8paEOfmhT8wN0dhOahc3l7M2v2/0Y7ptX8BV0KiHpSsveGPV7ioq
	Jr8LP7Nnu0Qxi8YKSoDlIIvYg/x25CIbDFZc+Y9sHPUOgfyvuun/2kp1pmQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4y1e5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Jul 2025 18:11:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234a102faa3so35495725ad.0
        for <ath12k@lists.infradead.org>; Tue, 08 Jul 2025 11:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751998274; x=1752603074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1FAG17sRidFuF3rwaY6fJao8lQnUQusYs/ZoyKTlJ4=;
        b=BLRrAZ6DMb7UNBBWHdwiA1QfJus4TPEnFAwLfTfc6MfvCIwILvVW16LfDgRDtSZf+W
         mXQDmh03uRmI3qwFBFb6vKucoxYj7wewPNypsow0BdYDYlR6b5q5BRRgkQQU36v5wfiT
         /9pPNYxAOi9J6g60y2KrF8SQVjTfyNikeuTEp/GkBXOYrMtaWBWkyqVuUejnwBl8pIpB
         I1XeXR3eAFgmnbwjG3LFWJm1trlmIBmBjwEawMxlw7FxZHALrvgL5Qsr7COo3IlJ7Hl2
         CgOK8qFjQSmLEu1A5BprI/yH9oE8PIuMI1eAOo5pnbEW5MynBdSfCdgxv8N6eD14lxe4
         XgEA==
X-Gm-Message-State: AOJu0YzfjZBD0pq6B+PiIoZabstPmnexjnbYSlvH+nNYBlHBxd2On9fg
	BOLPYCaZXwDcwBKX83kmkab0XHadE3nYVtO5cMs+znJgAOFJVpnw054f8PbAq7O+kfMGSLX4ArR
	vuIPv3ZyuD/qgj8QN59gzTw81zAO5opfvNu/LdTR5hRVfRsyrm0LSZCnYu2yJVVoPMWheyjeR
X-Gm-Gg: ASbGnctfqjJvzV/r948C6eaZMax5kAZXpSi7fHLSR9NbzL3fM5og9tF/+MdSdy5KnBL
	t+jycR5oVSf4d5o8kk9mywAJ/LEIwF16d1lknishW+BQAXFX0abZtvp6lom8E+n7jTgLs2WdUdW
	tPx3v+ewjqRDb+wZDE5RD7TpbdnhgzDzbjWso4LgJ/mc38rBb9/byMo+VmzO2rdCnc2qL6uN9VA
	Ika5IIZC9ZkbxeVZ6g4F4Vb+RFbijwFNDifwe7r8iMN3ZPf3kiTKyp6xNwygmvg3Fi0iHO3PqGa
	If0wrsu2HRQCBDuj6s5HHvbuobczUg++uaY4ewxEBOJmSN+p7hc5s9sf6wedzxBoH22XKz0qTb/
	6NG00CXOgksl1MXl7/4KFCJ++n7Y0tbDCqrStGCvJW2FU3w==
X-Received: by 2002:a17:902:fc87:b0:23c:7c3b:4c61 with SMTP id d9443c01a7336-23dd98004f5mr4755085ad.8.1751998274130;
        Tue, 08 Jul 2025 11:11:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6Xl4nsQcuKW47kp9GCDqnPn/RwuMxnNZIBodXIoMAjx2JvQEKjsYcat+SWt+2Y9aL6ccetw==
X-Received: by 2002:a17:902:fc87:b0:23c:7c3b:4c61 with SMTP id d9443c01a7336-23dd98004f5mr4754585ad.8.1751998273250;
        Tue, 08 Jul 2025 11:11:13 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455d0a9sm115980425ad.95.2025.07.08.11.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 11:11:12 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 2/4] wifi: ath12k: Remove redundant TID calculation for QCN9274
Date: Tue,  8 Jul 2025 23:41:00 +0530
Message-Id: <20250708181102.4111054-3-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708181102.4111054-1-aaradhana.sahu@oss.qualcomm.com>
References: <20250708181102.4111054-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE1MiBTYWx0ZWRfX44UYktkw5TmX
 liRTqVj8dnQmoXDrCamlrBM1cpsps3323ar3IFSDSEhZvMDD5ZirYf+hMPkyU4wQRqCmHLKhAL2
 YC5naM+8YR5Oflh/L+iA/cZH6YkunIpx8l8uVM09ARsbXZkcEa2cN8rKVyCuAV/4o1dfWeZUiR1
 5mTW9tEbEKPeOiELJEj+GxzTJChbtDu+8QPLEMlUs3uaVXiQ8YMPxSNXfxmepcMrDVlFnEysqRP
 LmaFbgPk9UGD+sNpYqIR6dEH9eaviDHveJnhlaOcbvUcrVyaHW2OKy5ZRtLyTRpOqb+5UquPf5W
 zWnbmvVKA+BmZQzyowl5ZtxpfU8zDHykBgrZfsPrsyK1/YBIkRzzqk/8zG5wmDBe7/KNlvdNJii
 gjwZO+irswA4kRKdOTECJsx6NhBkpvAPotXlvxbCPiK4siRgi006h1C8gBKCELEO2naVjCLV
X-Proofpoint-ORIG-GUID: dYgW4PxPOLySWqTGAM-qWPL_T5bWJC2I
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=686d5f43 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Wa9tDcmNiZk3z8JJqtoA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: dYgW4PxPOLySWqTGAM-qWPL_T5bWJC2I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_05,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_111116_780375_3C909073 
X-CRM114-Status: GOOD (  14.28  )
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

Currently, host sends num_tids (number of TID (Traffic Identifier))
value to firmware via WMI_INIT_CMD during WMI initialization. However,
the firmware does not use this value, as it determines the number of
TIDs using its own internal logic.

Hence, remove the redundant num_tids calculation logic for QCN9274.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 9 ---------
 drivers/net/wireless/ath/ath12k/core.h | 1 -
 drivers/net/wireless/ath/ath12k/hw.h   | 2 --
 drivers/net/wireless/ath/ath12k/wmi.c  | 1 -
 4 files changed, 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 8b0c67735171..037486553ba0 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -638,15 +638,6 @@ u32 ath12k_core_get_max_peers_per_radio(struct ath12k_base *ab)
 	return TARGET_NUM_PEERS_PDEV_SINGLE;
 }
 
-u32 ath12k_core_get_max_num_tids(struct ath12k_base *ab)
-{
-	if (ab->num_radios == 2)
-		return TARGET_NUM_TIDS(DBS);
-	else if (ab->num_radios == 3)
-		return TARGET_NUM_TIDS(DBS_SBS);
-	return TARGET_NUM_TIDS(SINGLE);
-}
-
 struct reserved_mem *ath12k_core_get_reserved_mem(struct ath12k_base *ab,
 						  int index)
 {
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index b2dcb979dc75..272b7e9822ea 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1356,7 +1356,6 @@ const struct firmware *ath12k_core_firmware_request(struct ath12k_base *ab,
 						    const char *filename);
 u32 ath12k_core_get_max_station_per_radio(struct ath12k_base *ab);
 u32 ath12k_core_get_max_peers_per_radio(struct ath12k_base *ab);
-u32 ath12k_core_get_max_num_tids(struct ath12k_base *ab);
 
 void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group *ag);
 void ath12k_fw_stats_init(struct ath12k *ar);
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 0a75bc5abfa2..4e10d5df2919 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -45,8 +45,6 @@
 
 #define TARGET_NUM_PEERS(x)	TARGET_NUM_PEERS_##x
 #define TARGET_NUM_PEER_KEYS	2
-#define TARGET_NUM_TIDS(x)	(2 * TARGET_NUM_PEERS(x) + \
-				 4 * TARGET_NUM_VDEVS + 8)
 
 #define TARGET_AST_SKID_LIMIT	16
 #define TARGET_NUM_OFFLD_PEERS	4
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index b34f2c183312..facca29ee9e7 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -204,7 +204,6 @@ void ath12k_wmi_init_qcn9274(struct ath12k_base *ab,
 	config->num_vdevs = ab->num_radios * TARGET_NUM_VDEVS;
 	config->num_peers = ab->num_radios *
 		ath12k_core_get_max_peers_per_radio(ab);
-	config->num_tids = ath12k_core_get_max_num_tids(ab);
 	config->num_offload_peers = TARGET_NUM_OFFLD_PEERS;
 	config->num_offload_reorder_buffs = TARGET_NUM_OFFLD_REORDER_BUFFS;
 	config->num_peer_keys = TARGET_NUM_PEER_KEYS;
-- 
2.34.1


