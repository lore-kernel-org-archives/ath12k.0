Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E3CD69104
	for <ath12k@archiver.kernel.org>; Thu, 28 Nov 2024 12:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgmEMeLMG2aZJ4AfTFTPDPGYzzDKKRqWAeNFdqnuNLg=; b=Bc/z0SPVJXZCYhiulhk1IbhEvO
	hi0nLEz/sImx/AW4nYIFZ7v7MTYToR0GQm9QN9BkeqD4xFNYv5X6Oxqa3FA9NebDyFrCY3rJZK7tS
	J9gR/0FSIg4Bbj6A3SpVkR7VZ4ghXbTODnY3uuOWMDORAUL6Zoej90lUoawZSXRK95sG2F9FrtC4E
	lRb3qwsX4VAXPknHJtj+clGUlUPm7/yXG37TOOHrIdOVxH+wctekXOv6m/QSS0nokSCvr33kTIVZH
	eLZpMcahtBv7ahLFKt8ZtgffFnAUNmTpmOsWdGbJwBT/7JsYAp8+hc8Fu+8LTkMO289q0YWbfsoq8
	1PeFCvmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdj5-0000000FV3a-2i9B
	for ath12k@archiver.kernel.org;
	Thu, 28 Nov 2024 12:34:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdj3-0000000FV2E-0XpR
	for ath12k@lists.infradead.org;
	Thu, 28 Nov 2024 12:34:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47AA05C53F1;
	Thu, 28 Nov 2024 12:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836D0C4CED3;
	Thu, 28 Nov 2024 12:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732797268;
	bh=7/2hs8AYAHMb0J5u/xgcDIRS+q0MfawTUy4a/6t6x9w=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Z5enbyc/yeZptP87dza6mlfkGlqRtbuCZeblkRrAFx14MmEEkhdV6+4aIZtfpCALz
	 PPCzOdzj09dxdzLnTazpy+Vi2/ANjtmIFvX8JVAqkpVY06Edw5KtV7i9sKaUHY6TjZ
	 ldtGzjsJH4yRGtlZ4Y84bRCPheQqai9k5U1FeIbz7I6kgTiwL6l1pmowVBu27jBW+f
	 pJwzTLLXgpYeiQQ+29GtIOR9RJVxJKqqeeFalXTAYN54F8WtXDc8WYzIKj2/0Ie4c9
	 /gRLzrT5S27itW52P+vmfwIZu9PsRQHgBKh7xyw8aySKs9D2mBihJplkrRZsuUFnMC
	 A4ZMAtUAM7eMQ==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 06/10] wifi: ath12k: do not return invalid link id for
 scan link
References: <20241126171139.2350704-1-kvalo@kernel.org>
	<20241126171139.2350704-7-kvalo@kernel.org>
	<abf0db61-326d-4b06-8ced-66d5f96d8dc0@quicinc.com>
Date: Thu, 28 Nov 2024 14:34:25 +0200
In-Reply-To: <abf0db61-326d-4b06-8ced-66d5f96d8dc0@quicinc.com> (Baochen
	Qiang's message of "Wed, 27 Nov 2024 11:06:23 +0800")
Message-ID: <87plmfv8oe.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_043429_205774_611AF4E4 
X-CRM114-Status: GOOD (  11.22  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> On 11/27/2024 1:11 AM, Kalle Valo wrote:
>> From: Sriram R <quic_srirrama@quicinc.com>
>> 
>> @@ -4317,14 +4327,14 @@ static void ath12k_mac_op_cancel_hw_scan(struct ieee80211_hw *hw,
>>  					 struct ieee80211_vif *vif)
>>  {
>>  	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
>> +	u16 link_id = ahvif->last_scan_link;
>>  	struct ath12k_link_vif *arvif;
>>  	struct ath12k *ar;
>>  
>>  	lockdep_assert_wiphy(hw->wiphy);
>>  
>> -	arvif = &ahvif->deflink;
>> -
>> -	if (!arvif->is_created)
>> +	arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
>> +	if (!arvif || arvif->is_created)
>
> s/arvif->is_created/!arvif->is_created/ ?

Another good catch! Fixed now.

>> @@ -7990,6 +8011,19 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
>>  	if (!ar)
>>  		return NULL;
>>  
>> +	/* cleanup the scan vdev if we are done scan on that ar
>> +	 * and now we want to create for actual usage.
>> +	 */
>> +	if (vif->valid_links) {
>
> better to use ieee80211_vif_is_mld()?

Yup, fixed in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=54504518cb26fef3dbaf16457cde91a9fd7e9c3d

Thanks for the detailed review, very much appreciated.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

