Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C5AC021A6
	for <ath12k@archiver.kernel.org>; Thu, 13 Feb 2025 22:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6grw8wuFGe/gguOVhEpgEpd6veb5fHEaE9GwGP73BM=; b=HbqmX/QG/PLZoHJWcPFFjHi+Cz
	fxGOS/Fs4Pjw4pe8Pgp7nlvxSzgR3RaFy64mClK0Qy9D8rThFru8sw++AvaXsA0myfgW9ILDkjkfe
	miEk0nm0WtjvCXv/XtPLiLwGv12/7bFmgNrZo+K0+ItXht8rJQf3/03ky0FeHbguRoOcdI12Bhmnh
	iqgBMn4U3VZg1G5jbBqW1jiR7EdsqhXPUBwl+nHK3Pmno1kG68Yh6w/dp8dlRCTwgw709YVtIeNp5
	SI34QbujdD1MfmxVg1a3rOd7Ro+mqju5RuFPNOlgas2CfvRP6maL0OZ3s5MkPDBS9wDqu7/Lj1X6d
	q8Vxpb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tii2i-0000000Crt9-0lKL
	for ath12k@archiver.kernel.org;
	Thu, 13 Feb 2025 22:50:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tii2f-0000000CrqH-31I6
	for ath12k@lists.infradead.org;
	Thu, 13 Feb 2025 22:50:47 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DJDmES021218
	for <ath12k@lists.infradead.org>; Thu, 13 Feb 2025 22:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p6grw8wuFGe
	/gguOVhEpgEpd6veb5fHEaE9GwGP73BM=; b=Oc83GJrrP3tiTxtzl4TPWGI3C25
	EQF8QaZPD/DPPMF4PBwigrfn1vuu2KMVrrNhw2LFSwktsFoZXfiWsQ8coLS0FzUW
	GDlLwflXjZqmZUoykBqhHqGWaLjdf2/nZzTFAoIYPr1r5x/G5fEA0Py3SzA043Cy
	xXOCIMW+4xSMm8ijPvd/hCQSKSWipOslFOCL0WI4rlkRwCvkvSwEUHlOxUxv/3U0
	slrJ1xwf6LMb5rYUWGHH5jYdK2/FmhQctJBNGsMl1fbwocgKjcPO/0EBO+1HcxP5
	E5lLq1497PwJHtadLdD6fTtQoJO4qlvVJ7Nz+kAzmqNYnEUoJmSymDvMIpw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sdyxsy2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 13 Feb 2025 22:50:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21f7519ae0cso28435695ad.3
        for <ath12k@lists.infradead.org>; Thu, 13 Feb 2025 14:50:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739487042; x=1740091842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6grw8wuFGe/gguOVhEpgEpd6veb5fHEaE9GwGP73BM=;
        b=mhiisBYuG2YunG4+yFVngeUqisk7OXTyrK0KJAHadmmaGe5YMRmJvPwNgu2U628QGE
         rwxRIyWJESVR3iCSOiSmoyLLOW2wryXT2kpsEzdz8RdBktP43j6O2r3vpeunopsyrnjx
         bQwF0QafYGhrFjDnjnqkFGYbqu4g36VRCOhdeluXWyRRpdoHNwKkaeAn3DoKhKfXA/Mg
         IhmmdRocL28NVa7M+cSLsWj7EXNdKJeYPyPC321rRKxum+xhcIa6JsVjXo3Er3pL5WJh
         mCHg3uRHQ89mUaM+4TcS3QTarxxSFDJ4GsRXa8bMomIG/9lSIJKc0pSS6WBP5SqHxpjG
         7+9w==
X-Forwarded-Encrypted: i=1; AJvYcCUalbdiJMD836Obn0M4cKc2vNMuMxeHlshJ6CnCx1FZeOWfkRyuEF61wCR4mOZbFADETjwfHd4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzfxiaeIT52u61bS2RbOKVsqid4DmDRG/l4fmS3uzL/4T4AIGK8
	njWDdYKkPdyFSSU6ZoxZ6mvF+GSANuA74E1+naNe8Buw5GjZ9B8+KbXc4szU+i+fYWfOxTIISZ7
	tbQWkHicNXaNCzJjd7SHynYJ7jZu+bLO36tMkKx1MJD9jbM5mjQDpQSHt78YS
X-Gm-Gg: ASbGncuhE0c4efxFpzZJykoeVo3qzGBO39etGfHhsWctzWbdvPcPvxxatlyyVXIhYFi
	15ClJeYuPXLWADmpx0hnjH5gjNW5uQAHUr6bgv9XtDGjcfBqZNkDlSdSqw5ywje3Oflct5pwg5I
	rg4zD5cQyfyuzR8FvhavihH3bFJyUj0fuZ25UQTSE9fkP+ffsQDtf5SdH26Zqp94Lu7+Ir84Ws6
	JKG8Ve76rWPamIpnLOLs58PALjrfD2zM9wAzH4nrbdLXla+yN7QO0rEbXSYJcsRUEk0nNjbfFEo
	yvY/ED6CHd6tyBPKX/F6gXXZfYeAzckLaq4iti6MYn7GPPRCEnAKsvNajgzQ
