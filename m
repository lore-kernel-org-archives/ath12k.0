Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F55CD8C8C
	for <ath12k@archiver.kernel.org>; Sun,  7 Jun 2026 17:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjhxCgxuOJfa+7eTPwbzhwHIn9DJIuFJipxqJyxc4Ws=; b=sPLq2GK40JmG5FpjvDaIqdpG/7
	G9HS2HonjBQrtGX3PjYxgO2D9nuQ8eu0puGvnFK4BI5PZNlsFBkbqYQbBz+RcVu3Zgu60mOy0L9u0
	Vzz/8UVRGbecPJ/Jro8wTOuVVlWv3eeOgtJ6ID6zhlmuJFJUzn37kpY7wwgk9GUeFjoc4m1uzTS7W
	2TXJ3x7X61NHOxD/yZjAQrvCr3d0TAo+lK9/fxg97VCqlBoizLOtDQdpGtGK1GeIbT4nR8i+u/7xK
	jRohZzkvqLtyXocJ+jGJyqeDO6LY2qa0dYEQtaqdwmBkUoxFyeBIT8tlggB5TEC8zQZP8qDtDL16A
	EH+wVEdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHms-00000002O9X-3JDZ;
	Sun, 07 Jun 2026 17:59:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHmq-00000002O7Y-3nYM
	for ath12k@lists.infradead.org;
	Sun, 07 Jun 2026 17:59:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657ErUoc349419
	for <ath12k@lists.infradead.org>; Sun, 7 Jun 2026 17:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bjhxCgxuOJf
	a+7eTPwbzhwHIn9DJIuFJipxqJyxc4Ws=; b=mVzt1skXENxihZU2L4FBtuYEfPi
	c+tmE+AdAIQzSEJ4OG3IvVUaBnIY5EG/dn41wQi8J45iZ65KTGeYt9ReZsFXehJw
	HTEkUP7/3JRbFO1FATfYe/En3kxq77VMCaE5WNhSs5/GdZ2wP7DZ63kslcDQ47MN
	6S6fM+PHpJCzuWhFWjjPFKg33IS4lBu3dj360GjIK47wvl1+4WUmACq+/Nh/oEUz
	8b12Cj7sP1hBmO6U7LK9OW/ROIOm92YfExupM8jATVkg0iRmLCAgbS1UbPg0EqDu
	CiAj9Fp82JaQQYMz4y85ENOjx91CXCdCoXXtfWXXemggz7pzUI7r/uswCvA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgv51t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 07 Jun 2026 17:59:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84245e2bb00so3175437b3a.1
        for <ath12k@lists.infradead.org>; Sun, 07 Jun 2026 10:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780855192; x=1781459992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjhxCgxuOJfa+7eTPwbzhwHIn9DJIuFJipxqJyxc4Ws=;
        b=ksLZrE8aYNI0bIUUvGXt5J/FhQvqZLesvBFqhPdRC1sFpqB886ykV/1//Vvkz48ns/
         IX8GAzyw7UuBU182XndMb4OICRo1KoeShIML8CMHPuVFuXP5Yr3ybTWh6wbY0VEnyqN6
         7V8Cpv+LlaMaaKPf/ZCBYvcIt7PynfIDcffG4C6X7acnC4FcbzzEFptm8KotiW7YCvKh
         E/LxnLHkTwGuI1EqPbijZ6t71FE6XgN70MAyRocEZxsxr+T0OA3H57B1v+zgBIHoykOO
         4SO+ePJkGh0JO5GY5LhIf3qW3jU2AaUB2mPrGstjJkzQtIHt92wjKSWPGlbkHVSTch+1
         mJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780855192; x=1781459992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bjhxCgxuOJfa+7eTPwbzhwHIn9DJIuFJipxqJyxc4Ws=;
        b=VzrQxSP8hpEly0+lWyPxKpIkkB3x0ISPygbqbAbY76N1g8HTh4FaOykSsinSWeMY9g
         FB3y22G6gkIbj2RkP29ZJFaxLpfGp6GLoVW9e7Nn8nv90fKbyOIlayew7Zb5j+fvWtWs
         qFIHQ1J8xXNSDZiG3xRd4LP4rVuPP3PkIeEUjQloNdesmFfWHT4WrcrWPSv+Yzh1ZRL/
         nDhJ7Jip5NSQmvT5Zaho3EdmkQesZDG3/pHNsu6jwfxJ3vJ2PypIP+xjXdF2vyZs3ekt
         OLzMKG5os6t2AZ0h5nqF0ymvzg/L3FX2Jll0lKvUYQ6lDutLBlvLhUI+OD0rxHqklzr5
         sj7w==
