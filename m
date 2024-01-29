Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38F9C47422
	for <ath12k@archiver.kernel.org>; Mon, 29 Jan 2024 13:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aw9hg25Rdr4TlybCiMX4bb0WFlhoQBr8gLcr8G3wws4=; b=lHOhDNngtB1QslHWyyEyW+6Ldx
	8futP+37yypqnL50gFBSs3LB2W9h4bNVzgTOqhh1XZqCgW93Dop36SoLWOdHGV0I4iWZcNGCovAh6
	+b3FNJUY5HijxrKmTLUxmBtz6pgzjXuA8ILGbdKDTNpgGDn3aL19ewqnksdS9fqudC79rC59GZxKV
	1AHTAzGR5QuZ22V9jJo6W7wsZAQIrE45NvpYsX+THvE1/YpjysBFPbMBp2p8pkYRLUXNeEJSANO3Z
	tJJ9aZI5nZI021P1Ro8C+9KJIMKId3z1uDb5qi36AQM1mecdrUJtavDAFuHw80dw1EkiZtlZ1zEt+
	2GRpVdpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURHK-0000000CkZK-2KoH
	for ath12k@archiver.kernel.org;
	Mon, 29 Jan 2024 13:02:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURHI-0000000CkYc-1dR8
	for ath12k@lists.infradead.org;
	Mon, 29 Jan 2024 13:02:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7815DCE1258;
	Mon, 29 Jan 2024 13:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4CBC433C7;
	Mon, 29 Jan 2024 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706533337;
	bh=d+4Z5MstCVFXKpwlXs3/v/FQWYagJl4WAWEOBXcyiTM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=SDSOy5bgoTLElsi7UY2gJkKFH3ZR60/D1HLQiJXZnpISlFQszj59gyPt44dGoFkIx
	 oL/cEEQ74T96ayvjDP6Z2ab2Iyl56U2a1EZNgeKNpudVouaQtl5Ln09IwL9OponEtM
	 d68rJJtxlxPWcVMQuIxbSM+dnR49+4M8Kg5i7J6jRqOUkv70r80gF1r8RjyRvN68G9
	 zWQsE7eKI4DjUoV5XwnLdX8dyk0Z9KVu494qp7PEczVtROVLXJNtsRQQVKsnsWfyy4
	 KdL7NsMCO+FaPWml0BYVeLeBkggKgrXmwj7TcXlB77K6WmS9ulDeWWKWBHgRuPNRhK
	 NWd/Xq1QayyDw==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 00/10] wifi: ath12k: P2P support for WCN7850
References: <20240122113904.8938-1-quic_kangyang@quicinc.com>
	<87cytp1nhd.fsf@kernel.org>
	<9a90fab6-18f1-4664-96f4-6795174d636f@quicinc.com>
Date: Mon, 29 Jan 2024 15:02:14 +0200
In-Reply-To: <9a90fab6-18f1-4664-96f4-6795174d636f@quicinc.com> (Kang Yang's
	message of "Fri, 26 Jan 2024 17:34:44 +0800")
Message-ID: <87sf2gwaw9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_050220_641931_C1F7CF12 
X-CRM114-Status: GOOD (  13.87  )
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

Kang Yang <quic_kangyang@quicinc.com> writes:

> On 1/25/2024 10:44 PM, Kalle Valo wrote:
>> Kang Yang <quic_kangyang@quicinc.com> writes:
>> 
>>> Add P2P support for WCN7850.
>>>
>>> Kang Yang (10):
>>>    wifi: ath12k: change interface combination for P2P mode
>>>    wifi: ath12k: add P2P IE in beacon template
>>>    wifi: ath12k: implement handling of P2P NoA event
>>>    wifi: ath12k: implement remain on channel for P2P mode
>>>    wifi: ath12k: change WLAN_SCAN_PARAMS_MAX_IE_LEN from 256 to 512
>>>    wifi: ath12k: allow specific mgmt frame tx while vdev is not up
>>>    wifi: ath12k: fix broken structure wmi_vdev_create_cmd
>>>    wifi: ath12k: move peer delete after vdev stop of station for WCN7850
>>>    wifi: ath12k: designating channel frequency for ROC scan
>>>    wifi: ath12k: advertise P2P dev support for WCN7850
>>>
>>> v3: rebase on new ath-tag, use ath12k_ah_to_ar() get ar(Karthikeyan).
>>> v2:
>>>      1. add Tested-on tag of QCN9274.
>>>      2. update copyright in patch #1, #2, #4 and #10.
>> I have not been able to run any p2p tests yet but during rmmod with
>> WCN7850 I now see:
>> [  136.260660] ------------[ cut here ]------------
>> [ 136.260909] UBSAN: shift-out-of-bounds in
>> drivers/net/wireless/ath/ath12k/mac.c:6005:38
>> [  136.261008] shift exponent 255 is too large for 64-bit type 'long long int'
>
>
> It seems you enable CONFIG_UBSAN, CONFIG_UBSAN_SANITIZE_ALL and other
> CONFIG_UBSAN_XXX.

Yes, I try to enable debug facilities as much as possible. They are
really good at finding issues in the code.

> I will add them to my config file and debug this warning.

Thanks.

> It's been a long time since the last update of kernel config. Can you
> share the new one if convenient?

Yeah, it is. I updated it now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