X-Received: by 2002:a17:902:c402:b0:220:d7f9:9ea8 with SMTP id d9443c01a7336-220d7f99fc9mr51790605ad.26.1739487042410;
        Thu, 13 Feb 2025 14:50:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbl+ByEJmGsoi3MIiBDk9HO865Pptlkod6xeE/FgmeLuvCEu8A5fRJ/bY82qQD4lJfd4D3bA==
X-Received: by 2002:a17:902:c402:b0:220:d7f9:9ea8 with SMTP id d9443c01a7336-220d7f99fc9mr51790315ad.26.1739487042011;
        Thu, 13 Feb 2025 14:50:42 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55916c7sm17571665ad.243.2025.02.13.14.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:50:41 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Muna Sinada <muna.sinada@oss.qualcomm.com>,
        Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v3 1/3] wifi: nl80211: add link id of transmitted profile for MLO MBSSID
Date: Thu, 13 Feb 2025 14:50:34 -0800
Message-Id: <20250213225036.3118133-2-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213225036.3118133-1-aloka.dixit@oss.qualcomm.com>
References: <20250213225036.3118133-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gS4KKgd4C05q-iK-CiioIEKQVcUgdbOh
X-Proofpoint-GUID: gS4KKgd4C05q-iK-CiioIEKQVcUgdbOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_145045_865622_34686FD0 
X-CRM114-Status: GOOD (  19.12  )
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

From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

During non-transmitted (nontx) profile configuration, interface
index of the transmitted (tx) profile is used to retrieve the
wireless device (wdev) associated with it. With MLO, this 'wdev'
may be part of an MLD with more than one link, hence only
interface index is not sufficient anymore to retrieve the correct
tx profile. Add a new attribute to configure link id of tx profile.

Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Co-developed-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
Co-developed-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 include/net/cfg80211.h       |  2 ++
 include/uapi/linux/nl80211.h |  6 ++++++
 net/wireless/nl80211.c       | 14 ++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index a72e7eb7027f..d0e5e146704e 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1286,11 +1286,13 @@ struct cfg80211_crypto_settings {
  * struct cfg80211_mbssid_config - AP settings for multi bssid
  *
  * @tx_wdev: pointer to the transmitted interface in the MBSSID set
+ * @tx_link_id: link ID of the transmitted profile in an MLD, default is 0.
  * @index: index of this AP in the multi bssid group.
  * @ema: set to true if the beacons should be sent out in EMA mode.
  */
 struct cfg80211_mbssid_config {
 	struct wireless_dev *tx_wdev;
+	u8 tx_link_id;
 	u8 index;
 	bool ema;
 };
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 9d8ecf20ef0d..ed2a181a2557 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -8022,6 +8022,11 @@ enum nl80211_sar_specs_attrs {
  *	Setting this flag is permitted only if the driver advertises EMA support
  *	by setting wiphy->ema_max_profile_periodicity to non-zero.
  *
+ * @NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID: Link ID of the transmitted profile.
+ *	This parameter is mandatory if the transmitted profile is part of an MLD
+ *	and the interface getting configured is a non-transmitted profile. For all
+ *	other cases it will be ignored.
+ *
  * @__NL80211_MBSSID_CONFIG_ATTR_LAST: Internal
  * @NL80211_MBSSID_CONFIG_ATTR_MAX: highest attribute
  */
@@ -8033,6 +8038,7 @@ enum nl80211_mbssid_config_attributes {
 	NL80211_MBSSID_CONFIG_ATTR_INDEX,
 	NL80211_MBSSID_CONFIG_ATTR_TX_IFINDEX,
 	NL80211_MBSSID_CONFIG_ATTR_EMA,
+	NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID,
 
 	/* keep last */
 	__NL80211_MBSSID_CONFIG_ATTR_LAST,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 8bd09110d393..13fc03858474 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -469,6 +469,8 @@ nl80211_mbssid_config_policy[NL80211_MBSSID_CONFIG_ATTR_MAX + 1] = {
 	[NL80211_MBSSID_CONFIG_ATTR_INDEX] = { .type = NLA_U8 },
 	[NL80211_MBSSID_CONFIG_ATTR_TX_IFINDEX] = { .type = NLA_U32 },
 	[NL80211_MBSSID_CONFIG_ATTR_EMA] = { .type = NLA_FLAG },
+	[NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID] =
+		NLA_POLICY_MAX(NLA_U8, IEEE80211_MLD_MAX_NUM_LINKS),
 };
 
 static const struct nla_policy
@@ -5561,6 +5563,18 @@ static int nl80211_parse_mbssid_config(struct wiphy *wiphy,
 			}
 
 			config->tx_wdev = tx_netdev->ieee80211_ptr;
+
+			if (config->tx_wdev->valid_links) {
+				if (!tb[NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID])
+					return -ENOLINK;
+
+				config->tx_link_id =
+					nla_get_u8(tb[NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID]);
+
+				if (!(config->tx_wdev->valid_links &
+				      BIT(config->tx_link_id)))
+					return -ENOLINK;
+			}
 		} else {
 			config->tx_wdev = dev->ieee80211_ptr;
 		}
-- 
2.34.1


