Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F9DD42B9E
	for <ath12k@archiver.kernel.org>; Tue, 12 Nov 2024 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKU+cYqHX3RxOCYeaaEyqkrMVryog1VhU47F75WzRn0=; b=QnWgG3/qJ0M/8VV05NFJEF1+zJ
	unh1MXxvdTUGDFvArzJ+QCugSETHdv6GR4Ka/IrhSX+Bfo9csdCPPEz4riJDrCDvF2onhOsYWYDEO
	gxPKxretoW7sVLAhv5Y0VClfhGZ06/AbCxctc33NvZEEHman1jin5qrO/c1JaTEa0ZDIHrWR4E0ky
	YdmYiXQuwcFf1TsUrTSYIxnoui9Z9pKpFekvlppUsqpYAQCf8fc2S13RiLotVXSrmRa1IDOFwbzh5
	O7NhRX87/7BGixxY15eHC6Ev35M+T9a2cAkLhA1nj8k0BB2oCGp1iliTGxku0Jfj2n0S7Nsss2QSJ
	ZX8S+QPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtAT-000000040no-08Xx
	for ath12k@archiver.kernel.org;
	Tue, 12 Nov 2024 15:51:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtAP-000000040mi-3LaD
	for ath12k@lists.infradead.org;
	Tue, 12 Nov 2024 15:50:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 353CE5C49FD;
	Tue, 12 Nov 2024 15:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34632C4CECD;
	Tue, 12 Nov 2024 15:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731426656;
	bh=hRPj4clhocGqNEn4CH8MQoODgrwCA8SvKrYXdlNXTwk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KWKk+5gKig31WFZ6Hw7DUmWDBYQAx7w+WvUP47uBAUeq4l4pYaQQxmj38GfJ8D6vk
	 hpmk+7MJ7a16+VA7PHVahCXFp4B5mFMXvFJ4OXetGrImvPlDtcKPhrk2FLe0zCw/q6
	 ixvPNygJNpVXq4m343XQmrC5upU7ckWV5w4J9O4r2w9/heNfzYuxPDuf11K2Lcfma+
	 iNaZekG9oss26XuEM+xOCZE1NDZuPZPX+bBvyOiutzGIAQndA5bPgOnF91NAkrrmqh
	 AGZ3jyrUdypJ0E2agwXam92xOan7OixdF1aj++dEeoaRtq5syRLQF8RNr1qd2RZQy+
	 Dznx8ST8uUEKQ==
From: Kalle Valo <kvalo@kernel.org>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Dinesh
 Karthikeyan <quic_dinek@quicinc.com>
Subject: Re: [PATCH v4 1/4] wifi: ath12k: Support Downlink Pager Stats
References: <20241106044548.3530128-1-quic_rdevanat@quicinc.com>
	<20241106044548.3530128-2-quic_rdevanat@quicinc.com>
