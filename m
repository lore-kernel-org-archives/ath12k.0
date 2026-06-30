Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6DBC43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 03:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JP1yIvMClEIEZQ3nb0MKnhMzUYJWGmbEcD39CqyF3do=; b=bxsLPRXGoH7sOryKp4Gz+AWdz9
	wNgWfHtT25h6b8V1pfXDGZmKnQdMSVzzdarSPeI2G3VruhwOp9OO54ryLtVWNP1GwnkBStJ0pP9VH
	bd0vpharMMcPtEPa5zbTYv9drM5hyxAmoxdCrgGl8cXBdhs4p+P+Gzvi+n9McJBZ3h0JziDxKnO3P
	aZITvk67Go1ziEdyRwYo1orUJz+GpWU++nAFRT2IqmIlqnz2kIk6H7aeBZ5ZQJpxIVNHpKr6yaDis
	X04rznl8Eve0kqaj6sRah+mljuXeWKNnpE+wT7O1tvCqqsNAN3jWXKcuLEHaIl6XUbCd9QX98zlhj
	Nhio7wWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wePXC-0000000Fl3K-0hRi;
	Tue, 30 Jun 2026 03:53:18 +0000
Received: from mail.mokrynskyi.com ([65.109.39.229])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wePX9-0000000Fl2z-1Axi
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 03:53:16 +0000
Message-ID: <6f46ab6c-c7c0-4865-a68b-992ace4225d8@mokrynskyi.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mokrynskyi.com;
	s=dkim; t=1782791574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JP1yIvMClEIEZQ3nb0MKnhMzUYJWGmbEcD39CqyF3do=;
	b=GFgO2Yua4LlEM56tU5GMNhM9/2twhuJ9Vafprwd1uQKe+6EbhUMUox3ANODgK5OdYT2SSt
	WQBZzX5V2jk+UVX4HQig39lTMgDiLUV2PKfg3KwHIhnAxe5O+8VGAH+Y42L96+5JEAyqY8
	WPGt/SY8KKpL2GRgNCfw4OW/FkGc000joN/jh0mB1TatzMRUIfEIHSE6jT0LgRkBMyuqY+
	ohlKZNPFwRxgA5crhr6w4THvadRwPm21SgoJap2sDH4EAa90XB540ApoXxp8+1Eo6rUvxS
	eMNBgIX4hiHX/A+7o0qoQ8bH4WcArsp3iJjHAE91mzuD+pxut32HpcXLBv4+RQ==
Authentication-Results: mail.mokrynskyi.com;
	auth=pass smtp.mailfrom=nazar@mokrynskyi.com
Date: Tue, 30 Jun 2026 06:52:54 +0300
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] wifi: ath12k: skip unknown direct buffer ring module
 IDs
From: Nazar Mokrynskyi <nazar@mokrynskyi.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260505172415.566328-1-nazar@mokrynskyi.com>
 <20260505172415.566328-3-nazar@mokrynskyi.com>
 <89f30996-3210-403b-8c9a-52cf6d5fcb51@oss.qualcomm.com>
 <07a1e340-cfdf-4027-861e-8f2a940bd21c@mokrynskyi.com>
Content-Language: en-US, uk, uk-UA
In-Reply-To: <07a1e340-cfdf-4027-861e-8f2a940bd21c@mokrynskyi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ---
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_205315_662219_9D0966C6 
X-CRM114-Status: GOOD (  25.29  )
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

Anything else I can do to help upstream some version of these patches?
I've been running them for another 1.5 months with no issues.

Sincerely, Nazar Mokrynskyi
github.com/nazar-pc

