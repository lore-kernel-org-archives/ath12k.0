Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36202C6FA82
	for <ath12k@archiver.kernel.org>; Tue, 13 Sep 2022 04:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uo9F/V/UX9Lyo2X+dTN8uyCM6LMQlFtSbbd1EaVgATo=; b=CVLmxXOM3iscv+
	Le3lQRDEcUYblz/g6N5IngIsSffWAJ8kXNIRCjmqAjkL0hWeXQNswLgzW3MSCdmScCDIfngPTv022
	FB5B0TFKSdrgMO9u5TuDp08JizkcCQeq1TaAXOM0M4JyNfdqEQvdV1626p2HI9SM2Yr4BXhlWyza2
	9CCcNKBw+K+2uyQ4Zt1sJxUZ+KitwgIGnxhNgL55Mo7CPiEJ5UcgzDOEuv3za9bUkFpKfIA3L5NZH
	QuI8wrCnozRM4Gym52HE/eJcdbKN2RA5Nk7J9B3B9xfKvMBUa/13qR8kbMSHHIrnzQJq7iGNVcCT8
	de/a2PIh47gciypUW0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXxh0-001mHp-FB
	for ath12k@archiver.kernel.org; Tue, 13 Sep 2022 04:38:38 +0000
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXxXI-001cBV-1R
	for ath12k@lists.infradead.org; Tue, 13 Sep 2022 04:28:38 +0000
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 28D4RwlsE000319, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 28D4RwlsE000319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Tue, 13 Sep 2022 12:27:58 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 12:28:19 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 13 Sep 2022 12:28:18 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::402d:f52e:eaf0:28a2]) by
 RTEXMBS04.realtek.com.tw ([fe80::402d:f52e:eaf0:28a2%5]) with mapi id
 15.01.2375.007; Tue, 13 Sep 2022 12:28:18 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Kalle Valo <kvalo@kernel.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: [PATCH 03/50] wifi: ath12k: add ce.c
Thread-Topic: [PATCH 03/50] wifi: ath12k: add ce.c
Thread-Index: AQHYrmYIMsrBvw/I+06ltzv97HuLo63c8W6Q
Date: Tue, 13 Sep 2022 04:28:18 +0000
Message-ID: <3634f14f162a4a9fb9c1c89647b9a29d@realtek.com>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-4-kvalo@kernel.org>
In-Reply-To: <20220812161003.27279-4-kvalo@kernel.org>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.69.188]
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2022/9/12_=3F=3F_11:33:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_212836_290355_E092801D 
X-CRM114-Status: GOOD (  16.71  )
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


> -----Original Message-----
> From: Kalle Valo <kvalo@kernel.org>
> Sent: Saturday, August 13, 2022 12:09 AM
> To: linux-wireless@vger.kernel.org
> Cc: ath12k@lists.infradead.org
> Subject: [PATCH 03/50] wifi: ath12k: add ce.c
> 
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> (Patches split into one patch per file for easier review, but the final
> commit will be one big patch. See the cover letter for more info.)
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/ce.c | 971 +++++++++++++++++++++++++++++++++++
>  1 file changed, 971 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
> new file mode 100644
> index 000000000000..5694eef37232
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath12k/ce.c

[...]

> +
> +static int ath12k_ce_rx_buf_enqueue_pipe(struct ath12k_ce_pipe *pipe,
> +					 struct sk_buff *skb, dma_addr_t paddr)
> +{
> +	struct ath12k_base *ab = pipe->ab;
> +	struct ath12k_ce_ring *ring = pipe->dest_ring;
> +	struct hal_srng *srng;
> +	unsigned int write_index;
> +	unsigned int nentries_mask = ring->nentries_mask;
> +	struct hal_ce_srng_dest_desc *desc;
> +	int ret;
> +

[...]

> +
> +	ring->skb[write_index] = skb;
> +	write_index = CE_RING_IDX_INCR(nentries_mask, write_index);
> +	ring->write_index = write_index;
> +
> +	pipe->rx_buf_needed--;
> +
> +	ret = 0;

nit.
I think '= 0' can be initializer like other functions.

> +exit:
> +	ath12k_hal_srng_access_end(ab, srng);
> +
> +	spin_unlock_bh(&srng->lock);
> +
> +	return ret;
> +}
> +
> +static int ath12k_ce_rx_post_pipe(struct ath12k_ce_pipe *pipe)
> +{

[...]

> +
> +		ATH12K_SKB_RXCB(skb)->paddr = paddr;
> +
> +		ret = ath12k_ce_rx_buf_enqueue_pipe(pipe, skb, paddr);
> +

nit.
this blank line can be removed.

> +		if (ret) {
> +			ath12k_warn(ab, "failed to enqueue rx buf: %d\n", ret);
> +			dma_unmap_single(ab->dev, paddr,
> +					 skb->len + skb_tailroom(skb),
> +					 DMA_FROM_DEVICE);
> +			dev_kfree_skb_any(skb);
> +			goto exit;
> +		}
> +	}
> +
> +exit:
> +	spin_unlock_bh(&ab->ce.ce_lock);
> +	return ret;
> +}
> +

[...]

> +
> +int ath12k_ce_send(struct ath12k_base *ab, struct sk_buff *skb, u8 pipe_id,
> +		   u16 transfer_id)
> +{

[...]

> +
> +	ath12k_hal_srng_access_end(ab, srng);
> +
> +	spin_unlock_bh(&srng->lock);
> +
> +	spin_unlock_bh(&ab->ce.ce_lock);

Two unlock are duplicate of err_unlock. I think they can be merged to a single
copy to reduce maintain effort. If my opinion is accepted, maybe rename
err_unlock to out_unlock because it becomes a normal flow.

> +
> +	return 0;
> +
> +err_unlock:
> +	spin_unlock_bh(&srng->lock);
> +
> +	spin_unlock_bh(&ab->ce.ce_lock);
> +
> +	return ret;
> +}
> +

These opinions are not very important. Just for reference.

Ping-Ke


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
