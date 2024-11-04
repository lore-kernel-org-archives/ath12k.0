Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93434D132AF
	for <ath12k@archiver.kernel.org>; Mon,  4 Nov 2024 11:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSxBgqPfpQjkN7O+XPeJLGUaI9KDl+dMTh+g5rY3PqI=; b=4jbNC2EFnNHdW5nFDK5vNEbf1O
	OdXAyHS++ItBi38v7DluYeuQE5E9lvgIGy7pCSx0S4YQ/tEeFk8c7oov/Zo95a1mP0BAi0mYNgkwT
	jayYlzLZi3GoKp6ENBzDzWAmQY0CV5pZWJ8YIDs+V8a6hTIvfWB+sRcnV5VqBzNj2yUiS0yS8cRIw
	1N/iVQ6ZWtPs87udgQiTK27z1AgoyaQ/o0PIwZDgS5uY0i8DgO4ixMi4qo9CYvvP4IC7kUc48BQQF
	yQZZyVd6PzrU2LpY1ZD9s0+30Pk3K7PNi9mC9FAfkuE2epuxJIhyP2ZtFDBWOdS5zZbGayg7/TPx1
	revMVlgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vC7-0000000DV9k-1FS9
	for ath12k@archiver.kernel.org;
	Mon, 04 Nov 2024 11:24:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7v1u-0000000DSQZ-0Fyg
	for ath12k@lists.infradead.org;
	Mon, 04 Nov 2024 11:13:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 72A37A42D6F;
	Mon,  4 Nov 2024 11:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB56C4CECE;
	Mon,  4 Nov 2024 11:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730718832;
	bh=X9Es2YNbaqU6K64HSrwfnFwfae6RM4V8eJVc5Imb+DI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=aAEsJC+4lnHKbqlEpohYUwFCxUQk+VHwRzxM/glkoGCJoOuM12qSB94A7w7KyfRf8
	 Ifsp10ok8E3WeM+MTjyNe9DW1X6duAEABzIbGZEXrg8SU12uMBrkwZEqgiTiEUfXqu
	 DEd7V7XhyDU3IJy4+QR/Pooh0Q5SmjC20nmObRJRaqxF8/3ekLj40T1yBOYLZ9Eks0
	 5/a5TwMAVVFJ6+X++CTnYBZALIwP9kheUjrq+WbXsMM5U8zUy//SJUfAXxLfVVINkX
	 3ZYKPOesthI58+vNUb1/2HKmDfnot68ZIGaucg5Gb7fbvPgASBJb3eUB1X3FtdMUa4
	 1bTnvHVq2Mftg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 0/8] wifi: ath12k: MLO support part 2
References: <20241101151705.165987-1-kvalo@kernel.org>
	<935b7f88-a48f-48b5-9e5b-b333cafec25f@quicinc.com>
Date: Mon, 04 Nov 2024 13:13:49 +0200
In-Reply-To: <935b7f88-a48f-48b5-9e5b-b333cafec25f@quicinc.com> (Jeff
	Johnson's message of "Fri, 1 Nov 2024 09:51:59 -0700")
Message-ID: <87ttcn6yky.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_031354_265034_7E0E75AE 
X-CRM114-Status: GOOD (  16.68  )
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

> On 11/1/2024 8:16 AM, Kalle Valo wrote:
>
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>> 
>> Here we continue to refactor mac.c to support multiple links and extend peer
>> assoc WMI command to support MLO.
>> 
>> Please review.
>> 
>> v2:
>> 
>> * patch 1: use err_vdev_del
>> 
>> * patch 2: ath12k_mac_mlo_get_vdev_args(): switch
>> wiphy_dereference()
>> 
>> * patch 2: use struct ath12k_wmi_mac_addr_params instead adding struct wmi_mac_addr
>> 
>> * patch 3: ath12k_mac_station_post_remove(): assign
>> ahsta->links_map before rcu_assign_pointer()
>> 
>> * patch 3: ath12k_mac_station_unauthorize(): fi* confusing comment about __sta_info_destroy_part2()
>> 
>> * patch 4: debugfs.c: copyright year
>> 
>> * patch 5: ath12k_peer_mlo_create(): remove parenthesis from the
>>   warning message
>> 
>> * patch 5: ATH12K_ML_PEER_ID_VALID: move to peer.h and rename to ATH12K_PEER_ML_ID_VALID
>> 
>> * patch 5: rename struct ath12k_peer::ml_peer_id to peer_id
>> 
>> * patch 5: use ath12k_peer_ml_*() naming style in peer.c
>> 
>> * patch 7: improve commit message a bit
>> 
>> * patch 7: struct wmi_peer_assoc_mlo_partner_info: add _params to name
>> 
>> v1: https://patchwork.kernel.org/project/linux-wireless/cover/20241023133004.2253830-1-kvalo@kernel.org/
>> 
>> Kalle Valo (2):
>>   wifi: ath12k: ath12k_mac_vdev_create(): use goto for error handling
>>   wifi: ath12k: introduce ath12k_hw_warn()
>> 
>> Sriram R (6):
>>   wifi: ath12k: MLO vdev bringup changes
>>   wifi: ath12k: Refactor sta state machine
>>   wifi: ath12k: Add helpers for multi link peer creation and deletion
>>   wifi: ath12k: add multi-link flag in peer create command
>>   wifi: ath12k: add helper to find multi-link station
>>   wifi: ath12k: Add MLO peer assoc command support
>> 
>>  drivers/net/wireless/ath/ath12k/core.h  |  25 ++
>>  drivers/net/wireless/ath/ath12k/debug.c |   6 +-
>>  drivers/net/wireless/ath/ath12k/debug.h |   5 +-
>>  drivers/net/wireless/ath/ath12k/mac.c   | 504 +++++++++++++++++++-----
>>  drivers/net/wireless/ath/ath12k/peer.c  | 115 ++++++
>>  drivers/net/wireless/ath/ath12k/peer.h  |  12 +
>>  drivers/net/wireless/ath/ath12k/wmi.c   | 191 ++++++++-
>>  drivers/net/wireless/ath/ath12k/wmi.h   | 115 ++++++
>>  8 files changed, 848 insertions(+), 125 deletions(-)
>> 
>> 
>> base-commit: fa934bf3e0a825ee09f035c6580af513187d59a2
>
> with this series I see a new warning with gcc:
> drivers/net/wireless/ath/ath12k/mac.c: In function 'ath12k_bss_assoc':
> drivers/net/wireless/ath/ath12k/mac.c:3080:1: warning: the frame size
> of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]

What GCC version are you using and can you privately share your .config?
I'm guessing it's coming from peer_arg which was already in
ath12k_bss_assoc() before this patchset:

	struct ath12k_wmi_peer_assoc_arg peer_arg;

And indeed it's a large struct, we shouldn't allocate that from the
stack.

> we should clean this up with a subsequent patch

Agreed.

> I'm taking the current series into 'pending'

Thanks.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

