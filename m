Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5548E606A32A
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 02:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xu7/Q7VG;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F0wORpZ1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MadhhWb5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Nz+ktU89He0bF1hqohmkleNWzf3Mh6uTtANssCUZtI4=; b=xu7/Q7VGXSPKjO
	gN7kB0x9MIQ/cgPRK/oNbLrwq4JQToFHV05TxBINt69S9WHgXmGOAQcjArf4kpmkMMW2Aja9bU7eA
	PPFOgNIbMiVEk/3tOE4pL8lO+yj6HpP8R2ilGQCEgSE7eDwdpCd+yP/IH9MdKqhko9MkN1F64qMup
	TUhCMoFja1JWTvpq44FH2Q8ZKlxf1kd4Uvxb32TA/UklhSMRmsNr3Txin9Nmkd2BzjZDuVZDq5g7v
	rw20JS/7npb2T+pPokm4YgEXyc3nfAuq3s9SK8evX6ej+BU/VhwFBPrqBIVpSWJPaDTPc6jmBuzVu
	pBJHuiQBU2NSd0x1YA6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOtu-0000000BrAq-01F3;
	Thu, 26 Nov 2026 02:07:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOtm-0000000Br5D-2Zd5
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 02:07:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APMgmB51803155
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 02:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Nz+ktU89He0
	bF1hqohmkleNWzf3Mh6uTtANssCUZtI4=; b=F0wORpZ1u6nIPpGtOgHUU4KIF6k
	caFb5fzEQP6HdPKe7LQUsDnifWhN8AKvTM1DZpTWHCncJZgmCXFbkPbb6fYeZ0zm
	M8YK25+FKHiC8gizo3ToGlhFd+qF8d5dldaXc/pxrL+c+olLI32i4VJFXxzM6LK6
	zhegKMHQxApVN8UjHy+5FbPJIR7mKuwIRrMLPHFyCxrw47/DO3ZwX5OT3d0guWkW
	JMt+pyft4q3Q7LvN/i3jLzRhT+TtewBQQ861pH37VpiTwdqI5aIJAwptp6jsF1MQ
	gQ44i0rIavLlIaCh1XnSqgxm9l7M9l5sABLlRD7O7p+V1ZeW7/aBE7aG2ew==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxtsj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 02:07:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b41333cb47so5426403a91.0
        for <ath12k@lists.infradead.org>; Wed, 25 Nov 2026 18:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658865; x=1796263665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nz+ktU89He0bF1hqohmkleNWzf3Mh6uTtANssCUZtI4=;
        b=MadhhWb5yvZPOqPbex//PyJ3lVPISwT4oo8+dJwfpyeeTN2fQvW8M55cYK0cIxW8vj
         kQVbZKU8Z2qRkHc//WLv7FmvFbDmN8XN+BzjZtDkjxPVkKsQgnsZolndId5PBW2LJvH3
         46MbzvJUiMqhkEuVak04+vB/OMV7vunyXwoBf3agoJN8s41D5iAYqIeWC3636/loqtqj
         bnv9gEZAcOSVpZVQjEGtCD4Qsj1t8ugOQGX7HpBlrbbbtuIbFAqUKpuGbmD9chTlx5ok
         LLIJGK89l++fmsk7e2TtngjLHmdyx8TSZjZguI2aYCIEKzXtfWP/lb14jrexBcu7jkWm
         1pWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658865; x=1796263665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nz+ktU89He0bF1hqohmkleNWzf3Mh6uTtANssCUZtI4=;
        b=kY1MKumXzPtUz7TQRYqhJ3y7XmxQal7iOfwZHIJZB3v2JRfPs+GFtZ+FzVrHU2aZ94
         eczXNzxs5d/V3PEjhTqsZmDp6VFa6x7aIGHAgV/A1nD7wB/+SHYbcP1Kg4zBTTsZoRr8
         RGB9M3q99QwLbBGYxp3Z8qpgvuBP0ojyZufaso4L+wOu7xft6ftyTPe0L68WiYarBJkJ
         P0jD7F4gDEJRg7gWFx14AP0JdvkjwHibSbm69j1yiIxM1ZBLKepi3ddSb5M/+Yz5djaR
         q+D7oOI0n6KtUT7KLPtE9wo9w6xxrl2tX5pjGagqEfhc5SGF0yoCak0+VAk/mjZX/lC0
         EyPQ==
