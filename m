Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6E260A2600
	for <ath12k@archiver.kernel.org>; Sat, 28 Nov 2026 17:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nzcynvXH;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=k4/2he3W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PO4i6qUcXTERLvTBrnvj9bYRokOWmfKRjAdgWippNcE=; b=nzcynvXH+fYLtV
	WN6snrWCbkieTKn+9CQ9aWUt/UEjFD5olsfxwAnYOGHu4xO53oyMmHHunae7JxiAkrme140ymNIQE
	EMTVRreV02Ow57ovCk4Srexi53zUZxM4T2sdwIyIJe/RXbwANLwWy7OSMSwV9TfsnG++gLvoMZZIC
	+QhiAOToGiWc33/79QpO6gKszdK5bF/sUd4OXI6b2Y1bxsMtfs/YzlFYmF2r8FXHg3P0W5MTmY/iu
	wvB407ibyWk++LbUUw7Hw0bBbImayN2+QT8tC90ch2LoSlImERTYW7DDVj9O8iUCJUoR4NoGj8oT7
	LvWY8oL9CGathdqIhsvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM83-000000010yU-1b51;
	Sat, 28 Nov 2026 17:22:27 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM7z-000000010t9-0IdI
	for ath12k@lists.infradead.org;
	Sat, 28 Nov 2026 17:22:26 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so1505003866b.3
        for <ath12k@lists.infradead.org>; Sat, 28 Nov 2026 09:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886541; x=1796491341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO4i6qUcXTERLvTBrnvj9bYRokOWmfKRjAdgWippNcE=;
        b=k4/2he3WRXwNWXSTesrqaZYwYCguJmX2eQcvvISN/qvX/MFihteQCF3W6DxAequiGZ
         1XmdvEJjsJcYVOwwpqwYmEUaL21yYwbg+GhBSBu4KO3jfwGi6RnWQej623TiPrXsDM6u
         ky7V9ECs9iingtFGecglyGyu+GFJubUdOA079SG+5zh2s8WT/l6Y5o+QDNYk2HGsAUjX
         Ir6Kgc8R+lD1IsUHmWtTYsMIY8Wa+Oge/0O4jC2UUv8VBR+aRWbQ/riWh9Z2huNsvJKQ
         YLtkcsd7rb781ALFhafR2jNn7KYDJdbqt7Y0OWpkM8DFrBgqbQV0ghXlkckDc93q4OHl
         w0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886541; x=1796491341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PO4i6qUcXTERLvTBrnvj9bYRokOWmfKRjAdgWippNcE=;
        b=f8JtFjtAhxpTvmf+SI7w8ubjgeiyqPFnts7Wghsr8bY7EIYxs4RaL2pz0aQ4LrXO1Q
         VrL0HrJ+nL0YnslaFpjTpIXg56iMyU8TIHNR38g4CW95ahpCXB8XdGaRUOQF0F8kbP+U
         joONE6wu6AB8ON753LsRu8MavWTgrI8mGZXS+hhLzA6S0dNOI9sau0jGT8cWIw7UAUMI
         qNAYV05tq5ntAQFWp2laDuNeVbtIa9y5GDPdhSm3Hpf1uuHf1msL3vkq6aZ+9SqD+jCa
         C9RoOWdzfifPwrZMgs0E3EiO9SsBK6oMKfXcwrHKCGmOHun24a3Ug+pQBDd4SHlKBEmy
         ysYw==
X-Forwarded-Encrypted: i=1; AL+hErGklLfVzE9bwVHH9BSPagpGLi47nWc1oHUr57XFLczgPCTr+LoJwlBtWFzVFPBTCmQhKOT2lMA=@lists.infradead.org
X-Gm-Message-State: APuU4Z+bgqflgV23JIYuGWyp8aqcEfLQE5GlI8CUYZ2iRO9tgsy3atB/
	6WntyACBfClAUuE8El52xi1KzY4jx1QS894q+io3G9T7bOfR1CVlAbvu7YorqE7HTw==
