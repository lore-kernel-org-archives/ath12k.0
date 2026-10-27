Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6302606A31A
	for <ath12k@archiver.kernel.org>; Tue, 27 Oct 2026 15:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LUbPc4H0;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RfC95asv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxV28An5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JaqaLjrmwy7fdzHOEJtle5+O6Kddtcs9UQZqSzs60sw=; b=LUbPc4H0b+dyUH7upBn+3nbGYW
	/U88aHmhAJCl+XCP1Tq+adZQXKen92WcPpLgR6r4jgh66+ZVQ6KS/OFGIxZDN4mUgIMrngryHR6h6
	brEJY2Fcx5MH7sOPL6RAGuM5XDBLcwNVI2seUapEDjEHApQ9uURXPr+wBhcKrKbLDTJpfUUh0LcaF
	0TVcifirYLxoWsRh4RCqvRrXBN2f8RjVd/xvgbaFuM+3F2RaHwZ8HolglU8JnpHLyQtrqJjZMUyTZ
	JcFpIoVF/WDLrgAE8i1P3c1FEI+fw+46AkXCF5RwSVRumN5sw/X4RG4kSb3ToDEGsAryhwYtO5zA3
	smqmg8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjEL-00000005Bhv-3PPp;
	Tue, 27 Oct 2026 15:36:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjEI-00000005BhW-2hps
	for ath12k@lists.infradead.org;
	Tue, 27 Oct 2026 15:36:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFKvKt2548911
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 15:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JaqaLjrmwy7fdzHOEJtle5+O
	6Kddtcs9UQZqSzs60sw=; b=RfC95asvO3wBuKKfTiSHSaEcUiMx7L9WepLVdFew
	SHc451TdHYCuykvg0xVZVIJSIBpVkpEH/tWFAMZG209pfBUTly/bYWCT3miLfjGa
	jBPQGtotY7AEqEFqOfv+CxvCmJVb4gRBwXkEITAWt3K5Imppa47wJihjd4gsE4o/
	fNCrX0Cq1Fwnazq+hrQOp/g4NWDHU4Uzn8BesIbilsYizt8WZ3ZMbJO8FGcCWret
	G1DbFM910nhwWRi59JUdZuB+/7cWlCJXRPkbqKdSEwncgsZZmgXSTYI47d6uXKcx
	yBQ8sOgEm8843TgbDpK9gekvdSZwxwZ2/7Gd1aetLQG5Gg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq69nq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 15:36:48 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6e0063e7a02so77929eaf.2
        for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 08:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793115408; x=1793720208; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JaqaLjrmwy7fdzHOEJtle5+O6Kddtcs9UQZqSzs60sw=;
        b=jxV28An5NFn7vAYqJ9XE5La8OQOgyS5uKtb1QPswXMXd+n5u60LWjJ9k1x+9q9bTrJ
         A0gKVqhjXa3rNp3bVPGAFg98okLJTL7y2t+HT0uOprFrQeQfuGfxQN7Rz+TjXZ1ARQxz
         yuaee4oER7s6j7m27btae+2Mauu3oTd3bCUT6ni2h5/CHh6LPc2Fhyqk4+iKaURo3CEn
         Hjqf6Xn9D0VFJSHNJl5JHwOTz2OCNUfKZrI/3uUIvTNx/KDUur2BVdChi82BNh6eACLg
         LnSbSHmErmllwzAmMh67WscZDL1hbZMQC+FZpQrNVsx1pPyboQ7iLlrPqJDJLdCana2O
         USQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115408; x=1793720208;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaqaLjrmwy7fdzHOEJtle5+O6Kddtcs9UQZqSzs60sw=;
        b=HgYIEwxdzjpiUx638Suuq1UQAQ5O+5+RWmdDX5Ib9xyzT4NTLdIo2ejmbaFYxe1g/u
         7mQSjcQuat5q0RcvhR5eus0xXVuncqeXCtsxlxyQey03+e4n0bN+Sc198EYuZ/cX3/NB
         2a+0/PUSenq0vS1G54tWuSsa2tVUeFVtVgnrbHaWYoe53dH/Qufdu1n9mt700UcrT6mJ
         8GXXWjxNGLCWQkbW12QVFTE2u4hoXgKHVdB+hwLLSSYKU1W3BmGU5igMs1mVzHYd+C6B
         YJVe6Q7uKCCwM4ZBbI6zzZeoXEwkLpBX7UNg2mIvlJBQcbnXz4iLUD7id7TRjLsqCaz5
         uxAA==
