Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0280FC0218A
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztTkXggYlobgx0epsppi5S+4LOlRnswYqg61lPztKMQ=; b=nSyOI/aqX7eJzCGfSQ7CTIzMV0
	3laNNHfBlmHqFfeBgq5Gxgs53cuz6jO9PKSQzaR5eZ7+5iuBfF/Yk47TEZBPoaAMYYKGajpGxS6EK
	HpOlJyw5u5b40fc6OCf/FfD8gbp651XUosKLMrQweNOWbiqjd8q6ZR1qIE7jXjVCa0VTuwSeD70AF
	y3x+WzGAl019aLpNiB6FRrAv8S0chrlzS2wpGbf4StMxVaS10xKXiJKT146Px1WUyXXOV8QM3a2t/
	Z5kJ6sqvZh8+LrMZ/ba9eKdrT6M0dZ4I0vGHJRg3w3+OcHlImS8Mdm3mJguBM06q+mJNcheHDThlz
	lIyQbHfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQIY-00000008SQr-39FH
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 08:53:18 +0000
Received: from e3i103.smtp2go.com ([158.120.84.103])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQIV-00000008SQ8-3Rmi
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 08:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1738227186; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=ztTkXggYlobgx0epsppi5S+4LOlRnswYqg61lPztKMQ=;
 b=Ibw6ofU+yPk98uF7e48LkMtr/QiJk/Lf4CzS1kycnKgU5UmQ3Po1TDWCe3Cm7ogBinGYv
 4N29gXVu3UHY140Psx56JvETPwSG+IqQKyKL9+efKUd9kE9Tetg96GU8GRkO1jfxos9t5or
 6n23szgF+vLZB/I57EJSk7ySxtrrQJVqdsbAej0pFjapP4R/XaF6XLGR2EB1zD7pfyrc0CF
 pri9lJ25u3pvibar4P0uVSIHsAD7jEqPiU8N5qT2qa8qvvdMfRTveMfoeV1YJF+1nfvob30
 01TxsNyxKciaSOZzmBeckkgwhxioJpYSanR/Q51D0CECq9bvwt1CNvp66UhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1738227186; h=from : subject
 : to : message-id : date;
 bh=ztTkXggYlobgx0epsppi5S+4LOlRnswYqg61lPztKMQ=;
 b=ZF7QNmPxPIJywEUaXPfQ4o54JnukmUhTGSeTtGwYfVHszsp+TtKSnG2h0JLYgmrLHHOUm
 UogVFbPzq6pcovSwCGiq1rBhXk2j+owTJgE0pxItL5SqXi2GgZxzMZTkCgJVD7vIzIKvf2a
 wSQOFtUgyNwWwliuqX1MnrQbFjIocNDAhg15DnVGmi+gPgptsHFG4vEwTDhE8uMKlin8/OW
 fi2XN/8gSRTBxasJqs1qkkeou2Eydj7bOl3+rLlC+DP/3Bts5LIxdfb+mMlQpLNPLTzg2DV
 w0LcvxglavyT14NjQ4bpNV/ZwfV+NMZnwpCrsozm43WuZLIBK06Hhu1QDsWw==
Received: from [10.12.239.196] (helo=localhost)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <repk@triplefau.lt>)
	id 1tdQIF-4o5NDgrn3Ce-oqLA;
	Thu, 30 Jan 2025 08:52:59 +0000
Date: Thu, 30 Jan 2025 09:49:12 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Subject: Re: [PATCH v2] wifi: ath12k: remove return for empty tx bitrate in
 mac_op_sta_statistics
Message-ID: <Z5s9CO_mmazq2Kg1@pilgrim>
References: <38c2a7c4f7eaf57b9306bb95a9e6c42b7d987e05.1738169458.git.repk@triplefau.lt>
 <9c12e9b9-35a4-47f1-bd17-6b4641de92a4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c12e9b9-35a4-47f1-bd17-6b4641de92a4@oss.qualcomm.com>
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 510616m:510616apGKSTK:510616sX7BLYLfdb
X-smtpcorp-track: mjH8hCbpBIFb.WZ0v_PTevWqK.qlPRIQoiyih
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_005316_261761_5F1C6822 
X-CRM114-Status: GOOD (  16.67  )
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

On Thu, Jan 30, 2025 at 12:21:54PM +0530, Aditya Kumar Singh wrote:
> On 1/29/25 22:25, Remi Pommarel wrote:
> > Currently in ath12k_mac_op_sta_statistics() there is the following
> > logic:
> > 
> >      if (!arsta->txrate.legacy && !arsta->txrate.nss)
> >          return;
> > 
> > Because ath12k_sta_statistics is used to report many info to iw wlan0 link,
> > if it return for empty legacy and nss of arsta->txrate, then the other
> > stats after it will not be set.
> > 
> > To address this issue remove the return and instead invert the logic to set
> > the txrate logic if (arsta->txrate.legacy || arsta->txrate.nss).
> > 
> > The same was done also in both ath10k with commit 1cd6ba8ae33e ("ath10k:
> > remove return for NL80211_STA_INFO_TX_BITRATE") and ath11k as well with
> > commit 1d795645e1ee ("ath11k: remove return for empty tx bitrate in
> > mac_op_sta_statistics").
> > 
> > Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> MISSING_BLANK_LINE
> 'Tested-on:' tag missing blank line after it.
> 
> You missed v1 comment? :)

Yes sorry I think your mail never reached me, did you CC me ? Do you
need a respin ?

-- 
Remi

