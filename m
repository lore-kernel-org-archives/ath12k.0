Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96BCCD4F26
	for <ath12k@archiver.kernel.org>; Tue, 23 Jun 2026 03:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i2FMV4qXXYG6SBDoZjlw8oaGTiGHYxPxZX7e/s/Cgp0=; b=XxEBvhWxeLc7AZ2N2ByAXVjd1a
	Sa/c9w9TTEyarRwPqnoJJLqXmp+mdAkVbGlErkneOlg7p3HSI4ZjslL+EVAYAtChMhrCsZKaCvKP3
	iZqWc+aAT9mqEBwW1THrsOx3CnWEx35jYLCjUfcYPq6I3xL0PALB5yyfzxzxMCA4V28aCKuE/WCga
	iuVDbBh/CJkNmNpnytrTsTFxa8dE7CnYDht4Fzhv8wzRzimXg9Tt5mHeGDmUbSZztfsK2RoodEp5h
	+gOh+ciQxf6lKKzvZ0iya9zXUxLKgKIfL47riiTlvGDGpRcBRc6HE1t7ySXSsqrFL7ky9Afi6txei
	h2sA9M4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbsAN-00000005fTy-1Ri0;
	Tue, 23 Jun 2026 03:51:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbsAK-00000005fTa-3ZAP
	for ath12k@lists.infradead.org;
	Tue, 23 Jun 2026 03:51:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N0kjoA2766393
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 03:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=i2FMV4qXXYG6SBDoZjlw8oaGTiGHYxPxZX7
	e/s/Cgp0=; b=E5hjDdL7Iy5xa/BM+M6tqnyYF8bm57nYyJ00J0i/JWFR/T4OPk+
	qQSVwQf+AxsSMY5kS3QIUFDaxiFmAfQfubxV0aWonHIGg+OzjLRUCXuHLfqH0isx
	V+/dvHB1l0/UVwI4ok1dRVV8RMggahsS/Smn8S7tFFt/CQtantloDHf5k4G68ZLe
	jmD74k4OzeZeF/7rUhfxrmLr02IT8T9573JK2xzOgKUN6+yQPYUHI34yba4XptVz
	Eb+4TYh5yqdSAa4hWoRJ5k+Zg5d1p4BoJ1ElAZFg97ncvaw1lECu/NlFs+azWkTD
	N5ap/ofwLkIZ9k4Ru+/BXo3TyDm1ygQMR0w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3ebb9x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 03:51:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6afd85980so50335665ad.0
        for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 20:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782186670; x=1782791470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i2FMV4qXXYG6SBDoZjlw8oaGTiGHYxPxZX7e/s/Cgp0=;
        b=ZcGi6BKbiKBToEM9APZU+nTN04NZEv6kKKLU6+pg01VdTZgYhXJQYvBo82QlklXX2h
         MAVfOY2LwzQZ6IrtXzQnihvSNzUM/lyiBv51A3/crGvn36ESj1licVhSqPzN40qaS2TY
         ooJu3ebVKb3x5kt7pUguaLxJbQDyyHeJDkcIWqXdI9rwcKbYcloAFrfYT/GHaydGUms7
         oMo8BE7F9EkykZjfDHSZr0MJ6t0X9Q91Np1C1AZ2ByFUShCYG/14FCVwe/xOZRUhHkFz
         BSx4Poh+chvTyJIlr2ErpLPOnbJduz3HbiSbP5lpW06hsc9lOF8BpEciIR8F1fkBVpZh
         MDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782186670; x=1782791470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2FMV4qXXYG6SBDoZjlw8oaGTiGHYxPxZX7e/s/Cgp0=;
        b=Ba9HiF+WUCUajEHCgNo0TKVlOgUNTcg5e0x0T+JLs7Sm3bQJ2t8nPhm068VdfKJhxm
         0mIAMn0SBkHo77sMpvptgkzn/jNXB/58oqsmkdj9gLPTvkDqzvWXr3jzubgQJXGonMCb
         mGSGb9pDab9DcOojds3pjCGDO73LGdYAjpBI0yQFSxUb+kwV+BvZuxWeXlaAMRFcpWod
         CGBE4jevDbs+XWM/qF7/a81jcjGxIIvmuYfVSJIwO7YDas4pV8V43KzpYeN5AUiSbd7L
         G1XFbvEXDAmZSJQZe+iBYAhCkpjt+uoGnI7d+AbddnVNxC9TRrgsAk2UnZfkRDac8rmd
         Ki+A==
