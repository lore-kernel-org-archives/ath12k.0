Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D0D60A5BDE
	for <ath12k@archiver.kernel.org>; Thu, 22 Oct 2026 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4rEN1RAQ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jN2V1inN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h0FfZ3ws
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2m6HS/eDp0MfpNzLq0aimsYTbu2ZaMfn05Sksguquh0=; b=4rEN1RAQw8kPu2gJYaOcPBW0mD
	FD+VuhMMZRyAmUdnJ5dbxd98SXcYteyn+K/2jopGgVU8dVgbT+tQFp0cqtrfzrrvE5FLf7jWsPuCB
	DTU3L6FR7HMYzyC8r7ms0uzRUWcsby4DazWedOrSEGP9ohQ8TZ3+tvEHxFSbyqJZLkY0BFs8uxx+F
	6LYI3TO4vlObkHxZ1EWOecACu/yCRhk+zqb0IKv7CltUaSrszFc+Lq31wECab1zgtmC3okfctumRI
	QaCMGFGWlTaXhkCf8hNY9UPhLlMFv0XihMse/HZu+Z4FiEKis9U6tA5iYZYHw1KB2RPO3lSLtD6ap
	S+IhjiAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJt6O-0000000EESk-1LXf;
	Thu, 22 Oct 2026 13:45:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJt6J-0000000EER9-2zFp
	for ath12k@lists.infradead.org;
	Thu, 22 Oct 2026 13:45:00 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA06QV3115503
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 13:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2m6HS/eDp0MfpNzLq0aimsYT
	bu2ZaMfn05Sksguquh0=; b=jN2V1inNKhl8Rj1z8VXdS0uoWnKy+qVWis9/UDBa
	YAMAU7nvjnVNsva7AFu8PMIluqyybNIp2GCAFgQowZ+g2dtgrpZfJNvFI5PGXkF7
	wLYqCujur2qmZt6+yROQimtKwjG7hFAHLcN4huJpvmhJcIzvW/Vz+qy9xStzwbtB
	xq76n9fCAXVKJka6OKk00iflm5Cg2L0tLUnRPn7QOoPvbC5ElsY98GEqZD5zqVWJ
	1Dhu5wZBc6t0Fay1Ri0wWsZIbRl2biZAVIDRxxZmNAXcFuI/XzPtDdI+L+Spypuo
	jScRj2CM6hHnhXzJQfca9iNJUVDFdzIq2n2m1zUDrnfvwA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93buyfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 13:44:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36998507c13so279987eec.0
        for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 06:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792676698; x=1793281498; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2m6HS/eDp0MfpNzLq0aimsYTbu2ZaMfn05Sksguquh0=;
        b=h0FfZ3wsr3aSxt5PKyQYuneR4gJVwbiXpEtUKgbS/Up9VwgWW+B+rDfdE3NfJr3ahl
         FWJq8IIHY1rBW+WUHOFxdIJBjoQtskBk3krwYxbcVVrPrnmveTq0rN95Qhn6DtsVy39L
         Kd7JQ39GpK+RSQEwBF64ZrrGsC2VnLeJX7MIOjYW+gr372YZO4PfRT81azZ5nRLbqhby
         JhKgC2AGWdmpyihn8Z6HlJ2QeIOHCLN2p5n0rY/OVonC3r+EGcxt/SjKT6IceJ4aioYA
         Ot6Oi8IohrkvcqNG9Y41UV+x/y0lPN37ike3IF8fM4bgPog3enfG/4aPldpP5h8u0Mz2
         QAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676698; x=1793281498;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2m6HS/eDp0MfpNzLq0aimsYTbu2ZaMfn05Sksguquh0=;
        b=GGk+4TIfy1DxpiwUYWLlmiol6G0bquBRpoNAuyI7a9IgChb9idGNqLFJGLsfj1SC8X
         umE+mu0+D+g0xcoNzwO1PLFSVcMuGBUCyoX6Jl/Ap9ypePTWr+ebK4rk54/Ww2RYVn5Q
         HhWRUIoRASS3MUwM+ZxddFi0dlC9LaSpXCc/LG7q9DhzGRA7NOqMgInE9Bw83DfwSEAt
         08bKZG5y5Rah/kKtyeIOHW1oNDy47bdtxu8Lzxl4YKVx0dT9K1toS4iOOR1lWt42Jt9E
         4y6BNjvsGvfSI4pGHudxoYG/cgVwnnhyoNG1z8cF+7XsKTpiE+YNzsIywmhOP3iC+IU0
         9jkw==
