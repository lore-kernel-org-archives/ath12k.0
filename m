Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB17E6F060
	for <ath12k@archiver.kernel.org>; Fri,  1 Nov 2024 14:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFBzUozcQdmw+Q5VUxiC2stbwXEae7rLRYh1w3A2XTo=; b=1jUirSZch9mQWUKXvYJZ8YFXoi
	NZlmraPzNhCDV10AiwIHBfdWl5B1PUDXvZcAPGtuqmZY/qeP9fqtU2diux3nPcpvtZHrP/xsPOhZL
	runUGWXIQBb5LYDL2iwFEpKKM7qiqsIfhVe6g16yrHyvktdVO1n5PRrPSQ30U0WJgHnpyJ+xR0fFF
	N3mpTFY6IHyM3uePtZOykxGkV5b+euHGtM7kZ8OdQID3/othJlvYHkXWM4ui5nImjO9L+J2ujeFL0
	xFKirHLVWeDQT1JcGnoZCGTw1JtPsfz+4ANovKAAMMUD4UzDDGl3P1E/aq/I0iqPg0iQRzMzNThWv
	Okz/ZMNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sbl-00000007KjP-06Jn
	for ath12k@archiver.kernel.org;
	Fri, 01 Nov 2024 14:26:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sI1-00000007H0E-2w70
	for ath12k@lists.infradead.org;
	Fri, 01 Nov 2024 14:06:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F3C58A44191;
	Fri,  1 Nov 2024 14:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756B5C4CECD;
	Fri,  1 Nov 2024 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730469972;
	bh=hw08P6c0qMmSDif5XWYSxDZ+sFwdJtpv8E3VGa2FsFw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nhZy/pzMEIYHMDYS6TZg9AEupTSrkrWgLoOdT8/SDEN3sz9s2+yYVY35zqjidsW2Q
	 jSZTEgEUkiFAcl8Wa5EtHkehM6v4EfA6Ydfx23aE2QXHEcfYuwbfD0kKB2pS6prWQT
	 oHi3FucEyG5aTQ4+R1gDwnHAzZyMfBiYOVEBsQhlPmP8NQgSkPxC3k3dRfB33fad3+
	 A65165KIxbQyPXIW0BVwA101HLktzFf+X1zGm5Ow9an+oHRcXA62HqZeEYEaLQv/VS
	 2ul8TCw0TLwH8gfmN0Zemvu3J+lt2PVFcXFShtlCTQsgX/oaM8OtpF3Gi9HwtmpSE1
	 j12dqja2q4a2Q==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 6/8] wifi: ath12k: add multi-link flag in peer create
 command
References: <20241023133004.2253830-1-kvalo@kernel.org>
	<20241023133004.2253830-7-kvalo@kernel.org>
	<f8049c99-c7ac-410c-84fd-ac844041f34c@quicinc.com>
	<87wmhqgb0r.fsf@kernel.org>
	<8d4aca1d-e48d-48e2-bacf-fdfe49c8e212@quicinc.com>
Date: Fri, 01 Nov 2024 16:06:09 +0200
In-Reply-To: <8d4aca1d-e48d-48e2-bacf-fdfe49c8e212@quicinc.com> (Jeff
	Johnson's message of "Tue, 29 Oct 2024 09:01:17 -0700")
Message-ID: <87h68r6oby.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_070613_829493_54D98F89 
X-CRM114-Status: GOOD (  16.00  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 10/29/2024 8:54 AM, Kalle Valo wrote:
>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>> 
>>>> @@ -1244,9 +1249,23 @@ int ath12k_wmi_send_peer_create_cmd(struct ath12k *ar,
>>>>  	cmd->peer_type = cpu_to_le32(arg->peer_type);
>>>>  	cmd->vdev_id = cpu_to_le32(arg->vdev_id);
>>>>  
>>>> +	ptr = skb->data + sizeof(*cmd);
>>>> +	tlv = ptr;
>>>> +	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_STRUCT,
>>>> +					 sizeof(*ml_param));
>>>
>>> using the same TLV size both here and for the TLV that follows doesn't seem
>>> logical. is this missing + TLV_HDR_SIZE to account for its own TLV header?

So I assume you are referring to this:

	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_STRUCT,
					 sizeof(*ml_param));
	ptr += TLV_HDR_SIZE;
	ml_param = ptr;
	ml_param->tlv_header =
			ath12k_wmi_tlv_cmd_hdr(WMI_TAG_MLO_PEER_CREATE_PARAMS,
					       sizeof(*ml_param));

I have never figured out how WMI_TAG_ARRAY_STRUCT is supposed to work
but I see a similar pattern also in ath12k_wmi_wow_add_pattern(). Any
ideas?

>>>> +	ptr += TLV_HDR_SIZE;
>>>> +	ml_param = ptr;
>>>> +	ml_param->tlv_header =
>>>> +			ath12k_wmi_tlv_cmd_hdr(WMI_TAG_MLO_PEER_CREATE_PARAMS,
>>>> +					       sizeof(*ml_param));
>> 
>> But did you notice that here is used ath12k_wmi_tlv_cmd_hdr() and it
>> reduces the header size:
>> 
>> static __le32 ath12k_wmi_tlv_cmd_hdr(u32 cmd, u32 len)
>> {
>> 	return ath12k_wmi_tlv_hdr(cmd, len - TLV_HDR_SIZE);
>> }
>> 
>
> Yes, I missed that since that is evil to use the _cmd_ TLV function on
> something that isn't the command TLV.

Ok, so you are saying that we should have a identical function but with
name ath12k_wmi_tlv_param_hdr() or similar? That makes sense but I think
that's separate cleanup as ath12k_wmi_tlv_cmd_hdr() is already used with
several WMI params, like in ath12k_wmi_wow_add_pattern().

> Please fix to use the standard function and subtract the thv header size from
> the length param

I'm not a fan of manually subtracting lengths, as then it's easy to miss
something. I would prefer to have functions for handling the length
calculation, like ath12k_wmi_tlv_cmd_hdr() ath12k_wmi_tlv_param_hdr().

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

