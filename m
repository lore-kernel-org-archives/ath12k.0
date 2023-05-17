Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA25FC77B7F
	for <ath12k@archiver.kernel.org>; Wed, 17 May 2023 08:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=942uO88fgjxdV8fDXY8rsD360xXkZebumDxSv26wya8=; b=e1RyFiB35KlQei
	M9m8KEYu80ObB0XFlkYeecIapBeEZ0za1yB2lJJnudLrRYmpNobzyerkODcF0FXKxUTHueSZIEgPQ
	duG+4OAU5n6YEwMil89WR7SvEQw5Gw4FOC/7gHwDfwHTKgDcaxztnyPH9A64BEDh1VqqnItLj4JrL
	gdTkNy50L5JrPxAEuwl/SpRKSGsyCiHWb3Paa1AY+dO/8JED9bURKoyZeEnTKsw5gfTGhiSHGJc2r
	cTkqBrryK/Mt1qfSgV6QMrafFrlMBhQhwaOUO2yuv/B6CZpAHAcrbQhPaL1V2q1//15LTtOqN6Se1
	0BiLGn+lnFp/jdklod8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzCro-008vr7-1Y
	for ath12k@archiver.kernel.org;
	Wed, 17 May 2023 08:50:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzCrl-008vqT-17
	for ath12k@lists.infradead.org;
	Wed, 17 May 2023 08:50:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BCE1761716;
	Wed, 17 May 2023 08:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13742C433D2;
	Wed, 17 May 2023 08:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684313436;
	bh=6rgrwlaZHojy/RgltgvP3Z7GNEA6aZa/h9uZUuiicpI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=G9WdNhzmNu4MvZ9/FL2lrLu6C/uM6VzFwj0BrXOtJqcT/iQzl+Hg6m3rWtPp7Alg8
	 PMsh5QXpA1ZdvSdXUAcaVYrPT78F95PUhJp8Fm4VHXDm+2vxXUJStyuKQqZJHTbFXa
	 giw6HtyMvSY6vqm/ZrQZOt8PXH+cc9ENmD27BS5elZYdqhCl1foiGxxpv/8Cmih6CY
	 My85DJx2i1ekp8wYuMz/pUI+lHe2459WPMky6jnpMokYD8gRXnO6MB7WCmEZCE4u+X
	 EcDVGfIx4woInDsCULAmnUkEd5Lw65w/+UZR04YYUN9XF3pXWvZZumO/ka6BnRNz5+
	 xqLvzgXdhCR/Q==
From: Kalle Valo <kvalo@kernel.org>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org,  P Praneesh <quic_ppranees@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: Add support to parse new WMI event for 6 GHz regulatory
References: <20230502142018.20301-1-quic_rgnanase@quicinc.com>
Date: Wed, 17 May 2023 11:50:30 +0300
In-Reply-To: <20230502142018.20301-1-quic_rgnanase@quicinc.com> (Ramya
	Gnanasekar's message of "Tue, 2 May 2023 19:50:18 +0530")
Message-ID: <875y8rmje1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_015037_473696_38996AA7 
X-CRM114-Status: GOOD (  20.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Ramya Gnanasekar <quic_rgnanase@quicinc.com> writes:

> From: P Praneesh <quic_ppranees@quicinc.com>
>
> In order to support different power levels of 6 GHz AP and client,
> new WMI event for regulatory (WMI_REG_CHAN_LIST_CC_EXT_EVENTID) has been
> added in firmware to provide new parameters required for 6 GHz regulatory rules.
>
> Firmware advertises its capability of handling new event in WMI service ready
> event. Based on that, host needs to set host_service_flags in WMI init command
> to indicate that host supports processing of this WMI event.
> Based on advertised host capability, firmware sends event (WMI_REG_CHAN_LIST_CC_EXT_EVENTID).
> This new event contains 2G/5G/6G reg rules with additional power value
> fields for 6GHz and regd is built accordingly.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>

I made some changes in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=a483b258992f80c657ed3175293a15cac4acd25d

> @@ -3403,6 +3403,10 @@ int ath12k_wmi_cmd_init(struct ath12k_base *ab)
>  	struct ath12k_wmi_base *wmi_sc = &ab->wmi_ab;
>  	struct ath12k_wmi_init_cmd_arg arg = {};
>  
> +	if (test_bit(WMI_TLV_SERVICE_REG_CC_EXT_EVENT_SUPPORT,
> +		     ab->wmi_ab.svc_map))
> +		arg.res_cfg.is_reg_cc_ext_event_supported = 1;

is_reg_cc_ext_event_supported is bool so I changed this to true.

> +static int ath12k_wmi_tlv_services_parser(struct ath12k_base *ab,
> +					  u16 tag, u16 len,
> +					  const void *ptr,
> +					  void *data)
>  {
> -	const void **tb;
>  	const struct wmi_service_available_event *ev;
> -	int ret;
> +	u32 *wmi_ext2_service_bitmap;
>  	int i, j;
> +	u16 expected_len;
>  
> -	tb = ath12k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
> -	if (IS_ERR(tb)) {
> -		ret = PTR_ERR(tb);
> -		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
> -		return;
> +	expected_len = WMI_SERVICE_SEGMENT_BM_SIZE32 * sizeof(u32);
> +	if (len < expected_len) {
> +		ath12k_warn(ab, "invalid len %d for the tag 0x%x\n",
> +			    len, tag);
> +		return -EINVAL;
>  	}

I changed the warning to be more descriptive.

> -	ev = tb[WMI_TAG_SERVICE_AVAILABLE_EVENT];
> -	if (!ev) {
> -		ath12k_warn(ab, "failed to fetch svc available ev");
> -		kfree(tb);
> -		return;
> -	}
> +	switch (tag) {
> +	case WMI_TAG_SERVICE_AVAILABLE_EVENT:
> +		ev = (struct wmi_service_available_event *)ptr;
> +		for (i = 0, j = WMI_MAX_SERVICE;
> +		     i < WMI_SERVICE_SEGMENT_BM_SIZE32 && j < WMI_MAX_EXT_SERVICE;
> +		     i++) {
> +			do {
> +				if (le32_to_cpu(ev->wmi_service_segment_bitmap[i]) &
> +				    BIT(j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32))
> +					set_bit(j, ab->wmi_ab.svc_map);
> +			} while (++j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32);
> +		}
>  
> -	/* TODO: Use wmi_service_segment_offset information to get the service
> -	 * especially when more services are advertised in multiple service
> -	 * available events.
> -	 */
> -	for (i = 0, j = WMI_MAX_SERVICE;
> -	     i < WMI_SERVICE_SEGMENT_BM_SIZE32 && j < WMI_MAX_EXT_SERVICE;
> -	     i++) {
> -		do {
> -			if (le32_to_cpu(ev->wmi_service_segment_bitmap[i]) &
> -			    BIT(j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32))
> -				set_bit(j, ab->wmi_ab.svc_map);
> -		} while (++j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32);
> +		ath12k_dbg(ab, ATH12K_DBG_WMI,
> +			   "wmi_ext_service_bitmap 0:0x%x, 1:0x%x, 2:0x%x, 3:0x%x",
> +			   ev->wmi_service_segment_bitmap[0],
> +			   ev->wmi_service_segment_bitmap[1],
> +			   ev->wmi_service_segment_bitmap[2],
> +			   ev->wmi_service_segment_bitmap[3]);

I changed the debug messages to the recommended style.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