X-Forwarded-Encrypted: i=1; AKwUvBwU+Txsc2qXCFo1vA4hA0L1dbpkcF5A0J4wz24tE9FtIQI/oA61eDP7SHmgxFhwu01U2qFdQhE=@lists.infradead.org
X-Gm-Message-State: AFq9FYKKYbGhXJNkSTV9V5CeLXntfdPnqPWBTRhY97hhIDINKOlv41GK
	XNqMh8+IOlf6ugJOhTKl75Nfh6qCk30ZN4XyNQBCuJeC7QNOsLT9fwSDqo0Kwu3ei0A1WGeYitP
	jovT2Y6c4+kechf/v0RZarlxm6I0sQ9BMRmnmNxFSdES7Wlx/QLLc+f63bp9ue/k0IhomA4Lu
X-Gm-Gg: AYBFou2ET4rvXG07lszNsms57H2R1R7Rzb639Vo4SVmLHIsI8jCsKED8clv6ynaSq2i
	aEI6pB2+lCNzf6n6YCJul5JQUbVHkN9ItT8mLIuOBTJRXX4Me1GkY7TJGJcV897pkkAuHTrxnVK
	Powbyfc1TnMVZz2M6sXGmpM2282gPgbsSnGK4/IWcqMteH7TxoI/+6XD4OpRzuXDQIOjGRK2t14
	npiTyfZHwXvBpEqPK6889pGiQw80nFaUqSjAVNv2vi5AMzayTedn56IuNLl+Qn/GWXGm7fQzXtK
	HhE4SLGwIEOzxrk/6foe2OuMtpVmVZuM9K3TeP2f51FWIu2kMr9MoskmaZMXKwLOOMm8k06zmkG
	jmbhfBJKwAYuiuUCrxFvv0tYG2LTrXwaZlh6EgsCBTw==
X-Received: by 2002:a05:693c:8083:b0:368:4acb:f8a with SMTP id 5a478bee46e88-3684acb1061mr4736866eec.17.1792676697538;
        Thu, 22 Oct 2026 06:44:57 -0700 (PDT)
X-Received: by 2002:a05:693c:8083:b0:368:4acb:f8a with SMTP id 5a478bee46e88-3684acb1061mr4736793eec.17.1792676696230;
        Thu, 22 Oct 2026 06:44:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm17397811eec.10.2026.10.22.06.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:44:55 -0700 (PDT)
Date: Thu, 22 Oct 2026 21:44:50 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
Message-ID: <atoTUgEIfkg6b29U@QCOM-aGQu4IUr3Y>
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfXycbmHGC3p0g7
 9C44CYd8PCmedm98ZwTvHvSJtiVoKxMQs8W6HaSid2r6qzwcGdvm3S47j19JgKJU2JbWg5O66al
 m8aPAPWdlSQcZQhl4meVUOX7YH4k6IA=
X-Proofpoint-GUID: beB23E7yrzZ3VbyhBE7503LK4fmnUTHn
X-Proofpoint-ORIG-GUID: beB23E7yrzZ3VbyhBE7503LK4fmnUTHn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfX/fOwBH3xikur
 Bywnkx3aYvarBtDUFDNzdhyLV7njPFde/U4P2RcWog+FNYHkKNaDwGooas10UYWUFM1xilnXJWZ
 +M393dY01XY1FSnQZJmPTxc1LCVSK1rOEbGtYacsW2T85wm2vVrsDuXp2iYPBrnKF8RBH/7oY+K
 Zn66CS9Q4sdsKeFZvxaro21qAq+LG0ZdQkzcTkQFpxtrHS2SImlh3uyAQOV9HROGBKBYW/Fce6c
 LDv9+gmeZFY68zmSvWMIdBj9wJN7+KfDtpv2LI/BFsIuxemGHaETD1BIantL4lZ8+4ZVCAnC3Rp
 8VRvW6WTZ7jlF9h0Mx5rMqIEAGUYe52YJCfTSCqwGhZeXCz5srBQeo2+JWco8W0AweDKb7Pola1
 KSFKJNZTb5hlm43R4Va/8TMzNWJ8dw==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ada135a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HcXVOmt5dcc9mTenIEwA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_064459_865564_BFAFB3A5 
