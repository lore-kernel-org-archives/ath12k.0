Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2961C48260
	for <ath12k@archiver.kernel.org>; Fri, 16 Feb 2024 17:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9b6WPmyHSFQ0legCyttEJQag8nooSGiQ6ao1ETf7E1k=; b=PiKI6e1tz4KTy56rGTWchh+Dv2
	q5Q0eOUuJyKcwebd2GXr8iS6sMECgnN++hOYB4VUG8e/eX3sHt8gHwdRzSEnLdmpulNQ7m4flFIz0
	kxAvVWIcDJmTej0py7r7jvjSbtJUMwD/USBcPbwXaPLusyyDt+Gg9RxMZPKKvWfUEUP3tcjk8RBY3
	nxKytxusNfVbrY7N36HxG/eDFFlBEcgyZO7E8FxkzXyGW3vWvSrT+Ih7/FD2cxhhKeX1QYFQn6LRo
	OShjLy5ruzKf0f/07BhuNuX2UzO2TbHetDoL8UYOPuBGKXuwxc+SJiEjxCvPyZA7s1Fchf9UxZrFe
	cgVaMRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb1bW-000000035dc-2YXD
	for ath12k@archiver.kernel.org;
	Fri, 16 Feb 2024 17:02:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb1bU-000000035cY-0lfR
	for ath12k@lists.infradead.org;
	Fri, 16 Feb 2024 17:02:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A57D362009;
	Fri, 16 Feb 2024 17:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25A94C433F1;
	Fri, 16 Feb 2024 17:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708102943;
	bh=Xd1k6B3rpvnjzH8dFWRFqXG1PC4qd/CXfj52QbnAOJA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=jcEbXpC7e4fSVcPe1/JrT3CbiRRmmg3veIxCcQa27RQSPwTAY+0DerAzQv+3fdXWl
	 zT1ldA09oy3qud4JrJ+ux4CxWbelYIoILkPIQ2EnRXHOpbfCdNmw9rUqd9AW8lWdWg
	 o6z7w7zmfgER1H23ayhPHGX10a9so8kEC0YtRiX1EZggSWEipqPDVtfTPwQMuXlSUK
	 C2rp43VGYM2CDqfRQmmhsCKxXWbl7djk+ZF8zhqu3k/ZRenXe65FEdJXLX6zHUbxw0
	 EMZiIkWYlk52otP8K2gzAhe+lRYUUUdUo0VA0u02oteuZthpUbRC1zwdYPqiFpwa3V
	 /uze4iPUBDiRQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Sriram
 R <quic_srirrama@quicinc.com>
Subject: Re: [PATCH v2 03/12] wifi: ath12k: modify ath12k mac start/stop ops
 for single wiphy
References: <20240206091954.4144454-1-quic_ramess@quicinc.com>
	<20240206091954.4144454-4-quic_ramess@quicinc.com>
	<8734tsnz8i.fsf@kernel.org>
	<2368ff4c-374c-4203-b0f8-f8a761370310@quicinc.com>
Date: Fri, 16 Feb 2024 19:02:20 +0200
In-Reply-To: <2368ff4c-374c-4203-b0f8-f8a761370310@quicinc.com> (Jeff
	Johnson's message of "Fri, 16 Feb 2024 08:45:56 -0800")
Message-ID: <87y1bkmjfn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_090224_282436_9A88E5D5 
X-CRM114-Status: UNSURE (   8.64  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 2/16/2024 8:35 AM, Kalle Valo wrote:
>> Rameshkumar Sundaram <quic_ramess@quicinc.com> writes:
>> 
>>> From: Sriram R <quic_srirrama@quicinc.com>
>>>
>>> When mac80211 does drv start/stop, apply the state change
>>> for all the radios within the wiphy in ath12k.
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>
>>> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
>>> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
>> 
>> I haven't reviewed the patchset fully yet, first quick impressions:
>
> I didn't review it at all since it has a dependency upon a series that
> needs rework, and hence I figure this series will require rework.

Makes sense, I'll then mark this as Changes Requested in patchwork.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