X-Gm-Message-State: AOJu0YwnOfnGApEDUo6ZefifjS/YPSIiVJs9EBV0utn6QvaiFhwXdNuW
	4esRjVNzg4VSoB4fOuDcYhL8PrBENnGMF4I2T1/5yQrUIthvheCrARDvUA5o7tfqp74m3iJs43I
	xzHoCqExsmGHJKqMIxCGa63zf+jYVhk/rP20olJgMgCS3GVmB3s9nMlW5X8CQTMVgk0DxM0lC
X-Gm-Gg: AfdE7cm9xWpRmwD7PfvglPGokb6S44qVNJPG/NRYcGskkPmbRWkhRUXuZaAEsyeDHLP
	b/ot7w805GRN5ifX41UQW9ZKqT1GTpUYAAXpfovAytiXoyggstGnVmzWdt0tRGIRD0H8DEmQPX3
	UcBrSZWUuNtcM7FGQo4muiq8qqZtQwFYplGXgPfUhQ7K409Wc5X8oqL0kcwD+BOZWONhTWpdbQV
	PBFK/jHqb9EY/EiWD7eiybRIR/YsYVo/stSfcu8PWA9+RgIO3gcBMoleY9JV2yRZJNd5qwd1jzB
	kGkq8MNYWbQ6krBf0KuM9z3tl8UUpdc25qI7ISJR288J55Q+Y3hTqpvo83jtxZ74uNsKTZ9OvVl
	PheNHOCzv+IBD9ym2IHcI9TVemHDT21bY3Da9r0MG7x8ra2+kPrIjXRuTUm18Nk7lFMNa/+jg/+
	U8RXWVVE93Ff9J7PBFqpjUA063NuYno4N9lw==
X-Received: by 2002:a17:902:ce82:b0:2c7:c4b8:60eb with SMTP id d9443c01a7336-2c7c4b8678dmr18585075ad.3.1782186669969;
        Mon, 22 Jun 2026 20:51:09 -0700 (PDT)
X-Received: by 2002:a17:902:ce82:b0:2c7:c4b8:60eb with SMTP id d9443c01a7336-2c7c4b8678dmr18584885ad.3.1782186669526;
        Mon, 22 Jun 2026 20:51:09 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7444aa5f1sm110095495ad.78.2026.06.22.20.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 20:51:09 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: remove unused QMI definitions
Date: Tue, 23 Jun 2026 09:21:04 +0530
Message-Id: <20260623035104.3765404-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDAyNyBTYWx0ZWRfXwe5rTDzbGq9i
 RaJP1raXGd87qIEZjJ1lm6A2+/bIFl/XF70cImgT64dPD3nBMzVGtSDg7pvEKIjcl8XF+mY8aWZ
 g1oP41UUDoXkNNhPPgPTvTvVRk3QfPY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDAyNyBTYWx0ZWRfXwn9SqIXJjzsw
 Kbzr1wpZC1SNReshfhgVqH+mV484DX4poKc8cUdpAyILSugahTOYNveJkT3YDQAeAlYIUB6cWcD
 m9ruF9pYOP9x4sFx+U5ZrYmPT/hKfml8x5Mx30PVxRiEbwnuan7gnX3ThU0WewdxcIGqq+JvbOL
 JGGY8+8jMXiLWQ5EKoFt/AO3dHrVcu1XyUW9yZVxrskeVAkt149CKjnqr3x9lMXDZxOZXNlQnPc
 nObqKI0LiGFr61eejWiklVnCqvA4rfWynrZbFcWz/Xh6FpmMbHHU1lh8cVVcz9aWE129v0nVBka
 U2zB+DMPuJBC+AGDszfZZDpJyw2tyrWjfwsfF2V1Nt8hi0YExUddqlS5EdL4FzjbKfsHhTO3hx0
 r0BJiwljgvteDBcGuFb6ZrvFTN8+9u383MGNqTPMEnEJq9GMR40L3b1Ghx+yqIAk+GLN42KzVXw
 BiPNMdIpD5+YJZn4x9w==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a3a02af cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=hj2YK8iUnCGhfojHIzIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 0eAnBInrTOI2m2cKP-ifeyMuOb5HLrl0
