Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7D6CFB449
	for <ath12k@archiver.kernel.org>; Mon,  7 Oct 2024 15:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//T52fMC7WWMt5dTJqaCQlvm8B4Es11mRMKUi0xW2E4=; b=Cu7miOYY4qIz7V3hqcNyd3is98
	vLEweYclvh8FkEJ4aoIur42mX7PLH5hMgXt/L0jmIF1MRkn9kW+yaJ8Pw4zZgv0zG+Lk+b0g/MsMX
	Pt26Jrkwto0yDbt3cCpJr0tbEz1kVLf9Qi0HGcJfKKDgn80XTqgKamAoSAKedhFJQ09ih5pgfHtgK
	CSPn1gM9fPdjiobr/YZaIcqh0R5BGB2GpHP3Cl+Hgn+sTI/7vc/m++260+AtZKfGhFF6DisqkAisM
	rLgVdVLNbOTZKrx0VbIt/+aMfmafEr3ppAoPLIQvJxmGUm97ZNrWsrw3xDVWMejUwx0USd6Mr2j5l
	Ug/17Oxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxq2g-000000032Wj-1nB0
	for ath12k@archiver.kernel.org;
	Mon, 07 Oct 2024 15:53:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxq0G-0000000326c-3bMn
	for ath12k@bombadil.infradead.org;
	Mon, 07 Oct 2024 15:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=//T52fMC7WWMt5dTJqaCQlvm8B4Es11mRMKUi0xW2E4=; b=XCxfdxbuLnRD6WZjN7h0odt3mD
	mg84rBQ5vN6yfkyOhmBXLnRb/MZeneTsf1/eOOwgWSbNPiJGKMycfSQ+DHpRhGmaVy19FJpvDbQd5
	hbP16c08YL7CytMrkgHVDSf+Lfrq8ixzG/bY6zMDw5KYWTX6oCn6tXqds5KkdKsPw3rfDK198sJ2z
	QQoIoqWkk1Og73+CihnoNugLhtQVk4mOdprmNYWeR+ellKRspana85iMt9drA8TtdHerkUI8pJlQc
	vxTN4caeTBLhVlqpS1kXrz4h6vYndIK8qxroht9Lp8bRQPJsBSfqkd4yVvrgZTkvGOQNxgpamnjhN
	hwuBw3/Q==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxq0D-00000004Rbg-1zCW
	for ath12k@lists.infradead.org;
	Mon, 07 Oct 2024 15:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 33BF7A40E1A;
	Mon,  7 Oct 2024 15:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E138EC4CECF;
	Mon,  7 Oct 2024 15:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728316224;
	bh=qML5pkxadoNVXdBJ5X/OIyBz8I3Rh1mFnP9bs/fG8nY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nuf0xLZLVBjmI45TNxIWsfPslO8ijInXjZaK9oSH7BFKHZ3xx26S+JP6RgklMW9RC
	 O5ZOEaqjwxXDHfQSK+BJdS225ubGrTLrutwVwOS86IWRkd1e6Wn/93jQ08rBxdKyUJ
	 un+i9GRIbyIuKUFTa4+l6N+nLrd0rkTT9BVkScExx95iBUG/vZePYQtbxbpacajHTr
	 XVbYtadPq5RwmRbEJvgydCFRNyANtn8mlKLOMP7VZ4qaqEJH2mlzgD4/3+xEK9LDSV
	 CvWlkKwAj++mE24AjVjvSf4KdR2dSTETLN2LxbjEDnq4+cLIEnCrAdW6gAkr+RTnpE
	 4lrxzka9bYZiA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: kernel test robot <lkp@intel.com>,  Rajat Soni
 <quic_rajson@quicinc.com>,  <oe-kbuild-all@lists.linux.dev>,  Jeff Johnson
 <jjohnson@kernel.org>,  <ath12k@lists.infradead.org>,  Roopni Devanathan
 <quic_rdevanat@quicinc.com>
Subject: Re: [ath:pending 8/12]
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2515:77: warning: left
 shift count >= width of type
References: <202410040200.Mwb85JzQ-lkp@intel.com>
	<9db6842d-ddc6-4f0e-a818-c13298eedd8b@quicinc.com>
Date: Mon, 07 Oct 2024 18:50:21 +0300
In-Reply-To: <9db6842d-ddc6-4f0e-a818-c13298eedd8b@quicinc.com> (Jeff
	Johnson's message of "Mon, 7 Oct 2024 08:40:30 -0700")
Message-ID: <87iku352v6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_165029_854569_135488ED 
X-CRM114-Status: GOOD (  16.12  )
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

> On 10/3/2024 11:37 AM, kernel test robot wrote:
>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
>> head:   08dd5d93509f962500dc983864b4effb2600831a
>> commit: f6a46bc3719cc6b445cb071a7dd6968891ffb169 [8/12] wifi: ath12k: Support DMAC Reset Stats
>> config: i386-allmodconfig
>> (https://download.01.org/0day-ci/archive/20241004/202410040200.Mwb85JzQ-lkp@intel.com/config)
>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>> reproduce (this is a W=1 build):
>> (https://download.01.org/0day-ci/archive/20241004/202410040200.Mwb85JzQ-lkp@intel.com/reproduce)
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202410040200.Mwb85JzQ-lkp@intel.com/
>> 
>> All warnings (new ones prefixed by >>):
>> 
>>    drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c: In function 'ath12k_htt_print_dmac_reset_stats_tlv':
>>>> drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2515:77: warning: left shift count >= width of type [-Wshift-count-overflow]
>>     2515 |         time = ((unsigned long)le32_to_cpu(htt_stats_buf->reset_time_hi_ms) << 32) |
>>          |                                                                             ^~
>>    drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2519:81:
>> warning: left shift count >= width of type [-Wshift-count-overflow]
>>     2519 |         time = ((unsigned long)le32_to_cpu(htt_stats_buf->disengage_time_hi_ms) << 32) |
>>          |                                                                                 ^~
>>    drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2523:78:
>> warning: left shift count >= width of type [-Wshift-count-overflow]
>>     2523 |         time = ((unsigned long)le32_to_cpu(htt_stats_buf->engage_time_hi_ms) << 32) |
>>          |                                                                              ^~
>
> Out of curiosity is there a way to tell if this is a 32-bit build vs a 64-bit
> build? I just want to verify that the issue is that unsigned long is 32-bits
> and not that the shift occurs before the typecast

The config is i386-allmodconfig so it has to be 32-bit. The report also
includes link to the actual .config file.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

