Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935E1606A691
	for <ath12k@archiver.kernel.org>; Sun, 22 Nov 2026 21:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z63ac9Hw;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Ddz0USLc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0Bkx2jlQcxYbAjWN1LA9t9bAHgweEVF16qJ99FDl9R4=; b=Z63ac9HwY3Cv5t
	41lDbPG/WPktzMAJrTPmsUGo5qSfM9KKURa+5Jx9EMXIxZ0VX81Xo5tmHOLDcI+cGL+Qhn3l1Utny
	Td+ypaHiq1+9/l3L0vnXVa9WXlBFtU/DcIyainvGRpUGLzpKf8/h2xMlhYLMmiMGmQPDGq+37/Krf
	NBE2UH1/kym3waUqRh+f7Kny7DvK4+3KHfgpEMgKX+oTklh4zLDbT5p3mHHzExH9mduOKqCsYP2/L
	bo+pni1FafVdWBdzGrBDiuIitBiaNUdC249D1Vybwrvm/nzZUtQDTOI3cwmDCJtTmuRLaabhQwzQz
	LA++4lWXyv5hy7VEKTeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEkd-00000001kke-1KIU;
	Sun, 22 Nov 2026 21:05:31 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEkZ-00000001kgf-3fXa
	for ath12k@lists.infradead.org;
	Sun, 22 Nov 2026 21:05:29 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c4322d310e7so467902266b.0
        for <ath12k@lists.infradead.org>; Sun, 22 Nov 2026 13:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381526; x=1795986326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Bkx2jlQcxYbAjWN1LA9t9bAHgweEVF16qJ99FDl9R4=;
        b=Ddz0USLcE+g5Pc6bL4JElBeGzfMWXOEzm6DM1SohdpiEcpq+NMUwEOpIuZdZfu8X2J
         +WTgYZc/hH/mAHB5WnyIYl8R/RM2jdyigoGw3rordRd+fP3s49enVrWlJNbLAR7AngAM
         YUSQPZMpv+scKWcIC5U4oScPRsvFm+qc/xXq+JdRuNXdFnJdboWhPurMRY0p6ZZftAeY
         +QwMYVuL2J60jljUP8Uu6x9k2F3iHfhp88Y2oxq4SI/zbSOvWG8zYs4+DKpIbgZ+Yagu
         lGV2Om//MiUXwDcj9kfGpkb3/n2cmndCYaAuEoMvtFwh5U53dVuAj/IHGzsT9RGBHcpG
         Y50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381526; x=1795986326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Bkx2jlQcxYbAjWN1LA9t9bAHgweEVF16qJ99FDl9R4=;
        b=dNVK85v0Q/0uYljuWyp9LAIKwuqkEk52R4H+JbHG47xFyzPWmSLR4HV7W+eaMVBFPf
         ++TCxflSSRLcr7CTziqJJXwIyEV2D6XXzlWMNW6xY62pm9P0ySuEwecx4upTllVGoW3f
         /fvtjpBLRFptEtUwUv7cukjjKC1MtNUM5EpRlpR7KEDHkbuvYGiMPhd79xaA+oNLUHfH
         aR128XJ0JOgNv/5j0a0YoV4AnrWYkzOYWjF6+Pss32OKjQ0Dxf9mQdCFWNO3I7BM8V5O
         o1X/E1niLm7tZAaNpmzfKyW7XNAalz/9W+JlS0G0LjqyWQPByNfmsgl0HjkS0zHpSPoL
         51YQ==
X-Forwarded-Encrypted: i=1; AL+hErGAS4sjlPdq/zm/7ITf3IUEaVQxVHGb0ALAfclDWxjOKimRYhSA6txqqrNBtXuxyUnGRgfc39M=@lists.infradead.org
X-Gm-Message-State: APuU4Z89yq4fF2/EbqQMBliO63/Sj1+a4MAPZqaE1m89zf+uTfcYefgq
	VcBqyN75TgGNWLhZNoBIElI8wwlSi29pa0dtEm6JjZatmZk5yFWBti1/Wt51aCVpm91k5OcNJGL
	lkRDFXMpw
