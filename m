Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C8DC54FDF
	for <ath12k@archiver.kernel.org>; Thu, 30 Jul 2026 10:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWLCaC8YWc1DFCqeIK7seRRulNWyH3TqxJf5OslhVpw=; b=cnvlWNGVzfWS7HL+WrNEFoMwU0
	ruAbQFxtgU7GZRviizUaq1vFMU1JQ/ClFAVyuFYmtMG+aMmkkwxHkWsFbJh/FcF20k+6lEBW3OzKM
	UxDjE9ncHLXerTz8wH13nb3O3wGwdPuomQt3qlSJ4A1ce++Kjl+0MHCidFaaaDgxkTjPpxdZ/N1aP
	zZxJXzcwzM0Zd/gvQDoyKO4TdDR9MT/8bGiBOVmROgNMOGqX0UW97hr8PamMHsFld19OCt2c9VRos
	cgAyEEyD6KEZaLl7i1xmP0a79PRXan6gJjqsCsBDyS8YNoao4w8sGU1sgSUsgIcxJ0PrHmC2cMFdk
	qrMrOR8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNag-0000000A8Aq-13Lq;
	Thu, 30 Jul 2026 10:02:14 +0000
Received: from mail.as201155.net ([185.84.6.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNae-0000000A89x-1Dr1
	for ath12k@lists.infradead.org;
	Thu, 30 Jul 2026 10:02:13 +0000
Received: from webmail.newmedia-net.de (smtps.newmedia-net.de [IPv6:2a05:a1c0:0:de::167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.as201155.net (Postfix) with ESMTPS id C2814DFC75
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 12:02:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com; s=mikd;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID; bh=UWLCaC8YWc1DFCqeIK7seRRulNWyH3TqxJf5OslhVpw=;
	b=HW8rqCazbnFIKC3CAj0BB3N1YUpB/5F2Qb+2jr9KdaAbeTnSj+f5r7gh6Hzd+RYJKdjsm+5QOjZf9CKcd+fxQfNGwvhFWNenPhHopTYW5Rc9Psqxg3HS5/0BrWxGBMVAqisFqw3Qs9HLQHr6CuKlVC8KmlfL4y4HtpHrkl0IHMs=;
Message-ID: <236fc613-fb51-42fd-8091-d5be48de9572@dd-wrt.com>
Date: Thu, 30 Jul 2026 12:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH ath-next] wifi: ath12k: fix encrypted EAPOL TX in encap
 offload mode
To: ath12k@lists.infradead.org
References: <20260729171732.668367-1-reshma.rajkumar@oss.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
In-Reply-To: <20260729171732.668367-1-reshma.rajkumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass (webmail.newmedia-net.de: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=s.gottschall@dd-wrt.com; helo=webmail.newmedia-net.de;
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: s.gottschall@dd-wrt.com
X-SA-Exim-Scanned: No (on webmail.newmedia-net.de); SAEximRunCond expanded to false
X-NMN-MailScanner-Information: Please contact the ISP for more information
X-NMN-MailScanner-ID: 1wpNaX-0008Y8-IB
X-NMN-MailScanner: Found to be clean
X-NMN-MailScanner-From: s.gottschall@dd-wrt.com
X-Received: from localhost ([127.0.0.1] helo=webmail.newmedia-net.de)
	by webmail.newmedia-net.de with esmtp (Exim 4.72)
	(envelope-from <s.gottschall@dd-wrt.com>)
	id 1wpNaX-0008Y8-IB
	for ath12k@lists.infradead.org; Thu, 30 Jul 2026 12:02:05 +0200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_030212_534118_57E8DC4C 
X-CRM114-Status: GOOD (  29.10  )
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


Am 29.07.2026 um 19:17 schrieb Reshma Immaculate Rajkumar:
> When a vif operates with IEEE80211_OFFLOAD_ENCAP_ENABLED,
> mac80211 delivers EAPOL frames to ath12k in native-WiFi format.
>
> Unencrypted EAPOL frames used during the initial 4-way
> handshake are already handled through the existing
> is_diff_encap path. However, EAPOL frames transmitted during
> GTK rekeying carry ATH12K_SKB_CIPHER_SET and continue through
> the normal native-WiFi transmit path.
>
> Firmware encryption requires RAW frames with cipher-specific IV and ICV
> fields correctly provisioned in the skb. Passing encrypted EAPOL frames
> in native-WiFi format results in incorrect IV provisioning, leading to
> an invalid ICV and frame drop.
>
> Fix this by detecting the EAPOL frames that need HW encryption and
> converting them to firmware-encrypted RAW frames before transmission.
> Reserve IV space after the MAC header, append ICV space at the tail,
> select the appropriate firmware encryption type and request
> firmware-side encryption.
>
> Introduce ath12k_dp_tx_crypto_iv_len() and ath12k_dp_tx_crypto_icv_len()
> helpers in the TX path to obtain cipher-specific IV and ICV lengths.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01270-QCAHKSWPL_SILICONZ-1
you mention WLAN.WBE.1.6-01270-QCAHKSWPL_SILICONZ-1 but this firmware 
isnt available for public. i tested it with wds frames enabled and still 
have problems with the current available version (01243)

Sebastian

>
> Fixes: d29591d5b52e ("wifi: ath12k: Advertise encapsulation/decapsulation offload support to mac80211")
> Signed-off-by: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/dp_tx.c       | 46 +++++++++++++
>   drivers/net/wireless/ath/ath12k/dp_tx.h       |  2 +
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 64 ++++++++++++++++++-
>   3 files changed, 111 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
> index c10da6195c9c..9644f9ef2c74 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
> @@ -82,6 +82,52 @@ enum hal_encrypt_type ath12k_dp_tx_get_encrypt_type(u32 cipher)
>   }
>   EXPORT_SYMBOL(ath12k_dp_tx_get_encrypt_type);
>   
> +u8 ath12k_dp_tx_crypto_iv_len(enum hal_encrypt_type enc_type)
> +{
> +	switch (enc_type) {
> +	case HAL_ENCRYPT_TYPE_TKIP_NO_MIC:
> +	case HAL_ENCRYPT_TYPE_TKIP_MIC:
> +		return IEEE80211_TKIP_IV_LEN;
> +	case HAL_ENCRYPT_TYPE_CCMP_128:
> +		return IEEE80211_CCMP_HDR_LEN;
> +	case HAL_ENCRYPT_TYPE_CCMP_256:
> +		return IEEE80211_CCMP_256_HDR_LEN;
> +	case HAL_ENCRYPT_TYPE_GCMP_128:
> +	case HAL_ENCRYPT_TYPE_AES_GCMP_256:
> +		return IEEE80211_GCMP_HDR_LEN;
> +	case HAL_ENCRYPT_TYPE_WEP_40:
> +	case HAL_ENCRYPT_TYPE_WEP_104:
> +	case HAL_ENCRYPT_TYPE_WEP_128:
> +		return IEEE80211_WEP_IV_LEN;
> +	default:
> +		return 0;
> +	}
> +}
> +EXPORT_SYMBOL(ath12k_dp_tx_crypto_iv_len);
> +
> +u8 ath12k_dp_tx_crypto_icv_len(enum hal_encrypt_type enc_type)
> +{
> +	switch (enc_type) {
> +	case HAL_ENCRYPT_TYPE_CCMP_128:
> +		return IEEE80211_CCMP_MIC_LEN;
> +	case HAL_ENCRYPT_TYPE_CCMP_256:
> +		return IEEE80211_CCMP_256_MIC_LEN;
> +	case HAL_ENCRYPT_TYPE_GCMP_128:
> +	case HAL_ENCRYPT_TYPE_AES_GCMP_256:
> +		return IEEE80211_GCMP_MIC_LEN;
> +	case HAL_ENCRYPT_TYPE_TKIP_NO_MIC:
> +	case HAL_ENCRYPT_TYPE_TKIP_MIC:
> +		return IEEE80211_TKIP_ICV_LEN;
> +	case HAL_ENCRYPT_TYPE_WEP_40:
> +	case HAL_ENCRYPT_TYPE_WEP_104:
> +	case HAL_ENCRYPT_TYPE_WEP_128:
> +		return IEEE80211_WEP_ICV_LEN;
> +	default:
> +		return 0;
> +	}
> +}
> +EXPORT_SYMBOL(ath12k_dp_tx_crypto_icv_len);
> +
>   void ath12k_dp_tx_release_txbuf(struct ath12k_dp *dp,
>   				struct ath12k_tx_desc_info *tx_desc,
>   				u8 pool_id)
> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.h b/drivers/net/wireless/ath/ath12k/dp_tx.h
> index 7cef20540179..1af79af2ada2 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_tx.h
> +++ b/drivers/net/wireless/ath/ath12k/dp_tx.h
> @@ -19,6 +19,8 @@ enum hal_tcl_encap_type
>   ath12k_dp_tx_get_encap_type(struct ath12k_base *ab, struct sk_buff *skb);
>   void ath12k_dp_tx_encap_nwifi(struct sk_buff *skb);
>   u8 ath12k_dp_tx_get_tid(struct sk_buff *skb);
> +u8 ath12k_dp_tx_crypto_iv_len(enum hal_encrypt_type enc_type);
> +u8 ath12k_dp_tx_crypto_icv_len(enum hal_encrypt_type enc_type);
>   void *ath12k_dp_metadata_align_skb(struct sk_buff *skb, u8 tail_len);
>   int ath12k_dp_tx_align_payload(struct ath12k_dp *dp, struct sk_buff **pskb);
>   void ath12k_dp_tx_release_txbuf(struct ath12k_dp *dp,
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> index d2749de44553..306ab98d28dc 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> @@ -13,6 +13,49 @@
>   #include "hal.h"
>   #include "hal_tx.h"
>   
> +/*
> + * Convert an encrypted EAPOL frame from native-WiFi format to
> + * the layout expected by the firmware RAW encrypt pipeline:
> + *
> + *   [802.11 hdr][IV (zeroed)][LLC/SNAP][EAPOL payload][ICV (zeroed)]
> + *
> + * mac80211 delivers the frame as [802.11 hdr][LLC/SNAP][EAPOL payload].
> + * The MAC header length is read from the unmodified skb and is safe because
> + * ieee80211_hdrlen() only inspects the 2-byte frame_control field.
> + * pskb_expand_head() is used to grow both head (for the IV) and tail
> + * (for the ICV) in a single call and allocation.
> + */
> +static int
> +ath12k_wifi7_dp_tx_encap_eapol(struct sk_buff *skb,
> +			       struct hal_tx_info *ti,
> +			       struct ath12k_skb_cb *skb_cb)
> +{
> +	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
> +	enum hal_encrypt_type enc_type =
> +				ath12k_dp_tx_get_encrypt_type(skb_cb->cipher);
> +	u16 mac_hdr_len = ieee80211_hdrlen(hdr->frame_control);
> +	u8 iv_len = ath12k_dp_tx_crypto_iv_len(enc_type);
> +	u8 icv_len = ath12k_dp_tx_crypto_icv_len(enc_type);
> +
> +	if (pskb_expand_head(skb, iv_len, icv_len, GFP_ATOMIC))
> +		return -ENOMEM;
> +
> +	if (iv_len) {
> +		skb_push(skb, iv_len);
> +		memmove(skb->data, skb->data + iv_len, mac_hdr_len);
> +		memset(skb->data + mac_hdr_len, 0, iv_len);
> +	}
> +
> +	if (icv_len)
> +		memset(skb_put(skb, icv_len), 0, icv_len);
> +
> +	ti->flags0 |= u32_encode_bits(1, HAL_TCL_DATA_CMD_INFO2_TO_FW);
> +	ti->encap_type = HAL_TCL_ENCAP_TYPE_RAW;
> +	ti->encrypt_type = enc_type;
> +
> +	return 0;
> +}
> +
>   static void
>   ath12k_wifi7_hal_tx_cmd_ext_desc_setup(struct ath12k_base *ab,
>   				       struct hal_tx_msdu_ext_desc *tcl_ext_cmd,
> @@ -91,6 +134,7 @@ int ath12k_wifi7_dp_tx(struct ath12k_pdev_dp *dp_pdev, struct ath12k_link_vif *a
>   	u32 iova_mask = dp->hw_params->iova_mask;
>   	bool is_diff_encap = false;
>   	bool is_null_frame = false;
> +	bool eapol_encap_done = false;
>   
>   	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags))
>   		return -ESHUTDOWN;
> @@ -211,9 +255,27 @@ int ath12k_wifi7_dp_tx(struct ath12k_pdev_dp *dp_pdev, struct ath12k_link_vif *a
>   	case HAL_TCL_ENCAP_TYPE_NATIVE_WIFI:
>   		is_null_frame = ieee80211_is_nullfunc(hdr->frame_control);
>   		if (ahvif->vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED) {
> -			if (skb->protocol == cpu_to_be16(ETH_P_PAE) || is_null_frame)
> +			if ((skb->protocol == cpu_to_be16(ETH_P_PAE) &&
> +			     !(skb_cb->flags & ATH12K_SKB_CIPHER_SET)) || is_null_frame)
>   				is_diff_encap = true;
>   
> +			if (skb->protocol == cpu_to_be16(ETH_P_PAE) &&
> +			    (skb_cb->flags & ATH12K_SKB_CIPHER_SET)) {
> +				if (!eapol_encap_done) {
> +					ret = ath12k_wifi7_dp_tx_encap_eapol(skb, &ti,
> +									     skb_cb);
> +					if (ret)
> +						goto fail_remove_tx_buf;
> +					hdr = (void *)skb->data;
> +					eapol_encap_done = true;
> +				} else {
> +					ti.flags0 |= u32_encode_bits(1,
> +							HAL_TCL_DATA_CMD_INFO2_TO_FW);
> +					ti.encap_type = HAL_TCL_ENCAP_TYPE_RAW;
> +					ti.encrypt_type =
> +						ath12k_dp_tx_get_encrypt_type(skb_cb->cipher);
> +				}
> +			}
>   			/* Firmware expects msdu ext descriptor for nwifi/raw packets
>   			 * received in ETH mode. Without this, observed tx fail for
>   			 * Multicast packets in ETH mode.
>
> base-commit: ca27e3c2284a7a43ba390ed5ce0d68b3c869c0ce

