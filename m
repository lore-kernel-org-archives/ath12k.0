Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AB7C021B3
	for <ath12k@archiver.kernel.org>; Thu, 20 Feb 2025 22:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZS9Q9WqcwLiUdcljiokrz+IM5SfsQCqkS/SZsmclhp0=; b=AfQ18UO6p0a5Eo7NuVNf9Vgqa5
	6bqEIni+SCE0hQbqrDPYEC6idx61Spf9mUh3cyYuWfe0NmDpkXb2N6WWsovJcV/MtLueT4r6EMU6D
	pqutrAEispqdLBxK3TUdy4olLjyJaXoifTEYgAGsdILlq8ayoqkxkcz2u2Q+5JBdZ0C3u+iu6OGN2
	GkYKUylCl7tF+BDbmIyVgBK/F7vW08TvfCeBDJXCzImEdCFEK7ajworTjzz2L5Pf9zU6Ju8Qz2Ze1
	yoRIqOAduYoCb0ZU0xqNrYrQEJ4SvIozDSQUG4MVFFYihA5o9SdxpLPPjKMNL1Uo2VLhOISH0wNah
	X3Z26c9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEf4-000000034oJ-1pr1
	for ath12k@archiver.kernel.org;
	Thu, 20 Feb 2025 22:04:50 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEf2-000000034nn-3Chu
	for ath12k@lists.infradead.org;
	Thu, 20 Feb 2025 22:04:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54E1668310;
	Thu, 20 Feb 2025 22:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9356C4CED1;
	Thu, 20 Feb 2025 22:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740089087;
	bh=uihc167KrdTrO3EXNbTDVRhAtMtOiSXVR0xiKhEB1uk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=fuVRn1eBGFijgqaMToS+5aZSPHWQ7TDUp9r+axJ/p/g7q19AwOFCYp8zzW3FzYaHT
	 CUwZbzampzgFEkSnbHnTzkELwEwO5Lv1x20HU8S5fJSRR7zU5YX78dTCwfXfPt6o/8
	 nhiFnPUflO2/oiZFpu9WK2DgH0+WqKse2J5p9Ql/SWXQHyc1lsHMHYjrk7b4TIK3+x
	 Pr6AvKV4w5W8tepcBP1nb20YkexHatFxdH944ao1LaiUPvQr2sA0L8mywu6Mg5PvJo
	 zoe/evoGfAFgzEUVZhhuxQbNt5UF+NdlhbHDc0IaWqzO1fFsqH2bG/z79MPdyI/enp
	 +fybSXU80NO5A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 50CD4CE0B34; Thu, 20 Feb 2025 14:04:47 -0800 (PST)
Date: Thu, 20 Feb 2025 14:04:47 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: rcu@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
	rostedt@goodmis.org, Jens Axboe <axboe@kernel.dk>,
	ath12k@lists.infradead.org
Subject: Re: [PATCH rcu 1/9] rcu: Add lockdep_assert_in_rcu_read_lock() and
 friends
Message-ID: <67063387-6ba9-47fe-b283-d6346da15d9a@paulmck-laptop>
References: <657595c8-e86c-4594-a5b1-3c64a8275607@paulmck-laptop>
 <20240604222355.2370768-1-paulmck@kernel.org>
 <9130e3da-1cc5-43ea-9153-47117d57caca@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9130e3da-1cc5-43ea-9153-47117d57caca@oss.qualcomm.com>
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
Reply-To: paulmck@kernel.org
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On Thu, Feb 20, 2025 at 11:38:14AM -0800, Jeff Johnson wrote:
> On 6/4/24 15:23, Paul E. McKenney wrote:
> > There is no direct RCU counterpart to lockdep_assert_irqs_disabled()
> > and friends.  Although it is possible to construct them, it would
> > be more convenient to have the following lockdep assertions:
> > 
> > lockdep_assert_in_rcu_read_lock()
> > lockdep_assert_in_rcu_read_lock_bh()
> > lockdep_assert_in_rcu_read_lock_sched()
> > lockdep_assert_in_rcu_reader()
> > 
> > This commit therefore creates them.
> 
> I'm looking at some downstream code that is trying to become
> upstream compliant, and currently that code uses:
> 
> 	RCU_LOCKDEP_WARN(!rcu_read_lock_held(), "some message");
> 
> It seems like this would be a good use of one of these helper
> functions, but I'm shocked to see that no upstream code is using
> them yet.
> 
> Is there a reason to not use these helpers?

In cases where there is no additional useful information that can be
placed in "some message", the new helpers should be just fine.

							Thanx, Paul