X-Forwarded-Encrypted: i=1; AFNElJ8q6RmT6r3TllC2ll00p9zzDbblg6RfkZnrBVvJ2172dxuTe9DZkzGcdbhOiY4GlI1JFpZ9rSg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx8/VG8qBTbjiuAIcV3renPNgdOO5jffN6RGW9f6WnoTOqcCx7
	toFkiLyXRGxHCsFQo2C07oFVcSjMwwjTBLn4qWiB8MKKlgA8sUkzf04i9eDtyviliXlgunlMkG8
	DunOHRJ9OWhFukU0OXOeyskxNI7Uj0f3k8zrC7LBnMQ9pg3nu6mMYYj3YHBs8w3iu
X-Gm-Gg: Acq92OFdxTw0K0rLcvSlirgnFbQ+SYOuzgDrEdJdmfMfyxjxwws8de5FiDFmu2T1bwy
	MKd1RqSSADaN1/UQ7+RTKXg4ygkMY53J8C8AxW/fHGTkbO97OpyYdVzTOr4uywWOjcGo48NH+xx
	5IJFCzAQ+w8z+Kjca7F8iddQdTgD/JrGRhkBgHv/p8ZwvyK981bEVMP+urX2YCQD/oVexRb0CmW
	g5iRxLAlApmykC1lbVAqO7muv8FBqNuoiRa3tBf7AEXaYtIkfBZ20+GJPYJ07c/3MhzrqpiEMYZ
	nYEALIKZSfiIxltWms2g9XZtEZvdVbYzFIeTZ0L27ykbd5bjVRFZKyK9yz9l8LdPIxT66jgIVty
	pcGWuPcJV6i+e0txpXxr7MzufsCHsCOhFyMlOrPxAyFJnqYRvJ2yFQIYJO949l5yUQPn+qei8VY
	0scmt/6UBGEwBD8R46twJjolipskbkdeeQiGH11MgV0y72ijOAFw==
X-Received: by 2002:a05:6a21:685:b0:3a8:7fb:ca0e with SMTP id adf61e73a8af0-3b4ccf91e30mr15401536637.23.1780855191638;
        Sun, 07 Jun 2026 10:59:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:685:b0:3a8:7fb:ca0e with SMTP id adf61e73a8af0-3b4ccf91e30mr15401511637.23.1780855191186;
        Sun, 07 Jun 2026 10:59:51 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a624fsm13078522a12.18.2026.06.07.10.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 10:59:50 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        praneesh.p@oss.qualcomm.com
Subject: [PATCH wireless-next 2/5] wifi: cfg80211: Add helper to pack station-level STA_INFO
Date: Sun,  7 Jun 2026 23:29:09 +0530
Message-ID: <20260607175912.2266215-3-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
References: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a25b198 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=NF4BABWMmOogFjTiQ1IA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 9F7jLiwb4QYJ93pDRl2QFhmctN_AR8Jn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE4MCBTYWx0ZWRfX7vVGhHkUAtm7
 b8iBzzpLtqpmGpUzETc0V9LWQ73NlVXcwYyLw0hw+VOAw3eO0vTKuLJhNJxJ0ZfAYOqpii04XqC
 l8FdTh7RNxXqxCuuapnGwrv83+a8wsKI54q6eIAIeqlFH79ya5fFQS0LysUJAIuEraCwZenUeMQ
 C6nvcn/kDuex1l0Izh76uv066L4adWQrokEaSuIoh2hCA/K8IV4D7ZluaQhfJ1qHJnGt61uAgip
 qn2I0b7DC4FYARFWmpcLFKwcsKn0sy/34dxD/1O5iHdebWzdWP9rzFwfBl/EMORvQMS51zeJ9Ee
 9SesrMO0+tbuI4Emyuz4gudYKoE/5RTp/AKOtah0Enm96LmqEnGB+1Ec3Qajoy25phEHjfoOUMZ
 rOi3vaKemecvuy683lF8sevdtVj03nvyRu1H+3i6T16TIdUbHaP00tg1vajmCI9GQOq/ToNktEX
 8lGzz/DkePsXgkWdP5Q==
