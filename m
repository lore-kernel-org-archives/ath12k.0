Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EF9C36010
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 19:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGewVlGR5Rw3EAn1ECySsP4zNMvSdf5+Gq5+AeTqVY8=; b=QDnHis5h5dv6XCwgfW8N5yf0AL
	29YGZ/PQXFtM1A/qnjPvsP0U8BwieTk7YX4WxXRmmFQwp8TGJpXJVMJ4aywCDFaJeiy79FYP1Mi1C
	JStpzLxOQEvxwSN470tgIL/UPGF1YaG+xmjWKartle6UARRMKyX6p2/h6IEj5TiMG5rdTt5G2umYy
	dVzS65iXlTxQsyVjqWM57HMEYllXL2TMbIHjKkzEMugcQ0qXGYrhP3t9pV+Z8VXFzqmUBp4xnb396
	y/MrKMLaL7KOHEWtLxagFSpkcB5hbT3plWx0k7TT7wxVNxJbPdTc56XHhPvmAInwvRiStJUBvRoa5
	tQ5/Y08Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2F50-00000005HfJ-1eJz
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 19:57:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Dwg-000000059EM-4Bcl
	for ath12k@bombadil.infradead.org;
	Tue, 08 Apr 2025 18:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=nGewVlGR5Rw3EAn1ECySsP4zNMvSdf5+Gq5+AeTqVY8=; b=bcqRsBBKEALiP7Zh8Aje3ZRcYC
	3Sjn/g0hiWxEZAUhn7ln0SZga6mDF7OiutYyL68sJs6wUUjo7HESBbQjR9xb5LU7ZZRx/MVcYprdA
	2Tv3qQOO2OWqbid3CdjLRVOnAyvn+GZeMJnxLXRQ6Zc6z4la2XFep9fVtJRiPieyCSpqTJvKkY3Rr
	EtX/vG3ZwbQFP62E9pOgq00CyHageKquZuo7L0NZw8VY4swbHCTBXWcDKavJ4U3AqPSBxTDjjIbgr
	whGc7rY4zC1ap230hjXJ4sye3EtaBcV0PG9MVagAm839+0IsJ94pax3BpaabIDL76ClgWyCeleODo
	5578GH6w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2Dwc-00000008OVb-0umX
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 18:45:13 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Bbw6g020225
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 18:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nGewVlGR5Rw
	3EAn1ECySsP4zNMvSdf5+Gq5+AeTqVY8=; b=GNMLwAN1/geTCrT3bfp/FuFFkAu
	3N+qTtt/bxlRYRaQydTX9/vgXCfqCd7WMB2+aJIZ/uoeKdczdYqDKX7r1n6xkQmG
	0ZhmY0kA90X71TxvDOjFjn/W8cvzuMaCXbvEI1OHg2amOb1QGmgxppBNniV7vbPv
	tdCGQAVo/SBwm7CBkB9KVfLtbszdTGIn4EkFxEFFwv1ltbVukL9gE48KTVahv2wu
	p9oLf9w1sN8UukfNwvnWmr1PEFLFBZMSKOssP1aYfW8uuf6xSKdJXm2RGQ+pVSr7
	Y+jaa1NmTQgYoiL9lkHlrozTVj+KadNIw2DpoPBs9kM7PlPOh6TTYXc2aAg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2rw00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 18:45:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff7aecba07so5732490a91.2
        for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 11:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744137904; x=1744742704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGewVlGR5Rw3EAn1ECySsP4zNMvSdf5+Gq5+AeTqVY8=;
        b=t7CHxkxFle7hwD36AvClB21VvRhhJDRp5EGvTrxOTa77yjgNFRMPEa2iExT28ANAdC
         g8z7R5fHYc0ZbtF1P70o5IhQ6tVf7D9Y2ehFKvnnf5htZZd/7W9ymibDOjCGa06zn4LQ
         wy3ha/RyPdSvLS8NVqKDlgNtZ/9C+Lfg/3pyLAV3882UJ5gz0XUHgZ9wtqPXENIjEzLa
         aPBiRT+zGS9eCYmmwzBtA+e1H7UmY24IceIhG6xZhaz5pR6pgt1E7jAT7Nfury8rIL2V
         CRPxFzaJkhQLZH87BRFql5m1BW6NZbHofpFxWdy6jBsQG3t2113hvGIMe2KcAiGmk7/a
         /Uqw==