X-Gm-Gg: AZFdTZcvvaFusKcNONfDB4c+37tpWIev0Z1NtnJDdKZSyN58rwCnuLYbIfklTkH5Sou
	rMZIz0hWq5vNdT67y0d7cE5KRNkYhGxCFcoy11uVtRZcvgah4QBBkqZdr3K1B1hvRArcYrqfEE+
	rHc1hlRJDsAOG3Ght5a2EC7MFBUD0lB1b707N5lT/MnrlPFTqKsUUOwmR+MYvNK9fyUm9EoCMHj
	efc6ODusa1284ewsVNpRL0sElXn3DtSQaTTzxy4Lqoe60EYLqGQoj+YV4q/55eHw+5VTEAozSP0
	lwB/2kL7ZUIoVAm+LlvU+IUN6qruLQwRK9lLb0Q4NDU6u8XN3Xzmnt/TKDO4rlz8wdRk4F1MCh2
	XWJKHQY+mO6c5e8YkuLZ6BM4XZO+FMOkCb1NPhes9vSFP4OKtXpyN0uf9eBFVD9y8PpqvwRkrkM
	mOOphamjKa4BO++MfGQTaOYwRZrSb5L1jQHwLvSnpOUxT+0Q7ZC6tOODypoiXHMQf68mVsmjIDF
	1usVo/bfbjkZ/rS2I4kjemS5BrTTCI3UF8BOMO7RcYo/oaDTMOHxCbZoNnCV7c9QE5k7A2ofCn8
	nc9g6wMU0WoD8MZfZ8LLjHRcybPaofXrCyaDUUcfu5u51Zb51QCbAerEodQxXge7IzgQ5HIG9+v
	LZD9avhk/f+gb6+pN/Qidj+J/N9meVa5VddRWH6lTX8cuHNKtoVxpXPY5V+arsKfpfSnDgWQnQs
	NNWGpUQRQVoif9ng70RvSS4mxtZvxuvTcV2bROb58brNf+EDJBTh/3vaZkvHHmJzcgSxJy9J5/L
	PzuVM6Fchrtp1EzCkfTgCVPyRUqHzAZuLUp6IOxE5Da2Gc3PA6E2GfYcM2YhyT94oNuc6tAi36p
	czSB2kh6BDAY2w==
X-Received: by 2002:a17:906:365a:b0:c46:50c6:f737 with SMTP id a640c23a62f3a-c513a88d971mr1837729166b.31.1795886541449;
        Sat, 28 Nov 2026 09:22:21 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:20 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	John Crispin <john@phrozen.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Jouni Malinen <quic_jouni@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>
Subject: [PATCH ath-next v2 2/6] wifi: ath12k: only trust the RX checksum of a frame the hardware checked
Date: Sat, 28 Nov 2026 18:22:16 +0100
Message-ID: <20261128172220.922376-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128172220.922376-1-julius@bairaktaris.de>
References: <20261128172220.922376-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_092223_160011_A0F19BE7 
X-CRM114-Status: GOOD (  15.13  )
X-Spam-Score: -2.1 (--)
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

ath12k_wifi7_dp_rx_h_csum_offload() marks every received MSDU
CHECKSUM_UNNECESSARY unless the MSDU end TLV reports an IP or TCP/UDP
checksum failure. Those bits report a checksum the hardware computed
and found wrong, so both are also clear for a frame whose transport
checksum it never computed: any protocol other than TCP and UDP, such
as ICMP, ICMPv6 or GRE, a TCP or UDP frame whose headers it did not
parse, and an IP fragment, which carries only part of the datagram its
checksum covers. A frame that ath12k_wifi7_dp_rx_h_defrag() reassembles
from 802.11 fragments keeps the descriptor of its first fragment, of
which only the MSDU length is rewritten, so its flags say nothing about
the payload of the later fragments. icmp_rcv() then takes the checksum
as verified, and a UDP datagram whose IP fragments all carry
CHECKSUM_UNNECESSARY keeps it after reassembly.

ath11k has the same check. Extract the protocol, fragment and
header-parsed flags of the MSDU end TLV with the other descriptor
fields on each chip, from the last buffer of the MSDU like the other
MSDU end fields, and mark a frame CHECKSUM_UNNECESSARY only when it is
TCP or UDP, not a fragment, its IP and TCP/UDP headers were parsed, and
it was not reassembled from 802.11 fragments. Unlike ath11k, ath12k
needs no case for a raw A-MSDU: nothing in the driver sets
ATH12K_FLAG_RAW_MODE.

