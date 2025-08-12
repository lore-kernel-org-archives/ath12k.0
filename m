Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BD3CA0EDB
	for <ath12k@archiver.kernel.org>; Tue, 12 Aug 2025 19:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ie56wAAfWWPbXelyVCGl5DCjsfo0fkcoFUmNbM2JfsA=; b=29bBHGLpyPjcrbJs+Dv2tR+Bz8
	jIHSFqtwOhueoExk8dq8AzbRXv8X1KIHU/WqJD7boQ3exgBsUPXcwB71UUYzocurHqKN+oxXzj3HZ
	oW9XhpfIUrjwtGf4PDmsMeNurJS7VSvR3vfGolSz/NudmMAoHtjoHV9EANulcr+zu1+9twV8K4jF9
	fpC/SpA0X1VL7uBYpM5/lOu9SUAMpKGtyGSn3h6r/ZA6favL6Kv9QbyxLbZqRbDqREDVUlDok8tOj
	VX57Mt3lL43GoX6rv3clSh0LUPBsAz7GtVb58721jlThWdVZ/+nM+v3VcEuCWaZcU4CJfZNnEhBfV
	F/Axp2Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulubj-0000000Boai-2Xha;
	Tue, 12 Aug 2025 19:24:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrq4-0000000BPRE-2v1C
	for ath12k@lists.infradead.org;
	Tue, 12 Aug 2025 16:27:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0C618A576CA;
	Tue, 12 Aug 2025 16:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A32C4CEF8;
	Tue, 12 Aug 2025 16:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755016023;
	bh=SgiOIo0+U4m4CywXjwqcS9SUXLMQx+94iYxhv5zSRsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bMms5c9Qi4DHUwgY+Aw7KJLEV9yTjvxrFpsuZPx+ShTdFzHOki5+WybI+mPNMu+Ob
	 N/539NLmMcc1FBQUfaPVfLPmsiercNs6laHW35vGZ6y9gquFv/K9XEwuMAxZtuhmIi
	 l8OWmP5k9sqpuRL6gS4exGypqsPHCoe3Ll/w9mP4=
Date: Tue, 12 Aug 2025 18:27:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: stable@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, Gregoire <gregoire.s93@live.fr>,
	Sebastian Reichel <sre@kernel.org>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	Johan Hovold <johan@kernel.org>
Subject: Re: Stable Request: wifi: ath12k: install pairwise key first
Message-ID: <2025081240-trustless-secret-1354@gregkh>
References: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
 <aFvGnJwMTqDbYsHF@hovoldconsulting.com>
 <2d688040-e547-4e18-905e-ea31ea9d627b@quicinc.com>
 <e23d7674-31cd-4499-9711-6e5695b149c6@oss.qualcomm.com>
 <053a7887-c08d-4272-8ada-cf4a008894f9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <053a7887-c08d-4272-8ada-cf4a008894f9@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_092704_800283_9C5D6B31 
X-CRM114-Status: GOOD (  10.87  )
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

On Tue, Aug 12, 2025 at 08:58:52AM -0700, Jeff Johnson wrote:
> Stable team,
> 
> Per https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> Option 2 (since the patch was merged before being identified for -stable)
> Please consider the following for -stable
> 
> subject of the patch:
> wifi: ath12k: install pairwise key first
> 
> commit ID:
> 66e865f9dc78d00e6d1c8c6624cb0c9004e5aafb
> 
> why you think it should be applied:
> This issue impacts all products that use iwd (instead of wpa_supplicant) for
> WLAN driver management
> 
> what kernel versions you wish it to be applied to:
> All LTS kernels from 6.6+

It only applied cleanly to 6.16.y, so if you want it backported to older
kernels, please provide a working backport.

thanks,

greg k-h

