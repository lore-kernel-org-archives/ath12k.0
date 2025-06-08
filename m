Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9859AC5AD49
	for <ath12k@archiver.kernel.org>; Sun,  8 Jun 2025 14:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2NdFZblz24zzgD5Ttc2TUmLu2/a4R5f3RkxKbIXCUWU=; b=TJ+vLysRXT6YpVL9QhsRgbea8n
	4Bhd2caIboV3i7k2h7mOnYlko8riE4qq+4jz1ZcuW1X1NWB1h14As8j8ZamjO/s3Y/r9j+NAE2/9k
	1atZGe+1Fgz+pIOxFty/NdaDzof8+ZSg5ldvgxaWpU/h4sFc8B9tqTLNA/9c9s0/9TQ21y54DfiDH
	gO9O+C9E/DmIThm+LQ31/97cQlsif4MLSnTq3qC+5twoCu2jjpsFt6Qx8IJmQ4QolPj25jXRJarT1
	JPvOh5s2eYKK96aGJquGrrDqMAHTJ8IQ71x/2ubF1E3WYGmkqldED6KR8OMh9+CRNJHNNCwpS9pyK
	Zhz6JbAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOHSJ-00000002isG-148N;
	Sun, 08 Jun 2025 14:57:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOHSH-00000002irv-0iVP
	for ath12k@lists.infradead.org;
	Sun, 08 Jun 2025 14:57:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558EE8ZS012866
	for <ath12k@lists.infradead.org>; Sun, 8 Jun 2025 14:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2NdFZblz24zzgD5Ttc2TUmLu2/a4R5f3Rkx
	KbIXCUWU=; b=WSSEHPf8pU7Ae2/BhFFrbXzKx7xf/4CU48c2x4GNLIkm5cyyy2C
	vRmBRUUPyh0feXlijs62rkpx1+fJcI4nErCgKKi4wXNXWiym2SCmCLlICw+8vXOa
	m60JKU4gVaTombLaZLEtLyHKxjmGDAjAASa52OMwNMkQiOoIr0/ueStarQzMUCaM
	uWD2jjdYHaQkopWzucFP61EVZYjV1cpLZnJGIsthfnKJHk82MPqVKzIpdtakhNSo
	fR1RfaGMO9GvaHZASQEWKrE0fVBqMtYu0mxJpfUbyzx54TSJnyJOUON1fatBsX6z
	fUwMT7YYvL3LtHCEO+ZcM4Y1xrYxueWGhzQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxk897-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 08 Jun 2025 14:56:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742a969a4d0so2919586b3a.2
        for <ath12k@lists.infradead.org>; Sun, 08 Jun 2025 07:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749394618; x=1749999418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NdFZblz24zzgD5Ttc2TUmLu2/a4R5f3RkxKbIXCUWU=;
        b=ChOksUrWowI4/wCXkjvm3mCW5oH7WGyqIetmspU55PBXjAKcLInSc27EA6UiYprO/V
         nQZpzGT4RNxN6otspQ6CajStaLBivFU6soMjG26jBycn9HnOdTto7nx/9bC/7xzdOCr1
         pbaQoViO/55DImjrVmgr2rlbar34Ewsb4L8+ERt/sKqYdiQ4REibCFRDeU/8/4G9sMzY
         ygyYl42tDC8CMuYkj+fwli6r/8cehFEmcQL59cHM4GfgwgHHK9Hv5sc8an2fum1ftc/j
         iwnO+ADb7D7He87DaCJ/WOqOJvwi9A13Y6Mf+iJItNMBPIpbWN0n9kmZ2NxIxyq2QvYC
         LGuA==
X-Gm-Message-State: AOJu0YyRwfb23W3Qm6Ag8suLIv+TRWCVTQh/y+Bt7K7sCKrEfc1nXvVD
	g9tr2lIhqznFBIECC9VHF3t0c7TvP2gYnEeNZskmOnkafUYN44o1QkatPpzNO3wS8Od8m+EIaMj
	hus50NDLuAVWVlU081CBQangQr9quWCbIn99U2P6DRd5fFkd8z2cOW/8G1hiKFY9NThIKOSX6
X-Gm-Gg: ASbGncskQ0n3wbsOn17lEBJdMDJ8XOXdR/mMgC4fYLOHmcYtzY7eGhMfsaVtHUmGKE3
	UymmmCnUS3+EwWmH5NTY4TjU1G7JmFfnwYu5612cdNHN6E1T6FYg/78nTEQ5QQQV5mujOeOVed0
	Jsscgz6ERdx0FVvL4w3RCIKn7kV4i70lOGmEX8nsvK0YQm2URnfUHI6jU4DthSku8VKuzjV4129
	l7Sh1qF3W9tuPRlYc3rGTUEDXQRep3d3N8lQgjyRdRrzfhRlSYkDtjulexa1nQOvt188FB7A2qb
	1GYYvl39rnlC7pfUlWgmC5tP9gR71zKiIM46Ib9TGbQg//JdsDO+cfYi3oIkmQFXc6JrWt7vtAI
	SGRqQZlTmwNSGaWMVCXSd4gRwBpLcyIh6J36VPnQmW6A+mWdBTDU=
