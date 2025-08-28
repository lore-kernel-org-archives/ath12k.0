Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951C7CA0EED
	for <ath12k@archiver.kernel.org>; Thu, 28 Aug 2025 21:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APT2DWCuaQQn0tlFVUn2pmA22V2oZiaDSZt7h5ZkTPw=; b=gnzusaxhBOLrJQE4EtGh7VRDzF
	W0VYgxxLIRD8YAWVpyy+KI1CokKq/kKxougEKjBllwqZ02/zBgavKSkqoaP5KpduPf5RoVKjobfhW
	K6YB27wnqKCkavnwJZj6z4hH/6qfySCKtwgPf4bhtJIjcIKSXCucAczLMV/nrAq+I+gVMx/mJtaSw
	BoydbV6xbhw+kSX5PX3s2d3DDgezP+AWKxvDTV8CNl+FqHwVKI2t/fy59HBfCsyi+K5J+ljFi8aI0
	yMCvgOWEFs7eLmVjVWQkqbSgTWA9mMb+xRkE5crkbyxQz02QtKS3v/qdg2Nf8TR9VhnDFT98+zZ+r
	waKMP4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urk7X-00000003LMg-1Sqz;
	Thu, 28 Aug 2025 21:25:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgXx-00000002Ye3-0Uzt
	for ath12k@bombadil.infradead.org;
	Thu, 28 Aug 2025 17:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=APT2DWCuaQQn0tlFVUn2pmA22V2oZiaDSZt7h5ZkTPw=; b=g9S2AeKtx/ThyPHuhfBxSb1wlR
	e2X7D52mQi+JzKWrmWoevpQAMxZ9DGpNBa6AAtMqN3Sk6t9bLyrYtd/s3V0JCTOcB3Gv67pJShULl
	j3A+yUxhM+KNLmySixr9za8onvJl3nGXfotu6K+7aeGx/Eyja4ww37uZ6ze2a5iedlC7DYM3sD0ms
	JPz/nJXRLcNilAhMGgHVqh8EYt9iuV3CiYnNk3SdqVy2OQNdIRlGRQdkdNOW7lk7tyTpiYYh6oVYk
	dNxanS7Z7i/lhRES1CRGobuXYlj+uURd5HQxccNd8K75Joy5JgOFwukIyJuMMpceUVYCnTsAM+Ezm
	rng0Sp9g==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgXs-00000002p9R-3sW8
	for ath12k@lists.infradead.org;
	Thu, 28 Aug 2025 17:36:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SE93Qb029193;
	Thu, 28 Aug 2025 17:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	APT2DWCuaQQn0tlFVUn2pmA22V2oZiaDSZt7h5ZkTPw=; b=KXYmO73F/G0zXXPj
	dFvNS83Ct4+MufOStxuKT459ocQbmQtFOFalolgKhBYZW38xUP+FgBlwPEvsGhng
	5iHCOPoA+XdCt9ovEsS4yfJf2/jPeb4xKZNrrtrzER4fA0htg+C/AyS+ygVYgs2P
	XX40JPR7Ihk1SDwKlcmnuI2mybx3rkDHTaqS4QYAVC+vpoL7fazFsyb4aswywAQ4
	nr+E6Wdi+xXRoNEpY7A5I5oR2s0GRATkUihTGxHWVFaGBzHWhltHzOTWFX6RHCrw
	qCPzg5UL7X6EaMKLly0rfDUXTGYlbQSfGuWoLlmZIcWUF7dDiNaMPGL0eKPDxfik
	CYmEeg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w31b14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 17:36:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SHaG0B015609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 17:36:16 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 28 Aug 2025 10:36:14 -0700
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng 04/20] wifi: ath12k: Move HAL Rx wrapper APIs to dp_rx.h
Date: Thu, 28 Aug 2025 23:05:37 +0530
Message-ID: <20250828173553.3341351-5-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828173553.3341351-1-quic_rdeuri@quicinc.com>
References: <20250828173553.3341351-1-quic_rdeuri@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68b09390 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Tu4bRPs8u5QZ4hX5J3kA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX0rP9c7DpAO6c
 fKfRjstuig75ByTK/TbboZ6gVy68sc5dLRHi1Y3NZD6pKjk7gIkn4bVhO/1bivCT8JPN0kBOM7N
 oJBVirkXhUv6/My46pRpfQ8DYgyDvUap8QFamnqwHE2GGHf8g/L9mFF5o9TxDjQN+GMipQB1dLY
 YFvnWF2rDsO6sZMpcKdnWxXgMG9JXE9bxwNfRu/RFJwZCcfTd3cea4ZbgtPb6T+UY7cAFwxyrHQ
 fPIIjmByo34sJ9DROOOe2ADYdWOaysfetXhj64K/yK5EuD4Y9Lk88mM0fu762/xt1BueIDtwwQL
 6UXQyPlpV9RJikgwkwnAVZJLQAHBFyBB608X44E5L/+ROdDuNBvsYXJ3ZjygcnZ3XAkSgf2sA/E
 Cg2Vz9N+