X-Forwarded-Encrypted: i=1; AKwUvBzm/e9aLj9BvPqdNQurP0koERm/jexwJWTDGm0zLOPvb1frZEZ1osWijjip8e68BOk4eCz9PeQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYLtQgT6oWCWtgwmLFYjWl/HZwJqSHrQJB8TPJVQLxip5ATjxCnN
	ArV24wFlHJvHXla8iymd/1tpsRfD0FYG5Nal28BYEBauDM3ed7AmcTQJxOQugqpXUjenoSLD704
	75yPTBshBZEIjDB0+OGsJBL3wpYfqpnxcbE0omuVYMr3FgV4fHM9TfuJnAZLxpcnK
X-Gm-Gg: AYBFou0GpYufPjf4BOEQ3isM7VqZwNiW0V16iPBkSmdR8b+JX6Qfb10CoBX8ygcUljF
	r5NFVeGfNTBux9I333Mapu+Mb1eWfcVYPjp8DxKOPkqo/19V+GZM+gh8TbFHn+UsLSyIjSIXTu/
	OCslI/JyASMMyQEa8KKmTpWBy6eNbPVN0gJwHTxrxomRz2oJmoSdKC7Q+4nNwUJD9Q0F6e32msY
	GvL5lQuZRciYP2woA473dlGffXUaVShhJc9xB8/dfybJaEnUjRyaCMPROqav80AM+fL3lNQBp0N
	AwXJu5W0xn5adu4QE2S9cz+43IZkSMke6Nwr1UEYB/smxLMVp9VAIEle2H3rwjeRAIWQoYCk9fD
	pv5UX+GivfDoDMN/7Br9SZ4tcQnWpD5MNo4ulHfR7zg==
X-Received: by 2002:a05:6820:221c:b0:713:9556:572 with SMTP id 006d021491bc7-71395561134mr419728eaf.40.1793115407559;
        Tue, 27 Oct 2026 08:36:47 -0700 (PDT)
X-Received: by 2002:a05:6820:221c:b0:713:9556:572 with SMTP id 006d021491bc7-71395561134mr419711eaf.40.1793115407003;
        Tue, 27 Oct 2026 08:36:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e04aa58sm11128084eaf.7.2026.10.27.08.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:36:46 -0700 (PDT)
Date: Tue, 27 Oct 2026 23:36:40 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com,
        stable@vger.kernel.org
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
Message-ID: <auDFCMlOJGhGbbL9@QCOM-aGQu4IUr3Y>
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y>
 <atoTUgEIfkg6b29U@QCOM-aGQu4IUr3Y>
 <cbfa35c9-cfa5-4eb5-a203-09c9069e3b0b@oss.qualcomm.com>
 <atrJv0wgF20tmuDr@QCOM-aGQu4IUr3Y>
 <38fc5a6d-c019-43bb-98f6-ba6a667c64e1@oss.qualcomm.com>
 <atrYGgGWB_zQIrc1@QCOM-aGQu4IUr3Y>
 <7ada1074-9c84-4708-b5d6-9790b9f6f3c5@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ada1074-9c84-4708-b5d6-9790b9f6f3c5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0c510 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=xoSu3tygczuAq7DmB4IA:9
 a=CjuIK1q_8ugA:10 a=-UhsvdU3ccFDOXFxFb4l:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: S6gy1bko6GwEYbiEPr3FXGxJ4cf2K5as
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfX85KQT7Rq7mCh
 bzt5Of7/LO6HKXVo6V1JhLV3kU/sgzQSSkfOa3hDlCOndhFvFgYY4jSoENCbHqeu8BxLqIVYi8R
 BzqaEBQ+sI9m/eSoanyYm+j2h5AbJeI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfX8fOCqh7I5FVk
 UKNuIZzs/dumUQVeQyuDNkce9muaWF7KAV2OeIkEJPk7DVABpJzXI42QvHX/9zstkTNmHtJm5lU
 2C8XdNV3FvMlHpMN9vSTfA1akNMAOzQUOxM+j/N0pp9NHRreGBCX7OoCROfwrC3iOqKTnZpBjr0
 dIz806lH8OlIqOMuC14cvP9ewY2Efw2jZeanm1R69AvbEYVQjBWosVNTPmI8Ko7dnNg4ASUejTq
 hPPjQ5OoCgxa/RqWWy2kioZlZJ9stmgGzSc4clY/Xnk/D79ypV7iCDzjzuyxWQzpJ9FERmVkbH4
 q2qBKniznDQC0Rv6K81JfSb9Npdo3absWt3uRa4+PwAZyKSbaQvkP5yrACaK6MkwQXnMYwyidAM
 oJeb2bBqAXJRD68HJm47UaRqtUS4xa5ikrwAZFv4uo0jSPnm32sfLlyOZIkHiCU0BMJsYkfUP/c
 ej5nZ8rdALJCiFje9ow==
