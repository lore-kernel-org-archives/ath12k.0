Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB578C4345F
	for <ath12k@archiver.kernel.org>; Fri, 26 Apr 2024 07:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ugDEdjbF5o9GKH7g2bqMspcfcYi/pY4+2Ul5kvV9nI=; b=HihD+doNRXoA/WnXE6v+AJXfId
	lPvhj+icn9xlhK2ryzDtu1aWjqvqjx8ouMbkYoRYcEIaXnYesj+za7pEFbYVduqnI2oJpKcvPH4zR
	ML25v3C2piZHa0W3KT5tswZN7eTUF5yqJAEuAMVLaCtHcD1xrDIHoV89Ni0iRIe0Rgq7XCdGE9OQz
	hxldQO/TfObnmsxSiQOImUE0zxa5K7k0iar/tmx0R/xJBv57IBrItoqOl1Y0z+CdhCUHWBTH1BHIM
	3CEAIm1HQUhCpqEz1/7qQZtm5EPkUWJgzfhV8lUAj1egV0pTHagKe4DZPx7oFLC/hna3XhdqHtZ2r
	ApQGAtQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0G3R-0000000BTKQ-1tHo
	for ath12k@archiver.kernel.org;
	Fri, 26 Apr 2024 07:31:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0G3O-0000000BTIO-0U7t
	for ath12k@lists.infradead.org;
	Fri, 26 Apr 2024 07:31:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 18290CE1B73;
	Fri, 26 Apr 2024 07:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB3BC113CD;
	Fri, 26 Apr 2024 07:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714116687;
	bh=isyzkTMFUUfUJHWC2RVAZbtuOQi2dD5iTcTS2iLN7cE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=XY5QuWkcV44TfgMONSLttEq/z7XK6MbVSxZLSX5ziO04TfvnJ9us4QUHwmdKGyjBJ
	 63LRljRq6iW+az1xZnNE+cAJgUENNjV8REkhrX39v2LHxAdZqr9JRfdVlQBT7EMhm1
	 Lujg54U44l86GAkR9MRhXPAa9u3ZkB4f32mGau+1j7qJk/y7KoQ4C1yNPkP2RpiBp8
	 0+3jeYWKzIsYLSdsuJGVsV32vF5J9gGqhrINaOH/tbAcbuuIfwCusuMt7xctBAZAH3
	 L2NZSZ65AJcNZc5CcXJDeZ8IdJXS1kzcBbKqI1Za9vPa9jYY+eDF+2xX+P932IbX5V
	 dsWk//oX0ovWA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Muna
 Sinada <quic_msinada@quicinc.com>
Subject: Re: [PATCH v3 07/10] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
References: <20240424201959.935-1-quic_pradeepc@quicinc.com>
	<20240424201959.935-8-quic_pradeepc@quicinc.com>
	<72bc6772-8bf7-427d-8f03-01e8dbf30d0c@quicinc.com>
Date: Fri, 26 Apr 2024 10:31:24 +0300
In-Reply-To: <72bc6772-8bf7-427d-8f03-01e8dbf30d0c@quicinc.com> (Jeff
	Johnson's message of "Thu, 25 Apr 2024 15:32:14 -0700")
Message-ID: <87y190fulv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_003130_627150_CE5A786F 
X-CRM114-Status: GOOD (  11.59  )
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

> On 4/24/2024 1:19 PM, Pradeep Kumar Chitrapu wrote:
>> Add support to set fixed HE rate/GI/LTF values using nl80211.
>> Reuse parts of the existing code path already used for HT/VHT
>> to implement the new helpers symmetrically, similar to how
>> HT/VHT is handled.
>> 
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> 
>> Co-developed-by: Muna Sinada <quic_msinada@quicinc.com>
>> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
>> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
>> ---
>
> [...]
>
>> @@ -7753,7 +8034,20 @@ ath12k_mac_bitrate_mask_get_single_nss(struct ath12k *ar,
>>  			return false;
>>  	}
>>  
>> -	if (ht_nss_mask != vht_nss_mask)
>> +	he_mcs_map = le16_to_cpu(ath12k_mac_get_tx_mcs_map(&sband->iftype_data->he_cap));
>
> drivers/net/wireless/ath/ath12k/mac.c:8041:22: warning: incorrect type in argument 1 (different address spaces)
> drivers/net/wireless/ath/ath12k/mac.c:8041:22:    expected struct ieee80211_sta_he_cap const *he_cap
> drivers/net/wireless/ath/ath12k/mac.c:8041:22:    got struct ieee80211_sta_he_cap const [noderef] __iftype_data *

ALWAYS run ath12k-check, we wrote the tool for a reason. Skipping these
tests is disrespect for maintainers' time and a great way to get your
patches to the bottom of the queue.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