X-Proofpoint-GUID: qdTqljU8HrXcY9_CXwZTDKA_DDpE8SYV
X-Proofpoint-ORIG-GUID: qdTqljU8HrXcY9_CXwZTDKA_DDpE8SYV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1011
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_183621_399782_915D8A73 
X-CRM114-Status: GOOD (  13.89  )
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

From: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>

Move HAL Rx APIs from dp_rx.c to dp_rx.h to facilitate the separation of
common and hardware-specific code that are dependent on these HAL Rx ops
in upcoming patches.

Move the following wrapper APIs to dp_rx.h

ath12k_dp_rx_h_enctype
ath12k_dp_rx_h_mesh_ctl_present
ath12k_dp_rx_h_seq_ctrl_valid
ath12k_dp_rx_h_fc_valid
ath12k_dp_rx_h_more_frags
ath12k_dp_rx_h_frag_no
ath12k_dp_rx_h_seq_no
ath12k_dp_rx_h_msdu_done
ath12k_dp_rx_h_l4_cksum_fail
ath12k_dp_rx_h_ip_cksum_fail
ath12k_dp_rx_h_is_decrypted
ath12k_dp_rx_h_msdu_len
ath12k_dp_rx_h_sgi
ath12k_dp_rx_h_rate_mcs
ath12k_dp_rx_h_rx_bw
ath12k_dp_rx_h_freq
ath12k_dp_rx_h_pkt_type
ath12k_dp_rx_h_nss
ath12k_dp_rx_h_tid
ath12k_dp_rx_h_peer_id
ath12k_dp_rx_h_first_msdu
ath12k_dp_rx_h_last_msdu
ath12k_dp_rx_desc_end_tlv_copy
ath12k_dp_rxdesc_set_msdu_len
ath12k_dp_rx_h_is_da_mcbc
ath12k_dp_rxdesc_mac_addr2_valid
ath12k_dp_rxdesc_get_mpdu_start_addr2
ath12k_dp_rx_desc_get_dot11_hdr
ath12k_dp_rx_desc_get_crypto_header
ath12k_dp_rx_get_msdu_src_link

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>
Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 237 -----------------------
 drivers/net/wireless/ath/ath12k/dp_rx.h | 239 +++++++++++++++++++++++-
 2 files changed, 238 insertions(+), 238 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 4f6b71a18dc4..acd20417b650 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -21,243 +21,6 @@
 
 #define ATH12K_DP_RX_FRAGMENT_TIMEOUT_MS (2 * HZ)
 
