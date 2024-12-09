Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FA7E7717D
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 13:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNwBuht7FhTBA/F8tncqQ0NXqKJ5PnM66BVFntIZ6lo=; b=N+OlxpBpGpZyc+pxN+6YsPvnH2
	ExiIaYmXlnO36BWA5RPHeQlK/RgPgqNLYI8ONM/qzORzHMUZIYf/m77F/b5jmQK+ofULWcmXzpZJy
	RhiRZuDx+7hqmWdA6dArcE/wRdbJVWHD38/nUKuYHM+YwTD5U8h+9reSciXoUJtDEPtL85s7AxFpm
	s6knDrjuFpER5RyzlNw8YqmGpJi/PyrztjGBT980oWW65Oj5SGE8hjNL2l+5RAwRaglhleSvHlL10
	ab9PXa1XyMr5rINmckzjCXmpzlrT2OUc8aj/6eIGjPMM9ur9RY//wwh+tmtGk/PGaPjmNAST7gf9o
	lQgKXNQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdQD-00000007qwh-2321
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 13:03:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKd2W-00000007k92-2mcX
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 12:39:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90CEF5C547C;
	Mon,  9 Dec 2024 12:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7AAC4CEE0;
	Mon,  9 Dec 2024 12:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733747943;
	bh=ngU9mgDLiPW+Jj5JFXStLmp9bwIcUT+Lp2fVYZwvnaE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=QyqIyZCmuZb9Qxx5I66VshErpU7xl/PRW4CyjuqoL+eiEgwTzfR/4eqUtMy8PLoL4
	 53MKH5EtC8ymyhhCisLgTWXOVR2id9VJqx9SJKn6i94cdDXbQazx6NC4GYKpkLw5nM
	 /qETwoTZFO84D4QoUEozz/jBUmJXfAv9NsQxjRInCkwySFBSubt7pS8dAV1MrU7m/D
	 SYSLHhTlNRMYn0XZIsMOGQlfqH6YUv42gBhZk4/GVNYa0Z9LTp61ioMTbLvPQO0frS
	 rTXxa0TtcAcVxAF6q7IjYrBuKV2vN6FRlI/b8Ogewo21spA6+gx7UKz2yhva2boTCe
	 7SxQuS3O74zXg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>,
  ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next] wifi: ath12k: Fix out-of-bounds read
References: <20241206073542.315095-1-dheeraj.linuxdev@gmail.com>
	<8c019176-6bb5-467c-bcea-10517675de7d@oss.qualcomm.com>
Date: Mon, 09 Dec 2024 14:39:00 +0200
In-Reply-To: <8c019176-6bb5-467c-bcea-10517675de7d@oss.qualcomm.com> (Jeff
	Johnson's message of "Fri, 6 Dec 2024 12:06:51 -0800")
Message-ID: <87v7vtrpy3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_043904_753649_3762D891 
X-CRM114-Status: UNSURE (   8.47  )
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

Jeff Johnson <jeff.johnson@oss.qualcomm.com> writes:

> On 12/5/2024 11:35 PM, Dheeraj Reddy Jonnalagadda wrote:
>
> The subject should be as specific as possible while still fitting on one line.
> Ideally the subject should be unique. So at a minimum I'd add "in
> ath12k_mac_vdev_create()"

Nitpicking but sometimes I add the function name in front ('wifi:
ath12k: ath12k_mac_foo(): fix bar'), that way no need to add the 'in'
word. But this is just cosmetics, either way is fine.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

