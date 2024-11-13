Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46264D41C36
	for <ath12k@archiver.kernel.org>; Wed, 13 Nov 2024 10:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoaiZ4VyDIaxJ8Zt4GWHijKuc/CtUPDzn8h3Kp0HjqM=; b=jOT3kaJAUYGhJje+d3LtiWzMUG
	jBs6HhFkgP6qKWeh4AGBMqYNN6um2kre3hplfJd5JEU9n++VM3g0j75f7H1lyCIYfTijejfPAPnE3
	ZRjtN9FSK/ItAnXFpDbhFjGssn0Z0Fi4Y2uiiCN2tGA/T2SxonSBQZvlnXMr7zptPVJbK4dXLI9WL
	Qaf1kHEjkyrJABBSljxISAhz8bkqX7hddcpWAVlSxAVHAli8uui4WRAz/qg/rwqqCivQUnPUuF5TD
	Yb6fbMc37tTay/D6q5Vn/sttHggI7dCH9y4UGeb8F+PR7pX0zJ7cJA/4QZO8nev6XztRbSHq1qGac
	8f0gNVkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBB4s-00000006WH2-42gO
	for ath12k@archiver.kernel.org;
	Wed, 13 Nov 2024 10:58:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBB4q-00000006WGe-2TGF
	for ath12k@lists.infradead.org;
	Wed, 13 Nov 2024 10:58:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7368FA406A2;
	Wed, 13 Nov 2024 10:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF682C4CECD;
	Wed, 13 Nov 2024 10:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731495503;
	bh=ZjTRsOF4qwzLsDiCUTq+yM1yuZi+CSMqTmTWlNn1XbU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=LlJMiHfeVwv+O1yoEQl0PLijxDj9yEa2UrHg6x6hfWKFbmjT/MEX9q1n+H7S3rPba
	 9oB0fGCLUaLZ6gaIUmaE7k1khvDai2HijLZqVyqDf3Gb3LKAYMygmOp76VnHVmLZaV
	 8OxI3KuBvuNC+BMvA54o7OQs5b+3tb/qfE75s+cKylvIGResq7r/01bd/NtWNp/gSO
	 vWZSOnuqF4XeVQS8RBIIkSbbTj9z/AeSV6Q8AGMoOX0TAPKXbBD86lPKUgaN9ysBK4
	 sHWK1gWMquOw9FM43nVYMhTEpBG9G5PPeO760k+XtT8vxVFw+R1xUshSNCCSambjwe
	 vlitQF+vVMDCA==
From: Kalle Valo <kvalo@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Jakub Kicinski <kuba@kernel.org>,  oe-kbuild-all@lists.linux.dev,  Jeff
 Johnson <jjohnson@kernel.org>,  ath12k@lists.infradead.org,  Jeff Johnson
 <quic_jjohnson@quicinc.com>
Subject: Re: [ath:master 2/4]
 drivers/net/ethernet/intel/ice/ice_ptp.c:165:15: error: implicit
 declaration of function 'ice_read_sma_ctrl'; did you mean
 'ice_read_sr_word'?
References: <202411131838.DE0FWg8Q-lkp@intel.com>
Date: Wed, 13 Nov 2024 12:58:19 +0200
In-Reply-To: <202411131838.DE0FWg8Q-lkp@intel.com> (kernel test robot's
	message of "Wed, 13 Nov 2024 18:31:45 +0800")
Message-ID: <87ldxn2yes.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_025824_715300_4A5FD126 
X-CRM114-Status: GOOD (  11.37  )
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

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
> head:   fc6f018eda7f9054e427f731db1e8b200f22873c
> commit: 33e2bcda33620fc43cc948627be525ddb342c446 [2/4] Merge branch 'ath-current'
> config: arc-allyesconfig
> (https://download.01.org/0day-ci/archive/20241113/202411131838.DE0FWg8Q-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build):
> (https://download.01.org/0day-ci/archive/20241113/202411131838.DE0FWg8Q-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411131838.DE0FWg8Q-lkp@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>    drivers/net/ethernet/intel/ice/ice_ptp.c: In function 'ice_ptp_set_sma_cfg':
>>> drivers/net/ethernet/intel/ice/ice_ptp.c:165:15: error: implicit
>>> declaration of function 'ice_read_sma_ctrl'; did you mean
>>> 'ice_read_sr_word'? [-Werror=implicit-function-declaration]
>      165 |         err = ice_read_sma_ctrl(&pf->hw, &data);
>          |               ^~~~~~~~~~~~~~~~~
>          |               ice_read_sr_word
>>> drivers/net/ethernet/intel/ice/ice_ptp.c:187:16: error: implicit
>>> declaration of function 'ice_write_sma_ctrl'; did you mean
>>> 'ice_write_intrl'? [-Werror=implicit-function-declaration]
>      187 |         return ice_write_sma_ctrl(&pf->hw, data);
>          |                ^~~~~~~~~~~~~~~~~~
>          |                ice_write_intrl

Our ath.git master branch is an integration branch of other branches and
it's not sent forward to other trees. Looks like we did a merge error in
the master branch but no action needed as it's only within ath.git.
We'll try to fix it the next time we update the master branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

