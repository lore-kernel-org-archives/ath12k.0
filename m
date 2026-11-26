Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58AA606A330
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 02:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=naymL9mc;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mFnHGhGM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NR+OJTax
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SyqmBY1RWa1USlwSoGhwRFBGS05QWoGC5aF9860rgWU=; b=naymL9mcnIzLsk
	ZGwwI39GNzg/JIDvmvO9D6x/2rntzH25StV1I8e2PwQjLccnVxeHj0i5xI9hLV1sCN2GdPQeq7E1O
	Zpp7EoCAPVldMK6D6ZQn4s9fJl+cpXspwZVi8epmRf6pTK/4QYyh+ryWazoo3yZufmAq3bhh81xa6
	tXlOLKC3ZH4Dc81YAYfKWlzNbunvom7ZOGZfAH7Uc0/zUCozyZvoafKzaX0Jxh9W57v3YEdNiYSDY
	9zVRYHAoXxCK5T0ilg7h3jTp9DG+1iHJrOS/GgMmQosos8+tLiwfbh6ygYgov6u2RYEzdwN6pMQWc
	xMibSRQxwB9znW7/g85g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOtw-0000000BrEP-2MI9;
	Thu, 26 Nov 2026 02:07:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOtp-0000000Br7T-0gjU
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 02:07:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAtle648284
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 02:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SyqmBY1RWa1
	USlwSoGhwRFBGS05QWoGC5aF9860rgWU=; b=mFnHGhGM3rFVRy4cfGUkLNi777p
	77W6dCrsz7extpcJX0NH3mJD5BqQ+W6b2SHXeCyMdU4Jg21J84CvvdaaDQuYZwBx
	RzE4jB99mD2qYMcDPRqAUt3ri8d28XaKH9iTiAhOhicaRzIJaxokVQtOHM1IujaV
	mytpp1998HCbobRU94vGPUbB6yuvV5HoylcIhOtKO+spWokVChFwASrhz9jjbHj4
	cMYPeaDCASgRHa75+10Vu0Gdar/yW51dTvKBJKQMDbZulWOrqUZCTwQhI6vLWFl4
	MGmfMxJyu0Rw7TNKCKNtJ8hLFI6KsTsrgSajsGnJGoyOugkk1Y4lGl6Lsog==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61aht9nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 02:07:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b421417c3cso5613702a91.0
        for <ath12k@lists.infradead.org>; Wed, 25 Nov 2026 18:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658868; x=1796263668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SyqmBY1RWa1USlwSoGhwRFBGS05QWoGC5aF9860rgWU=;
        b=NR+OJTaxMK9rBAbons9CoCj+xWGEVIGSZp2KbdYAqcLXzCcdoT5jZAf8DqgVLjCnn1
         MO9RbsIv4c3rQonWvibDdg0pdOxoeNfNyLKJWvTL4cBMaiv4RjaKaz1qwZ1b43tN7Nw/
         nI08i5LPx733bmb9Pr3p5BXGLyn7RgAZ2GIbYleFGPrF29bOns5Jzha3hxoyCx/1Lea+
         xzmpL+Z7JxMw2JK6hPwdK5YlKOuQBERUWWO4Ur1cCLhSpmcGzfde60s3fbV+mKy2xU97
         83MQFKhHJawfgiURuz/VExEox/n+mCNNakNwJx4Eicf7WxHjI694wIDl+l1FiQbm1PN1
         Zpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658868; x=1796263668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SyqmBY1RWa1USlwSoGhwRFBGS05QWoGC5aF9860rgWU=;
        b=YCHTMr8E/S0aaM7hVdxlZ3vYbovBZpLnBnLGg4SUmEpc4hX3HumcyMwfg8kB1be0Yf
         DEVXTCoCXj/jVYBGeUGAGMFOhvOtgPx/B3xSlvGF8xNqbfX3h4te9aM5A/bL6IILnEYb
         2KeSaA/IhcarrJ1VywdY9CvMXdnS8Wcbjj+f8lJfi+SjamXpWCCOP9jMeH4DfMsXSyrD
         q/mBEraik53s6jXAAlPHQbf9NyeKUPEuFNe8qeb/fS6tDXtLeZeZWdn1rmSvxA4EVSpP
         JdYV5QOLh9EiTnIaLiFzfKoDxcgJ2i+CIt4hpmo1W5gK92ZAbPDNQ+v2SUVw/aTWKs1H
         QPRg==
