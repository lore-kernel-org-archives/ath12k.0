Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ADD606A31A
	for <ath12k@archiver.kernel.org>; Thu, 22 Oct 2026 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wc3OF4eV;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kBYxFLjr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FWle8uqH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9Vw7fnKc3VAocPM27GWdWNWFuAYiQe9Qj0jcJnHPkQY=; b=wc3OF4eV3X46+LUlUg3eGGg3SO
	yo9ZBCbFpsFAQMfzw+Aa+1ybHF1tTzOSuFOwsH8ATazi6AJDdt1excKNBu8xCYFaRYjfzUbOE6VX8
	YPqVqYufNgoMSMNDPnhhnFWaUHnZTwAXc8wO5L8dKAs4MZiYQE8aqX2F/CsqScYcPwcV3ObZrd4I9
	b0pJ9lxfeVUalNAENokzwxsOnIJpIG7pd1cg8wkqntGTpVhCUoqySekstUT8F/pEdYe8uYpzKSO0W
	lkOTzcU8zlc3NdD3lHd5otmeP4QSQwoaHURrRet1jvS6kHT1hqJq9bPsIBmbeYFYiWPQcTuooLjZd
	t8+TUq+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJt03-0000000EDjW-2NKL;
	Thu, 22 Oct 2026 13:38:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJt00-0000000EDjB-3z2P
	for ath12k@lists.infradead.org;
	Thu, 22 Oct 2026 13:38:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xoad346047
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 13:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Vw7fnKc3VAocPM27GWdWNWF
	uAYiQe9Qj0jcJnHPkQY=; b=kBYxFLjrTr6+r+wNEyfUXpu8kTmOIFI8bJWdB/AA
	VFXovdQDD8z9lYJpybCGfPLYSURbbGYr6lpUckpQMKcAeQw3YQTYsRUlFuwnTngp
	jHtnS1eBKxYr7JXlivZITdAjsMawxTK93zRF5dD9YWYJX15jW6ui0QDd8D5WkeVA
	5Sux8FZ3be+TBrGEfcCqyEtWtTDPxvobiRPn+bv/K1haZnSy7o+Fn2LdPBG0OSvj
	TL4V7XIQKhfKormHXlAT9xunEm9cWZtNem7R3xWN8x94OlV4hSzt5UzvGJjk9NBa
	7kxzXM6BuWRe9+tJFSGXq1eh57Aczma2I05QFKfEkSV3VQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93dbqmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 13:38:28 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so2353808c88.1
        for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 06:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792676308; x=1793281108; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Vw7fnKc3VAocPM27GWdWNWFuAYiQe9Qj0jcJnHPkQY=;
        b=FWle8uqHZmb63+F34o1sf4Rr5+ntnsp0zKDwlbhYcqiVHPVIxmJqEoWktJTYSxTyQD
         3TgbwSJEXgJUH8IYajy7BVzdHoAAJb5nQEYCbpgnWIzzi2WeaNuE+nc/21kz+ZRJghxY
         iO1+gHj2nc3VoPU9H2nnTWpbxOi++m4xbE51uh6FLYXkX1LaVGuqoY6ZBr/jl+ssNudG
         +3EPynT8esKAHZaKooaYc+MYZVFYc0VKifwOuFhE9IE3N05PrAK06gUjgA4p0sn9F4zy
         RY1k/2npWCA9mQV0aZsU2SSM5wL9ZroEqPHIwFnauuVIok91eGhXVt8KW6QDmvFjoOcs
         BOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676308; x=1793281108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Vw7fnKc3VAocPM27GWdWNWFuAYiQe9Qj0jcJnHPkQY=;
        b=yGLah9SbWZEvqiZD4aNseqy7OgoVEqY7rD1jNcd3yG5AAOJjrwl3e5VhV7Mn57pXuK
         +1r1F5XLkgCJQsCLWT1qdLrI+2acoV6quRdOhfPbrWo9M7BiYdBbfnHOSIamCm+eStsW
         /cBGbW3OwQNi4HPcx2d9cxt/eIgjcR6spv05tHmRnhkgsAKjmdO82kIa7wyFWghuW1G5
         Vl3I1Dw1zvqj8vXfZ7vR4PQ9v3qNGgMlyXqJ7JlCOZE0lXY8wsNU0PdrYLLbkCLmPeRU
         wbf6x4TYvVDpTby63QXSJjoE3q/Nq3oYG0x9Z+u5yujW9fvlMovsq4oWqyVpe+UsRt7G
         yJ8A==
