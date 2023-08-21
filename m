Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A7FEE4996
	for <ath12k@archiver.kernel.org>; Mon, 21 Aug 2023 07:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vIn1kIs0N0LQwIYcG/eM6vYxNEuu2z8OhKM4CshCLk=; b=Vp9WjGdN5HLB+N
	QdxN7n5m74nK7hp3LcYTG2VTJ2lnJDpibl9Zco1j4ggPRt0oO+AFj1uPQimWU7PAQusiUNf2ZHOSK
	tj/b3VgEWRK1HeMuH1Z1eHR6bplH47c+O8kUjV1C8cvUp7z9WoRyeWEUQfTgG1bJhiGs5GboQaV8Z
	cn6M06nthblpWu+/3QR3MwlkE2soZCpMvb+tqjNvfbH1iW8SqL6Q70DetG0iIf+02jS8mK23PY8Bt
	k4jRWQmZeZ8ePFvwzSfSldhMgvXGECyQr0LkgHF91VWoDRVSB2rBmJGJyNrZ8tx2AZjCYAfh3K4V3
	g05lOksROBGmAPXJi+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzWT-00DNCd-2n
	for ath12k@archiver.kernel.org;
	Mon, 21 Aug 2023 07:40:25 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzWQ-00DNBF-0M
	for ath12k@lists.infradead.org;
	Mon, 21 Aug 2023 07:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=a2YnMR9sKL36w+fjRI775d8yUbY27E77h+cTuZKWsZs=;
	t=1692603619; x=1693813219; b=KTKpUUOvDzUBtohJIRLWLME3ZkExdhveq+QwqKDw61LUR+X
	MaI7rLIR5spE92wo6kGeoQR3cXoZmwTrFhjQx7o4lpCznhJ4XHETYUMKTDmi7/xhABiEO5LD0p0pK
	PPTEyO2/pLrkSKGu7Ce7WUCrEjw6XbvPGBBuvnKYvnxwwjXGFTRAkpr3TkruCRyIJENHP1lDBRf6f
	FXqFmNcW7FzX/g7q5c9qIgg8m0VX2kYNMqn1C52bz4gI0ukNgv1WFsNs/9xrpBcwqrhB6sF3uWTC+
	GKk2BADo5A1apgyE+ksDmoxpvgTtdKSSOwhQNvUAqrUMGzNTqrZ3wmq9CiIJJ+Ww==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qXzWJ-002qhK-1p;
	Mon, 21 Aug 2023 09:40:15 +0200
Message-ID: <5c072b0a45ad29dc03b989fbd9a9fd974ae0c23d.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: fix cfg80211_bss always hold when assoc
 response fail for MLO connection
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Mon, 21 Aug 2023 09:40:14 +0200
In-Reply-To: <20230821061355.18168-1-quic_wgong@quicinc.com>
References: <20230821061355.18168-1-quic_wgong@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_004023_564307_45CE7678 
X-CRM114-Status: GOOD (  12.32  )
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

On Mon, 2023-08-21 at 02:13 -0400, Wen Gong wrote:
> 
> +++ b/net/mac80211/mlme.c
> @@ -5429,17 +5429,22 @@ static void ieee80211_rx_mgmt_assoc_resp(struct ieee80211_sub_if_data *sdata,
>  	for (link_id = 0; link_id < IEEE80211_MLD_MAX_NUM_LINKS; link_id++) {
>  		struct ieee80211_link_data *link;
>  
> -		link = sdata_dereference(sdata->link[link_id], sdata);
> -		if (!link)
> -			continue;
> -
>  		if (!assoc_data->link[link_id].bss)
>  			continue;
>  
>  		resp.links[link_id].bss = assoc_data->link[link_id].bss;
> -		resp.links[link_id].addr = link->conf->addr;
>  		resp.links[link_id].status = assoc_data->link[link_id].status;
>  
> +		link = sdata_dereference(sdata->link[link_id], sdata);
> +
> +		if (!link) {
> +			/* use the addr of assoc_data link which is set in ieee80211_mgd_assoc() */
> +			resp.links[link_id].addr = assoc_data->link[link_id].addr;

As I mentioned before, this cannot be done - it introduces use-after-
free since assoc_data is freed after the loop, and the
cfg80211_rx_assoc_resp() is after that.

> +			continue;
> +		}
> +
> +		resp.links[link_id].addr = link->conf->addr;
> 

Also, I don't see that we need to use two different assignments for the
two cases.

johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