-static enum hal_encrypt_type ath12k_dp_rx_h_enctype(struct ath12k_base *ab,
-						    struct hal_rx_desc *desc)
-{
-	if (!ab->hal_rx_ops->rx_desc_encrypt_valid(desc))
-		return HAL_ENCRYPT_TYPE_OPEN;
-
-	return ab->hal_rx_ops->rx_desc_get_encrypt_type(desc);
-}
-
-u8 ath12k_dp_rx_h_decap_type(struct ath12k_base *ab,
-			     struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_decap_type(desc);
-}
-
-static u8 ath12k_dp_rx_h_mesh_ctl_present(struct ath12k_base *ab,
-					  struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_mesh_ctl(desc);
-}
-
-static bool ath12k_dp_rx_h_seq_ctrl_valid(struct ath12k_base *ab,
-					  struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_mpdu_seq_ctl_vld(desc);
-}
-
-static bool ath12k_dp_rx_h_fc_valid(struct ath12k_base *ab,
-				    struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_mpdu_fc_valid(desc);
-}
-
-static bool ath12k_dp_rx_h_more_frags(struct ath12k_base *ab,
-				      struct sk_buff *skb)
-{
-	struct ieee80211_hdr *hdr;
-
-	hdr = (struct ieee80211_hdr *)(skb->data + ab->hal.hal_desc_sz);
-	return ieee80211_has_morefrags(hdr->frame_control);
-}
-
-static u16 ath12k_dp_rx_h_frag_no(struct ath12k_base *ab,
-				  struct sk_buff *skb)
-{
-	struct ieee80211_hdr *hdr;
-
-	hdr = (struct ieee80211_hdr *)(skb->data + ab->hal.hal_desc_sz);
-	return le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_FRAG;
-}
-
-static u16 ath12k_dp_rx_h_seq_no(struct ath12k_base *ab,
-				 struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_mpdu_start_seq_no(desc);
-}
-
-static bool ath12k_dp_rx_h_msdu_done(struct ath12k_base *ab,
-				     struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->dp_rx_h_msdu_done(desc);
-}
-
-static bool ath12k_dp_rx_h_l4_cksum_fail(struct ath12k_base *ab,
-					 struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->dp_rx_h_l4_cksum_fail(desc);
-}
-
-static bool ath12k_dp_rx_h_ip_cksum_fail(struct ath12k_base *ab,
-					 struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->dp_rx_h_ip_cksum_fail(desc);
-}
-
-static bool ath12k_dp_rx_h_is_decrypted(struct ath12k_base *ab,
-					struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->dp_rx_h_is_decrypted(desc);
-}
-
-u32 ath12k_dp_rx_h_mpdu_err(struct ath12k_base *ab,
-			    struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->dp_rx_h_mpdu_err(desc);
-}
-
-static u16 ath12k_dp_rx_h_msdu_len(struct ath12k_base *ab,
-				   struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_msdu_len(desc);
-}
-
-static u8 ath12k_dp_rx_h_sgi(struct ath12k_base *ab,
-			     struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_msdu_sgi(desc);
-}
-
-static u8 ath12k_dp_rx_h_rate_mcs(struct ath12k_base *ab,
-				  struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_msdu_rate_mcs(desc);
-}
-
-static u8 ath12k_dp_rx_h_rx_bw(struct ath12k_base *ab,
-			       struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_msdu_rx_bw(desc);
-}
-
-static u32 ath12k_dp_rx_h_freq(struct ath12k_base *ab,
-			       struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_msdu_freq(desc);
-}
-
-static u8 ath12k_dp_rx_h_pkt_type(struct ath12k_base *ab,
-				  struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_msdu_pkt_type(desc);
-}
-
-static u8 ath12k_dp_rx_h_nss(struct ath12k_base *ab,
-			     struct hal_rx_desc *desc)
-{
-	return hweight8(ab->hal_rx_ops->rx_desc_get_msdu_nss(desc));
-}
-
-static u8 ath12k_dp_rx_h_tid(struct ath12k_base *ab,
-			     struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_mpdu_tid(desc);
-}
-
-static u16 ath12k_dp_rx_h_peer_id(struct ath12k_base *ab,
-				  struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_mpdu_peer_id(desc);
-}
-
-u8 ath12k_dp_rx_h_l3pad(struct ath12k_base *ab,
-			struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_l3_pad_bytes(desc);
-}
-
-static bool ath12k_dp_rx_h_first_msdu(struct ath12k_base *ab,
-				      struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_first_msdu(desc);
-}
-
-static bool ath12k_dp_rx_h_last_msdu(struct ath12k_base *ab,
-				     struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_last_msdu(desc);
-}
-
-static void ath12k_dp_rx_desc_end_tlv_copy(struct ath12k_base *ab,
-					   struct hal_rx_desc *fdesc,
-					   struct hal_rx_desc *ldesc)
-{
-	ab->hal_rx_ops->rx_desc_copy_end_tlv(fdesc, ldesc);
-}
-
-static void ath12k_dp_rxdesc_set_msdu_len(struct ath12k_base *ab,
-					  struct hal_rx_desc *desc,
-					  u16 len)
-{
-	ab->hal_rx_ops->rx_desc_set_msdu_len(desc, len);
-}
-
-u32 ath12k_dp_rxdesc_get_ppduid(struct ath12k_base *ab,
-				struct hal_rx_desc *rx_desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_mpdu_ppdu_id(rx_desc);
-}
-
-bool ath12k_dp_rxdesc_mpdu_valid(struct ath12k_base *ab,
-				 struct hal_rx_desc *rx_desc)
-{
-	u32 tlv_tag;
-
-	tlv_tag = ab->hal_rx_ops->rx_desc_get_mpdu_start_tag(rx_desc);
-
-	return tlv_tag == HAL_RX_MPDU_START;
-}
-
-static bool ath12k_dp_rx_h_is_da_mcbc(struct ath12k_base *ab,
-				      struct hal_rx_desc *desc)
-{
-	return (ath12k_dp_rx_h_first_msdu(ab, desc) &&
-		ab->hal_rx_ops->rx_desc_is_da_mcbc(desc));
-}
-
-static bool ath12k_dp_rxdesc_mac_addr2_valid(struct ath12k_base *ab,
-					     struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_mac_addr2_valid(desc);
-}
-
-static u8 *ath12k_dp_rxdesc_get_mpdu_start_addr2(struct ath12k_base *ab,
-						 struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_mpdu_start_addr2(desc);
-}
-
-static void ath12k_dp_rx_desc_get_dot11_hdr(struct ath12k_base *ab,
-					    struct hal_rx_desc *desc,
-					    struct ieee80211_hdr *hdr)
-{
-	ab->hal_rx_ops->rx_desc_get_dot11_hdr(desc, hdr);
-}
-
-static void ath12k_dp_rx_desc_get_crypto_header(struct ath12k_base *ab,
-						struct hal_rx_desc *desc,
-						u8 *crypto_hdr,
-						enum hal_encrypt_type enctype)
-{
-	ab->hal_rx_ops->rx_desc_get_crypto_header(desc, crypto_hdr, enctype);
-}
-
-static inline u8 ath12k_dp_rx_get_msdu_src_link(struct ath12k_base *ab,
-						struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_msdu_src_link_id(desc);
-}
-
-static void ath12k_dp_clean_up_skb_list(struct sk_buff_head *skb_list)
-{
-	struct sk_buff *skb;
-
-	while ((skb = __skb_dequeue(skb_list)))
-		dev_kfree_skb_any(skb);
-}
-
 static size_t ath12k_dp_list_cut_nodes(struct list_head *list,
 				       struct list_head *head,
 				       size_t count)
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index e971a314bd2d..61861c63ecbf 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #ifndef ATH12K_DP_RX_H
 #define ATH12K_DP_RX_H