X-Forwarded-Encrypted: i=1; AKwUvBwYxX+RqJoSRDdsnGJf7GA0EQQjHmbzotq+fvTJqFYecjRFjQTMlZdr8jmS6tgzGhx0sm2+vao=@lists.infradead.org
X-Gm-Message-State: AFq9FYJiL/kTUrQ8bIW1shbUmtraSOd5cQWsC1+ysuzsm1TuYJJUsEz/
	IDOE+CycdBou5PGGerVWqNvB9FiIQlx072xNE+xuzYsRMRKgClt6tvIJj4KdUvM3AHre6BOfuit
	4F0h8DuC3nl3Q3OjXaUTig9Yh1XzY13wHD5jYEZJhRnYojCLV42fyUL/u3OnUumTe
X-Gm-Gg: AYBFou38pJsNLPq1daQxl7E6m/kP1I5V3LVHnhHUf77cheJp+AGOYE0cgpBfeb7kCfv
	PwRn/tCaWtDAu0KGUNRXMfdPSXAF4l/Wj0WLAo3ba7SLUO1Cs0PV+wsnJDn22d8o3/Ku93eMei+
	kdojLITE5NXWK8F0ZJwJWD4ZKbeD1xXY15RtbKSJ5wlqxZQjezdYQOUe6aZbxqoF+qO8sFaBgFn
	deWgOIB0Bsa9nHOeQd2uhB94twg1IBb8bgjxhVbEX4t2X+MiGcJfQGk2zu4dy4Z8vVO4HMn67cs
	evGeI+/2LMmqWlMt6BM5ocUzlG+1VXF9crCAUhrX4ek80jp4ODh+PJ+VR6XHIjYLCybUkZt/abi
	6U+haU2hWFJnY1rCyNcLnxTZh+XsdcuPW9M39/IzIsg==
X-Received: by 2002:a05:701b:4553:20b0:189:ff2b:b194 with SMTP id a92af1059eb24-190a6adcaebmr6406859c88.16.1792676307485;
        Thu, 22 Oct 2026 06:38:27 -0700 (PDT)
X-Received: by 2002:a05:701b:4553:20b0:189:ff2b:b194 with SMTP id a92af1059eb24-190a6adcaebmr6406826c88.16.1792676306856;
        Thu, 22 Oct 2026 06:38:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903aefe90asm14097649c88.9.2026.10.22.06.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:38:26 -0700 (PDT)
Date: Thu, 22 Oct 2026 21:38:20 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
Message-ID: <atoRzGmURyjFcH7Y@QCOM-aGQu4IUr3Y>
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y>
 <0d5d36ae-3d65-4dec-98cd-7409ba4180c2@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d5d36ae-3d65-4dec-98cd-7409ba4180c2@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfX6Py4WPou1J5k
 UCglaTw8IiXPePF3ql1S8GSEFaQxMy938a7yj7Uc+XpaHgAIaeFRtNM49n4E9B4tUd+mPlhirSo
 br7WPu1Kvvk/b6k187XzO5Q76tyC3FU=
X-Proofpoint-ORIG-GUID: uJEj1Yre8D48U25ZS3ZnRFMV6rY5hWO2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfX7mmNnPDNERRl
 Qjjdsx+SF7b8crTRCmxMelX0BHcKZtod5sbz/akG1AsTwQnAf2tS79zpVqMzRbpH2gy9k9IRsyH
 /2sfs/mrXCDm1ECViwzz1F5YCbLNXPnpj+4A/mZTuMl6/3B2b3rCDKi7jFu4ZR2KSDfD3t8I0vT
 bHOLi8WpQO8leidJBi/gVmZXqFjOd26M2zdPPTahj+Dctjv1cBkmmWiyOsWfPKxnNcQcn5wz7w7
 KhuGUilgINPTUu3siw1bEtJsvojgE5SSSyahlEogtUWxx/f6RA9OpN/OIfRvCVeONEBB2Gm8XX4
 0Qelx8u9zwJJPF4xK44G0RW6MZAqMqimXIEaGJoovNu6KkqBI6hvX8/YloIaUztkg4smPNF0cUH
 gIA8mfcJjVTv/hdIbcoEEEWC5VgT5WXtu5AyZNyc46VRRVOQS0xb3VT9adxhzdQ2ZI/H23GtOel
 jsWABkFsE9P5Gi60Oag==