X-CRM114-Status: GOOD (  36.25  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 05:20:56PM +0800, Shawn Guo wrote:
> On Thu, Oct 22, 2026 at 10:30:45AM +0800, Baochen Qiang wrote:
> > 
> > 
> > On 10/20/2026 4:53 PM, Shawn Guo wrote:
> > > + linux-arm-msm
> > > 
> > > On Tue, Jun 09, 2026 at 08:13:58PM -0700, Yingying Tang wrote:
> > >> For WCN7850, MAC buffer ring size is updated to 2048 in
> > >> 955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
> > >> to increase peak throughput.
> > >>
> > >> But during the RX process, a phenomenon can still be observed where
> > >> the throughput drops by about 30% from its peak value and then recovers,
> > >> and this behavior repeats during RX.
> > >>
> > >> After increasing MAC buffer ring size to 4096, the data rate drop has
> > >> gone.
> > >>
> > >> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> > >>
> > >> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
> > > 
> > > FYI, in case someone else runs into this: with this change (merged in
> > > v7.3), WiFi on my Lenovo Yoga Slim 7x (X1E80100, WCN7850 hw2.0) stopped
> > > working with the older firmware that Debian trixie still ships
> > > (firmware-atheros 20250410-2):
> > > 
> > >   WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> > > 
> > > Probe and firmware download succeed, but every WMI command times out
> > > once the interface is brought up:
> > > 
> > >   ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
> > >   ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
> > >   ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
> > >   ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11
> > > 
> > > Bisecting ath12k between v7.2 and v7.3 lands on this commit, and
> > > reverting it on v7.3 brings WiFi back with the old firmware.
> > > 
> > > Unmodified v7.3 works fine after updating to the current linux-firmware
> > > image:
> > > 
> > >   WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> > > 
> > > On Debian trixie that one is available from trixie-backports
> > > (firmware-atheros 20260916-1~bpo13+1).
> > > 
> > > So nothing needs fixing on the driver side. I'm just leaving this here
> > > so that anyone who sees "wmi command ... timeout" on WCN7850 after a
> > > kernel upgrade knows to update the firmware first.
> > 
> > Hi Shawn, thanks for reporting this. I just had a quick test
> > WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 with the latest ath tree
> > (ath-202610191908), everything looks good, simple connection and ping pass, I don't see
> > any ath12k warning.
> > 
> > The firmware images I am using comes from the first commit adding WCN7850 firmware:
> > 
> > 	fb04a7f4b750 ("ath12k: add new driver and firmware for WCN7850")
> > 
> > and the md5 values are:
> > 
> > linux-firmware/ath12k/WCN7850/hw2.0$ md5sum ./*
> > d3750b67b1013fe82358d0538fb131b0  ./amss.bin
> > c79c410d585360000c0490f16fda43e2  ./board-2.bin
> > 73056f1d2aff886ce9bff313f455e963  ./m3.bin
> > d0ee61498bf1a205147cdbcf645391e7  ./Notice.txt
> > 
> > can you share the md5 values of your images?
> 
> Hi Baochen,
> 
> Here are md5 values of the old firmware shipped by trixie firmware-atheros
> 20250410-2.
> 
> $ md5sum /lib/firmware/ath12k/WCN7850/hw2.0/*
> d3750b67b1013fe82358d0538fb131b0  /lib/firmware/ath12k/WCN7850/hw2.0/amss.bin
> 5dacdfbe6c3c25d9e0605be8a9f1f6e4  /lib/firmware/ath12k/WCN7850/hw2.0/board-2.bin
> 73056f1d2aff886ce9bff313f455e963  /lib/firmware/ath12k/WCN7850/hw2.0/m3.bin
> 
> > and have you ever tried the upstream mainline
> > kernel or the latest ath.git tree?
> 
> I'm not sure what you mean by upstream mainline kernel, but v7.3 should
> be the mainline kernel released a few days ago.
> 
> On the other hand, I just tested ath.git tree at tag ath-202610191908,
> and it worked with the old firmware. So it seems there are some gaps
> between v7.3 and ath kernel.

I bisected drivers/net/wireless/ath/ath12k between v7.3 (broken) and
the ath tag (working). It lands on:

  15f7603b69a8 ("wifi: ath12k: Increase RXDMA buffer ring size for default memory profile")

The previous commit, 643f0bf93617, still has 4096 entries and is broken.
15f7603b69a8 changes one line, .rxdma_buf_ring_size from 4096 to 8192,
and works.

Shawn