X-Proofpoint-ORIG-GUID: 0eAnBInrTOI2m2cKP-ifeyMuOb5HLrl0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_01,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_205113_013857_F64B3686 
X-CRM114-Status: GOOD (  12.29  )
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

The driver contains several unused QMI definitions such as response
length macros, message IDs, firmware segment length definitions, and
CALDB address size definitions.

Remove these unused definitions as they are not referenced anywhere in
the driver.

No functional change intended.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.h | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 2a63e214eb42..80a9b42a2548 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -13,7 +13,6 @@
 #define ATH12K_HOST_VERSION_STRING		"WIN"
 #define ATH12K_QMI_WLANFW_TIMEOUT_MS		10000
 #define ATH12K_QMI_MAX_BDF_FILE_NAME_SIZE	64
-#define ATH12K_QMI_CALDB_ADDRESS		0x4BA00000
 #define ATH12K_QMI_WLANFW_MAX_BUILD_ID_LEN_V01	128
 #define ATH12K_QMI_WLFW_SERVICE_VERS_V01	0x01
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01	0x02
@@ -24,9 +23,7 @@
 #define ATH12K_QMI_WLANFW_MAX_TIMESTAMP_LEN_V01	32
 #define ATH12K_QMI_RESP_LEN_MAX			8192
 #define ATH12K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01	52
-#define ATH12K_QMI_CALDB_SIZE			0x480000
 #define ATH12K_QMI_BDF_EXT_STR_LENGTH		0x20
-#define ATH12K_QMI_FW_MEM_REQ_SEGMENT_CNT	3
 #define ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01 4
 #define ATH12K_QMI_DEVMEM_CMEM_INDEX	0
 