X-Forwarded-Encrypted: i=1; AJvYcCVeG4FDEJVf3V4xwqHriVdUzAswUtYNFSU0CySE14El3+ed5trS/U/45h1eYrYoYR9JAfmPYB0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAWLDBG62ZQC4rLlkUtIPlUrxv0/Nehc6MWunr3P4OBitey+5A
	Sx5HqaAYldMACHwq/J10QUZ6a3G/R9BolvCaDSGddnAH7KFE+Qyy8MOMjEUBymVhFuceGVUSp6Y
	MShqeIer9LoO8m7r9Q7ogVaFgwQpBXyJ0H+3lEgkN8TCrwejE3eRihB7QMKYTnnJ2LdC8
X-Gm-Gg: ASbGncsXScvGB5BactLLY/FJIGYqV8BYqgGa7n2kud/kmMxduf45YT4o45uge9d4hj/
	pXGc8t2otfQlUYknWGPENTWhGkxspfCoQ4SMiYYk6JVlzXLdMIzwkTYIgVcu4nyxDbleRdIxuL5
	qY9O+ntkHJpTSajkjyqiwMeAObHC6zE946+WNsDvVSj36HVu8u+DCVD2vwqh2tGsVZBM5NNmiTM
	XNUOo5TJoBxYJwuup1ckvlmwCV6iiJOta4mk3gJNfGTNgX94gGeGiva3ZeH8CEKeGnF9WFtb+zx
	/jkFZFcjWtp1TdAZe4nNHBR2+6t/dX4YUgDHLoIiaxl9G18QxKmyu9jkOYRJ7zqEdigncQw=
X-Received: by 2002:a17:90b:4ece:b0:2ea:5dea:eb0a with SMTP id 98e67ed59e1d1-306dbb8c16emr404213a91.4.1744137903964;
        Tue, 08 Apr 2025 11:45:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUOVLwRfGhy9gwHXSdQAnOWYQikjdvGvb9IJL52qmnY3UBEm9qZ17YKSWTwjSbsRDxb3wagg==
X-Received: by 2002:a17:90b:4ece:b0:2ea:5dea:eb0a with SMTP id 98e67ed59e1d1-306dbb8c16emr404186a91.4.1744137903551;
        Tue, 08 Apr 2025 11:45:03 -0700 (PDT)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb9500dsm12882212a91.47.2025.04.08.11.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 11:45:03 -0700 (PDT)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org
