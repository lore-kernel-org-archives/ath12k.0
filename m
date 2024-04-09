Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA08C67861
	for <ath12k@archiver.kernel.org>; Tue,  9 Apr 2024 11:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Woe2De6lsflDHKTZq1uvLf+zs7Qou7UleKz7+DFao0I=; b=soRA77cfQ/B4deju1m81vmz0oT
	IMUvJRC3woLvC6Odxhg+7dyl4npvrZdr8Q3SNmEcjL16WeZAY8Z9G2ytq24WwlxIibVUBBzCvy2x6
	rqD5eKBN//M3pD0GYElTFnJe++GYH8ZqmvNTh1lRzF+Bnl3sm/rcfkF8XEuPAcVoS8mKy2jwjWRcm
	E8PqMLvx4A9rqteZmKOjl1b5va186ytO78iZL2ch2Z6U8sjg6OtpoPE8YmFMPD7DersDmsprGLKSJ
	dXqgFGyw2iRwz+HoDKBG2sfau+7mcESE2O2l+zgAPTeqdpzxeEbN5K37eru54CNcT/nkf4hkRF4mE
	zUSHPzCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9x0-00000001mWe-4AvO
	for ath12k@archiver.kernel.org;
	Tue, 09 Apr 2024 11:47:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9ws-00000001mUl-2Ndq
	for ath12k@lists.infradead.org;
	Tue, 09 Apr 2024 11:47:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14D92616C2;
	Tue,  9 Apr 2024 11:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4694C433C7;
	Tue,  9 Apr 2024 11:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712663253;
	bh=NmvLM1sOjZAvzKIwPzVoLWwGrDkjhXoEpGYTq24dtbc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Ikt20URzd2sHZawhvH3y3uczgDi/j/XjqzTp+Iq5TqJL8mZz0LV+VlmQ2HiR2Uqz4
	 4+h2VB4vAGSV1iJ+GsZixeqiRWDVtXLL0nVJ+SwKxwBClnkXb+cjTNmSu0XjzQvAhP
	 0Rhal7808mZMnxGLEUQlC+3+CbDw4IK5mq0VUp/seeA8We/o7IEdCkVPgGRscxg+gE
	 zwatwFlPGH4f1oi6MFkw52spbX1mZNQb4EMEKVL0YYewwvc+VEhFmIatRk9MRXBG4x
	 /3JsfzqSRtMBjtmgYMmsLrYVYDJfHxw6Xpg/6gQcNj71bmqXu4MV3RbJtPv6KfKjud
	 OszUSkBRFxNRQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: correct the capital word typo
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240405144524.1157122-1-quic_periyasa@quicinc.com>
References: <20240405144524.1157122-1-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171266325125.3197288.14300733414199687268.kvalo@kernel.org>
Date: Tue,  9 Apr 2024 11:47:32 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_044734_738587_202DC486 
X-CRM114-Status: UNSURE (   5.17  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> Rename the "ATH12k" word to "ATH12K" for consistent capitalization in the
> word.
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

df1f2b947ffa wifi: ath12k: correct the capital word typo

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240405144524.1157122-1-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