X-Gm-Message-State: APuU4Z+RfIYMFZNcCn2B7J+equMaqEz2EwUQ1CdGi876OWRBY5PMnta+
	KupNLzTvWbimhAt7dMbCaHjEryVRsg8XoEzyz2KaPvtcpQTQ6PHEpTS7ZI1zFYz4x5zNaU0HLf2
	gPTIft8XS9IjJ+pFvw0IZSNXHRPhZv4uTinDYwQsjJ3M1mnzp2HFNWQbZUmsIMoZ2
X-Gm-Gg: AZFdTZfrDs8m4Rt7cM8ux6tm8a4a8mKgqhuIdAdDF7gqBkhJ1YX3+HdSJn8rb5ULK+b
	OamdTNE9wzTrs9tJWFg36MC7C5EeHkwCWg/OPcMN3Wrd+bgEiXCPpzX8sxZjP5aLOaX44rV50pd
	Z4P0lD3x4Kvv+VBRKcyMGZiGJYRLwpiTyx+gueoySnmHKKD83MFY7TOBs1e3rEOU85nhr/LOyZc
	oa7vUatw+meHKsk5vmnL6FxyR1HW7RGIgMlx9sYr052zmNkhICsGtwbfupH9yX2SGgiI3022qGP
	IKjZD/ondCmHAZX3cCmlMvEkjBpY0LaG2eQaWNl+wGal1YNxydyQWgLAfKM+QdWTNsKaHIHqADY
	jPgP9doDv+eab955AJSSh4BORe5ObrItKCNboEpJ17rU5qqW3XBCYlmNZJ7ai09CshJhwM3CMdj
	2toi26nKn2X4RDK9bAihZN7hd3pIoDDVgd8QMh
X-Received: by 2002:a17:90b:3a4d:b0:3b0:9882:9e5e with SMTP id 98e67ed59e1d1-3b41c8d488cmr19672886a91.18.1795658867785;
        Wed, 25 Nov 2026 18:07:47 -0800 (PST)
X-Received: by 2002:a17:90b:3a4d:b0:3b0:9882:9e5e with SMTP id 98e67ed59e1d1-3b41c8d488cmr19672861a91.18.1795658867222;
        Wed, 25 Nov 2026 18:07:47 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:46 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 6/6] wifi: ath12k: add debugfs control for EMLSR support advertisement
Date: Thu, 26 Nov 2026 10:07:27 +0800
Message-Id: <20261126020727.3273337-7-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
References: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: n7ugNKJhR1mmfRZxjLGce23yrmHoOyEU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfXxaUVYKVRGndj
 t+s+uOJCPTsVTwqI36vqTOBaXIgIhkFkKNAYy4g8zNDnP+pG7tCc+0gNT8gZ9mpynKJRDl5aXSx
 SqONN6761//QtuUTnCKYU6GXdGX/JqI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX6XMCpPlG8rCS
 7GW0UjlL/SM9OdxjfcQKHcHx8GwcYhyXmcpGmYCuj69S7aKUXQuz01f+QpGUn9REY5M946bd9Dn
 d4qV6qzGoLhD8wFzYrCzsqPgF7wiw8NOqYE/l+XYCpdcO3Jl058UJKOO4utq+eIc0sxbhLk6f8p
 Bzg1OCMSX+5IUk218kExOjStZx5HHbxqIRNEaXF7dHFZsj++kgViL3W3g8oYt5/iG/ZVusdUmq+
 w4r+7l2CD4r0Dnx3WLVNS+LfQOZKNcBHplpvfJC2ZeTyEv+g5/Gucr8CxRvH/Ne2gf5V1JDM13c
 mbzf0cEoSLUGOA8sQDVI8P7TCIB1385OoI+CSnZM0f218wFjQpB/uzUA1Il9sGQzdhOGLjHmKbl
 mfYdVks+na5eKbkBoBiW19C2jHIuXC8DCx/U/jAUFQq9XtuTigCl2nNVDSB5uXU4Y3h5pWka9iw
 CX6RLGTNDSyRlB74cdg==
