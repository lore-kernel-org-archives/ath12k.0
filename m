Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFD5109B477
	for <ath12k@archiver.kernel.org>; Tue, 31 Mar 2026 14:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7x7Sag3p1W6KTCAxlSilDkanjEO722npmlRKN1tRFNk=; b=xONjmuoQGjta5E+lzdC7EKB6I5
	Z36Ck1zLFq4fRE3c8iI/pG9l2LsBBf489nRIT0SXtU0lSmFJNAfkvYn8Wu601Z0VfPm1esOGFFCcW
	sIiaG7fkWRnA+Ojh7RRFaB75qXNzZh4R1nirHAK7O4K9UIVZvcsJaHrfbUe0yVaZdL9q/BgA5Tt6K
	LeLsvxKiSp/Mm0+hQEb6s9tcMselqxjcEzTD7WjhCTCRqfAdYDXfIEf2KmXHK80dlU8MKZp5Umq9f
	Wg2zuEwRVvR1VPU5pIA20Qr5jNZ1HoVYk6EEkkjo/ovKbhtUSHLPk6GpPBw9BKf3JS5A7UxaqKaTR
	Ya6OTSeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a1w-0000000D5Th-0gXy;
	Tue, 31 Mar 2026 14:25:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a1o-0000000D5O4-1RV2
	for ath12k@lists.infradead.org;
	Tue, 31 Mar 2026 14:25:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VE4O3a058651
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 14:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7x7Sag3p1W6
	KTCAxlSilDkanjEO722npmlRKN1tRFNk=; b=nBkL5SElUfeiCbL2OadIBiGnWhJ
	BxzZ04WrpI8F5fT4t7dJd6Nuh5gfeu2vH8xLw2EgHJwfl3VA+Y8f3nR7hwhJxM0l
	XwK0/6ROZdGdJbJDxM3gOenOcds7gwwc3v1CaETE4X5S9sGr3ONVW5Hr1UshgO2G
	Ws1S+D+eRinUPfRzYB2Vzs8n8cS8xQdx0cUQvlRRH0iP0gNz+figMGUmc6WhcuS1
	CsvUxEx8WqIB/2+9dFZ2gxCsLv80kpyvA8PIa5+uI2BtHHN8eQ+3WCW5JhHwmV4w
	RJFM02c3D/fl3NWkhfXTNiHvMm1BnHXgFN068QV8pJc8AOt9k3FFcp+GI9Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8ahksk5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 14:25:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24e45271cso30280655ad.2
        for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 07:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774967110; x=1775571910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7x7Sag3p1W6KTCAxlSilDkanjEO722npmlRKN1tRFNk=;
        b=UPF9JYBJQwW+VX3SzhzQeZMGeHzlfNhG6EyNvfkTvZiQs16f8j9dCli92ZR09oFzG8
         9CIRTCy/qDPIoDOk2dHn0QXPgcSAbsoxM02nezJhPy+hqXtG9BlNenD93Q+rSPihRB14
         sijFI2gzFEyPGHLOuC6ifD/GkmBiuDtX/Mfhny5pTgq9NYnP0cO+QsA5yzdwD87s21ec
         6wWhg28iINjAty1uWMuZkJRrg9/HAX+tJYICKtTJ+eD5MidfQW8nyu/Hiyjuvq1Fxs0L
         IcETHnMOxbCcHjyvBS/3wqcSh/04hR1skS99ew/1qM+4a+a458J2bVln/WEBXAY9dTHL
         kF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774967110; x=1775571910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7x7Sag3p1W6KTCAxlSilDkanjEO722npmlRKN1tRFNk=;
        b=HccK+Y9r2RlTXZZTjycqHtYesQj9jY+B+JDZ/polqxJ/9BS71h4OkJlkULzZGDgf3Q
         oAfObqGAsFZvHG8HBdNDukDgZrG/2faE8y7uyHQ1pLcfFofBbu16E9CftcpkV1A0I93p
         npEx2MzhDXHey8OjOIzpQst6/fOp+QLyhsk/s9R9JzPHzMNYCi1Rbgwfuc9Y2xd551u4
         epukGu5VGYIed2o05Oq1LQSeBiudpIoYIlIc894NmXqRa495lMpkWR5apgMYp697EA+0
         afRcjU6J7+OieUPdr+/X9U6k4JotMqncbM8Lolo6X/sCuA4rZX7tka+PZdCD1JwqdfRP
         xe0A==
