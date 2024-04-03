Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F96CD128A
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 14:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qH7aIEB6qT6QNNLmKCyjcmOQNMcsaO3lZbdp9yMawN4=; b=cdsNMWJ6ozTMscKV5z3Gl8TBtT
	WVnOgE0SSoUM4P85j2NlIvHl3DbToLa0WgRR1IWH51wpaZeN1UoesBrLR4bApgzjw/khEgFPjKqzT
	kiteb7LyCFHOJqha6VmRgj8I9ogcbAlsHZpQugjs3PfHgvEsbLeQb4poSUBK5AcVwNVA7sCd6n2zA
	dvunoakzcoBDN0tJLx48+yXhsUQkLZIZbULqAynxP9VlUthDlzOaqq+Qqym7KW8K/lm++KJhHf7Gu
	y96d0DEePB5JVMyRLuiIpzAKrUJQzsYnBuL+foNaXBOl9o/m4GNbg1Gxr9sqNWq9Em59jks2TSDdI
	bDsUrM6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs19o-0000000GLEA-0D84
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 14:00:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs19j-0000000GLD8-1Wuk
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 14:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A94F861458;
	Wed,  3 Apr 2024 13:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EAB6C433F1;
	Wed,  3 Apr 2024 13:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712152798;
	bh=xWOoflujjPGS0Ej1CAyXYZlgQxQGJxVb6eX5fIZF1SY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VItlUmjoFbS3y/XeTK3D42AekqiqqY1poxrXawEqaA+jtI/pFcpy5qyZ7FoELKmMf
	 +4PJGBj+39OgalEVoJqZx0q2FcByEfg2ehib2Yd5T50i8ysiFU/+2a1a9W6KLb9AOh
	 hPAWZDY1L+i5z6bkAXd0byx+GgflmUszU9vnNQ5mJ9MBd95zxB1dhL5SQpOQBsORFm
	 kPFzolqHzOQVLsiRNJjxb4CoypsR6n6BQ4GW3DbeOc7F3NPiFo/Hsvuk/brXcYnT3x
	 2aJoqEktCAtGNxoMkt+e0hfoypGHuh34dhnSLZ2JrSBBEE8EsAvoNF7Xs9ukaufuzc
	 jBye5ze7Zd7TA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/2] wifi: ath12k: extend the link capable flag
References: <20240329012358.2242354-1-quic_periyasa@quicinc.com>
	<20240329012358.2242354-2-quic_periyasa@quicinc.com>
	<f17ab010-5874-495a-8bd8-3e18e85cc327@quicinc.com>
	<ebeb7fa3-f0d1-230a-80bc-0877fdab7e62@quicinc.com>
	<6dac32c7-a2b2-4ac3-9c1f-b02f612ee3ef@quicinc.com>
Date: Wed, 03 Apr 2024 16:59:55 +0300
In-Reply-To: <6dac32c7-a2b2-4ac3-9c1f-b02f612ee3ef@quicinc.com> (Jeff
	Johnson's message of "Tue, 2 Apr 2024 10:41:53 -0700")
Message-ID: <877che5yxw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_065959_607340_A90B9859 
X-CRM114-Status: GOOD (  15.30  )
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

> On 4/2/2024 2:32 AM, Karthikeyan Periyasamy wrote:
>
>> 
>> 
>> On 4/1/2024 10:24 PM, Jeff Johnson wrote:
>>> On 3/28/2024 6:23 PM, Karthikeyan Periyasamy wrote:
>>>> Link capability categorized as Single Link Operation (SLO) and Multi Link
>>>> Operation (MLO).
>>>>
>>>> 	* Intra-chip SLO/MLO refers to links present within a chip
>>>> 	* Inter-chip SLO/MLO refers to links present across multiple chips
>>>
>>> Is "chip" the correct term?
>>>
>>> I'm thinking that this should be called "device" since that is the unit of
>>> hardware that is detected by a bus probe function and which is handled by a
>>> *device* driver.
>>>
>>> Doesn't this make more sense if the references to chip and SoC are changed to
>>> device?
>>>
>> 
>> In the QMI, SLO/MLO parameter exposed as chip only not device. So 
>> followed the same terminology to avoid confusion for code readability.
>> 
>> struct wlfw_host_mlo_chip_info_s_v01 {
>>          u8 chip_id;
>>          u8 num_local_links;
>>          u8 hw_link_id[QMI_WLFW_MAX_NUM_MLO_LINKS_PER_CHIP_V01];
>>          u8 valid_mlo_link_id[QMI_WLFW_MAX_NUM_MLO_LINKS_PER_CHIP_V01];
>> };
>> 
>> struct qmi_wlanfw_host_cap_req_msg_v01 {
>> 
>> ...
>> 
>> u8 mlo_num_chips;
>> 
>> u8 mlo_chip_info_valid;
>> 
>> struct wlfw_host_mlo_chip_info_s_v01 
>> mlo_chip_info[QMI_WLFW_MAX_NUM_MLO_CHIPS_V01];
>> 
>> ...
>> 
>> }
>> 
>
> Please don't let firmware interface naming drive host driver code naming.
> And push back on the firmware team when they've introduced poor naming.
>
> As many Software Engineering experts stress, naming is probably the single
> most important thing we do. So we need to make sure we are using the correct
> names for all of the software objects that comprise the driver, especially
> with this multi-device MLO feature where we now have to represent a multitude
> of individual devices as a single logical wiphy.
>
> Lack of a single common term for each object in the architecture makes the
> code far less maintainable.

Amen to that. I think we should come up with a terminology list or
something, otherwise it's hard to keep up with all teams having their
own terminology.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