@@ -103,6 +103,243 @@ static inline u32 ath12k_he_gi_to_nl80211_he_gi(u8 sgi)
 	return ret;
 }
 
+static inline enum hal_encrypt_type ath12k_dp_rx_h_enctype(struct ath12k_base *ab,
+							   struct hal_rx_desc *desc)
+{
+	if (!ab->hal_rx_ops->rx_desc_encrypt_valid(desc))
+		return HAL_ENCRYPT_TYPE_OPEN;
+
+	return ab->hal_rx_ops->rx_desc_get_encrypt_type(desc);
+}
+
+static inline u8 ath12k_dp_rx_h_decap_type(struct ath12k_base *ab,
+					   struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_get_decap_type(desc);
+}
+
+static inline u8 ath12k_dp_rx_h_mesh_ctl_present(struct ath12k_base *ab,
+						 struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_get_mesh_ctl(desc);
+}
+
+static inline bool ath12k_dp_rx_h_seq_ctrl_valid(struct ath12k_base *ab,
+						 struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_get_mpdu_seq_ctl_vld(desc);
+}
+
+static inline bool ath12k_dp_rx_h_fc_valid(struct ath12k_base *ab,
+					   struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_get_mpdu_fc_valid(desc);
+}
+
+static inline bool ath12k_dp_rx_h_more_frags(struct ath12k_base *ab,
+					     struct sk_buff *skb)
+{
+	struct ieee80211_hdr *hdr;
+
+	hdr = (struct ieee80211_hdr *)(skb->data + ab->hal.hal_desc_sz);
+	return ieee80211_has_morefrags(hdr->frame_control);
+}
+
+static inline u16 ath12k_dp_rx_h_frag_no(struct ath12k_base *ab,
+					 struct sk_buff *skb)
+{
+	struct ieee80211_hdr *hdr;
+
+	hdr = (struct ieee80211_hdr *)(skb->data + ab->hal.hal_desc_sz);
+	return le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_FRAG;
+}
+
+static inline u16 ath12k_dp_rx_h_seq_no(struct ath12k_base *ab,
+					struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_get_mpdu_start_seq_no(desc);
+}
+
+static inline bool ath12k_dp_rx_h_msdu_done(struct ath12k_base *ab,
+					    struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->dp_rx_h_msdu_done(desc);
+}
+
+static inline bool ath12k_dp_rx_h_l4_cksum_fail(struct ath12k_base *ab,
+						struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->dp_rx_h_l4_cksum_fail(desc);
+}
+
+static inline bool ath12k_dp_rx_h_ip_cksum_fail(struct ath12k_base *ab,
+						struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->dp_rx_h_ip_cksum_fail(desc);
+}
+
+static inline bool ath12k_dp_rx_h_is_decrypted(struct ath12k_base *ab,
+					       struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->dp_rx_h_is_decrypted(desc);
+}
+
+static inline u32 ath12k_dp_rx_h_mpdu_err(struct ath12k_base *ab,
+					  struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->dp_rx_h_mpdu_err(desc);
+}
+
+static inline u16 ath12k_dp_rx_h_msdu_len(struct ath12k_base *ab,
+					  struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_get_msdu_len(desc);
+}
+
+static inline u8 ath12k_dp_rx_h_sgi(struct ath12k_base *ab,
+				    struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_get_msdu_sgi(desc);
+}
+
+static inline u8 ath12k_dp_rx_h_rate_mcs(struct ath12k_base *ab,
+					 struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_get_msdu_rate_mcs(desc);
+}
+
+static inline u8 ath12k_dp_rx_h_rx_bw(struct ath12k_base *ab,
+				      struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_get_msdu_rx_bw(desc);
+}
+
+static inline u32 ath12k_dp_rx_h_freq(struct ath12k_base *ab,
+				      struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_get_msdu_freq(desc);
+}
+
+static inline u8 ath12k_dp_rx_h_pkt_type(struct ath12k_base *ab,
+					 struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_get_msdu_pkt_type(desc);
+}
+
+static inline u8 ath12k_dp_rx_h_nss(struct ath12k_base *ab,
+				    struct hal_rx_desc *desc)
+{
+	return hweight8(ab->hal_rx_ops->rx_desc_get_msdu_nss(desc));
+}
+
+static inline u8 ath12k_dp_rx_h_tid(struct ath12k_base *ab,
+				    struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_get_mpdu_tid(desc);
+}
+
+static inline u16 ath12k_dp_rx_h_peer_id(struct ath12k_base *ab,
+					 struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_get_mpdu_peer_id(desc);
+}
+
+static inline u8 ath12k_dp_rx_h_l3pad(struct ath12k_base *ab,
+				      struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_get_l3_pad_bytes(desc);
+}
+
+static inline bool ath12k_dp_rx_h_first_msdu(struct ath12k_base *ab,
+					     struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_get_first_msdu(desc);
+}
+
+static inline bool ath12k_dp_rx_h_last_msdu(struct ath12k_base *ab,
+					    struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_get_last_msdu(desc);
+}
+
+static inline void ath12k_dp_rx_desc_end_tlv_copy(struct ath12k_base *ab,
+						  struct hal_rx_desc *fdesc,
+						  struct hal_rx_desc *ldesc)
+{
+	ab->hal_rx_ops->rx_desc_copy_end_tlv(fdesc, ldesc);
+}
+
+static inline void ath12k_dp_rxdesc_set_msdu_len(struct ath12k_base *ab,
+						 struct hal_rx_desc *desc,
+						 u16 len)
+{
+	ab->hal_rx_ops->rx_desc_set_msdu_len(desc, len);
+}
+
+static inline u32 ath12k_dp_rxdesc_get_ppduid(struct ath12k_base *ab,
+					      struct hal_rx_desc *rx_desc)
+{
+	return ab->hal_rx_ops->rx_desc_get_mpdu_ppdu_id(rx_desc);
+}
+
+static inline bool ath12k_dp_rxdesc_mpdu_valid(struct ath12k_base *ab,
+					       struct hal_rx_desc *rx_desc)
+{
+	u32 tlv_tag;
+
+	tlv_tag = ab->hal_rx_ops->rx_desc_get_mpdu_start_tag(rx_desc);
+
+	return tlv_tag == HAL_RX_MPDU_START;
+}
+
+static inline bool ath12k_dp_rx_h_is_da_mcbc(struct ath12k_base *ab,
+					     struct hal_rx_desc *desc)
+{
+	return (ath12k_dp_rx_h_first_msdu(ab, desc) &&
+		ab->hal_rx_ops->rx_desc_is_da_mcbc(desc));
+}
+
+static inline bool ath12k_dp_rxdesc_mac_addr2_valid(struct ath12k_base *ab,
+						    struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_mac_addr2_valid(desc);
+}
+
+static inline u8 *ath12k_dp_rxdesc_get_mpdu_start_addr2(struct ath12k_base *ab,
+							struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_mpdu_start_addr2(desc);
+}
+
+static inline void ath12k_dp_rx_desc_get_dot11_hdr(struct ath12k_base *ab,
+						   struct hal_rx_desc *desc,
+						   struct ieee80211_hdr *hdr)
+{
+	ab->hal_rx_ops->rx_desc_get_dot11_hdr(desc, hdr);
+}
+
+static inline void ath12k_dp_rx_desc_get_crypto_header(struct ath12k_base *ab,
+						       struct hal_rx_desc *desc,
+						       u8 *crypto_hdr,
+						       enum hal_encrypt_type enctype)
+{
+	ab->hal_rx_ops->rx_desc_get_crypto_header(desc, crypto_hdr, enctype);
+}
+
+static inline u8 ath12k_dp_rx_get_msdu_src_link(struct ath12k_base *ab,
+						struct hal_rx_desc *desc)
+{
+	return ab->hal_rx_ops->rx_desc_get_msdu_src_link_id(desc);
+}
+
+static inline void ath12k_dp_clean_up_skb_list(struct sk_buff_head *skb_list)
+{
+	struct sk_buff *skb;
+
+	while ((skb = __skb_dequeue(skb_list)))
+		dev_kfree_skb_any(skb);
+}
+
 int ath12k_dp_rx_ampdu_start(struct ath12k *ar,
 			     struct ieee80211_ampdu_params *params,
 			     u8 link_id);
-- 
2.34.1