Found by an LLM review (Claude) of the code.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: also leave a frame reassembled from 802.11 fragments to the stack
(Sashiko, on 1/6); read l4_csum_checked from the last buffer, like the
other MSDU end fields since commit 1e678e37ff13; discovery line
reworded.

 drivers/net/wireless/ath/ath12k/hal.h               |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c       | 11 ++++++++++-
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c | 11 +++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c | 12 ++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c | 12 ++++++++++++
 5 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 343e1636b4cc..003baf0d3ea0 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -732,6 +732,7 @@ struct hal_rx_desc_data {
 	    is_decrypted:1,
 	    ip_csum_fail:1,
 	    l4_csum_fail:1,
+	    l4_csum_checked:1,
 	    is_first_msdu:1,
 	    is_last_msdu:1,
 	    mesh_ctrl_present:1,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 473887ed4bb1..fa591a03ecef 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -344,7 +344,16 @@ int ath12k_wifi7_dp_rx_tid_delete_handler(struct ath12k_base *ab,
 static void ath12k_wifi7_dp_rx_h_csum_offload(struct sk_buff *msdu,
 					      struct hal_rx_desc_data *rx_info)
 {
-	msdu->ip_summed = (rx_info->ip_csum_fail || rx_info->l4_csum_fail) ?
+	/*
+	 * The failure bits only report a checksum the hardware computed, so
+	 * they are also clear for a frame it did not check: anything but a
+	 * TCP or UDP frame whose headers it parsed, and an IP fragment. A
+	 * frame reassembled from 802.11 fragments keeps the descriptor of its
+	 * first fragment, which does not describe the later ones.
+	 */
+	msdu->ip_summed = (ATH12K_SKB_RXCB(msdu)->is_frag ||
+			   rx_info->ip_csum_fail || rx_info->l4_csum_fail ||
+			   !rx_info->l4_csum_checked) ?
 			   CHECKSUM_NONE : CHECKSUM_UNNECESSARY;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index bad2b60409d9..10a8e3e78fdf 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -347,6 +347,16 @@ static bool ath12k_hal_rx_h_l4_cksum_fail_qcc2072(struct hal_rx_desc *desc)
 			       RX_MSDU_END_INFO13_TCP_UDP_CKSUM_FAIL);
 }
 
+static bool ath12k_hal_rx_h_l4_csum_checked_qcc2072(struct hal_rx_desc *desc)
+{
+	u32 info11 = __le32_to_cpu(desc->u.qcc2072.msdu_end.info11);
+
+	return (info11 & (RX_MSDU_END_INFO11_TCP | RX_MSDU_END_INFO11_UDP)) &&
+	       !(info11 & RX_MSDU_END_INFO11_IP_FRAG) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_FIXED_HDR_VALID) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_TCP_UDP_HDR_VALID);
+}
+
 static bool ath12k_hal_rx_h_ip_cksum_fail_qcc2072(struct hal_rx_desc *desc)
 {
 	return !!le32_get_bits(desc->u.qcc2072.msdu_end.info13,
@@ -421,6 +431,7 @@ static void ath12k_hal_extract_rx_desc_data_qcc2072(struct hal_rx_desc_data *rx_
 	rx_desc_data->msdu_done = ath12k_hal_rx_h_msdu_done_qcc2072(ldesc);
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcc2072(ldesc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcc2072(ldesc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_qcc2072(ldesc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_qcc2072(ldesc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcc2072(ldesc);
 }
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 0f85ae69b5e0..659d74a85764 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -872,6 +872,17 @@ bool ath12k_hal_rx_h_l4_cksum_fail_qcn9274(struct hal_rx_desc *desc)
 			       RX_MSDU_END_INFO13_TCP_UDP_CKSUM_FAIL);
 }
 
+static inline
+bool ath12k_hal_rx_h_l4_csum_checked_qcn9274(struct hal_rx_desc *desc)
+{
+	u32 info11 = __le32_to_cpu(desc->u.qcn9274_compact.msdu_end.info11);
+
+	return (info11 & (RX_MSDU_END_INFO11_TCP | RX_MSDU_END_INFO11_UDP)) &&
+	       !(info11 & RX_MSDU_END_INFO11_IP_FRAG) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_FIXED_HDR_VALID) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_TCP_UDP_HDR_VALID);
+}
+
 static inline
 bool ath12k_hal_rx_h_ip_cksum_fail_qcn9274(struct hal_rx_desc *desc)
 {
@@ -1042,6 +1053,7 @@ void ath12k_hal_extract_rx_desc_data_qcn9274(struct hal_rx_desc_data *rx_desc_da
 	rx_desc_data->msdu_done = ath12k_hal_rx_h_msdu_done_qcn9274(ldesc);
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcn9274(ldesc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcn9274(ldesc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_qcn9274(ldesc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_qcn9274(ldesc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcn9274(ldesc);
 }
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index 2d66d71d1b9b..6e103f49bb9f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
@@ -485,6 +485,17 @@ bool ath12k_hal_rx_h_l4_cksum_fail_wcn7850(struct hal_rx_desc *desc)
 			       RX_MSDU_END_INFO13_TCP_UDP_CKSUM_FAIL);
 }
 
+static inline
+bool ath12k_hal_rx_h_l4_csum_checked_wcn7850(struct hal_rx_desc *desc)
+{
+	u32 info11 = __le32_to_cpu(desc->u.wcn7850.msdu_end.info11);
+
+	return (info11 & (RX_MSDU_END_INFO11_TCP | RX_MSDU_END_INFO11_UDP)) &&
+	       !(info11 & RX_MSDU_END_INFO11_IP_FRAG) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_FIXED_HDR_VALID) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_TCP_UDP_HDR_VALID);
+}
+
 static inline
 bool ath12k_hal_rx_h_ip_cksum_fail_wcn7850(struct hal_rx_desc *desc)
 {
@@ -638,6 +649,7 @@ void ath12k_hal_extract_rx_desc_data_wcn7850(struct hal_rx_desc_data *rx_desc_da
 	rx_desc_data->msdu_done = ath12k_hal_rx_h_msdu_done_wcn7850(ldesc);
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_wcn7850(ldesc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_wcn7850(ldesc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_wcn7850(ldesc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_wcn7850(ldesc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_wcn7850(ldesc);
 }
-- 
2.53.0