X-Gm-Gg: AZFdTZdgi/L/1poF2o1TgKyZ+MwHIp4R2pTO+bA6nvi/0UfN1xR0S1Lf58md2Pecndz
	8QgshpWvtmJwNt9tL0bAFOio6uMDk6ohfNKznhLGWnvbT5Y7lKD8PQ7H9w5ePstM9t2cI53mPFP
	uoy/ChryCU8QZk3mxc46c8IziZ+b24tFv19rembSnFNoMEcUvoMifHJMU+mZbDzpjekNsW9+eqP
	eapxdO3xPzK+xT6SHy43Ul7XYodCQMtzVO6JyfehAseEc1f3MM/OX1UcgrCC6useQLAPVaMk/d3
	hYMcb5+6Tg9X9ZIFvsL62aGGofmM8qkC+L1uIY+ROZFCi+F4Y1zYdXSrT+TOk1fSDE3B1N+WmjZ
	Ra1423jzM6yQlc3w0eTUjFGBTolhC6dCIKyqXIFU8rS947XiPaNoTvsSDkmkYEGk3j5/6Z7cpil
	rqikh4nz3ytOWErJOUlEI1nmlI9VFHotnDA1Do8JSvPtSahLwVPV9CHBui6AHbBtftRujIF9L7G
	rkOH+MG2somB5861Cgwn0UokFpnlHCC1pLzKlgHRspvFlA+mmV0Po0hpXWyvfAgtFMIMMc4Odyb
	j/dIWbwtxR6kOUX+0mCLXvGL+9Nt1kLSmJLc72DeaTE1iKSFzgeWhxuS/xLXf2dKZUl7xfgq5o5
	9maE3HLMQRrzo7NJZspLI4G+BLcpu9RvTbyxOCm6nfaOWxzNiUGRf4KjoERFs8MyXio7NbpXm3U
	gmJUS9EMNE7jd9Tqt3Itz/OcaCPY9VnvMStT4MMIHijG554RDtdvWuq8bziVMb/cqFkQU/3b51q
	w2sPHf3UpsI+XkRTOtaK+0MKqWzzLko3rRrjeXR2cH8gZfcEzG6BDu8ms1RpBJ6aFTuNelJjcEU
	MUuBeMLTk9OPbVRy+sq8OQkavdIZ7Bunt6xKY+i/bnRcjDUD674qe1W1Tv3Yx9V0t+1cvtbiPA=
	=
X-Received: by 2002:a17:907:c13:b0:c4c:c997:8711 with SMTP id a640c23a62f3a-c513ac67123mr760146366b.38.1795381525929;
        Sun, 22 Nov 2026 13:05:25 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:25 -0800 (PST)
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
Subject: [PATCH ath-next 2/6] wifi: ath12k: only trust the RX checksum of a frame the hardware checked
Date: Sun, 22 Nov 2026 22:05:21 +0100
Message-ID: <20261122210525.2076058-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122210525.2076058-1-julius@bairaktaris.de>
References: <20261122210525.2076058-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_130527_982755_E5E5A458 
X-CRM114-Status: GOOD (  14.34  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_wifi7_dp_rx_h_csum_offload() marks every received MSDU
CHECKSUM_UNNECESSARY unless the MSDU end TLV reports an IP or TCP/UDP
checksum failure. Those bits report a checksum the hardware computed
and found wrong, so both are also clear for a frame whose transport
checksum it never computed: any protocol other than TCP and UDP, such
as ICMP, ICMPv6 or GRE, a TCP or UDP frame whose headers it did not
parse, and an IP fragment, which carries only part of the datagram its
checksum covers. icmp_rcv() then takes the checksum as verified, and a
UDP datagram whose fragments all carry CHECKSUM_UNNECESSARY keeps it
after reassembly.

ath11k has the same check. Extract the protocol, fragment and
header-parsed flags of the MSDU end TLV with the other descriptor
fields on each chip, and mark a frame CHECKSUM_UNNECESSARY only when it
is TCP or UDP, not a fragment, and its IP and TCP/UDP headers were
parsed.

Found by reading the code with an AI review tool.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/hal.h               |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c       |  8 +++++++-
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c | 11 +++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c | 12 ++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c | 12 ++++++++++++
 5 files changed, 43 insertions(+), 1 deletion(-)

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
index 473887ed4bb1..4a57d89669ab 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -344,7 +344,13 @@ int ath12k_wifi7_dp_rx_tid_delete_handler(struct ath12k_base *ab,
 static void ath12k_wifi7_dp_rx_h_csum_offload(struct sk_buff *msdu,
 					      struct hal_rx_desc_data *rx_info)
 {
-	msdu->ip_summed = (rx_info->ip_csum_fail || rx_info->l4_csum_fail) ?
+	/*
+	 * The failure bits only report a checksum the hardware computed, so
+	 * they are also clear for a frame it did not check: anything but a
+	 * TCP or UDP frame whose headers it parsed, and an IP fragment.
+	 */
+	msdu->ip_summed = (rx_info->ip_csum_fail || rx_info->l4_csum_fail ||
+			   !rx_info->l4_csum_checked) ?
 			   CHECKSUM_NONE : CHECKSUM_UNNECESSARY;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index f579fdfc7c1d..23a07ca5aaa9 100644
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
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcc2072(rx_desc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcc2072(rx_desc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_qcc2072(rx_desc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_qcc2072(rx_desc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcc2072(rx_desc);
 }
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index dd12b1684cf7..4f0a4daf7b41 100644
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
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcn9274(rx_desc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcn9274(rx_desc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_qcn9274(rx_desc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_qcn9274(rx_desc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcn9274(rx_desc);
 }
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index de6247aa3b2b..090ed78589a3 100644
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
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_wcn7850(rx_desc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_wcn7850(rx_desc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_wcn7850(rx_desc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_wcn7850(rx_desc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_wcn7850(rx_desc);
 }
-- 
2.53.0


