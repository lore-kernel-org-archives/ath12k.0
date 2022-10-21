Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7E4C433FE
	for <ath12k@archiver.kernel.org>; Fri, 21 Oct 2022 11:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jazsMN9FiCEtms1zn9NBItKx1bzU/RCsxRGgp2W8/Mk=; b=GIEuNCeknW7VOC
	aWr9MG5gWX+LjkrrUljicwL5EfuwOpHp/zNw5Lv3lej4P/yOoopJNKccvMwDbOo2ttBTt8QXkZm0i
	Ua7h3Z4i7qO6zk4K61nx7aYql85x2gJPEzb7IzcbGhjD7zNe4YE/7BG1EqXwtyGveAL4sgiXV7Qav
	45MrNIxkqBm+o1ICo4y3fjPGjj0CkdHf11QRtPzIOxVO/P0pyPwq/3+ZJ7z1twf0iqIjfSU273g14
	wk5AmElwECfWEpKhcYdCW6g/3hppUQUQ6HXPaeB6Q5k3SIbrBkUGNoslYw4E85A3a6GmUNTHlDf1v
	d103B9KnNcXyLtUfrQlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olqT5-007SOj-96
	for ath12k@archiver.kernel.org; Fri, 21 Oct 2022 11:45:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olqT2-007SM3-7Y
	for ath12k@lists.infradead.org; Fri, 21 Oct 2022 11:45:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7316761E3D;
	Fri, 21 Oct 2022 11:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFA6C433D6;
	Fri, 21 Oct 2022 11:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666352732;
	bh=jEOgSwQYCD+gxiCJMxt436mAcZyHcOjM4AZn3LcQ+Vc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=TyvPBM/avix8g4eP5sAjjJIR6HWquANhsUBQ+0uUcAgSvSeuz85ak8tGCOTX4NTaq
	 V6L+vYNFUIABkjCmYzP0YAepJe4EKHTetuwujyzFxZ7t8Ko1i5FBcUDQf6uCxzTkye
	 W3QhgPPAyNnWpMkdz8C4eskWhH/4wugAL5Ez2RgyKFeHSeRwPwKN0pkNXhw5G3pjE4
	 NwmFmUed9uNnBbHcDeJtE/McqE9KZI3Nfdteg1gibgEo9jyZzIYZJz4fGpEmwhMEKb
	 m8Mz/4m0XzUlzS8hafR4MwPPYkytsPqojt6sHqYQlmwqU+Bcu/TpfLoU4pHfc5jKGf
	 hqncKmj2R1eLQ==
From: Kalle Valo <kvalo@kernel.org>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,  "ath12k\@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: Re: [PATCH 12/50] wifi: ath12k: add dp.h
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-13-kvalo@kernel.org>
	<0eabd6c1b3ca4d8a8152ad5b4f3efee6@realtek.com>
	<87leqxag07.fsf@kernel.org>
Date: Fri, 21 Oct 2022 14:45:30 +0300
In-Reply-To: <87leqxag07.fsf@kernel.org> (Kalle Valo's message of "Mon, 05 Sep
	2022 20:27:20 +0300")
Message-ID: <878rl9jt7p.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_044536_325909_95BC5A6E 
X-CRM114-Status: GOOD (  10.50  )
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

Kalle Valo <kvalo@kernel.org> writes:

>>> +struct htt_srng_setup_cmd {
>>> +	u32 info0;
>>> +	u32 ring_base_addr_lo;
>>> +	u32 ring_base_addr_hi;
>>> +	u32 info1;
>>> +	u32 ring_head_off32_remote_addr_lo;
>>> +	u32 ring_head_off32_remote_addr_hi;
>>> +	u32 ring_tail_off32_remote_addr_lo;
>>> +	u32 ring_tail_off32_remote_addr_hi;
>>> +	u32 ring_msi_addr_lo;
>>> +	u32 ring_msi_addr_hi;
>>> +	u32 msi_data;
>>> +	u32 intr_info;
>>> +	u32 info2;
>>> +} __packed;
>>> +
>>
>> Should they be '__le32' instead of 'u32'?
>>
>> This struct is used to fill data of ath12k_htc_send(), and the fields of
>> htc header are __le32: 
>>
>> struct ath12k_htc_hdr {
>> 	__le32 htc_info;
>> 	__le32 ctrl_info;
>> } __packed __aligned(4);
>>
>> If above is correct, some struct(s) related to ath12k_htc_send() have
>> similar problems:
>> struct htt_ver_req_cmd
>> struct htt_ppdu_stats_cfg_cmd
>> struct htt_rx_ring_selection_cfg_cmd
>> struct htt_ext_stats_cfg_cmd
>> struct htt_tx_ring_selection_cfg_cmd  (miss __packed)
>
> Good catch, we'll fix those and the missing __packed. Thanks for the review!

I fixed these in:

efc72b2aa34c wifi: ath12k: dp: convert htt cmd structs to __le32

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