X-Received: by 2002:a05:6a00:17a5:b0:73f:ff25:90b3 with SMTP id d2e1a72fcca58-74827f375d7mr14902376b3a.24.1749394617873;
        Sun, 08 Jun 2025 07:56:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYuOPqtoPHVanhl6OAMoSE2pkHm6sgTiy5IfZo/+b7mC74vpCE+pItroKbCPWJvHtN0hbPKA==
X-Received: by 2002:a05:6a00:17a5:b0:73f:ff25:90b3 with SMTP id d2e1a72fcca58-74827f375d7mr14902357b3a.24.1749394617426;
        Sun, 08 Jun 2025 07:56:57 -0700 (PDT)
Received: from hu-rkaliapp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af38386sm4179519b3a.6.2025.06.08.07.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 07:56:57 -0700 (PDT)
From: Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>,
        Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Clear auth flag only for actual association in security mode
Date: Sun,  8 Jun 2025 20:26:51 +0530
Message-Id: <20250608145651.1735236-1-ramasamy.kaliappan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zsq2SOf22xITCoPOXLZ3qzlrh8184J0h
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6845a4bb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=QbhYrX8MiZuTvZd2UzcA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: zsq2SOf22xITCoPOXLZ3qzlrh8184J0h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDExOSBTYWx0ZWRfX3f6JpNa4Uyp2
 m3kOW7fREnK791b0ZpscQz8YO0vkCHXJFwF2uWI5TCqA9xi0eNsCsATcYZy9PxC5BYwWWZJt3O0
 t3caNrmRD8B63/x9HJ/ojt8PRf/adXbYX/HM9okPmdcV7R3JdDG9JKGSRazbMBqkGEG/7lvE5qL
 hSKVZit2bxl/AoQGWUooe1u9DPpwGs3FnBlAFC2vDNDVm1ZMEclz0vLw4XI7QT6yYtQRIMgDaRC
 989LoPFjz4T6JETP63UR0rWsi+dZiqX3pGCbBiekb3sfiFY1qdRfqAknGmRYipK1/Hok81wk1ba
 UvCHETx+Ou34WW8bSIvRAClt8++fPB3bpVKvInvRCW//z8hOJUWXbLDDQaK4GrAzD1CWUxjtr47
 PfiJeii3HvF4sIUeUfaieNLrpkdXMe7g5VzDAX8mQF22tga8RNyEpO1PpFVq4T+h33ilvN7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_075701_331230_BE2235DA 
X-CRM114-Status: GOOD (  14.98  )
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

From: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>

When setting a new bitrate, WMI peer association command is sent from
the host without the peer authentication bit set in peer_flags for
security mode, which causes ping failure.

The firmware handles peer_flags when the client is associating, as the
peer authentication bit in peer_flags is set after the key exchange.
When the WMI peer association command is sent from the host to update
the new bitrate for an associated STA, the firmware expects the WMI
peer authentication bit to be set in peer_flags.

Fix this issue by ensuring that the WMI peer auth bit is set in
peer_flags in WMI peer association command when updating the new
bitrate.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Thiraviyam Mariyappan<thiraviyam.mariyappan@oss.qualcomm.com>
Signed-off-by: Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 ++++
 drivers/net/wireless/ath/ath12k/wmi.c | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 88b59f3ff87a..d8c14954d8d2 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3232,6 +3232,7 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 
 	rcu_read_unlock();
 
+	peer_arg->is_assoc = true;
 	ret = ath12k_wmi_send_peer_assoc_cmd(ar, peer_arg);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to run peer assoc for %pM vdev %i: %d\n",
@@ -5174,6 +5175,8 @@ static int ath12k_mac_station_assoc(struct ath12k *ar,
 			    "invalid peer NSS %d\n", peer_arg->peer_nss);
 		return -EINVAL;
 	}
+
+	peer_arg->is_assoc = true;
 	ret = ath12k_wmi_send_peer_assoc_cmd(ar, peer_arg);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to run peer assoc for STA %pM vdev %i: %d\n",
@@ -5420,6 +5423,7 @@ static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *wk)
 			ath12k_peer_assoc_prepare(ar, arvif, arsta,
 						  peer_arg, true);
 
+			peer_arg->is_assoc = false;
 			err = ath12k_wmi_send_peer_assoc_cmd(ar, peer_arg);
 			if (err)
 				ath12k_warn(ar->ab, "failed to run peer assoc for STA %pM vdev %i: %d\n",
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 60e2444fe08c..8f3bba4fe4ac 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2147,7 +2147,7 @@ static void ath12k_wmi_copy_peer_flags(struct wmi_peer_assoc_complete_cmd *cmd,
 		cmd->peer_flags |= cpu_to_le32(WMI_PEER_AUTH);
 	if (arg->need_ptk_4_way) {
 		cmd->peer_flags |= cpu_to_le32(WMI_PEER_NEED_PTK_4_WAY);
-		if (!hw_crypto_disabled)
+		if (!hw_crypto_disabled && arg->is_assoc)
 			cmd->peer_flags &= cpu_to_le32(~WMI_PEER_AUTH);
 	}
 	if (arg->need_gtk_2_way)

base-commit: 3d933084a072fd5fb5da54c06a017abc0412c86f
-- 
2.34.1


