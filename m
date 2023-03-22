Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8421C6FD1F
	for <ath12k@archiver.kernel.org>; Wed, 22 Mar 2023 10:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBsoHw3b/kUd+HaCvUcHRgvOS+0YAGNuDXxm3oVGZAY=; b=fMbmO0SHVfJaC0
	urYQOkwmIJPuLIJv6zuFaLZzOK9/5Hbjx2t7gbnx1w0wfaYJjwsgWQpgSF3NsHlpHAx2jg69sGo3V
	4y41fR1ogr9Dhk4TwB6q/a/zByUf+CzJlQgzitrzH/9MEApO5cEIG6h+XH955OnE9CmYVRjrr2M4v
	GLOFxxCYn4CTz5uHtQLzHOkjtfzxtClcEONyqU1L9P9PwhATzqjce+hox9YEhO6ICqQpV+Q1AOjAm
	B9D1mTVBtT6ze+xxoE3kzKozkz9iFpSdXUIAhm8r9ZpIs7nKXTiwE8p8UOSd+pWG1Xmc4UIYA5wfa
	RWhDNsnfS4/CN4AFYCdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pevLa-00FZtU-0j
	for ath12k@archiver.kernel.org;
	Wed, 22 Mar 2023 10:05:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pevLX-00FZsh-0p
	for ath12k@lists.infradead.org;
	Wed, 22 Mar 2023 10:05:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7BA2461FFC;
	Wed, 22 Mar 2023 10:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0174DC4339B;
	Wed, 22 Mar 2023 10:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679479529;
	bh=mwPgbI5uMot2tExBjeYW8wbU82X3BixCLrz25CL5qlk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=lkrBCu6+5t0WzdskYOpQi22y1L5S/ZD49eMdnPg+ZNikceOSOUyXfYrKnHSEaA3jE
	 gqJR1j9UeHXKxGata9aFLP1+Do8QOCzpdLbCVWIoRtATR+3L0Pm9+Cus+ocZraeNj6
	 +0Igz1Z5T0aZ0P8FLzb2c7rGMWYcKqH3V14nmsu2eM0uGwJkGL9R3WEfMV8EMKjmGv
	 jFmooW2ymFRqyILvMUJPub4683JZ2HdIwVKV8KponiuU5hQMC4/pkrMio70YXzJ6Ii
	 yA57JmCBtrWvbwNPoyF/wDZFtiUpL72xvZYrZNgpZeygxQwh7HHNEBXsXGc862SC+j
	 /sR7c1Gf0kUCA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: fix memory leak in
 ath12k_qmi_driver_event_work()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230315090632.15065-1-quic_rajson@quicinc.com>
References: <20230315090632.15065-1-quic_rajson@quicinc.com>
To: Rajat Soni <quic_rajson@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Rajat Soni <quic_rajson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167947952529.29931.8146438365392973655.kvalo@kernel.org>
Date: Wed, 22 Mar 2023 10:05:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_030531_334585_270F0462 
X-CRM114-Status: UNSURE (   8.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Rajat Soni <quic_rajson@quicinc.com> wrote:

> Currently the buffer pointed by event is not freed in case
> ATH12K_FLAG_UNREGISTERING bit is set, this causes memory leak.
> 
> Add a goto skip instead of return, to ensure event and all the
> list entries are freed properly.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

960412bee0ea wifi: ath12k: fix memory leak in ath12k_qmi_driver_event_work()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230315090632.15065-1-quic_rajson@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
