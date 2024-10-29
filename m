Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A437ED3A676
	for <ath12k@archiver.kernel.org>; Tue, 29 Oct 2024 17:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbcRvxqRlmVm30rB29wqvU/EwVDwk6eOL73vTI5oeUY=; b=VOe3amJzwTdDaGmP2zQnQ41Q6N
	Fu7CDmn3dMAe82wQoAdXm4DKLvCH4lxnQdgjWkrmawuK0QWyP7o7M98h5RugFtOtuRUPrccYKVo0s
	+UqhvgeHjKt2Xfa81qusDc8fZPWXmFBeWZmkRkzPXQ4kDaN3L7UZaZT0ulUn7/3keiOj9pYzpMtP9
	gGbFH9Wo7PE6ThIa4gjQ4flrsnzs8atbDifLGjJn3Q4aZnw1t8tQfgYSLl2TOFJOmLznD4+5la3qF
	zbTW/6pu0RP426V8YDqjEhi4UHLHVzlxBCfGPgUWnoeRuvN2ZVjcHtu+TudGjFP1qVKd5ebNP5SPL
	ZO5sU3gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5q9S-0000000FIqt-3q7G
	for ath12k@archiver.kernel.org;
	Tue, 29 Oct 2024 17:37:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oj6-0000000F3ik-3K8k
	for ath12k@lists.infradead.org;
	Tue, 29 Oct 2024 16:05:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B4247A42E4C;
	Tue, 29 Oct 2024 16:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7588AC4CECD;
	Tue, 29 Oct 2024 16:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730217947;
	bh=XL2+U+EzgMjaP48cjHi1XHjDe4cfV6tfigF6VPzXcxQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=MWaiNAShUDKh4Z+qpU1IS8mMXXbSuv+9YVPptx6qPX2aohxSqTOt/oM3VNd2GKnz1
	 G+g4OOCaNTbjTINxYplv7QRC4HoELDnVn1N3iDW7YbieAgnIBCSiHyBpFuQI9nFBor
	 ikOYfMqpsSTDzBpQk2C0rlQz4Iu4lknMQMTAReqM7sIt6fZJS000CnNz8yTl42F/Qf
	 K1K6hzaSt5t9leVMq2MVvVK5ADw5WKjG8dPFu9PckG6f0xecLCEK3ExMF9g6Qd5IuH
	 +Wx3HTaqTVSgLS26eajMIJfmEQinZvs6PpELJaPZqsqvYyO+ERiY+4NQdvZq8PBKo9
	 mjXij+Yjj47nQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 8/8] wifi: ath12k: Add MLO peer assoc command support
References: <20241023133004.2253830-1-kvalo@kernel.org>
	<20241023133004.2253830-9-kvalo@kernel.org>
	<cb386a9b-2290-4640-8f08-7834cf4e79df@quicinc.com>
Date: Tue, 29 Oct 2024 18:05:44 +0200
In-Reply-To: <cb386a9b-2290-4640-8f08-7834cf4e79df@quicinc.com> (Jeff
	Johnson's message of "Wed, 23 Oct 2024 09:10:09 -0700")
Message-ID: <87o732gahz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_090548_920004_09806E1B 
X-CRM114-Status: GOOD (  14.01  )
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

> On 10/23/2024 6:30 AM, Kalle Valo wrote:
>
>> +	rcu_read_lock();
>> +
>> +	i = 0;
>
> nit: setting i=0 doesn't need to be RCU protected

Yeah, but that doesn't cause any issues and this way it's closer to the
for loop where it's used:

>> +	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
>> +		if (i >= ATH12K_WMI_MLO_MAX_LINKS)
>> +			break;

[...]

>> @@ -2243,12 +2251,38 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
>>  		ptr += sizeof(*he_mcs);
>>  	}
>>  
>> -	/* MLO header tag with 0 length */
>> -	len = 0;
>>  	tlv = ptr;
>> +	len = arg->ml.enabled ? sizeof(*ml_params) : 0;
>>  	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_STRUCT, len);
>>  	ptr += TLV_HDR_SIZE;
>> +	if (!len)
>> +		goto skip_ml_params;
>>  
>> +	ml_params = ptr;
>> +	ml_params->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_MLO_PEER_ASSOC_PARAMS,
>> +						       len);
>
> this is another instance where we are using the same length for two
> consecutive TLVs -- that doesn't seem right

This is also a similar case of _hdr() vs _cmd_hdr(), does that look ok?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