X-Proofpoint-GUID: uJEj1Yre8D48U25ZS3ZnRFMV6rY5hWO2
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ada11d4 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Z4Rwk6OoAAAA:8 a=6ugie7c4VXROldkqumgA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_063829_020125_2713EB43 
X-CRM114-Status: GOOD (  38.60  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 07:00:31PM +0800, Baochen Qiang wrote:
> 
> 
> On 10/22/2026 5:20 PM, Shawn Guo wrote:
> > On Thu, Oct 22, 2026 at 10:30:45AM +0800, Baochen Qiang wrote:
> >>
> >>
> >> On 10/20/2026 4:53 PM, Shawn Guo wrote:
> >>> + linux-arm-msm
> >>>
> >>> On Tue, Jun 09, 2026 at 08:13:58PM -0700, Yingying Tang wrote:
> >>>> For WCN7850, MAC buffer ring size is updated to 2048 in
> >>>> 955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
> >>>> to increase peak throughput.
> >>>>
> >>>> But during the RX process, a phenomenon can still be observed where
> >>>> the throughput drops by about 30% from its peak value and then recovers,
> >>>> and this behavior repeats during RX.
> >>>>
> >>>> After increasing MAC buffer ring size to 4096, the data rate drop has
> >>>> gone.
> >>>>
> >>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> >>>>
> >>>> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
> >>>
> >>> FYI, in case someone else runs into this: with this change (merged in
> >>> v7.3), WiFi on my Lenovo Yoga Slim 7x (X1E80100, WCN7850 hw2.0) stopped
> >>> working with the older firmware that Debian trixie still ships
> >>> (firmware-atheros 20250410-2):
> >>>
> >>>   WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> >>>
> >>> Probe and firmware download succeed, but every WMI command times out
> >>> once the interface is brought up:
> >>>
> >>>   ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
> >>>   ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
> >>>   ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
> >>>   ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11
> >>>
> >>> Bisecting ath12k between v7.2 and v7.3 lands on this commit, and
> >>> reverting it on v7.3 brings WiFi back with the old firmware.
> >>>
> >>> Unmodified v7.3 works fine after updating to the current linux-firmware
> >>> image:
> >>>
> >>>   WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> >>>
> >>> On Debian trixie that one is available from trixie-backports
> >>> (firmware-atheros 20260916-1~bpo13+1).
> >>>
> >>> So nothing needs fixing on the driver side. I'm just leaving this here
> >>> so that anyone who sees "wmi command ... timeout" on WCN7850 after a
> >>> kernel upgrade knows to update the firmware first.
> >>
> >> Hi Shawn, thanks for reporting this. I just had a quick test
> >> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 with the latest ath tree
> >> (ath-202610191908), everything looks good, simple connection and ping pass, I don't see
> >> any ath12k warning.
> >>
> >> The firmware images I am using comes from the first commit adding WCN7850 firmware:
> >>
> >> 	fb04a7f4b750 ("ath12k: add new driver and firmware for WCN7850")
> >>
> >> and the md5 values are:
> >>
> >> linux-firmware/ath12k/WCN7850/hw2.0$ md5sum ./*
> >> d3750b67b1013fe82358d0538fb131b0  ./amss.bin
> >> c79c410d585360000c0490f16fda43e2  ./board-2.bin
> >> 73056f1d2aff886ce9bff313f455e963  ./m3.bin
> >> d0ee61498bf1a205147cdbcf645391e7  ./Notice.txt
> >>
> >> can you share the md5 values of your images?
> > 
> > Hi Baochen,
> > 
> > Here are md5 values of the old firmware shipped by trixie firmware-atheros
> > 20250410-2.
> > 
> > $ md5sum /lib/firmware/ath12k/WCN7850/hw2.0/*
> > d3750b67b1013fe82358d0538fb131b0  /lib/firmware/ath12k/WCN7850/hw2.0/amss.bin
> > 5dacdfbe6c3c25d9e0605be8a9f1f6e4  /lib/firmware/ath12k/WCN7850/hw2.0/board-2.bin
> 
> this is different from mine, can you try mine?

Are you sure this board file works for my Lenovo Yoga Slim 7x laptop?

> 
> > 73056f1d2aff886ce9bff313f455e963  /lib/firmware/ath12k/WCN7850/hw2.0/m3.bin
> > 
> >> and have you ever tried the upstream mainline
> >> kernel or the latest ath.git tree?
> > 
> > I'm not sure what you mean by upstream mainline kernel, but v7.3 should
> 
> I mean Linus's tree
> 
> > be the mainline kernel released a few days ago.
> > 
> > On the other hand, I just tested ath.git tree at tag ath-202610191908,
> > and it worked with the old firmware. So it seems there are some gaps
> > between v7.3 and ath kernel.
> 
> can you share the exact tag of v7.3 kernel? is it just below tag?

Yes, it is.

Shawn

> 
> commit c03c1a14507dfaf8b856c2608f9ac216021fc222 (tag: v7.3)
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Oct 18 13:14:58 2026 -1000
> 
>     Linux 7.3
> 
> diff --git a/Makefile b/Makefile
> index 0dc1a9f4e63e..c61ea07ee505 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -2,7 +2,7 @@
>  VERSION = 7
>  PATCHLEVEL = 3
>  SUBLEVEL = 0
> -EXTRAVERSION = -rc7
> +EXTRAVERSION =
>  NAME = Baby Opossum Posse
> 
>  # *DOCUMENTATION*
> 
> 
> > 
> > Shawn
> 