@@ -160,8 +157,6 @@ struct ath12k_qmi {
 
 #define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN		261
 #define QMI_WLANFW_HOST_CAP_REQ_V01			0x0034
-#define QMI_WLANFW_HOST_CAP_RESP_MSG_V01_MAX_LEN	7
-#define QMI_WLFW_HOST_CAP_RESP_V01			0x0034
 #define QMI_WLFW_MAX_NUM_GPIO_V01			32
 #define QMI_WLANFW_MAX_PLATFORM_NAME_LEN_V01		64
 #define QMI_WLANFW_MAX_HOST_DDR_RANGE_SIZE_V01		3
@@ -267,8 +262,6 @@ struct qmi_wlanfw_host_cap_resp_msg_v01 {
 
 #define QMI_WLANFW_PHY_CAP_REQ_MSG_V01_MAX_LEN		0
 #define QMI_WLANFW_PHY_CAP_REQ_V01			0x0057
-#define QMI_WLANFW_PHY_CAP_RESP_MSG_V01_MAX_LEN		18
-#define QMI_WLANFW_PHY_CAP_RESP_V01			0x0057
 
 struct qmi_wlanfw_phy_cap_req_msg_v01 {
 };
@@ -285,8 +278,6 @@ struct qmi_wlanfw_phy_cap_resp_msg_v01 {
 
 #define QMI_WLANFW_IND_REGISTER_REQ_MSG_V01_MAX_LEN		54
 #define QMI_WLANFW_IND_REGISTER_REQ_V01				0x0020
-#define QMI_WLANFW_IND_REGISTER_RESP_MSG_V01_MAX_LEN		18
-#define QMI_WLANFW_IND_REGISTER_RESP_V01			0x0020
 #define QMI_WLANFW_CLIENT_ID					0x4b4e454c
 
 struct qmi_wlanfw_ind_register_req_msg_v01 {
@@ -322,12 +313,8 @@ struct qmi_wlanfw_ind_register_resp_msg_v01 {
 	u64 fw_status;
 };
 
-#define QMI_WLANFW_REQUEST_MEM_IND_MSG_V01_MAX_LEN	1824
 #define QMI_WLANFW_RESPOND_MEM_REQ_MSG_V01_MAX_LEN	888
-#define QMI_WLANFW_RESPOND_MEM_RESP_MSG_V01_MAX_LEN	7
-#define QMI_WLANFW_REQUEST_MEM_IND_V01			0x0035
 #define QMI_WLANFW_RESPOND_MEM_REQ_V01			0x0036
-#define QMI_WLANFW_RESPOND_MEM_RESP_V01			0x0036
 #define QMI_WLANFW_MAX_NUM_MEM_CFG_V01			2
 #define QMI_WLANFW_MAX_STR_LEN_V01                      16
 
@@ -385,9 +372,7 @@ struct qmi_wlanfw_fw_ready_ind_msg_v01 {
 };
 
 #define QMI_WLANFW_CAP_REQ_MSG_V01_MAX_LEN	0
-#define QMI_WLANFW_CAP_RESP_MSG_V01_MAX_LEN	207
 #define QMI_WLANFW_CAP_REQ_V01			0x0024
-#define QMI_WLANFW_CAP_RESP_V01			0x0024
 
 enum qmi_wlanfw_pipedir_enum_v01 {
 	QMI_WLFW_PIPEDIR_NONE_V01 = 0,
@@ -500,8 +485,6 @@ struct qmi_wlanfw_cap_req_msg_v01 {
 };
 
 #define QMI_WLANFW_BDF_DOWNLOAD_REQ_MSG_V01_MAX_LEN	6182
-#define QMI_WLANFW_BDF_DOWNLOAD_RESP_MSG_V01_MAX_LEN	7
-#define QMI_WLANFW_BDF_DOWNLOAD_RESP_V01		0x0025
 #define QMI_WLANFW_BDF_DOWNLOAD_REQ_V01			0x0025
 /* TODO: Need to check with MCL and FW team that data can be pointer and
  * can be last element in structure
@@ -529,8 +512,6 @@ struct qmi_wlanfw_bdf_download_resp_msg_v01 {
 };
 
 #define QMI_WLANFW_M3_INFO_REQ_MSG_V01_MAX_MSG_LEN	18
-#define QMI_WLANFW_M3_INFO_RESP_MSG_V01_MAX_MSG_LEN	7
-#define QMI_WLANFW_M3_INFO_RESP_V01		0x003C
 #define QMI_WLANFW_M3_INFO_REQ_V01		0x003C
 
 struct qmi_wlanfw_m3_info_req_msg_v01 {
@@ -543,7 +524,6 @@ struct qmi_wlanfw_m3_info_resp_msg_v01 {
 };
 
 #define QMI_WLANFW_AUX_UC_INFO_REQ_MSG_V01_MAX_MSG_LEN	18
-#define QMI_WLANFW_AUX_UC_INFO_RESP_MSG_V01_MAX_MSG_LEN	7
 #define QMI_WLANFW_AUX_UC_INFO_REQ_V01	0x005A
 
 struct qmi_wlanfw_aux_uc_info_req_msg_v01 {
@@ -556,13 +536,9 @@ struct qmi_wlanfw_aux_uc_info_resp_msg_v01 {
 };
 
 #define QMI_WLANFW_WLAN_MODE_REQ_MSG_V01_MAX_LEN	11
-#define QMI_WLANFW_WLAN_MODE_RESP_MSG_V01_MAX_LEN	7
 #define QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN		803
-#define QMI_WLANFW_WLAN_CFG_RESP_MSG_V01_MAX_LEN	7
 #define QMI_WLANFW_WLAN_MODE_REQ_V01			0x0022
-#define QMI_WLANFW_WLAN_MODE_RESP_V01			0x0022
 #define QMI_WLANFW_WLAN_CFG_REQ_V01			0x0023
-#define QMI_WLANFW_WLAN_CFG_RESP_V01			0x0023
 #define QMI_WLANFW_MAX_STR_LEN_V01			16
 #define QMI_WLANFW_MAX_NUM_CE_V01			12
 #define QMI_WLANFW_MAX_NUM_SVC_V01			24
@@ -605,9 +581,7 @@ struct qmi_wlanfw_wlan_cfg_resp_msg_v01 {
 };
 
 #define ATH12K_QMI_WLANFW_WLAN_INI_REQ_V01	0x002F
-#define ATH12K_QMI_WLANFW_WLAN_INI_RESP_V01	0x002F
 #define QMI_WLANFW_WLAN_INI_REQ_MSG_V01_MAX_LEN		7
-#define QMI_WLANFW_WLAN_INI_RESP_MSG_V01_MAX_LEN	7
 
 struct qmi_wlanfw_wlan_ini_req_msg_v01 {
 	/* Must be set to true if enable_fwlog is being passed */

base-commit: 1547a99cd8d8c1ab3e04dbd92b72b3b5f7cb85a9
-- 
2.34.1


