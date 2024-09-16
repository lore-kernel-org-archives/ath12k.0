Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A2CC3ABA2
	for <ath12k@archiver.kernel.org>; Mon, 16 Sep 2024 08:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+3W22zWX9JosYAYn3iRGCW+yCT0q9NqXcbTRnPgOoM=; b=qBIUC404t82X3GLv32MQ75O8zN
	thr0JdyCeigBM2yqwS2/EbstB50q/o6RpN80m87afHxINZEQkZxShHiHwKw2AVgHsy/YwSqqEwkDl
	pQltObR3C6psfEcFz+C4HNLeQq2XIqWuA2L8qzgeW8M2Yer0b2/fm/IE5H+nGtYPNkYY25nhXVKac
	fo3chZAr+6csZje9G3791t53UDUiANIIkF5z0bKrHoRoV128vDEvh0EMc/C73kqJDTqIdd1Md0mfL
	7y7YnP0/GLTtjLF4aABxdd2FExnd0Re8+piLgqNTalSjPGtAR7IlHvPGOrMnIUdeTsCERj9ibqttr
	TkWSh/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq7PW-00000003TZE-2idl
	for ath12k@archiver.kernel.org;
	Mon, 16 Sep 2024 08:48:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq7PT-00000003TXd-1PeY
	for ath12k@lists.infradead.org;
	Mon, 16 Sep 2024 08:48:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CC84EA41AA4;
	Mon, 16 Sep 2024 08:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E99C4CECC;
	Mon, 16 Sep 2024 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726476518;
	bh=wMEw+O32kPOdB78c5Nosgma+FyxCKzmalJs08g+2P6k=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=USOTt8lUX27HLEXxrYmbGOmiP8iqbleNMBLZuxTQo9fRhtUethCdjUtScIFQPnFle
	 9euuarKiL4tE1ecRTn4A4NcyndFNkad4mODto3TGJ6B/tJEYW9utnOVlRMc+6YbZks
	 AWdSnZdDvTB3s+QmTEgFjofJYj17qGKKUlLHK3XF5kmLQiYOiunTM9LUGiOinEOuXY
	 IL8/NF0a34Mwc+AAvYSA1dHS0VKZzFAGgb5DtCAUOWHHGekURykmSX6Lr9dZ2uNXun
	 JvDkoNKXuYqA4crqQp6zm7ia0zXz1sUeyZyocTXqkN4Da4IJ+Ge+td7xvGmfldoMgy
	 WTKBn4qBHAW5A==
From: Kalle Valo <kvalo@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Rameshkumar Sundaram <quic_ramess@quicinc.com>,  llvm@lists.linux.dev,
  oe-kbuild-all@lists.linux.dev,  Jeff Johnson <jjohnson@kernel.org>,
  ath12k@lists.infradead.org,  Kalle Valo <quic_kvalo@quicinc.com>
Subject: Re: [ath:ath12k-mlo 34/63]
 drivers/net/wireless/ath/ath12k/mac.c:4289:8: warning: variable 'ret' is
 used uninitialized whenever 'if' condition is true
References: <202409151616.hnCxh90B-lkp@intel.com>
Date: Mon, 16 Sep 2024 11:48:34 +0300
In-Reply-To: <202409151616.hnCxh90B-lkp@intel.com> (kernel test robot's
	message of "Sun, 15 Sep 2024 16:57:47 +0800")
Message-ID: <87ikuwdlwd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_014839_475198_FB3BE6F3 
X-CRM114-Status: GOOD (  10.10  )
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

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo
> head:   8f61af03fddc0a30bdf49e06a13eafff3cec91b0
> commit: ec3755e39b7ae8f7ed9853e6169fa5e307b9fb90 [34/63] wifi: ath12k: modify ath12k_mac_op_set_key for MLO
> config: x86_64-allyesconfig
> (https://download.01.org/0day-ci/archive/20240915/202409151616.hnCxh90B-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build):
> (https://download.01.org/0day-ci/archive/20240915/202409151616.hnCxh90B-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409151616.hnCxh90B-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/net/wireless/ath/ath12k/mac.c:4289:8: warning: variable
>> 'ret' is used uninitialized whenever 'if' condition is true
>> [-Wsometimes-uninitialized]

I fixed this now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