X-Proofpoint-ORIG-GUID: S6gy1bko6GwEYbiEPr3FXGxJ4cf2K5as
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_083650_835961_DBA1F56E 
X-CRM114-Status: GOOD (  36.10  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

+ stable list

On Mon, Oct 26, 2026 at 05:47:31PM -0700, Jeff Johnson wrote:
> On 10/22/2026 8:44 PM, Shawn Guo wrote:
> > + Jeff
> > 
> > On Fri, Oct 23, 2026 at 11:13:56AM +0800, Baochen Qiang wrote:
> >>
> >>
> >> On 10/23/2026 10:43 AM, Shawn Guo wrote:
> >>> On Fri, Oct 23, 2026 at 10:13:18AM +0800, Baochen Qiang wrote:
> >>>> On 10/22/2026 9:44 PM, Shawn Guo wrote:
> >>>
> >>> [...]
> >>>
> >>>>> I bisected drivers/net/wireless/ath/ath12k between v7.3 (broken) and
> >>>>> the ath tag (working). It lands on:
> >>>>>
> >>>>>   15f7603b69a8 ("wifi: ath12k: Increase RXDMA buffer ring size for default memory profile")
> >>>>>
> >>>>> The previous commit, 643f0bf93617, still has 4096 entries and is broken.
> >>>>> 15f7603b69a8 changes one line, .rxdma_buf_ring_size from 4096 to 8192,
> >>>>> and works.
> >>>>
> >>>> thanks for sharing this. I can repro it using the 481 firmware once get 15f7603b69a8 reverted.
> >>>
> >>> Thanks for confirming!
> >>>
> >>>> so the rule here seems that rxdma_buf_ring_size must be at least twice as large as
> >>>> DP_RX_MAC_BUF_RING_SIZE (I also tries four times large, it works). This rule looks
> >>>> reasonable to me, since WCN7850 get twos HW MACs and its firmware setups rx_mac_buf ring
> >>>> for each, and each ring fills itself using the buffers all from the single RXDMA buffer ring.
> >>>>
> >>>> maybe I should submit a patch mandate this rule.
> >>>
> >>> I'm more concerned about how we would fix the regression for 7.3.x stable
> >>> kernel.
> >>
> >> we can try to ask stable team to backport 15f7603b69a8 ?
> > 
> > Ok, I can do the backport after the commit lands mainline, assuming it's
> > part of Jeff's PR for 7.4 merge window.
> It's in Linus' tree now
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=15f7603b69a83a0acc7fcc8992ecbea6110f9424
> 
> Would obviously need to backport the entire series:
> https://lore.kernel.org/all/20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com/

Thanks for the pointers, Jeff!

If we want to backport the series as it is, we will need to cherry pick
the following 9 commits onto 7.3 stable kernel.

  wifi: ath12k: Increase RXDMA buffer ring size for default memory profile
  wifi: ath12k: Make RXDMA buffer ring size configurable per memory profile
  wifi: ath12k: convert DP_RX_RELEASE_RING_SIZE to inline helper
  wifi: ath12k: convert ATH12K_RX_DESC_COUNT to inline helper
  wifi: ath12k: convert ATH12K_NUM_POOL_TX_DESC to inline helper
  wifi: ath12k: convert DP_RXDMA_MONITOR_DST_RING_SIZE to inline helper
  wifi: ath12k: convert DP_RXDMA_MONITOR_BUF_RING_SIZE to inline helper
  wifi: ath12k: convert DP_TX_COMP_RING_SIZE to inline helper
  wifi: ath12k: move dp_profile_params to dp.h

Since most of them are not qualified as stable materials, I'm considering
the adapted patch below. What do you think?

Shawn


---8<------

From 7cb5ef07401ce8c8f0d512bb3a6521a5451046d7 Mon Sep 17 00:00:00 2001
From: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 14:53:33 +0530
Subject: [PATCH] wifi: ath12k: Increase RXDMA buffer ring size for default
 memory profile

commit 15f7603b69a83a0acc7fcc8992ecbea6110f9424 upstream.
commit 643f0bf936176c114d5631da7547e991b5d99f10 upstream.

The default RXDMA buffer ring size of 4096 entries can become a
bottleneck under high RX traffic load, resulting in reduced receive
throughput due to limited buffer availability.

Increase the RXDMA buffer ring size to 8192 entries for the default
memory profile to provide additional RX buffering and improve RX packet
processing efficiency.

This increases memory consumption by approximately 9-10 MiB and improves
RX throughput by ~20% with the default memory profile
(ATH12K_QMI_MEMORY_MODE_DEFAULT).

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Link: https://patch.msgid.link/20261007-mpp_ws-v1-2-739b1fb87d24@oss.qualcomm.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Backport rationale (not part of the upstream message):

v7.3 contains 58aeb412495a ("wifi: ath12k: change MAC buffer ring size
to 4096"), which sets DP_RX_MAC_BUF_RING_SIZE to 4096 while the RXDMA
buffer ring is also 4096 entries. With WCN7850 hw2.0 and the older
firmware WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 (still
shipped by Debian trixie, firmware-atheros 20250410-2), every WMI
command then times out once the interface is brought up:

  ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
  ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
  ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
  ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11

so WiFi does not work at all on affected systems. With the RXDMA buffer
ring at 8192 entries, v7.3 works with the same firmware. Per Yingying
Tang, the RXDMA buffer ring needs to be at least twice
DP_RX_MAC_BUF_RING_SIZE (four times also works): WCN7850 has two
hardware MACs, the firmware sets up an rx_mac_buf ring for each, and
both fill themselves from the single RXDMA buffer ring. Newer firmware
(WLAN.HMT.1.1.c5-00302 and later) is not affected.

Reverting 58aeb412495a is not preferable, as that gives up the
throughput improvement it provides for newer firmware.

Fixes: 58aeb412495a ("wifi: ath12k: change MAC buffer ring size to 4096")

[ Adapted for 7.3: 643f0bf93617 ("wifi: ath12k: Make RXDMA buffer ring
  size configurable per memory profile"), on which this commit depends,
  is not in 7.3 and does not apply because the profile parameters
  structure lives in core.h here. Fold its rxdma_buf_ring_size field
  and DP_RXDMA_BUF_RING_SIZE(ab) accessor into this backport. Values are
  as upstream after both commits: 8192 for the default profile and 4096
  for the low-512M profile. ]

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c  | 2 ++
 drivers/net/wireless/ath/ath12k/core.h  | 1 +
 drivers/net/wireless/ath/ath12k/dp.h    | 3 ++-
 drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index b0107cde99ff..b25202effb00 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -54,6 +54,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 			.num_pool_tx_desc = 32768,
 			.rx_desc_count = 12288,
 			.rx_release_ring_size = 16384,
+			.rxdma_buf_ring_size = 8192,
 		},
 	},
 [ATH12K_QMI_MEMORY_MODE_LOW_512_M] = {
@@ -68,6 +69,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 			.num_pool_tx_desc = 16384,
 			.rx_desc_count = 6144,
 			.rx_release_ring_size = 8192,
+			.rxdma_buf_ring_size = 4096,
 		},
 	},
 };
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 93fd227b4d19..6941cd41551d 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -934,6 +934,7 @@ struct ath12k_dp_profile_params {
 	u32 num_pool_tx_desc;
 	u32 rx_desc_count;
 	u32 rx_release_ring_size;
+	u32 rxdma_buf_ring_size;
 };
 
 struct ath12k_mem_profile_based_param {
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index bef0f2ba0560..53f7cd990892 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -202,10 +202,11 @@ struct ath12k_pdev_dp {
 #define DP_REO_REINJECT_RING_SIZE	32
 #define DP_RX_RELEASE_RING_SIZE(ab) \
 	((ab)->profile_param->dp_params.rx_release_ring_size)
+#define DP_RXDMA_BUF_RING_SIZE(ab) \
+	((ab)->profile_param->dp_params.rxdma_buf_ring_size)
 #define DP_REO_EXCEPTION_RING_SIZE	128
 #define DP_REO_CMD_RING_SIZE		256
 #define DP_REO_STATUS_RING_SIZE		2048
-#define DP_RXDMA_BUF_RING_SIZE		4096
 #define DP_RX_MAC_BUF_RING_SIZE		4096
 #define DP_RXDMA_REFILL_RING_SIZE	2048
 #define DP_RXDMA_ERR_DST_RING_SIZE	1024
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 8fa0e90b4531..d1f0ac152dd4 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1702,7 +1702,7 @@ int ath12k_dp_rx_alloc(struct ath12k_base *ab)
 	ret = ath12k_dp_srng_setup(ab,
 				   &dp->rx_refill_buf_ring.refill_buf_ring,
 				   HAL_RXDMA_BUF, 0, 0,
-				   DP_RXDMA_BUF_RING_SIZE);
+				   DP_RXDMA_BUF_RING_SIZE(ab));
 	if (ret) {
 		ath12k_warn(ab, "failed to setup rx_refill_buf_ring\n");
 		return ret;
-- 
2.47.3