11.05.26 23:10, Nazar Mokrynskyi:
> 11.05.26 22:02, Jeff Johnson:
>> On 5/5/2026 10:24 AM, Nazar Mokrynskyi wrote:
>>> The firmware may advertise direct buffer ring capabilities for module
>>> IDs beyond what the driver currently knows about (WMI_DIRECT_BUF_MAX).
>>> This happens with newer firmware versions that support additional ring
>>> types not yet implemented in the driver.
>> What "newer firmware version" are you using that has this issue?
>>
>> Can you share the "Skipping unknown direct buf ring module id" logs from your
>> modified driver?
> ID is the same as in the original warning:
>
> [   10.611560] ath12k_pci 0000:01:00.0: Invalid module id 2
> [   10.616467] ath12k_pci 0000:01:00.0: failed to parse tlv -22
>
> The firmware according to system logs (all this info is provided in [PATCH 0/2] email):
>
> [    7.688137] ath12k_pci 0000:01:00.0: fw_version 0x160484db fw_build_timestamp 2025-12-09 20:09 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
>
> This is running on OpenWRT 25.12, which uses 6.12.74 kernel with modules backported from 6.18.7 kernel:
> [    0.000000] Linux version 6.12.74 (builder@buildhost) (x86_64-openwrt-linux-musl-gcc (OpenWrt GCC 14.3.0 r32802-f505120278) 14.3.0, GNU ld (GNU Binutils) 2.44) #0 SMP Wed Mar 25 20:09:53 2026
> [    6.997293] Loading modules backported from Linux version v6.18.7-0-g5dfbc5357
> [    6.999210] Backport generated by backports.git c8a37ce
>
>>> The current code treats an unknown module_id as a fatal error, returning
>>> -EINVAL and tearing down the entire driver initialization. This is
>>> incorrect: the driver only needs to set up rings for types it uses
>>> (SPECTRAL=0, CFR=1) and can safely ignore capability advertisements for
>>> unknown types.
>>>
>>> Change the unknown module_id handling to skip the entry with a debug
>>> message rather than failing, allowing initialization to proceed.
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Nazar Mokrynskyi <nazar@mokrynskyi.com>
>>> ---
>>>  drivers/net/wireless/ath/ath12k/wmi.c | 12 ++++--------
>>>  1 file changed, 4 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
>>> index 484fdd3b1..0e776a8d8 100644
>>> --- a/drivers/net/wireless/ath/ath12k/wmi.c
>>> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
>>> @@ -4814,10 +4814,10 @@ static int ath12k_wmi_dma_ring_caps(struct ath12k_base *ab,
>>>  	dir_buff_caps = ab->db_caps;
>>>  	for (i = 0; i < dma_caps_parse->n_dma_ring_caps; i++) {
>>>  		if (le32_to_cpu(dma_caps[i].module_id) >= WMI_DIRECT_BUF_MAX) {
>>> -			ath12k_warn(ab, "Invalid module id %d\n",
>>> -				    le32_to_cpu(dma_caps[i].module_id));
>>> -			ret = -EINVAL;
>>> -			goto free_dir_buff;
>>> +			ath12k_dbg(ab, ATH12K_DBG_WMI,
>>> +				   "Skipping unknown direct buf ring module id %d\n",
>>> +				   le32_to_cpu(dma_caps[i].module_id));
>>> +			continue;
>> by continuing you don't populate the dir_buff_caps[i] information below,
>> leaving that record with zeroed data from the initial allocation. Does other
>> code correctly handle that?
>>
>> would it be better to have a separate count of the number of dir_buff_caps
>> records that are actually filled, and then update
>> dma_caps_parse->n_dma_ring_caps to match once the parsing has completed?
> I'm very far from kernel development, let alone ath12k driver specifically.
> The patch is provided to better showcase the problems I had.
> If there is a better way to address it, I'd really appreciate if someone more knowledgeable could take over, I just hope this is helpful.
>
> With these changes QCN9274 runs an access point with over 3 weeks uptime as of right now.
> That is not necessary the proof of anything, but it does seem to work in practice so far.
>>>  		}
>>>  
>>>  		dir_buff_caps[i].id = le32_to_cpu(dma_caps[i].module_id);
>>> @@ -4829,10 +4829,6 @@ static int ath12k_wmi_dma_ring_caps(struct ath12k_base *ab,
>>>  	}
>>>  
>>>  	return 0;
>>> -
>>> -free_dir_buff:
>>> -	ath12k_wmi_free_dbring_caps(ab);
>>> -	return ret;
>>>  }
>>>  
>>>  static void