X-Gm-Message-State: APuU4Z+KHcBecEr0J7OJT4eURGcPFwY8kF28DRagTrmmidjGqtEbzknb
	ucKDtzJqwBjO78Nxm2Nb6pikD2A68ev55KKRDUh+dq7jgrwmzfQcqtj+wsb1XTIAaVRbtXBKs02
	F3LwmpIsCpAqh6G/jXaptEHdJmRuqGZt/cVePBHGTgrONm5TZtWQ5B/MCvfhZ43jHZTR/qx0f
X-Gm-Gg: AZFdTZdkCt0ZL8GHilGnkIu58bZ1oKhh2bsdsodbVSsFxQzNWwgTK1ezPgHyWGKu9Cf
	tWgp9PGkvR8uvC/CZuOoSn7ikYQMrWC65FoaaDraAZUtUpUZPqe3xjqeI1rOaMbFh8iBva8w/2Y
	xEpaFLTpWgSHfhN5Dkr4JUrwbPubWvctl3mozKtSKyyEexzkEtyv6+pDnqvKXcA8anD2X09cnL+
	ti/jwFnlq8IT9ytkzdxCCbwX9PBNkU/gvn8uy6jOjsghrQ1McCRSEaU0S1hdUcy2ew5NapGtdMw
	ryd/uDUQH4MbMLfeyXFZhhbJChQGUYkLv/Dff7dUUzlH5f3In0xsoNXM9H4MJd/FsvZ4nv3mkez
	fF8phnVh32yi4EjFKCQr1BdQRmmi7+6oXk5cEFD6a75N0tR2nf0WKzyrC0iPlGVkS5ngA+78Lhv
	8wBeCihcC2A2zJBlcq5NMPsKjQUNAiPE8kXuPb
X-Received: by 2002:a17:90b:2e47:b0:3b4:eb3:a34e with SMTP id 98e67ed59e1d1-3b41c8fe15emr17358146a91.21.1795658865361;
        Wed, 25 Nov 2026 18:07:45 -0800 (PST)
X-Received: by 2002:a17:90b:2e47:b0:3b4:eb3:a34e with SMTP id 98e67ed59e1d1-3b41c8fe15emr17358115a91.21.1795658864718;
        Wed, 25 Nov 2026 18:07:44 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:44 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 5/6] wifi: ath12k: add debugfs control for MLO simultaneous links
Date: Thu, 26 Nov 2026 10:07:26 +0800
Message-Id: <20261126020727.3273337-6-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
References: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5QdomBba252t7K0adumNlODIsj_cUtR2
X-Proofpoint-ORIG-GUID: 5QdomBba252t7K0adumNlODIsj_cUtR2
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b079472 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=oayyblq_nbOQyOWrDy0A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX0GnYv/mFFsn5
 5GlxIqam/DmlQRfA0bBnpjF1HdFhUJNEpDNGsUHAKN6gvFpa3QuZYAFb9h1kpT72MZeMIzNTGk1
 YzVnjmL12Mct5zxrfalc+L5yKk48YNr8eNK3ZYDVdRqA0xN6I54G78D+nQGwCvqea+dVp5rsIG5
 IRCiduOS+nqrH76m5mW10oZ540hqzL1+6y0Yg3H6PxwnNRodolTu6SmPFVzxri4+SgmwqnabbMp
 1h9Zgo0C1Qjc5jW+1f3MZdr3OPplAmHozOURla7++P5+G3hRybCg373zxUuuUusw1CrRNqGdq6D
 8Od5rLOdhoIEseOAkaa1ISapIOLthJ2DiILtgDvim9eRNXVYZ4I2gGzlypSvJ/SBkX5EYzqlp6d
 N0nV+00abIc0Dm5SB6jJxAZf28x4xrCwQP1ocnlclEuyyxGf/uehcC8iKP/mqoDsQ6M470rtTmQ
 EWXnr/vy3jVMIldSHJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX8rwQluZ4wkli
 iw8lk22JFXTd6O7jJ1zBmoGR7iyaFQuik1a6XKkkx+BNNEVr/+GF3Fjitig/cgt+p2oIfGGAMWQ
 BFfvKQOAnlMdDR7M4pGM3pKLcV+ymuo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_180746_697050_43D07017 