Date: Tue, 12 Nov 2024 17:50:53 +0200
In-Reply-To: <20241106044548.3530128-2-quic_rdevanat@quicinc.com> (Roopni
	Devanathan's message of "Wed, 6 Nov 2024 10:15:45 +0530")
Message-ID: <87frnw4fj6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_075058_071456_9A8C89EF 
X-CRM114-Status: GOOD (  14.71  )
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

Roopni Devanathan <quic_rdevanat@quicinc.com> writes:

> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
>
> Add support to request downlink pager stats from firmware through HTT
> stats type 36. These stats give paging information like number of pages,
> their timestamp, number of locked and free pages, synchronous and
> asynchronous locked pages.
>
> Note: MCC firmware version -
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4 responds to
> the event requesting stats, but it does not give any data.
>
> Sample output:
> -------------
> echo 36 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_DLPAGER_STATS_TLV:
> ASYNC locked pages = 2
> SYNC locked pages = 0
> Total locked pages = 2
> Total free pages = 127
>
> LOCKED PAGES HISTORY
> last_locked_page_idx = 0
> Index - 0 ; Page Number - 8495 ; Num of pages - 1 ; Timestamp - 4031009360us
> Index - 1 ; Page Number - 7219 ; Num of pages - 2 ; Timestamp - 885379515us
> Index - 2 ; Page Number - 0 ; Num of pages - 0 ; Timestamp - 0us
> Index - 3 ; Page Number - 0 ; Num of pages - 0 ; Timestamp - 0us
> .....
> UNLOCKED PAGES HISTORY
> last_unlocked_page_idx = 0
> Index - 0 ; Page Number - 7144 ; Num of pages - 2 ; Timestamp - 4032070008us
> Index - 1 ; Page Number - 7214 ; Num of pages - 2 ; Timestamp - 885379512us
> Index - 2 ; Page Number - 0 ; Num of pages - 0 ; Timestamp - 0us
> Index - 3 ; Page Number - 0 ; Num of pages - 0 ; Timestamp - 0us
> .....
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

[...]

> +static void ath12k_htt_print_dlpager_entry(const struct ath12k_htt_pgs_info *pg_info,
> +					   int idx, char *str_buf)
> +{
> +	u32 ts_lo;
> +	u32 ts_hi;
> +	u64 page_timestamp;
> +	u16 index = 0;

Nitpicking but please strive for reverse xmas style and no need to have
just one variable per line:

        u64 page_timestamp;
        u32 ts_lo, ts_hi;
        u16 index = 0;

> +static void
> +ath12k_htt_print_dlpager_stats_tlv(const void *tag_buf, u16 tag_len,
> +				   struct debug_htt_stats_req *stats_req)
> +{
> +	const struct ath12k_htt_dl_pager_stats_tlv *stat_buf = tag_buf;
> +	u8 *buf = stats_req->buf;
> +	u32 len = stats_req->buf_len;
> +	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
> +	u32 info0;
> +	u32 info1;
> +	u32 info2;
> +	u32 dword_lock;
> +	u32 dword_unlock;
> +	u8 pg_locked;
> +	u8 pg_unlock;
> +	int i;
> +	char str_buf[ATH12K_HTT_MAX_STRING_LEN] = {0};

Same here. And maybe initialise buf_len separately to keep the
declarations clean?


> +	if (tag_len < sizeof(*stat_buf))
> +		return;
> +
> +	info0 = le32_to_cpu(stat_buf->info0);
> +	info1 = le32_to_cpu(stat_buf->info1);
> +	info2 = le32_to_cpu(stat_buf->info2);
> +	dword_lock = u32_get_bits(info2, ATH12K_HTT_DLPAGER_TOTAL_LOCK_PAGES_INFO2);
> +	dword_unlock = u32_get_bits(info2, ATH12K_HTT_DLPAGER_TOTAL_FREE_PAGES_INFO2);

There's le32_get_bits() so you can simplify this function quite a lot.

> +	pg_locked = ATH12K_HTT_STATS_PAGE_LOCKED;
> +	pg_unlock = ATH12K_HTT_STATS_PAGE_UNLOCKED;
> +
> +	len += scnprintf(buf + len, buf_len - len, "HTT_DLPAGER_STATS_TLV:\n");
> +	len += scnprintf(buf + len, buf_len - len, "ASYNC locked pages = %u\n",
> +			 u32_get_bits(info0, ATH12K_HTT_DLPAGER_ASYNC_LOCK_PG_CNT_INFO0));
> +	len += scnprintf(buf + len, buf_len - len, "SYNC locked pages = %u\n",
> +			 u32_get_bits(info0, ATH12K_HTT_DLPAGER_SYNC_LOCK_PG_CNT_INFO0));
> +	len += scnprintf(buf + len, buf_len - len, "Total locked pages = %u\n",
> +			 u32_get_bits(info1, ATH12K_HTT_DLPAGER_TOTAL_LOCK_PAGES_INFO1));
> +	len += scnprintf(buf + len, buf_len - len, "Total free pages = %u\n",
> +			 u32_get_bits(info1, ATH12K_HTT_DLPAGER_TOTAL_FREE_PAGES_INFO1));
> +
> +	len += scnprintf(buf + len, buf_len - len, "\nLOCKED PAGES HISTORY\n");
> +	len += scnprintf(buf + len, buf_len - len, "last_locked_page_idx = %u\n",
> +			 dword_lock ? dword_lock - 1 : (ATH12K_PAGER_MAX - 1));
> +	for (i = 0; i < ATH12K_PAGER_MAX; i++) {

Empty line before for.

> +		memset(str_buf, 0x0, ATH12K_HTT_MAX_STRING_LEN);
> +		ath12k_htt_print_dlpager_entry(&stat_buf->pgs_info[pg_locked][i],
> +					       i, str_buf);
> +		len += scnprintf(buf + len, buf_len - len, "%s", str_buf);
> +	}
> +
> +	len += scnprintf(buf + len, buf_len - len, "\nUNLOCKED PAGES HISTORY\n");
> +	len += scnprintf(buf + len, buf_len - len, "last_unlocked_page_idx = %u\n",
> +			 dword_unlock ? dword_unlock - 1 : ATH12K_PAGER_MAX - 1);
> +	for (i = 0; i < ATH12K_PAGER_MAX; i++) {

Empty line before for.

> +		memset(str_buf, 0x0, ATH12K_HTT_MAX_STRING_LEN);
> +		ath12k_htt_print_dlpager_entry(&stat_buf->pgs_info[pg_unlock][i],
> +					       i, str_buf);
> +		len += scnprintf(buf + len, buf_len - len, "%s", str_buf);
> +	}
> +	len += scnprintf(buf + len, buf_len - len, "\n");

Empty line after '}'.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