X-Proofpoint-ORIG-GUID: n7ugNKJhR1mmfRZxjLGce23yrmHoOyEU
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b079474 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QCLNOAGZVNuN6bSrVjcA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_180750_253571_B2CEC161 
X-CRM114-Status: GOOD (  16.65  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add eml_capa_present under the per-radio ath12k debugfs directory for
MLO-capable hardware groups to toggle the advertised
IEEE80211_EML_CAP_EMLSR_SUPP bit.

Use this control before station association or AP startup to validate
host-side EML capability advertisement and exercise combinations with the
maximum simultaneous-link advertisement without firmware changes.

Read the current value directly from the station iftype's advertised EML
capabilities. Reject enabling EMLSR if any local radio lacks firmware
support.

Update only the IEEE80211_EML_CAP_EMLSR_SUPP bit in the station and AP
entries, preserving other capability fields and leaving the generic entry
unchanged.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 78 +++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 657bdd4c7744..9852769cbbd3 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1670,6 +1670,81 @@ static const struct file_operations fops_mlo_max_simultaneous_links = {
 	.llseek = default_llseek,
 };
 
+static void ath12k_debugfs_set_emlsr_support(struct ath12k_hw *ah, bool enable)
+{
+	int i;
+
+	lockdep_assert_wiphy(ah->hw->wiphy);
+
+	for (i = 0; i < ARRAY_SIZE(ah->iftypes_ext_capa); i++) {
+		enum nl80211_iftype iftype = ah->iftypes_ext_capa[i].iftype;
+
+		if (iftype != NL80211_IFTYPE_STATION && iftype != NL80211_IFTYPE_AP)
+			continue;
+
+		ah->iftypes_ext_capa[i].eml_capabilities =
+			u16_replace_bits(ah->iftypes_ext_capa[i].eml_capabilities,
+					 enable, IEEE80211_EML_CAP_EMLSR_SUPP);
+	}
+}
+
+static ssize_t ath12k_write_emlsr_support(struct file *file,
+					  const char __user *ubuf,
+					  size_t count, loff_t *ppos)
+{
+	struct ath12k_hw *ah = file->private_data;
+	struct ath12k *ar;
+	int ret;
+	u8 val;
+	int i;
+
+	ret = kstrtou8_from_user(ubuf, count, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val > 1)
+		return -EINVAL;
+
+	guard(wiphy)(ah->hw->wiphy);
+	if (val) {
+		for_each_ar(ah, ar, i) {
+			if (!(ar->pdev->cap.eml_cap & IEEE80211_EML_CAP_EMLSR_SUPP))
+				return -EOPNOTSUPP;
+		}
+	}
+	ath12k_debugfs_set_emlsr_support(ah, val);
+
+	return count;
+}
+
+static ssize_t ath12k_read_emlsr_support(struct file *file, char __user *ubuf,
+					 size_t count, loff_t *ppos)
+{
+	const struct wiphy_iftype_ext_capab *iftype_ext_capa;
+	struct ath12k_hw *ah = file->private_data;
+	u8 emlsr_support;
+	char buf[8];
+	int len;
+
+	scoped_guard(wiphy, ah->hw->wiphy) {
+		iftype_ext_capa = cfg80211_get_iftype_ext_capa(ah->hw->wiphy,
+							       NL80211_IFTYPE_STATION);
+		emlsr_support = u16_get_bits(iftype_ext_capa->eml_capabilities,
+					     IEEE80211_EML_CAP_EMLSR_SUPP);
+	}
+	len = scnprintf(buf, sizeof(buf), "%u\n", emlsr_support);
+
+	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
+}
+
+static const struct file_operations fops_emlsr_support = {
+	.read = ath12k_read_emlsr_support,
+	.write = ath12k_write_emlsr_support,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 void ath12k_debugfs_register(struct ath12k *ar)
 {
 	struct ath12k_base *ab = ar->ab;
@@ -1737,6 +1812,9 @@ void ath12k_debugfs_register(struct ath12k *ar)
 	debugfs_create_file("mlo_max_simultaneous_links", 0644,
 			    ar->debug.debugfs_pdev, ah,
 			    &fops_mlo_max_simultaneous_links);
+	debugfs_create_file("eml_capa_present", 0644,
+			    ar->debug.debugfs_pdev, ah,
+			    &fops_emlsr_support);
 }
 
 void ath12k_debugfs_unregister(struct ath12k *ar)
-- 
2.25.1