X-Gm-Message-State: AOJu0Yx/P39+kIqiIXsa+FUwidQJszexD1DpZcwy6/H14Y0OmWD1jaE9
	UrYKfL25x2H0Eku8zfSKOJmCINVlQoYQy0llhR6+UFhk97NwsyCc9grqWnkiOb7EKHePN+ia4hi
	DY5lnK7JiY/AJ9P36Fpa0ikzbW8yD9ExTYIWKxSxd+Wqw/CvGFF1UtqbaepaMltS1jCio1KJI
X-Gm-Gg: ATEYQzyDziZIfr6hPIpKbwcSdDs9gYuPe+6tjyTlrHmU4fWtz4WvS/Gr1yvaSOKQYQ7
	sutEnIGQzZZwMu6+nwX0uZcsI+0wgEpJocQ1LbRBQpHh47JyGz3Y6Z+s3/C5tMLBaaUuVZV1Hfk
	K0L+MY+tGb0Q6qbsRsh+UG+i4hZaCPe3gyggDX5tpNOxNcppq4g8kwxAqmQGE4KfbOuuVqOTIyR
	QlXJuAAvaKSvCwxnTFrkunUFhLHDhycW8Y0k3JMxgcl4VjJCaBrIzN8tVpwJ41gPHAoCFYbN4yx
	FWh1TgNkrdfkWLoQ9D+w09OMOeEMLqi1wxGbfNKE1OeXncESlNnHuwwVHmz1cas3sKmra+8VmDO
	fskYf3bN9ZR0ltmyxU19N8+vYV7RCO5eyqcLUcP7HEYx2z8/4d2+RbGUS4sRTmcytGiksef2R7t
	yEdh1dWI2htebeaG4sSmmxPbv2dr9jN/kkWj/bTTwhdy8+hpLh19s=
X-Received: by 2002:a17:902:e74f:b0:2ae:6092:8d93 with SMTP id d9443c01a7336-2b0cdc9eac4mr183407725ad.28.1774967109893;
        Tue, 31 Mar 2026 07:25:09 -0700 (PDT)
X-Received: by 2002:a17:902:e74f:b0:2ae:6092:8d93 with SMTP id d9443c01a7336-2b0cdc9eac4mr183407365ad.28.1774967109429;
        Tue, 31 Mar 2026 07:25:09 -0700 (PDT)
Received: from hu-mkenna-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24276689asm112030225ad.38.2026.03.31.07.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:25:09 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next 3/5] wifi: ath12k: refactor per-radio thermal hwmon setup and cleanup
Date: Tue, 31 Mar 2026 19:54:44 +0530
Message-Id: <20260331142446.2951809-4-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331142446.2951809-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20260331142446.2951809-1-maharaja.kennadyrajan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE0MCBTYWx0ZWRfXxsO5Qu/4J3uL
 tQ9015Xso2pBEfy3F+wX/7Ovm6V+PXxo7g0Itcza3cPYvpN+KdmCK0RXlqreG/uNlJd91FIdq93
 iQ7LTip14DIXTu40cJKune3oj+R51QwPGlD90zAZCBV3bLdPuYD1C3gQpNxTsE2uiGGiMNTP8P0
 LfICK922RNfjhRS9lZgnlzS9uj919l7MUe+Ijgvx0l7Oy63gUT7q4aQgZgfFN0mWWao5ZUqbcEt
 SoTKKBnj9sd5YJOP7NKd+YqCbGg+42suVSrOwsn3RkO9qYWmHk3lLZMXNHrb2/JxZWl/eigcoLN
 N/35ufUizrAphBMte62bfZHT0CEmvS4sZvLraUKtTX6iETGHvCaV796jBFq9Iw4cNJqraXMjvfI
 Z3HCYJYtd/86zpUiK9krHdkS35nKrZxZyB6SU03nhdnLFbxxiKt6qEg39MF09m30Hdsjo8mJ3zr
 PpEvuBnfEmAJYhoWy+w==
X-Authority-Analysis: v=2.4 cv=K4wv3iWI c=1 sm=1 tr=0 ts=69cbd947 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=9zPADYYpdTKIp-S0na4A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: LGkvYAyOrnbUJdu0F1VVSY5fADCK3UsR
X-Proofpoint-GUID: LGkvYAyOrnbUJdu0F1VVSY5fADCK3UsR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_072512_505930_20FAF154 
X-CRM114-Status: GOOD (  16.82  )
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