Subject: [PATCH wireless-next v5 1/3] wifi: nl80211: add link id of transmitted profile for MLO MBSSID
Date: Tue,  8 Apr 2025 11:44:59 -0700
Message-Id: <20250408184501.3715887-2-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408184501.3715887-1-aloka.dixit@oss.qualcomm.com>
References: <20250408184501.3715887-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LA3Drk-s0NMzrUoZrKWXCy-6xv-LvuAn
X-Proofpoint-GUID: LA3Drk-s0NMzrUoZrKWXCy-6xv-LvuAn
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f56eb1 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=voIm8Yqn4N3_T5BSyJkA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_08,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_194510_627885_6E556C63 
X-CRM114-Status: GOOD (  21.43  )
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
 net/wireless/nl80211.c       | 24 +++++++++++++++++++++++-
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index efbd79c67be2..ac51614fedff 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1300,11 +1300,13 @@ struct cfg80211_crypto_settings {
  * struct cfg80211_mbssid_config - AP settings for multi bssid
  *
  * @tx_wdev: pointer to the transmitted interface in the MBSSID set
+ * @tx_link_id: link ID of the transmitted profile in an MLD.
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
index ddcc4cda74af..e9ccf43fe3c6 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -8036,6 +8036,11 @@ enum nl80211_sar_specs_attrs {
  *	Setting this flag is permitted only if the driver advertises EMA support
  *	by setting wiphy->ema_max_profile_periodicity to non-zero.
  *
+ * @NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID: Link ID of the transmitted profile.
+ *	This parameter is mandatory when NL80211_ATTR_MBSSID_CONFIG attributes
+ *	are sent for a non-transmitted profile and if the transmitted profile
+ *	is part of an MLD. For all other cases this parameter is unnecessary.
+ *
  * @__NL80211_MBSSID_CONFIG_ATTR_LAST: Internal
  * @NL80211_MBSSID_CONFIG_ATTR_MAX: highest attribute
  */
@@ -8047,6 +8052,7 @@ enum nl80211_mbssid_config_attributes {
 	NL80211_MBSSID_CONFIG_ATTR_INDEX,
 	NL80211_MBSSID_CONFIG_ATTR_TX_IFINDEX,
 	NL80211_MBSSID_CONFIG_ATTR_EMA,
+	NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID,
 
 	/* keep last */
 	__NL80211_MBSSID_CONFIG_ATTR_LAST,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index f039a7d0d6f7..bc48365ee188 100644
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
@@ -5523,11 +5525,13 @@ static int validate_beacon_tx_rate(struct cfg80211_registered_device *rdev,
 
 static int nl80211_parse_mbssid_config(struct wiphy *wiphy,
 				       struct net_device *dev,
+				       unsigned int link_id,
 				       struct nlattr *attrs,
 				       struct cfg80211_mbssid_config *config,
 				       u8 num_elems)
 {
 	struct nlattr *tb[NL80211_MBSSID_CONFIG_ATTR_MAX + 1];
+	int tx_link_id = -1;
 
 	if (!wiphy->mbssid_max_interfaces)
 		return -EOPNOTSUPP;
@@ -5551,6 +5555,9 @@ static int nl80211_parse_mbssid_config(struct wiphy *wiphy,
 	    (!config->index && !num_elems))
 		return -EINVAL;
 
+	if (tb[NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID])
+		tx_link_id = nla_get_u8(tb[NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID]);
+
 	if (tb[NL80211_MBSSID_CONFIG_ATTR_TX_IFINDEX]) {
 		u32 tx_ifindex =
 			nla_get_u32(tb[NL80211_MBSSID_CONFIG_ATTR_TX_IFINDEX]);
@@ -5572,10 +5579,25 @@ static int nl80211_parse_mbssid_config(struct wiphy *wiphy,
 			}
 
 			config->tx_wdev = tx_netdev->ieee80211_ptr;
+			/* Caller should call dev_put(config->tx_wdev) from this point */
+
+			if (config->tx_wdev->valid_links) {
+				if (tx_link_id == -1 ||
+				    !(config->tx_wdev->valid_links & BIT(tx_link_id)))
+					return -ENOLINK;
+
+				config->tx_link_id = tx_link_id;
+			}
 		} else {
+			if (tx_link_id >= 0 && tx_link_id != link_id)
+				return -EINVAL;
+
 			config->tx_wdev = dev->ieee80211_ptr;
 		}
 	} else if (!config->index) {
+		if (tx_link_id >= 0 && tx_link_id != link_id)
+			return -EINVAL;
+
 		config->tx_wdev = dev->ieee80211_ptr;
 	} else {
 		return -EINVAL;
@@ -6325,7 +6347,7 @@ static int nl80211_start_ap(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	if (info->attrs[NL80211_ATTR_MBSSID_CONFIG]) {
-		err = nl80211_parse_mbssid_config(&rdev->wiphy, dev,
+		err = nl80211_parse_mbssid_config(&rdev->wiphy, dev, link_id,
 						  info->attrs[NL80211_ATTR_MBSSID_CONFIG],
 						  &params->mbssid_config,
 						  params->beacon.mbssid_ies ?
-- 
2.34.1


