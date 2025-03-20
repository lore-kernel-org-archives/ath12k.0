Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7A5C36002
	for <ath12k@archiver.kernel.org>; Thu, 20 Mar 2025 12:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2G45JwkiuKUFcys+DtoNHHLBH1XV9DqRJlWo0d+5yw=; b=sSOAzkAM4zE840JXUvAmT1qW69
	Ql39EegmR3IWXvnPOgdTAIjlqYzSG7zVFaR+qfVIMrnwBMDtgAeAP62Zho4QjoyQ57J6BXBiIoxh6
	TRVPFzbB5qdukkQ2N3TkOWXh5RxJd2wIhD+z+MKyIlQokzYrGXxjIUAb9BPxjl0t+kct9XydNA5IM
	RGZ1TLujpHqWglBppugljMuLUTAiRofzJ1D4WcIfHx52JjJTNLi9Th9k/RqyLqdc73e8VxBVCo9EE
	0J5bY+DiEAIZNv7XrpM8s5WPmBwh+eUmJ0syAscCO9xDfaiwba9tnNID2sKav0dlEtzqjDWpKQYc0
	odx+MpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEx6-0000000C6eB-0o1T
	for ath12k@archiver.kernel.org;
	Thu, 20 Mar 2025 12:24:48 +0000
Received: from mail.tuxedocomputers.com ([157.90.84.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEqI-0000000C5bh-0i3n
	for ath12k@lists.infradead.org;
	Thu, 20 Mar 2025 12:17:48 +0000
Received: from [192.168.178.76] (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 8343C2FC0191;
	Thu, 20 Mar 2025 13:17:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1742473061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U2G45JwkiuKUFcys+DtoNHHLBH1XV9DqRJlWo0d+5yw=;
	b=tfwbS/SHdB3Tn/U0To+HdM0bzbrExuU4nUwD3hoB0q7SeSg+1Gpvnrt6yeGhotAQN5v7Gr
	IRgmu31aoWfAQOaSodqPwviIWpwhU4zoDCy6OHUee+xeeWDwCVZL+ADAsomLe3dS0dI/ig
	97GUuzj6PSL/2uMzDoUNNzh9sSWgCa0=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=ggo@tuxedocomputers.com
Message-ID: <0ca4584f-7da1-4b0a-b526-75151625dea8@tuxedocomputers.com>
Date: Thu, 20 Mar 2025 13:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath12k: WCN7850 hw2.0: update board-2.bin
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Georg Gottleuber <ggo@tuxedocomputers.com>
Cc: linux-firmware@kernel.org, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Christoffer Sandberg
 <cs@tuxedocomputers.com>, Werner Sembach <wse@tuxedocomputers.com>
References: <398de7cb-e455-4cb4-98e8-31471bb740a6@tuxedocomputers.com>
 <iffofcri7ah2pwu3b77z5zfsa2wkzl5mcoarm2any4fdcjvsys@o35roczyxb6q>
Content-Language: en-US
From: Georg Gottleuber <ggo@tuxedocomputers.com>
In-Reply-To: <iffofcri7ah2pwu3b77z5zfsa2wkzl5mcoarm2any4fdcjvsys@o35roczyxb6q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_051746_678171_78D181E8 
X-CRM114-Status: UNSURE (   4.97  )
X-CRM114-Notice: Please train this message.
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

Hi Dimitry.

Am 18.03.25 um 22:12 schrieb Dmitry Baryshkov:
[...]
> 
> Please follow the process specified at the kernel wiki [1]. Otherwise
> the next update by Jeff will revert your changes.
> 
> [1] https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html

Thank you for this hint. I will stick to this in v2.

Best regards,
Georg