X-Proofpoint-ORIG-GUID: 9F7jLiwb4QYJ93pDRl2QFhmctN_AR8Jn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_105952_949932_524E53A7 
X-CRM114-Status: GOOD (  15.31  )
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

Add a helper function nl80211_put_sta_info_common() to pack the
station-level (aggregated) STA information into a netlink message.
This prepares the code for future enhancements such as supporting
fragmented link statistics in nl80211_dump_station.

Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 net/wireless/nl80211.c | 59 ++++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 22 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 33609a065423..88232c323d9c 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -7841,32 +7841,15 @@ static bool nl80211_put_signal(struct sk_buff *msg, u8 mask, s8 *signal,
 	return true;
 }
 
-static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
-				u32 seq, int flags,
-				struct cfg80211_registered_device *rdev,
-				struct wireless_dev *wdev,
-				const u8 *mac_addr, struct station_info *sinfo)
+static int nl80211_put_sta_info_common(struct sk_buff *msg,
+				       struct cfg80211_registered_device *rdev,
+				       struct station_info *sinfo)
 {
-	void *hdr;
 	struct nlattr *sinfoattr, *bss_param;
 
-	hdr = nl80211hdr_put(msg, portid, seq, flags, cmd);
-	if (!hdr) {
-		cfg80211_sinfo_release_content(sinfo);
-		return -1;
-	}
-
-	if ((wdev->netdev &&
-	     nla_put_u32(msg, NL80211_ATTR_IFINDEX, wdev->netdev->ifindex)) ||
-	    nla_put_u64_64bit(msg, NL80211_ATTR_WDEV, wdev_id(wdev),
-			      NL80211_ATTR_PAD) ||
-	    nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN, mac_addr) ||
-	    nla_put_u32(msg, NL80211_ATTR_GENERATION, sinfo->generation))
-		goto nla_put_failure;
-
 	sinfoattr = nla_nest_start_noflag(msg, NL80211_ATTR_STA_INFO);
 	if (!sinfoattr)
-		goto nla_put_failure;
+		return -EMSGSIZE;
 
 #define PUT_SINFO(attr, memb, type) do {				\
 	BUILD_BUG_ON(sizeof(type) == sizeof(u64));			\
@@ -8044,6 +8027,38 @@ static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
 	}
 
 	nla_nest_end(msg, sinfoattr);
+	return 0;
+
+nla_put_failure:
+	nla_nest_cancel(msg, sinfoattr);
+	return -EMSGSIZE;
+}
+
+static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
+				u32 seq, int flags,
+				struct cfg80211_registered_device *rdev,
+				struct wireless_dev *wdev,
+				const u8 *mac_addr, struct station_info *sinfo)
+{
+	void *hdr;
+
+	hdr = nl80211hdr_put(msg, portid, seq, flags, cmd);
+	if (!hdr) {
+		cfg80211_sinfo_release_content(sinfo);
+		return -1;
+	}
+
+	if ((wdev->netdev &&
+	     nla_put_u32(msg, NL80211_ATTR_IFINDEX, wdev->netdev->ifindex)) ||
+	    nla_put_u64_64bit(msg, NL80211_ATTR_WDEV, wdev_id(wdev),
+			      NL80211_ATTR_PAD) ||
+	    nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN, mac_addr) ||
+	    nla_put_u32(msg, NL80211_ATTR_GENERATION, sinfo->generation))
+		goto nla_put_failure;
+
+	/* Use common helper for aggregated STA_INFO */
+	if (nl80211_put_sta_info_common(msg, rdev, sinfo))
+		goto nla_put_failure;
 
 	if (sinfo->assoc_req_ies_len &&
 	    nla_put(msg, NL80211_ATTR_IE, sinfo->assoc_req_ies_len,
@@ -8070,7 +8085,7 @@ static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
 	genlmsg_end(msg, hdr);
 	return 0;
 
- nla_put_failure:
+nla_put_failure:
 	cfg80211_sinfo_release_content(sinfo);
 	genlmsg_cancel(msg, hdr);
 	return -EMSGSIZE;
-- 
2.43.0


