Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD53D0E6D1
	for <ath12k@archiver.kernel.org>; Mon, 21 Oct 2024 09:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xaTg288/HQhQnXmZf0cBOHZ/yiUyhF7GlQNNm1ZAnJg=; b=og3VeSvy5Y5oQ4uKpB/zthVTfU
	ajjjfnPmVPWsT2U+rZgRSoedDGtNDhZcx4nPdRZ4/xVG+enxJUSvsr4PYDhWBwZf9MtpsrLuFUcYs
	sr7P0wy8yiIInNqgf4/NuPj335WqglmnJBeDPQu8Pe/ru+nRiEtdtKoM1evCTawTTFGgTsmsxEcf/
	1mr442UioGIHBInFeVVySqUwfRLECu1iAHaNyJTbVjvidsIG/Hpm2JNj6RNqMW3APgfrh78KEXK42
	W0LDKF8lCk227VmcWjJzBZIZpbvXWoRffGTNX4LKHVPGJp71AQhBQTxm6tIKrPIWBSRjUFhStgvQJ
	ESBVtW2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2oON-00000006euC-39gl
	for ath12k@archiver.kernel.org;
	Mon, 21 Oct 2024 09:07:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2oOJ-00000006et4-3rju
	for ath12k@lists.infradead.org;
	Mon, 21 Oct 2024 09:07:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E40465C5BBC;
	Mon, 21 Oct 2024 09:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C14C4CEC7;
	Mon, 21 Oct 2024 09:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729501675;
	bh=qJJnzJLApLm/pC+hOcBl9ymUBb/nq+DK3zkjkMbl4xg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ewvHbr943bKfo7CFKbWFsUXxk+/pOh9bc2GAX26iN+K1Sw1FgA/ahvkd4SRJSODdz
	 vN+n9NomPM/V5UvDa44rhYDiJOzDtZLfhrEw0hB5ebC/y887eVAjR99dlY9WPeYVLh
	 BNLpb5XRNZx81op/PJ+kE73I2sng0EXEtxGUisQy5KTGJxzL7zK7t73g0+Vnv7TJ6v
	 JqtvNNZ78U7wYZrqB4uxQXXxXpRbvDqUn8eBJADEK1Rzq0F8UfYluRovc/zNVzUR+5
	 yoK7fazYvBO6QTS7puSua1KQLuMSX/xWe5FY2yfdVBp7vATiBF2cZ9sMl17o668xmq
	 Sr9YKVBc1QlNg==
From: Kalle Valo <kvalo@kernel.org>
To: Karol Przybylski <karprzy7@gmail.com>
Cc: jjohnson@kernel.org,  linux-wireless@vger.kernel.org,
  ath12k@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: Fix for out-of bound access error
References: <20241015192155.3643363-1-karprzy7@gmail.com>
Date: Mon, 21 Oct 2024 12:07:51 +0300
In-Reply-To: <20241015192155.3643363-1-karprzy7@gmail.com> (Karol Przybylski's
	message of "Tue, 15 Oct 2024 21:21:55 +0200")
Message-ID: <8734kpq0wo.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_020756_025503_47356405 
X-CRM114-Status: GOOD (  12.53  )
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

Karol Przybylski <karprzy7@gmail.com> writes:

> Size of array passed to print_array_to_buf_index is decremented by 1
>
> Discovered in coverity scan, CID 1600742
>
> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> index b2be7dade79f..74767ba9ec2b 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> @@ -1550,7 +1550,7 @@ ath12k_htt_print_tx_selfgen_ax_stats_tlv(const void *tag_buf, u16 tag_len,
>  			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_ndp));
>  	len += print_array_to_buf_index(buf, len, "ax_mu_mimo_brpollX_tried = ", 1,
>  					htt_stats_buf->ax_mu_mimo_brpoll,
> -					ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS, "\n");
> +					ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS-1, "\n");

A space before and after '-', please.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