X-CRM114-Status: GOOD (  15.64  )
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

Add mlo_max_simultaneous_links under the per-radio ath12k debugfs
directory for MLO-capable hardware groups. The value uses IEEE 802.11be
N-1 encoding:
0 advertises one simultaneous link, 1 advertises two, and so on.

Use this control before station association or AP startup to validate
host-side MLD capability advertisement and exercise link-count-dependent
MLO behavior without firmware changes.

Bound writes to the first local radio's normalized firmware capability.
Infrastructure targets derive this field from the hardware-group radio
count; client targets using the firmware-count policy expose a single pdev.

Update only the station and AP iftype capability entries, leaving the
generic entry unchanged. Read the current value directly from the station
entry.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 90 +++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 12791e267d1a..657bdd4c7744 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1587,6 +1587,89 @@ void ath12k_debugfs_fw_stats_register(struct ath12k *ar)
 	ath12k_fw_stats_init(ar);
 }
 
+static void ath12k_debugfs_set_mlo_max_simultaneous_links(struct ath12k_hw *ah,
+							  u8 max_links)
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
+		ah->iftypes_ext_capa[i].mld_capa_and_ops =
+			u16_replace_bits(ah->iftypes_ext_capa[i].mld_capa_and_ops,
+					 max_links,
+					 IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+	}
+}
+
+static ssize_t ath12k_write_mlo_max_simultaneous_links(struct file *file,
+						       const char __user *ubuf,
+						       size_t count,
+						       loff_t *ppos)
+{
+	struct ath12k_hw *ah = file->private_data;
+	struct ath12k *ar;
+	u8 fw_max_links;
+	int ret;
+	u8 val;
+
+	ret = kstrtou8_from_user(ubuf, count, 0, &val);
+	if (ret)
+		return ret;
+
+	/*
+	 * debugfs value uses IEEE 802.11be encoded form (N-1), matching
+	 * MLD Capabilities and Operations per IEEE Std 802.11be-2024
+	 * Table 9-417n:
+	 * 0 means single-link, 1 means dual-link, etc.
+	 */
+	guard(wiphy)(ah->hw->wiphy);
+	ar = ath12k_ah_to_ar(ah, 0);
+	fw_max_links = u16_get_bits(ar->pdev->cap.mld_cap,
+				    IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+	if (val > fw_max_links)
+		return -EINVAL;
+
+	ath12k_debugfs_set_mlo_max_simultaneous_links(ah, val);
+
+	return count;
+}
+
+static ssize_t ath12k_read_mlo_max_simultaneous_links(struct file *file,
+						      char __user *ubuf,
+						      size_t count,
+						      loff_t *ppos)
+{
+	const struct wiphy_iftype_ext_capab *iftype_ext_capa;
+	struct ath12k_hw *ah = file->private_data;
+	u8 max_links;
+	char buf[8];
+	int len;
+
+	scoped_guard(wiphy, ah->hw->wiphy) {
+		iftype_ext_capa = cfg80211_get_iftype_ext_capa(ah->hw->wiphy,
+							       NL80211_IFTYPE_STATION);
+		max_links = u16_get_bits(iftype_ext_capa->mld_capa_and_ops,
+					 IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+	}
+	len = scnprintf(buf, sizeof(buf), "%u\n", max_links);
+
+	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
+}
+
+static const struct file_operations fops_mlo_max_simultaneous_links = {
+	.read = ath12k_read_mlo_max_simultaneous_links,
+	.write = ath12k_write_mlo_max_simultaneous_links,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 void ath12k_debugfs_register(struct ath12k *ar)
 {
 	struct ath12k_base *ab = ar->ab;
@@ -1647,6 +1730,13 @@ void ath12k_debugfs_register(struct ath12k *ar)
 	debugfs_create_file("ext_rx_stats", 0644,
 			    ar->debug.debugfs_pdev, ar,
 			    &fops_extd_rx_stats);
+
+	if (!ab->ag->mlo_capable || IS_ERR_OR_NULL(ar->debug.debugfs_pdev))
+		return;
+
+	debugfs_create_file("mlo_max_simultaneous_links", 0644,
+			    ar->debug.debugfs_pdev, ah,
+			    &fops_mlo_max_simultaneous_links);
 }
 
 void ath12k_debugfs_unregister(struct ath12k *ar)
-- 
2.25.1


