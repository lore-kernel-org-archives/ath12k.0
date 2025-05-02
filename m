Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568BCC3ABA9
	for <ath12k@archiver.kernel.org>; Fri,  2 May 2025 05:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTu0M4bQo4EGc3w89RoRRUpKiED9JgIT+DXpJNE6bS8=; b=hBoiaQl/de1Zm1yvTfQLQtV6As
	23zX4cKj3K3IvZNqRXqUnErgF81c4S2uNNZ/so2feINI3uHFq7oSEjpKjc9Da+O4Nj+5WU+/UGB7G
	Xri3pNY8WBehZwMVNDltW1cxAaDeuzDkX1nBfAi6Vv9cyO/AdH88idVOmVZl3KVuUQ64aVBxVUH3P
	Mr+1i/WV6ujjR51amI3B4cE+ZGD+SGquDoJLjpUqR7CQ90uTLg7nAMiSYWzwtvO1TEVyu2B6nR0V0
	C74XJ2FgQ4WAgo0v4LLlWABQkxRUuaiGDT5ZL3ZmHDh8zPVbaTZM1E6Hwls3Q+XPLJR3nvxCKNGYG
	fiH7/rpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAibi-00000000rVs-3sWC;
	Fri, 02 May 2025 05:06:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAibb-00000000rTJ-1zdR;
	Fri, 02 May 2025 05:06:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6276AA4B4DC;
	Fri,  2 May 2025 05:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A66DC4CEE4;
	Fri,  2 May 2025 05:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746162393;
	bh=9JE4pYtNWB/SHJMFnYwXCS9E2BpkOQ7Sf7/0bWmnk0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fh9i/ey0MG5Weu9XsA3P2apGoeurMNEyuRXvRw4bhLKJ9XQxC1k4KD7swj2C8saoM
	 Yan7v+d3C+4wiN7A/9DqilGy28/yB/+Md9s3tSsXBOwdlo80r8EfyabcboJIKbnhVh
	 K0hL1IafBJKqjRnBoE/RRG+onqDVn5tqWc0C31VE=
Date: Fri, 2 May 2025 07:06:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Youssef Samir <quic_yabdulra@quicinc.com>,
	Matthew Leung <quic_mattleun@quicinc.com>,
	Yan Zhen <yanzhen@vivo.com>, Alex Elder <elder@kernel.org>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Kunwu Chan <chentao@kylinos.cn>,
	Troy Hanson <quic_thanson@quicinc.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>, kernel@collabora.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org
Subject: Re: [PATCH v3] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
Message-ID: <2025050254-astride-grapple-797e@gregkh>
References: <20250429122112.104472-1-usama.anjum@collabora.com>
 <2025050110-unpeeled-spur-e4af@gregkh>
 <bdc89d09-ce50-43a4-9043-3ca6a9245eb4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdc89d09-ce50-43a4-9043-3ca6a9245eb4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_220637_183648_14845790 
X-CRM114-Status: GOOD (  23.27  )
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

On Fri, May 02, 2025 at 09:15:10AM +0500, Muhammad Usama Anjum wrote:
> Hi Greg,
> 
> On 5/1/25 9:00 PM, Greg Kroah-Hartman wrote:
> > On Tue, Apr 29, 2025 at 05:20:56PM +0500, Muhammad Usama Anjum wrote:
> >> Fix dma_direct_alloc() failure at resume time during bhie_table
> >> allocation. There is a crash report where at resume time, the memory
> >> from the dma doesn't get allocated and MHI fails to re-initialize.
> >> There is fragmentation/memory pressure.
> >>
> >> To fix it, don't free the memory at power down during suspend /
> >> hibernation. Instead, use the same allocated memory again after every
> >> resume / hibernation. This patch has been tested with resume and
> >> hibernation both.
> >>
> >> The rddm is of constant size for a given hardware. While the fbc_image
> >> size depends on the firmware. If the firmware changes, we'll free and
> >> allocate new memory for it.
> >>
> >> Here are the crash logs:
> >>
> >> [ 3029.338587] mhi mhi0: Requested to power ON
> >> [ 3029.338621] mhi mhi0: Power on setup success
> >> [ 3029.668654] kworker/u33:8: page allocation failure: order:7, mode:0xc04(GFP_NOIO|GFP_DMA32), nodemask=(null),cpuset=/,mems_allowed=0
> >> [ 3029.668682] CPU: 4 UID: 0 PID: 2744 Comm: kworker/u33:8 Not tainted 6.11.11-valve10-1-neptune-611-gb69e902b4338 #1ed779c892334112fb968aaa3facf9686b5ff0bd7
> >> [ 3029.668690] Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
> >> [ 3029.668694] Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
> >> [ 3029.668717] Call Trace:
> >> [ 3029.668722]  <TASK>
> >> [ 3029.668728]  dump_stack_lvl+0x4e/0x70
> >> [ 3029.668738]  warn_alloc+0x164/0x190
> >> [ 3029.668747]  ? srso_return_thunk+0x5/0x5f
> >> [ 3029.668754]  ? __alloc_pages_direct_compact+0xaf/0x360
> >> [ 3029.668761]  __alloc_pages_slowpath.constprop.0+0xc75/0xd70
> >> [ 3029.668774]  __alloc_pages_noprof+0x321/0x350
> >> [ 3029.668782]  __dma_direct_alloc_pages.isra.0+0x14a/0x290
> >> [ 3029.668790]  dma_direct_alloc+0x70/0x270
> >> [ 3029.668796]  mhi_alloc_bhie_table+0xe8/0x190 [mhi faa917c5aa23a5f5b12d6a2c597067e16d2fedc0]
> >> [ 3029.668814]  mhi_fw_load_handler+0x1bc/0x310 [mhi faa917c5aa23a5f5b12d6a2c597067e16d2fedc0]
> >> [ 3029.668830]  mhi_pm_st_worker+0x5c8/0xaa0 [mhi faa917c5aa23a5f5b12d6a2c597067e16d2fedc0]
> >> [ 3029.668844]  ? srso_return_thunk+0x5/0x5f
> >> [ 3029.668853]  process_one_work+0x17e/0x330
> >> [ 3029.668861]  worker_thread+0x2ce/0x3f0
> >> [ 3029.668868]  ? __pfx_worker_thread+0x10/0x10
> >> [ 3029.668873]  kthread+0xd2/0x100
> >> [ 3029.668879]  ? __pfx_kthread+0x10/0x10
> >> [ 3029.668885]  ret_from_fork+0x34/0x50
> >> [ 3029.668892]  ? __pfx_kthread+0x10/0x10
> >> [ 3029.668898]  ret_from_fork_asm+0x1a/0x30
> >> [ 3029.668910]  </TASK>
> >>
> >> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> >>
> >> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> > 
> > What commit id does this fix?  Should it go to stable kernel(s)?  If so,
> > how far back?
> This patch is fixing the dma_coherent_alloc() failure when there is
> memory pressure and its unable to allocate memory. Its not a bug in
> allocation API or the driver. I think it should be considered an
> improvement instead of the fix. Please correct me if I'm wrong.

You show a kernel crash in the changelog, that's a major issue (i.e.
will get assigned a CVE), so you need to show what commit id it fixes
for people to know how far back to take the fix to.

thanks,

greg k-h