Both the error path in thermal registration and the normal thermal unregister
path performed the same hwmon device unregistration and pointer cleanup.
Consolidate this logic into a single helper to reduce code duplication and ensure
consistent cleanup across all paths. Add a helper to set up the hwmon registration
during thermal registration to keep symmetry with thermal cleanup.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/thermal.c | 83 +++++++++++++----------
 1 file changed, 47 insertions(+), 36 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/thermal.c b/drivers/net/wireless/ath/ath12k/thermal.c
index 4f76622e8117..6f70c11c1098 100644
--- a/drivers/net/wireless/ath/ath12k/thermal.c
+++ b/drivers/net/wireless/ath/ath12k/thermal.c
@@ -130,59 +130,70 @@ static struct attribute *ath12k_hwmon_attrs[] = {
 };
 ATTRIBUTE_GROUPS(ath12k_hwmon);
 
-int ath12k_thermal_register(struct ath12k_base *ab)
+static int ath12k_thermal_setup_radio(struct ath12k_base *ab, int i)
+{
+	struct ath12k *ar;
+	int ret;
+
+	ar = ab->pdevs[i].ar;
+	if (!ar)
+		return 0;
+
+	ar->thermal.hwmon_dev =
+		hwmon_device_register_with_groups(&ar->ah->hw->wiphy->dev,
+						  "ath12k_hwmon", ar,
+						  ath12k_hwmon_groups);
+	if (IS_ERR(ar->thermal.hwmon_dev)) {
+		ret = PTR_ERR(ar->thermal.hwmon_dev);
+		ar->thermal.hwmon_dev = NULL;
+		ath12k_err(ar->ab, "failed to register hwmon device: %d\n",
+			   ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ath12k_thermal_cleanup_radio(struct ath12k_base *ab, int i)
 {
 	struct ath12k *ar;
-	int i, j, ret;
+
+	ar = ab->pdevs[i].ar;
+	if (!ar)
+		return;
+
+	hwmon_device_unregister(ar->thermal.hwmon_dev);
+	ar->thermal.hwmon_dev = NULL;
+}
+
+int ath12k_thermal_register(struct ath12k_base *ab)
+{
+	int i, ret;
 
 	if (!IS_REACHABLE(CONFIG_HWMON))
 		return 0;
 
 	for (i = 0; i < ab->num_radios; i++) {
-		ar = ab->pdevs[i].ar;
-		if (!ar)
-			continue;
-
-		ar->thermal.hwmon_dev =
-			hwmon_device_register_with_groups(&ar->ah->hw->wiphy->dev,
-							  "ath12k_hwmon", ar,
-							  ath12k_hwmon_groups);
-		if (IS_ERR(ar->thermal.hwmon_dev)) {
-			ret = PTR_ERR(ar->thermal.hwmon_dev);
-			ar->thermal.hwmon_dev = NULL;
-			ath12k_err(ar->ab, "failed to register hwmon device: %d\n",
-				   ret);
-			for (j = i - 1; j >= 0; j--) {
-				ar = ab->pdevs[j].ar;
-				if (!ar)
-					continue;
-
-				hwmon_device_unregister(ar->thermal.hwmon_dev);
-				ar->thermal.hwmon_dev = NULL;
-			}
-			return ret;
-		}
+		ret = ath12k_thermal_setup_radio(ab, i);
+		if (ret)
+			goto out;
 	}
 
 	return 0;
+out:
+	for (i--; i >= 0; i--)
+		ath12k_thermal_cleanup_radio(ab, i);
+
+	return ret;
 }
 
 void ath12k_thermal_unregister(struct ath12k_base *ab)
 {
-	struct ath12k *ar;
 	int i;
 
 	if (!IS_REACHABLE(CONFIG_HWMON))
 		return;
 
-	for (i = 0; i < ab->num_radios; i++) {
-		ar = ab->pdevs[i].ar;
-		if (!ar)
-			continue;
-
-		if (ar->thermal.hwmon_dev) {
-			hwmon_device_unregister(ar->thermal.hwmon_dev);
-			ar->thermal.hwmon_dev = NULL;
-		}
-	}
+	for (i = 0; i < ab->num_radios; i++)
+		ath12k_thermal_cleanup_radio(ab, i);
 }
-- 
2.34.1


